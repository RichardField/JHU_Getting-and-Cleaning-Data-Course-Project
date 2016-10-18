#  Code Book

## Original Data Set
Use of this dataset in publications must be acknowledged by  referencing the following publication.
*Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and  Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a  Multiclass Hardware-Friendly Support Vector Machine. International Workshop  of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012* 
* 'features_info.txt' -  Shows information about the variables used on the feature vector.
* 'features.txt' -  List of all features.
* 'activity_labels.txt' -  Links the class labels with their activity name.
* 'train/X_train.txt' -  Training set.
* 'train/y_train.txt’ -  Training labels.
* 'test/X_test.txt' - Test set.
* 'test/y_test.txt' -  Test labels.


## Overview of Data Collection
*Source Readme.txt file provide with raw dataset*

Sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
  
Following records were stored:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables. 
* A activity label. 
* An identifier of the subject who carried out the experiment. 

  
