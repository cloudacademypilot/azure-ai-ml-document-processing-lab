# Extract data using the Document Analysis models

## Document Analysis models
Extract text, tables, structure, key-value pairs, and named entities from documents using the following document analysis models:
1. Read OCR
2. Layout analysis
3. General document

## Prerequisites

* Azure subscription
* Form Recognizer resource
* Storage account with sample documents

## Learning objectives

* Learn and explore the Document Analysis models

## Read (OCR) model
The Read model analyzes and extracts lines, words, their locations, detected languages, and handwritten style if detected.

### What is OCR for documents?
Optical Character Recognition (OCR) for documents is optimized for large text-heavy documents in multiple file formats and global languages. It includes features like higher-resolution scanning of document images for better handling of smaller and dense text; paragraph detection; and fillable form management. OCR capabilities also include advanced scenarios like single character boxes and accurate extraction of key fields commonly found in invoices, receipts, and other prebuilt scenarios.

### OCR in Form Recognizer - Read model
Form Recognizer v3.0's Read Optical Character Recognition (OCR) model runs at a higher resolution than Computer Vision Read and extracts print and handwritten text from PDF documents and scanned images. It detects paragraphs, text lines, words, locations, and languages. The read model is the underlying OCR engine for other Form Recognizer prebuilt models like Layout, General Document, Invoice, Receipt, Identity (ID) document, in addition to custom models.

### Read model in Form Recognizer Studio

1. In the Form Recognizer Studio, click _Try it now_ on the Read card to use the model.

![FR Studio landing page]()

2. Select a document of your choice either from the Storage Account through the _Fetch from URL_ option or upload a file from your local machine through the _Browse for a file_ option. You can also perform analysis on the samples already uploaded in the Studio. In this lab we will analyze the document present in the Storage Account.

![Read model page]()

3. Go to the Storage Account and click on the _resume_example3_ file. Copy the URL to the file and paste it in the dialog box. 

![Storage Account page]()

4. Click _Fetch_ and wait for the file to be uploaded. After successful upload, you can view file on the left side.

![Fetch dialog box]()

5. To perform the analysis, Click on _Analyze_. Upon completion, to-do

![Analysis results page]()


## Layout model

The Layout analysis model analyzes and extracts text, tables, selection marks, and other structure elements like titles, section headings, page headers, page footers.

### What is document structure layout analysis?
Document structure layout analysis is the process of analyzing a document to extract regions of interest and their inter-relationships. The goal is to extract text and structural elements from the page to build better semantic understanding models. There are two types of roles that text plays in a document layout:
1. Geometric roles: Text, tables, and selection marks are examples of geometric roles.
2. Logical roles: Titles, headings, and footers are examples of logical roles.

The following illustration shows the typical components in an image of a sample page.

![Sample Page](to-do)

### Layout model in Form Recognizer Studio
to-do

## General document model
The general document model combines powerful Optical Character Recognition (OCR) capabilities with deep learning models to extract key-value pairs, tables, and selection marks from documents.

### General document model in Form Recognizer Studio
to-do
