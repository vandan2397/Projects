# SEISMIC FAULT DETECTION USING DEEP LEARNING

### Introduction
* Seismic fault detection uses sound waves to build a picture of what’s under the ground and help us identify faults by looking for discontinuities in the signal.

![image](https://user-images.githubusercontent.com/55615788/188991718-b9f01926-f04f-455f-93bd-222913f43115.png)

* Traditional approaches used to detect faults were by looking at faults, use image processing, and using domain knowledge to interpret the faults.
* Problems:
  - Operator intensive to study 2D or 3D seismic images.
  - Strenous for eyes.
  - Eigen structure coherence, gradient structure tensor have noise, which is sometimes difficult to differentiate.

In order to solve the problem, we are utilizing computer vision techniques.

### Objective
* The objective is to detect faults in seismic images using deep learning approach of image segmentation. 
* This project attempts to do a comparative analysis of three such image segmentation techniques: FPN, Unet, and Linknet along with three feature extractors Resnet, Inceptionnet, and VGG16.
* Leveraging best performing model, we are detecting faults in form of masked images.

### Impact an Value

* Identifying faults is critical in determining the size of the reservoir, which determines where to drill, what type of well to drill and  ultimately the amount of oil recovered from a reservoir.
* The detection of faults through ML has the potential to reduce both the time and cost of getting the oil out of the ground

### Workflow
![image](https://user-images.githubusercontent.com/55615788/188992664-e949e1e0-d306-4b38-a30b-39e87f18494b.png)

<b>1) Dataset </b>
* The dataset used in our project was the “Netherlands f3 block data”. 
* Contains different images of synthetic data and segmented data  (400 images) 
  - 200 - synthetic seismic images  
  - 200 - labeled images that clearly depict the faulty seismic data.
* [xinwucwp/faultSeg: Using synthetic datasets to train an end-to-end CNN for 3D fault segmentation (We are working on an improved version!) (github.com)]

<b>2) Data Augmentation</b>
* Data augmentation acts as a regularization to avoid overfitting and add variation into the data.
* Performed augmentation techniques such as horizontal and vertical flip on both seismic and masked images
* Results - the loss was significantly reduced, and the mean IOU increased as compared to results with 200 images.

![image](https://user-images.githubusercontent.com/55615788/188993867-b39a4e08-65ab-4805-939a-669352c5e2ed.png)

