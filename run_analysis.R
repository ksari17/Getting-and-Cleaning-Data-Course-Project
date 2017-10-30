# Getting and Cleaning Data Course Project 2017
# Kriti Sarin

# Load data.table package
library(data.table)

# Read data from features and activity labels
activity_labels <- read.table("./activity_labels.txt",header=FALSE,colClasses="character")
features <- read.table("./features.txt",header=FALSE,colClasses="character")

# Read data from training set
X_train <- read.table("./train/X_train.txt",header=FALSE)
y_train <- read.table("./train/y_train.txt",header=FALSE)
subject_train <- read.table("./train/subject_train.txt",header=FALSE)

# Read data from test set
X_test <- read.table("./test/X_test.txt",header=FALSE)
y_test <- read.table("./test/y_test.txt",header=FALSE)
subject_test <- read.table("./test/subject_test.txt",header=FALSE)

# Extract means and standard deviations from data
mean_std <- grepl("mean|std", features$V2)
features <- features[mean_std,]
X_test <- X_test[,mean_std]
X_train <- X_train[,mean_std]

# Assign labels and names to data
y_test$V1 <- factor(y_test$V1,levels=activity_labels$V1,labels=activity_labels$V2)
y_train$V1 <- factor(y_train$V1,levels=activity_labels$V1,labels=activity_labels$V2)

# Label data from test set
colnames(X_test) <- features$V2
colnames(y_test) <- "Activity Type"
colnames(subject_test) <- "Subject ID"

# Label data from training set
colnames(X_train) <- features$V2
colnames(y_train) <- "Activity Type"
colnames(subject_train) <- "Subject ID"

# Merge the datasets
test_set <- cbind(X_test,y_test)
test_set <- cbind(test_set,subject_test)
training_set <- cbind(X_train,y_train)
training_set <- cbind(training_set,subject_train)
data <- as.data.table(rbind(test_set,training_set))

# Create new tidy dataset with averages
tidy <- data[,lapply(.SD,mean),by = "Activity Type,Subject ID"]
tidy <- tidy[order(Subject ID),]
write.table(tidy,file="tidy.txt",row.names = FALSE)
