from azure.ai.formrecognizer import DocumentModelAdministrationClient 
from azure.identity import AzureCliCredential
from azure.core.credentials import AzureKeyCredential
from azure.core.exceptions import ResourceNotFoundError
from azure.mgmt.resource import ResourceManagementClient
import json
import requests


with open("steps/04_extract_data_using_custom_models/checks/04_extracted_data_using_custom_models/params.json") as f:
    params = json.load(f)

subscription_id = params['subscription_id']
resource_group_name = params['resource_group_name']

credential = AzureCliCredential()
token = credential.get_token("https://management.azure.com").token

resource_client = ResourceManagementClient(credential, subscription_id)
resource_list = resource_client.resources.list_by_resource_group(resource_group_name, expand = "createdTime,changedTime")

for resource in resource_list:
    if resource.kind == "FormRecognizer":
        fr_res_name = resource.name

endpoint = "https://" + fr_res_name + ".cognitiveservices.azure.com/"

listKeysUrl = "https://management.azure.com/subscriptions/" + subscription_id + "/resourceGroups/" + resource_group_name + "/providers/Microsoft.CognitiveServices/accounts/" + fr_res_name + "/listKeys?api-version=2021-10-01"
headers = {
    'ContentType': 'application/json',
    'Authorization': f'Bearer {token}'
}

response = requests.post(url=listKeysUrl, headers=headers)
if response.status_code == 200:
    key1 = response.json()['key1']

keyCredential = AzureKeyCredential(key1)

document_model_admin_client = DocumentModelAdministrationClient(endpoint, keyCredential)
account_details = document_model_admin_client.get_resource_details()

print("{} account has {} custom models, and we can have at most {} custom models".format(fr_res_name, account_details.custom_document_models.count, account_details.custom_document_models.limit))

# Here we get a paged list of all of our models
models = document_model_admin_client.list_document_models()

model_ids = [model.model_id for model in models if (model.model_id == "template-model") or (model.model_id == "neural-model")]

if "template-model" in model_ids:
    print("Custom Template Model created")
else:
    print("Custom Template Model not created")

if "neural-model" in model_ids:
    print("Custom Neural Model created")
else:
    print("Custom Neural Model not created")
