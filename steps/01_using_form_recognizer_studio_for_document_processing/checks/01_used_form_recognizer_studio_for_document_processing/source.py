from azure.identity import ClientSecretCredential, SharedTokenCacheCredential
from azure.mgmt.resource import ResourceManagementClient

def with_hint(result, hint=None):
    return {'result': result, 'hint_message': hint} if hint else result

def handler(event, context):
    credentials, subscription_id = get_credentials(event)
    resource_group = event['environment_params']['resource_group']

    client = ResourceManagementClient(credentials, subscription_id)
    resource_type = 'Microsoft.CognitiveServices/accounts'
    result = [resource for resource in client.resources.list_by_resource_group(resource_group_name=resource_group)]

    result = [resource for resource in client.resources.list_by_resource_group(resource_group_name=resource_group, 
                                         filter=f"resourceType eq '{resource_type}'")]

    hint = f'No resources of kind {resource_type} in lab resource group. Please ensure all commands completed successfully.'
    return with_hint(any([r for r in result if r.kind == 'FormRecognizer']), hint)


def get_credentials(event):
    subscription_id = event['environment_params']['subscription_id']
    credentials = ClientSecretCredential(
        client_id=event['credentials']['credential_id'],
        client_secret=event['credentials']['credential_key'],
        tenant_id=event['environment_params']['tenant']
    )
    return credentials, subscription_id