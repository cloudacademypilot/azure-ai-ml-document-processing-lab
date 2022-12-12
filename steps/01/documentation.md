# Using Form Recognizer Studio for document processing

## Form Recognizer Studio

Form Recognizer Studio is an online tool to visually explore, understand, train, and integrate features from the Form Recognizer service into your applications. The studio provides a platform for you to experiment with the different Form Recognizer models and sample their returned data in an interactive manner without the need to write code.

## Form Recognizer Studio features

The following Form Recognizer service features are available in the Studio.

* Read: Try out Form Recognizer's Read feature to extract text lines, words, detected languages, and handwritten style if detected. 
* Layout: Try out Form Recognizer's Layout feature to extract text, tables, selection marks, and structure information.
* General Documents: Try out Form Recognizer's General Documents feature to extract key-value pairs and entities. 
* Prebuilt models: Form Recognizer's prebuilt models enable you to add intelligent document processing to your apps and flows without having to train and build your own models
* Custom models: Form Recognizer's custom models enable you to extract fields and values from models trained with your data, tailored to your forms and documents. Create standalone custom models or combine two or more custom models to create a composed model to extract data from multiple form types.

## Prerequisites

* Azure subscription
* Form Recognizer resource

## Learning objectives

* Create a Form Recognizer resource
* Learn about the different models

## Exercise 1: Create a Form Recognizer resource

1.  Go to the [Azure](https://portal.azure.com) portal and search _Applied AI services_. Click _Create_ on the Form Recognizer card.

![01-Applied AI services Overview page](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/01/assets/01.png)

2. Enter the following details under the _Basics_ tab. Rest, keep it as is.
* Subscription - Your subscription
* Resource group - Your resource group
* Region - Central US 
* Name - An unique name
* Pricing tier - Standard S0

![02-Basic tab](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/01/assets/02.png)

3. Under _Review + create_, click _Create_.

4. Go to your Form Recognizer resource and click on _Try it_ on the Form Recognizer Studio card.

![03-Form Recognizer Overview page](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/01/assets/03.png)
