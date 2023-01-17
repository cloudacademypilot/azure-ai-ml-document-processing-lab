import os
import sys
import json
import logging
from azure.identity import AzureCliCredential
from azure.mgmt.resource import ResourceManagementClient
from azure.mgmt.subscription import SubscriptionClient

def handler():
    try:
        with open("steps/01_using_form_recognizer_studio_for_document_processing/checks/01_used_form_recognizer_studio_for_document_processing/params.json") as f:
            params = json.load(f)

        subscription_id = params['subscription_id']
        resource_group_name = params['resource_group_name']

        credential = AzureCliCredential()

        resource_client = ResourceManagementClient(credential, subscription_id)
        resource_list = resource_client.resources.list_by_resource_group(resource_group_name, expand = "createdTime,changedTime")

        fr_resource = [resource for resource in resource_list if resource.kind == "FormRecognizer"]
        if(len(fr_resource) != 0):
            print('Form Recognizer Studio is created')
        else:
            print('Form Recognizer Studio is not created')

    except Exception as e:
        logging.error(e)
        
if __name__=="__main__":
    handler()

