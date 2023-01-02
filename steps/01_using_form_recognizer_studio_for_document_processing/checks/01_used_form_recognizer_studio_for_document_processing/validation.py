from azure.ai.formrecognizer import DocumentModelAdministrationClient 
from azure.core.credentials import AzureKeyCredential 
from azure.core.exceptions import ResourceNotFoundError

endpoint = "https://fr-ahoode.cognitiveservices.azure.com/"
credential = AzureKeyCredential("47edc0dca7904238a6eb1c04525717ca")

document_model_admin_client = DocumentModelAdministrationClient(endpoint, credential)
account_details = document_model_admin_client.get_resource_details()

print("Our account has {} custom models, and we can have at most {} custom models".format(account_details.custom_document_models.count, account_details.custom_document_models.limit))

# Here we get a paged list of all of our models
models = document_model_admin_client.list_document_models()
for model in models:
    print("{} | {}".format(model.model_id, model.description))