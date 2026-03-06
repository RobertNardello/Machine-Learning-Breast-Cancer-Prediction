# Breast Cancer Prediction Using Logistic Regression and Random Forest in R

## Overview

This project applies data mining and machine learning techniques in **R** to predict breast cancer status using the **Breast Cancer Coimbra** dataset from the **UCI Machine Learning Repository**. The analysis compares two classification approaches:

- **Logistic Regression**
- **Random Forest**

The goal of the project is to classify whether an observation belongs to a healthy control or a breast cancer patient based on clinical and biomarker variables. The analysis also compares the predictive performance of a traditional statistical model and a tree-based machine learning model.

## Objective

The purpose of this project is to:

- build breast cancer classification models in R
- apply logistic regression and random forest
- evaluate predictive performance on test data
- compare model performance using the same selected predictors

## Dataset

The dataset used in this project was obtained from the **UCI Machine Learning Repository** and is titled **Breast Cancer Coimbra**. UCI describes it as a classification dataset in the health and medicine domain. It contains **116 instances**, **9 features**, and **no missing values**. The data includes measurements from **64 patients with breast cancer** and **52 healthy controls**. :contentReference[oaicite:1]{index=1}

The predictors are quantitative clinical and blood-analysis variables. According to the dataset documentation, the available variables include:

- Age
- BMI
- Glucose
- Insulin
- HOMA
- Leptin
- Adiponectin
- Resistin
- MCP.1

The target variable is:

- `Classification`, where:
  - `1 = Healthy controls`
  - `2 = Patients` :contentReference[oaicite:2]{index=2}

Based on the script used in this project, the models were trained using the following predictors:

- `BMI`
- `Glucose`
- `Resistin`

## Tools and Libraries

This project was developed in **R** using the following packages:

- `ggplot2`
- `dplyr`
- `randomForest`
- `caTools`

## Methodology

### 1. Data Loading and Preparation

The dataset was imported from a CSV file into R. The data was then standardized so that numeric variables were placed on a comparable scale before modeling.

### 2. Data Shuffling and Train-Test Split

A random seed was set for reproducibility, and row indices were shuffled. The dataset was then split into:

- 80% training data
- 20% testing data

This allowed the models to be trained on one portion of the data and evaluated on unseen observations.

### 3. Logistic Regression Model

A logistic regression model was trained using:

- `BMI`
- `Glucose`
- `Resistin`

This model estimates the probability that an observation belongs to one of the two classification groups based on the selected predictors.

### 4. Random Forest Model

A random forest model was also trained using the same predictors:

- `BMI`
- `Glucose`
- `Resistin`

Random forest is an ensemble learning method that builds multiple decision trees and combines their predictions to improve classification performance.

### 5. Model Evaluation

The project evaluates model performance using:

- prediction accuracy
- predicted classification output
- ROC curve output for logistic regression

This allows comparison between a linear probabilistic model and a nonlinear ensemble model.

## Model Output

This project produces the following outputs:

- trained logistic regression model
- trained random forest model
- prediction results on the test set
- logistic regression summary output
- random forest summary output
- classification accuracy
- ROC curve for logistic regression

## Project Structure

```text
breast-cancer-prediction/
│
├── data/
│   └── Breast Cancer biomarkers.csv
├── scripts/
│   └── breast_cancer_prediction.R
├── outputs/
│   ├── roc_curve.png
│   └── model_metrics.txt
└── README.md
