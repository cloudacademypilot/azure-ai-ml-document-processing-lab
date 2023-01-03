from azure.ai.formrecognizer import DocumentModelAdministrationClient 
from azure.core.credentials import AzureKeyCredential 
from azure.core.exceptions import ResourceNotFoundError
import json

with open("steps/04_extract_data_using_custom_models/checks/04_extracted_data_using_custom_models/params.json") as f:
    params = json.load(f)

endpoint = params['endpoint']
credential = AzureKeyCredential(params['key'])

document_model_admin_client = DocumentModelAdministrationClient(endpoint, credential)
account_details = document_model_admin_client.get_resource_details()

print("Our account has {} custom models, and we can have at most {} custom models".format(account_details.custom_document_models.count, account_details.custom_document_models.limit))

# Here we get a paged list of all of our models
models = list(document_model_admin_client.list_document_models())

model_ids = [model.model_id for model in models if (model.model_id == "template-model") or (model.model_id == "neural-model")]

if "template-model" in model_ids:
    print("Custom Template Model created")
else:
    print("Custom Template Model not created")

if "neural-model" in model_ids:
    print("Custom Neural Model created")
else:
    print("Custom Neural Model not created")
