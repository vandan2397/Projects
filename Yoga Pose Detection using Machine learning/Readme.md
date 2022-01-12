# YOGA POSE DETECTION USING MACHINE LEARNING

### Introduction
Pose detection techniques play vital role in computer vision to capture different body postures, which can be beneficial for various purposes, such as monitoring health, video-surveillance, human-computer interaction, sports analysis, etc,
Yoga is one such domain, where pose detection can help a lot by identifying correct postures. In a way, it can assist person doing yoga to evaluate, whether he is doing a correct posture or not.
In this project, we have leveraged pose estimation and machine learning techniques to detect different yoga poses on images, videos and live feeds. The Project involves a few problems and challenges such as, 

* Incorrect Posture can cause detrimental consequences to body.
* Incorrect posture can be unproductive and wastes time.
* Unaffordability of instructor.
* Availability of data

This is a Academic project as part of curriculum of course.

### Project Partner
- Aditya Shah (University of Houston)
- Jaysankar Sivakumar (University of Houston)
- Huai-an Su (University of Houston)
- Anirudh Pallerla (University of Houston)

### Methods Used
- Data Collection
- Data Augmentation
- Pose Estimation and Classification
- Machine Learning

### Tools and Libraries
- Python
- MediaPipe
- Pandas, Numpy, Matplotlib, Seaborn, Sklearn and Keras
- Jupyter IDE

### Project Flow
<b>1) Data Collection</b>
- Firstly, as a part of data collection, we webscraped the 1096 images of 6 different yoga poses.
    * Bhujangasana
    * Padmasana
    * Shavasana
    * Trikonasana
    * Vrikshasana
    * Tadasana
  
<b>2) Data Augmentation</b>
  - Data augmentation is an important technique to provide variety of data to models, which can help them learn different features.
  - In our project, we applied two different data augmentation techniques on our images such as horizontal flip and rotation at few angles.
  - We also captured images of different poses from different angles.
  - Purpose of performing data augmentation was to add variance into data.
  - After performing data augmentation, our images increased to 1500.
   ![image](https://user-images.githubusercontent.com/55615788/149187272-8c145a5f-06b1-4ff7-867d-7119470d13ae.png)

   
<b>3) Feature Extraction</b>
  - For pose estimation and feature extraction, we leveraged media pipe to get the coordinates of  every key points.
  - There are total 33 key points of a body part estimated by media pipe.
  - Each Key Point has 3 coordinates.
  - So, we will get 99 (33 *3) coordinates of each pose as features to train the model.
   ![image](https://user-images.githubusercontent.com/55615788/149187852-804c63fc-0961-42a2-9fc5-ffabc3fa260c.png)

<b>4) Data Preparation</b>
 - After extraction of coordinates, we prepared the dataset by adding labels of respective yoga pose to each sample.
 - Below gives a snapshot of Dataset  containing few features and samples along with labels.
  ![image](https://user-images.githubusercontent.com/55615788/149193448-789ba4d8-f84b-44e5-a7a8-e8fd7d4cb11e.png)


<b>5) Model Training</b>
  - We utilized 7 different deep learning and machine learning algorithms to train the models. 
    - Logistic Regression
    - Support Vector Machine
    - Decision Tree
    - Random Forest
    - Gradient Boost
    - Neural Network
    - Convolutional neural network

<b>6) Perfomance Evaluation</b>
  - To evaluate the performance of different models, We have used accuracy as the data is balanced.
   ![image](https://user-images.githubusercontent.com/55615788/149194717-72593f14-c2b8-4aed-aecb-f1101d455557.png)
  - Gradient Boosting outperforms all other algorithms.

<b>6) Detection</b>
- For detection, mediapipe extracts coordinates of each keypoint from each frame and then predicts using trained model. 
- Bhujangasana

https://user-images.githubusercontent.com/55615788/149195903-27294cb1-a823-4adb-acae-6a518d8d6ac7.mp4

![Bhujangasana](https://user-images.githubusercontent.com/55615788/149195910-124f1194-6c85-4dda-bcbc-acfdb66720b7.png)
