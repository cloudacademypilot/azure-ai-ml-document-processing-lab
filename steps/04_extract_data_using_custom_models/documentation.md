# Extract data using Custom models

Custom models extract and analyze distinct data and use cases from forms and documents specific to your business. Standalone custom models can be combined to create composed models.

Extract text, structure, and fields from models trained with your data, so they're tailored to your forms and documents using the following custom models:
1. Template (Custom form) models
2. Neural (Custom document) models

To create a custom model, you label a dataset of documents with the values you want to be extracted and train the model on the labeled dataset. You only need five examples of the same form or document type to get started.

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

    ![Custom model page](assets/1.1.1.png)

    ![Custom model page](assets/1.1.png)

2. On the Enter project details page, provide a name for your project, optionally a description, and select continue.

    ![Create project dialog](assets/1.2.png)

3. On the next step, under Configure service resource page, select your subscription, resource group and your Form Recognizer resource and select continue.

    ![Create project dialog](assets/1.3.png)

4. Next, under Connect training data source page, select your subscription, resource group and the storage account containing your custom model training dataset. Enter _fr-datasets_ in the _Blob container_ field. Enter _template-model-training-dataset_ in the _Folder path_ field. Once your storage account is configured, select continue.

    ![Create project dialog](assets/1.4.png)

5. Finally, review your project settings and select Create Project to create a new project. You should now be in the labeling window and see the files in your dataset listed.

    ![Lable data](assets/1.5.png)

### Label your data

1. To start labeling your dataset, create your first field by selecting the plus (➕) button on the top-right of the screen to select a field type.

    ![Add field](assets/2.1.png)

2. Enter a name for the field.

    ![Enter name](assets/2.2.png)

3. To assign a _Field_, draw a rectangle over the field in the form using _Region_ and select the field in either the dropdown or the field list on the right navigation bar. You'll see the labeled value below the field name in the list of fields.

    ![Select region](assets/2.3.png)

4. To assign a _Selection mark_, draw a rectangle over the field along with its respective checkbox in the form using _Region_ and select the field in either the dropdown or the field list on the right navigation bar. You'll see the labeled value below the field name in the list of fields.

    ![Select region](assets/1.1.2.png)

    ![Select region](assets/2.4.png)

5. To assign a _Signature_, draw a rectangle over the signature box in the form using _Region_ and select the field in either the dropdown or the field list on the right navigation bar. You'll see the labeled value below the field name in the list of fields.

    ![Select region](assets/2.5.png)

6. To create a _Table_ field, click **➕** and select _Table_ from the dropdown. Name the table, set the _Table type_ as _Fixed_, _Header type_ as _Column_ and click _Create_. Click on the table field you just created from the right navigation bar. You can add or delete columns or rows by clicking on one of the existing ones. Rename all the columns and rows to match the table present in the form by selecting each column/row and selecting Rename column/row from dropdown and give a name and enter. Draw a rectangle over the cell you want to capture using _Region_, then click on the respective cell position in the table on the right navigation bar. Repeat the same process for all the remaining cells in the table.

    ![Table field](assets/1_table.jpg)
    
    ![Table field](assets/2_table.jpg)
    
    ![Table field](assets/3_table.jpg)

    ![Table field](assets/4_table.jpg)
    
7. Repeat the process for all the fields you wish to label for your dataset.

    ![Labeling](assets/2.7.png)

8. Label the remaining documents in your dataset by selecting each document and selecting the text to be labeled.

9. You now have all the documents in your dataset labeled. Click _Train_ present in the top right corner. If you look at the storage account, you'll find a _.labels.json_ and _.ocr.json_ files that correspond to each document in your training dataset and a new fields.json file. This training dataset will be submitted to train the model.

    ![Train](assets/2.8.png)

### Train your model

> Note: Please repeat all the steps from above exercise **Label your data**, if you come across any errors while training the model.

1. On the train model dialog, enter _template-model_ as model ID and, optionally, a description. The model ID accepts a string data type.

2. For the build mode, select _Template_.

    ![Train dialog](assets/3.1.png)

3. Select Train to initiate the training process.

4. Template models train in a few minutes.

5. Navigate to the Models menu to view the status of the train operation.

    ![Models menu](assets/3.2.png)

### Test the model

1. Select the model and select the Test button.

    ![Test dialog](assets/4.1.png)

2. Select _Fetch from URL_ to fetch the test file from the storage account to test the model. The test file _filled-form.png_ will be in the _template-model-test-dataset_ folder in the storage account. Copy the URL for the file and paste it into the dialog box.

3. With a file selected, choose the Analyze button to test the model.

4. The model results are displayed in the main window and the fields extracted are listed in the right navigation bar.

    ![Results](assets/4.2.png)

5. Validate your model by evaluating the results for each field.

6. The right navigation bar also has the sample code to invoke your model and the JSON results from the API.

## Build and train a Neural (Custom document) models

The custom neural (custom document) model uses deep learning models and base model trained on a large collection of documents. This model is then fine-tuned or adapted to your data when you train the model with a labeled dataset. Custom neural models support structured, semi-structured, and unstructured documents to extract fields. Custom neural models currently support English-language documents. The sample invoices that you will be analyzing in this lab will differ from one another in layout. 

Sample  | Field Alignment | Table Alignment
------------- | ------------- | -------------
invoice1.pdf | Left | Left
invoice2.pdf | Top | Top
invoice3.pdf | Top | Left
invoice4.pdf | Left | Top
invoice5.pdf | Left | Left
test-invoice.pdf | Mixed | Left

### Create a project in the Form Recognizer Studio

1. In the Studio, select the _Custom models_ tile, on the custom models page and select the _Create a project_ button.

    ![Custom model page](assets/1.1.png)

2. On the create project dialog, provide a name for your project, optionally a description, and select continue.

    ![Create project dialog](assets/1.2.png)

3. On the next step in the workflow, choose your Form Recognizer resource before you select continue.

    ![Create project dialog](assets/1.3.png)

4. Next, select the storage account containing your custom model training dataset. Enter _fr-datasets_ in the _Blob container_ field. Enter _neural-model-training-dataset_ in the _Folder path_ field. Once your storage account is configured, select continue.

    ![Create project dialog](assets/1.4.png)

5. Finally, review your project settings and select Create Project to create a new project. You should now be in the labeling window and see the files in your dataset listed.

    ![Lable data](assets/5.1.png)

### Label your data

1. To start labeling your dataset, create your first field by selecting the plus (➕) button on the top-right of the screen to select a field type.

    ![Add field](assets/6.1.png)

2. Enter a name for the field.

    ![Enter name](assets/6.2.png)

3. To assign a value to the field, choose a word or words in the document and select the field in either the dropdown or the field list on the right navigation bar. You'll see the labeled value below the field name in the list of fields.

    ![Select word and assign field](assets/6.3.png)

4. To create a _Table_ field, click **➕** and select _Table_ from the dropdown. Name the table, set the _Table type_ as _Dynamic_ and click _Create_. Click on the table field you just created from the right navigation bar. You can add or delete columns or rows by clicking on one of the existing ones. Rename all the columns and rows to match the table present in the form by selecting each column/row and selecting Rename column/row from dropdown. To assign a value to the cell, choose a word or words in the invoice table's cell and click on its respective cell position in the table on the right navigation bar. Repeat the same process for all the remaining cells in the table.

    ![Table field](assets/6.4.png)

5. Repeat the process for all the fields you wish to label for your dataset.

    ![Labeling](assets/6.5.png)

6. Label the remaining documents in your dataset by selecting each document and selecting the text to be labeled.

7. You now have all the documents in your dataset labeled. Click _Train_ present on the top right corner. If you look at the storage account, you'll find a .labels.json and .ocr.json files that correspond to each document in your training dataset and a new fields.json file. This training dataset will be submitted to train the model.

    ![Train](assets/6.6.png)

### Train your model

1. On the train model dialog, enter _neural-model_ as model ID and, optionally, a description. The model ID accepts a string data type.

2. For the build mode, select _Neural_.

    ![Train dialog](assets/7.1.png)

3. Select Train to initiate the training process.

4. Neural models can take up to 30 minutes to train.

5. Navigate to the Models menu to view the status of the train operation.

    ![Models menu](assets/7.2.png)

### Test the model

1. Select the model and select the Test button.

    ![Test dialog](assets/8.1.png)

2. Select _Fetch from URL_ to fetch the test invoice from the storage account to test the model. The test file _test-invoice.pdf_ will be in the _neural-model-test-dataset_ folder. Copy the URL for the file from the storage account and paste it into the dialog box.

3. With a file selected, choose the Analyze button to test the model.

4. The model results are displayed in the main window and the fields extracted are listed in the right navigation bar.

    ![Results](assets/8.2.png)

5. Validate your model by evaluating the results for each field.

6. The right navigation bar also has the sample code to invoke your model and the JSON results from the API.
