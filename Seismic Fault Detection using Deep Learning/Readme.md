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

