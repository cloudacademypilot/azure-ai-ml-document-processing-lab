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

## Template (Custom form) models
The custom template or custom form model relies on a consistent visual template to extract the labeled data. The accuracy of your model is affected by variances in the visual structure of your documents. Structured forms such as questionnaires or applications are examples of consistent visual templates.

Your training set will consist of structured documents where the formatting and layout are static and constant from one document instance to the next. Custom template models support key-value pairs, selection marks, tables, signature fields, and regions. Template models and can be trained on documents in any of the supported languages.

## Template (Custom form) models
The custom neural (custom document) model uses deep learning models and base model trained on a large collection of documents. This model is then fine-tuned or adapted to your data when you train the model with a labeled dataset. Custom neural models support structured, semi-structured, and unstructured documents to extract fields. Custom neural models currently support English-language documents. 