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

### What is OCR for documents?
Optical Character Recognition (OCR) for documents is optimized for large text-heavy documents in multiple file formats and global languages. It includes features like higher-resolution scanning of document images for better handling of smaller and dense text; paragraph detection; and fillable form management. OCR capabilities also include advanced scenarios like single character boxes and accurate extraction of key fields commonly found in invoices, receipts, and other prebuilt scenarios.

### OCR in Form Recognizer - Read model
Form Recognizer v3.0's Read Optical Character Recognition (OCR) model runs at a higher resolution than Computer Vision Read and extracts print and handwritten text from PDF documents and scanned images. It detects paragraphs, text lines, words, locations, and languages. The read model is the underlying OCR engine for other Form Recognizer prebuilt models like Layout, General Document, Invoice, Receipt, Identity (ID) document, in addition to custom models.

### Read model in Form Recognizer

