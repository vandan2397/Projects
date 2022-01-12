# LOAN DEFAULTERS PREDICTION USING MACHINE LEARNING

### Introduction
One of the most pivotal issues faced by banks these days is Credit Risk Assessment. It assists banks in evaluating if a candidate poses a potential to repay the loan or not. 
It results in reducing the possibility of losses and manage financial risk. Basically, The aim of the project is to leverage machine learning techniques such as Logistic Regression, SVM, Decision Tree, Random Forest, Ada Boost, Gradient Boosting, Extreme-gradient boosting and Extra trees to build a robust model to evaluate credit risk involved and predict loan defaulters based on different features. However, building such models is a challenging task as the data being analyzed is enormous and complex. Here are some of the challenges.

* Identification of relevant and strong indicators of defaulters. 
* Understanding of domain knowledge is at most important to solve the problem. So, research of credit analytics needs to be done. 
* One of the challenges will be to deal with an imbalanced data set, as there will be less proportion of defaulters and high proportion of non -defaulters.
* To identify pertinent measures to evaluate performance of machine learning models for an imbalanced data set.

This is a Academic project as part of curriculum of course.

### Project Partner
- Lipi Shah (University of Houston)
- Anirudh Pallerla (University of Houston)

### Methods Used
- Exploratory Data Analysis
- Data Visualization
- Machine Learning

### Tools and Libraries
- Python
- Pandas, Numpy, Matplotlib, Seaborn, Sklearn, and XGBoost
- Jupyter IDE

### Project Flow
<b>1) Data Collection</b>
- Data set used in the project is of Lending club and downloaded from Kaggle website. 
    * https://www.lendingclub.com/
    * https://www.kaggle.com/jeandedieunyandwi/lending-club-dataset
- Lending club is the largest online loan marketplace, which facilitates business loan, personal loan, auto loan and finances for medical purposes. 
- This dataset has 27 different variables and has 396030 data points. All the variables are described in given table. 
  
<b>2) Data Preparation</b>
  - To make data into more understandable form for analysis, dropped missing and repetitive data, pre processed some outliers.   

<b>3) Exploratory Data Analysis and Feature Engineering</b>
  - Engineered few features to make it feasible for prediction.
    * Extracted zipcodes to emphasize the importance of location into data.
    * Extracted year out of dates to provide loan disbursement information.
    * Performed one hot encoding, which increased features from 27 to 84.
    * Normalized the dataset to make it efficient for machine learning models to learn patterns.
    
<b>4) Feature Selection</b>
 - Utilized Random forest to get the most important features to provide it to machine learning models. 

<b>5) Model Training</b>
  - In this project, I have used 7 different ML algorithms and compared their performances.
    - Logistic Regression
    - SVM
    - Decision Tree
    - Random Forest
    - AdaBoost
    - Gradient Boost
    - Extreme Gradient Boost

<b>6) Perfomance Evaluation</b>
  - To evaluate the performance of different models, I have used precision, recall, and F1 score as the dataset is bit imbalanced.
  - ![image](https://user-images.githubusercontent.com/55615788/149054835-123544f7-f56f-4c7f-a67f-55386822b62a.png)
  - Random Forest outperforms all other algorithms using stratified k fold cross validation.


  
  
  
  
  
