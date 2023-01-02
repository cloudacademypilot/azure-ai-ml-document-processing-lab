import os
import sys
import json
import logging
from azure.identity import AzureCliCredential
from azure.mgmt.resource import ResourceManagementClient
from azure.mgmt.subscription import SubscriptionClient

def handler():
    try:
        subscription_id = "cbb956ec-6c04-42ae-8428-91d91154f780"
        resource_group_name = "az-ahoode-rg"
        credential = AzureCliCredential()
        resource_client = ResourceManagementClient(credential, subscription_id)
        resource_list = resource_client.resources.list_by_resource_group(resource_group_name, expand = "createdTime,changedTime")
        resourcename = ''
        for resource in resource_list:
            if(resource.type == 'Microsoft.CognitiveServices/accounts'):
                resourcename = resource.name
                if(resourcename):
                    print('Form Recognizer Studio is Created')
                else:
                    print('Form Recognizer Studio is not Created')
    except Exception as e:
        logging.error(e)
        
if __name__=="__main__":
    handler()

