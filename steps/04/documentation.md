# Extract data using Custom models
Custom models extract and analyze distinct data and use cases from forms and documents specific to your business. Standalone custom models can be combined to create composed models.

Extract text, structure, and fields from models trained with your data, so they're tailored to your forms and documents using the following custom models:
1. Template (Custom form) models
2. Neural (Custom document) models

To create a custom model, you label a dataset of documents with the values you want extracted and train the model on the labeled dataset. You only need five examples of the same form or document type to get started.

## Compare model features
The table below compares custom template and custom neural features:

Feature  | Custom template (form) | Custom neural (document)
------------- | ------------- | -------------
Document structure | Template, form, and structured | Structured, semi-structured, and unstructured
Training time | 1 to 5 minutes | 20 minutes to 1 hour
Data extraction | Key-value pairs, tables, selection marks, coordinates, and signatures | Key-value pairs, selection marks and tables
Document variations | Requires a model per each variation | Uses a single model for all variations
Language support | Multiple language support | United States English (en-US) language support

## Prerequisites

* Azure subscription
* Form Recognizer resource
* Storage account with sample documents

## Learning objectives

* Build custom models

## Build and train a Template (Custom form) models
The custom template or custom form model relies on a consistent visual template to extract the labeled data. The accuracy of your model is affected by variances in the visual structure of your documents. Structured forms such as questionnaires or applications are examples of consistent visual templates.

Your training set will consist of structured documents where the formatting and layout are static and constant from one document instance to the next. Form Recognizer models require as few as five training documents to get started. If you have at least five documents, you can get started training a custom model. Custom template models support key-value pairs, selection marks, tables, signature fields, and regions. Template models and can be trained on documents in any of the supported languages.


### Create a project in the Form Recognizer Studio
1. In the Studio, select the _Custom models_ tile, on the custom models page and select the _Create a project_ button.
![Custom model page](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/1.1.png)

2. On the create project dialog, provide a name for your project, optionally a description, and select continue.
![Create project dialog](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/1.2.png)

3. On the next step in the workflow, choose your Form Recognizer resource before you select continue.
![Create project dialog](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/1.3.png)

4. Next select the storage account containing your custom model training dataset. The Folder path should be empty if your training documents are in the root of the container. If your documents are in a subfolder, enter the relative path from the container root in the Folder path field. Once your storage account is configured, select continue.
![Create project dialog](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/1.4.png)

5. Finally, review your project settings and select Create Project to create a new project. You should now be in the labeling window and see the files in your dataset listed.
![Lable data](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/1.5.png)

### Label your data
1. To start labeling your dataset, create your first field by selecting the plus (➕) button on the top-right of the screen to select a field type.
![Add field](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/2.1.png)

2. Enter a name for the field.
![Enter name](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/2.2.png)

3. To assign a _Field_, draw a rectangle over the field in the form using _Region_ and select the field in either the dropdown or the field list on the right navigation bar. You'll see the labeled value below the field name in the list of fields.
![Select region](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/2.3.png)
To assign a _Selection mark_, draw a rectangle over the field along with its respective checkbox in the form using _Region_ and select the field in either the dropdown or the field list on the right navigation bar. You'll see the labeled value below the field name in the list of fields.
![Select region](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/2.4.png)
To assign a _Signature_, draw a rectangle over the signature box in the form using _Region_ and select the field in either the dropdown or the field list on the right navigation bar. You'll see the labeled value below the field name in the list of fields.
![Select region](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/2.5.png)
To create a _Table_ field, select _Table_ from the dropdown. Name the table, set the _Table type_ as _Fixed_, _Header type_ as _Column_ and click _Create_. Click on the table field you just created from the right navigation bar. You can add a columns or rows by clicking on one of the existing ones. Rename all the columns and rows so as to match the table present in the form. Draw a rectangle over the cell you want to capture, then click on the respective cell position in the table on the right navigation bar. Repeat the same process for all the remaining cells in the table.
![Table field](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/2.6.png)

4. Repeat the process for all the fields you wish to label for your dataset.
![Labeling](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/2.7.png)

5. Label the remaining documents in your dataset by selecting each document and selecting the text to be labeled.

6. You now have all the documents in your dataset labeled. Click _Train_ present on the top right corner. If you look at the storage account, you'll find a .labels.json and .ocr.json files that correspond to each document in your training dataset and a new fields.json file. This training dataset will be submitted to train the model.
![Train](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/2.8.png)

### Train your model
1. On the train model dialog, provide a unique model ID and, optionally, a description. The model ID accepts a string data type.

2. For the build mode, select _Template_.
![Train dialog](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/3.1.png)

3. Select Train to initiate the training process.

4. Template models train in a few minutes.

5. Navigate to the Models menu to view the status of the train operation.
![Models menu](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/3.2.png)

### Test the model
1. Select the model and select on the Test button.
![Test dialog](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/4.1.png)

2. Select _Fetch from URL_ to fetch the test file from the storage account to test the model. Generate the SAS URL for the file and paste it in the dialog box.

3. With a file selected, choose the Analyze button to test the model.

4. The model results are displayed in the main window and the fields extracted are listed in the right navigation bar.
![Results](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/4.2.png)

5. Validate your model by evaluating the results for each field.

6. The right navigation bar also has the sample code to invoke your model and the JSON results from the API.

## Template (Custom form) models
The custom neural (custom document) model uses deep learning models and base model trained on a large collection of documents. This model is then fine-tuned or adapted to your data when you train the model with a labeled dataset. Custom neural models support structured, semi-structured, and unstructured documents to extract fields. Custom neural models currently support English-language documents. 

### Create a project in the Form Recognizer Studio
1. In the Studio, select the _Custom models_ tile, on the custom models page and select the _Create a project_ button.
![Custom model page](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/1.1.png)

2. On the create project dialog, provide a name for your project, optionally a description, and select continue.
![Create project dialog](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/1.2.png)

3. On the next step in the workflow, choose your Form Recognizer resource before you select continue.
![Create project dialog](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/1.3.png)

4. Next select the storage account containing your custom model training dataset. The Folder path should be empty if your training documents are in the root of the container. If your documents are in a subfolder, enter the relative path from the container root in the Folder path field. Once your storage account is configured, select continue.
![Create project dialog](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/1.4.png)

5. Finally, review your project settings and select Create Project to create a new project. You should now be in the labeling window and see the files in your dataset listed.
![Lable data](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/5.1.png)

### Label your data
1. To start labeling your dataset, create your first field by selecting the plus (➕) button on the top-right of the screen to select a field type.
![Add field](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/6.1.png)

2. Enter a name for the field.
![Enter name](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/6.2.png)

3. To assign a value to the field, choose a word or words in the document and select the field in either the dropdown or the field list on the right navigation bar. You'll see the labeled value below the field name in the list of fields.
![Select word and assign field](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/6.3.png)
To create a _Table_ field, select _Table_ from the dropdown. Name the table, set the _Table type_ as _Dynamic_ and click _Create_. Click on the table field you just created from the right navigation bar. You can add or delete columns or rows by clicking on one of the existing ones. Rename all the columns and rows so as to match the table present in the form. To assign a value to the cell, choose a word or words in the invoice tables' cell and click on its respective cell position in the table on the right navigation bar. Repeat the same process for all the remaining cells in the table.
![Table field](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/6.4.png)

4. Repeat the process for all the fields you wish to label for your dataset.
![Labeling](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/6.5.png)

5. Label the remaining documents in your dataset by selecting each document and selecting the text to be labeled.

6. You now have all the documents in your dataset labeled. Click _Train_ present on the top right corner. If you look at the storage account, you'll find a .labels.json and .ocr.json files that correspond to each document in your training dataset and a new fields.json file. This training dataset will be submitted to train the model.
![Train](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/6.6.png)

### Train your model
1. On the train model dialog, provide a unique model ID and, optionally, a description. The model ID accepts a string data type.

2. For the build mode, select _Neural_.
![Train dialog](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/7.1.png)

3. Select Train to initiate the training process.

4. Neural models can take up to 30 minutes to train.

5. Navigate to the Models menu to view the status of the train operation.
![Models menu](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/7.2.png)

### Test the model
1. Select the model and select on the Test button.
![Test dialog](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/8.1.png)

2. Select _Fetch from URL_ to fetch the test file from the storage account to test the model. Generate the SAS URL for the file and paste it in the dialog box.

3. With a file selected, choose the Analyze button to test the model.

4. The model results are displayed in the main window and the fields extracted are listed in the right navigation bar.
![Results](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/04/assets/8.2.png)

5. Validate your model by evaluating the results for each field.

6. The right navigation bar also has the sample code to invoke your model and the JSON results from the API.