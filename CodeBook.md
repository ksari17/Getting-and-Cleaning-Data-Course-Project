# Code Book for Course Project

# Introduction
This code book contains information relevant to the [UCI HAR data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and the processing behind the tidy data transformation.

# Background Information
The data was collected from an experiment that monitored the daily activities of 30 subjects while they carried waist-mounted smartphones with embedded inertial sensors.
Each volunteer performed six activities while wearing a Samsung Galaxy SII Smartphone on his/her waist:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

# Files
* 'README.txt' contains information about the experiment 
* 'features_info.txt'contains information about variables used within feature vector
* 'features.txt' lists all features
* 'activity_labels.txt' contains class labels and their activity names
* 'train/X_train.txt' contains training set
* 'train/y_train.txt'contains training labels
* 'test/X_test.txt' contains test set
* 'test/y_test.txt' contains test labels

# Data Transformation
* Step 1: Extract data from test, train, and main folders.
* Step 2: Extract mean and standard deviations.
* Step 3: Assign labels and names to data.
* Step 4: Merge test and train datasets into one dataset.
* Step 5: Create new tidy data set 'tidy.txt' with the average of each variable for each activity and each subject.

