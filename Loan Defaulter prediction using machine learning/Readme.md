<h2>LOAN DEFAULTERS PREDICTION USING MACHINE LEARNING</h2>

One of the most pivotal issues faced by banks these days is Credit Risk Assessment. It assists banks in evaluating if a candidate poses a potential to repay the loan or not. 
It results in reducing the possibility of losses and manage financial risk. Basically, The aim of the project is to leverage machine learning techniques such as Logistic Regression, SVM, Decision Tree, Random Forest, Ada Boost, Gradient Boosting, Extreme-gradient boosting and Extra trees to build a robust model to evaluate credit risk involved and predict loan defaulters based on different features. However, building such models is a challenging task as the data being analyzed is enormous and complex.

* Identification of relevant and strong indicators of defaulters. 
* Understanding of domain knowledge is at most important to solve the problem. So, research of credit analytics needs to be done. 
* One of the challenges will be to deal with an imbalanced data set, as there will be less proportion of defaulters and high proportion of non -defaulters.
* To identify pertinent measures to evaluate performance of machine learning models for an imbalanced data set.


<b>1) Data Collection</b>
  - Finding medical data is a challenging task. However, nowadays many open source platforms provide the medical data for research.
  - This data is collected from kaggle website (https://www.kaggle.com/paultimothymooney/chest-xray-pneumonia).
  
<b>2) Data Preparation/Augmentation</b>
  - Data augmentation can be very useful to avoid overfitting as it adds invariance in to the data and generates different images.
  - Here, I performed shear(0.2), rescaling, zoom(0.2), and Horizontal flip.

<b>3) Model Training</b>
  - Model training is also a crucial part, which helps to learn patterns or features within data.
  - In this project, I have used 4 different architectures to detect pneumonia in patient and compared their performances.
    - Basic Model with (3 convolutions and 3 pooling alternately)
    - VGG16 Architecture
    - RESNET Architecture
    - Inception net

<b>4) Perfomance Evaluation</b>
  - To evaluate the performance of different models, I have used precision, recall, and F1 score as the dataset is imbalanced.
  - Ratio of dataset was (Pneumonia-75) : (Normal-25)
  - ![Performance](https://user-images.githubusercontent.com/55615788/118265208-6f67b280-b4d6-11eb-8fe8-c3f10f483200.JPG)
  - From the above comparison, it can be concluded that VGG16 architecture outperfoms other architectures for this dataset.

<b>5) Deployment</b>
  - Using VGG16 model, build a flask app to deploy the model.
  - Results
  ![image](https://user-images.githubusercontent.com/55615788/118357994-63452900-b59a-11eb-9ead-9079747c1a22.png)
  
  
  
  
  
