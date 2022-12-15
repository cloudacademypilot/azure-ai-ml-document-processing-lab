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

1. In the Form Recognizer Studio, click _Try it now_ on the _Read_ card to use the model.
![FR Studio landing page](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/02/assets/1.1.png)

2. Select a document of your choice either from the Storage Account through the _Fetch from URL_ option or upload a file from your local machine through the _Browse for a file_ option. You can also perform analysis on the samples already uploaded in the Studio. In this lab we will analyze the document present in the Storage Account.
![Read model page](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/02/assets/1.2.png)

3. Go to the Storage Account and click on the _resume_example3_ file. Copy the URL to the file and paste it in the dialog box. 
![Storage Account page](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/02/assets/1.3.png)

4. Click _Fetch_ and wait for the file to be uploaded. After successful upload, you can view file on the left.
![Fetch dialog box](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/02/assets/1.4.png)

5. To perform the analysis on the document, Click on _Analyze_. Upon completion, the result is displayed on the right. Hovering over the _Paragraph_ cards reveals its respective block. Beside the highlighted block, the extracted text along with the polygon coordinate is displayed.
![Analysis results page](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/02/assets/1.5.png)

6. Got to the _Result_ tab to view the JSON output. 
    1. Paragraph extraction: The model extracts all identified blocks of text in the _paragraphs_ collection as a top level object under _analyzeResults_. Each entry in this collection represents a text block and includes the extracted text as _content_ and the bounding polygon coordinates under _boundingRegions_. The _spans_ information points to the text fragment within the top-level content property that contains the full text from the document. 
    ![JSON output - Paragraph extraction](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/02/assets/1.6.png)

    2. Lines and words extraction: The model extracts print and handwritten style text as _lines_ and _words_. The model outputs bounding _polygon_ coordinates and _confidence_ for the extracted words. The _styles_ collection includes any handwritten style for lines if detected along with the spans pointing to the associated text. This feature applies to supported handwritten languages.
    ![JSON output - Lines and words extraction](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/02/assets/1.7.png)

    3. Language detection: The model detects language for text lines. It will predict the detected primary language for each text line along with the _confidence_ in the _languages_ collection under _analyzeResult_.
    ![JSON output - Language detection](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/02/assets/1.8.png)


## Layout model

The Layout analysis model analyzes and extracts text, tables, selection marks, and other structure elements like titles, section headings, page headers, page footers.

### What is document structure layout analysis?
Document structure layout analysis is the process of analyzing a document to extract regions of interest and their inter-relationships. The goal is to extract text and structural elements from the page to build better semantic understanding models. There are two types of roles that text plays in a document layout:
1. Geometric roles: Text, tables, and selection marks are examples of geometric roles.
2. Logical roles: Titles, headings, and footers are examples of logical roles.

The following illustration shows the typical components in an image of a sample page.
![Sample doc](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/02/assets/2.1.png)

### Layout model in Form Recognizer Studio

1. In the Form Recognizer Studio, click _Try it now_ on the _Layout_ card to use the model.
![FR Studio landing page](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/02/assets/2.2.png)

2. Select a document of your choice either from the Storage Account through the Fetch from URL option or upload a file from your local machine through the Browse for a file option. You can also perform analysis on the samples already uploaded in the Studio which is what we will be doing henceforth.

3. Click on the _layout-checklist.jpg_ sample and then click on Analyze. Upon completion, the result is displayed on the right.
![Analysis results page](https://github.com/CSALabsAutomation/azure-ai-ml-document-processing-lab/blob/master/steps/02/assets/2.3.png)

4. Got to the _Result_ tab to view the JSON output. 
    1. Paragraph extraction: The Layout model extracts all identified blocks of text in the _paragraphs_ collection as a top level object under _analyzeResults_. Each entry in this collection represents a text block and includes the extracted text as _content_ and the bounding _polygon_ coordinates. The _span_ information points to the text fragment within the top level _content_ property that contains the full text from the document.
        1. Paragraph roles: The new machine-learning based page object detection extracts logical roles like titles, section headings, page headers, page footers, and more. The Form Recognizer Layout model assigns certain text blocks in the _paragraphs_ collection with their specialized role or type predicted by the model. They're best used with unstructured documents to help understand the layout of the extracted content for a richer semantic analysis. The following paragraph roles are supported:

            Predicted role | Description 
            ------------- | -------------
            title | The main heading(s) in the page
            sectionHeading | One or more subheading(s) on the page
            footnote | Text near the bottom of the page
            pageHeader | Text near the top edge of the page
            pageFooter | Text near the bottom edge of the page
            pageNumber | Page number
        
        2. Lines and words extraction: The model in extracts print and handwritten style text as _lines_ and _words_. The model outputs bounding _polygon_ coordinates and _confidence_ for the extracted words. The _styles_ collection includes any handwritten style for lines if detected along with the spans pointing to the associated text. This feature applies to supported handwritten languages.

        3. Selection marks extraction: The model extracts selection marks from documents. Extracted selection marks appear within the _pages_ collection for each page. They include the bounding _polygon_, _confidence_, and selection _state_ (_selected_/_unselected_). Any associated text if extracted is also included as the starting index (_offset_) and _length_ that references the top level _content_ property that contains the full text from the document.

        4. Extract tables from documents and images: Extracting tables is a key requirement for processing documents containing large volumes of data typically formatted as tables. The Layout model extracts tables in the _pageResults_ section of the JSON output. Extracted table information includes the number of columns and rows, row span, and column span. Each cell with its bounding polygon is output along with information whether it's recognized as a _columnHeader_ or not. The model supports extracting tables that are rotated. Each table cell contains the row and column index and bounding polygon coordinates. For the cell text, the model outputs the _span_ information containing the starting index (_offset_). The model also outputs the _length_ within the top-level content that contains the full text from the document.


## General document model
The general document model combines powerful Optical Character Recognition (OCR) capabilities with deep learning models to extract key-value pairs, tables, and selection marks from documents.

### General document model in Form Recognizer Studio
to-do
