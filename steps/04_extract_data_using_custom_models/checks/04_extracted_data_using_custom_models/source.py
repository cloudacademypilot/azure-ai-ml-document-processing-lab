import json
import requests
from azure.identity import ClientSecretCredential, SharedTokenCacheCredential
from azure.mgmt.resource import ResourceManagementClient

def with_hint(result, hint=None):
    return {'result': result, 'hint_message': hint} if hint else result

def authorized_get(url, key):
    return requests.get(url, headers={'Ocp-Apim-Subscription-Key': key})

def authorized_post(url, bearer_token):
    return requests.post(url, headers={'Authorization': f'Bearer {bearer_token.token}', 'ContentType': 'application/json'})

def get_access_key(bearer_token, subscriptionId, resourceGroupName, accountName):
    url = f"https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.CognitiveServices/accounts/{accountName}/listKeys?api-version=2021-10-01"
    response = authorized_post(url, bearer_token)
    return response.json()['key1']

def get_document_models(key, accountName):
    url = f"https://{accountName}.cognitiveservices.azure.com/formrecognizer/documentModels?api-version=2022-08-31"
    response = authorized_get(url, key)
    return response.json()['value']

def get_document_model(key, accountName, modelId):
    url = f"https://{accountName}.cognitiveservices.azure.com/formrecognizer/documentModels/{modelId}?api-version=2022-08-31"
    response = authorized_get(url, key)
    return response.json()

def handler(event, context):
    credentials, subscription_id = get_credentials(event)
    resource_group = event['environment_params']['resource_group']

    bearer_token = credentials.get_token('https://management.azure.com/.default')

    client = ResourceManagementClient(credentials, subscription_id)
    resource_type = 'Microsoft.CognitiveServices/accounts'

    result = [resource for resource in client.resources.list_by_resource_group(resource_group_name=resource_group, 
                                         filter=f"resourceType eq '{resource_type}'")]

    neural_models = []
    template_models = []
    for recognizer in [r for r in result if r.kind == 'FormRecognizer']:
        key = get_access_key(bearer_token, subscription_id, resource_group, recognizer.name)
        models = [m for m in get_document_models(key, recognizer.name) if 'prebuilt' not in m['modelId']]
        for m in models:
            model = get_document_model(key, recognizer.name, m['modelId'])
            build_mode = model['docTypes'][m['modelId']]['buildMode']
            if build_mode == 'neural':
                neural_models.append(model)
            elif build_mode == 'template':
                template_models.append(model)

    n_template_models = len(template_models)
    n_neural_models = len(neural_models)
    hint = f'Found {n_template_models} template and {n_neural_models} neural custom models in the lab resource group. Please ensure you have created one template and one neural custom model.'
    return with_hint(n_template_models > 0 and n_neural_models > 0, hint)


def get_credentials(event):
    subscription_id = event['environment_params']['subscription_id']
    credentials = ClientSecretCredential(
        client_id=event['credentials']['credential_id'],
        client_secret=event['credentials']['credential_key'],
        tenant_id=event['environment_params']['tenant']
    )
    return credentials, subscription_id
