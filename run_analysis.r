library(plyr)
#Merge train and test data

xtrain <- read.table("train/X_train.txt", stringsAsFactors = FALSE)
ytrain <- read.table("train/y_train.txt", stringsAsFactors = FALSE)
# subjecttrain <- read.table("train/subject_train.txt", stringsAsFactors = FALSE)

xtest <- read.table("test/X_test.txt", stringsAsFactors = FALSE)
ytest <- read.table("test/y_test.txt", stringsAsFactors = FALSE)
subjecttest <- read.table("test/subject_test.txt", stringsAsFactors = FALSE)

xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)
subjectdata <- rbind(subjecttrain, subjecttest)

# Extract the mean and standard deviation for each measurement

features <- read.table("features.txt", stringsAsFactors = FALSE)

# get only columns with mean() or std() in their names
meanstd <- grep("-(mean|std)", features$V2)

# subset the desired columns
xdata <- xdata[, meanstd]

# correct the column names
names(xdata) <- features[meanstd, 2]

# Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt", stringsAsFactors = FALSE)

# update values with correct activity names
ydata$V1 <- activities[ydata$V1, 2]

# correct column name
names(ydata) <- "activity"

# Put descriptive variable names

# correct column name
names(subjectdata) <- "subject"

# bind all the data in a single data set
all <- cbind(subjectdata, ydata, xdata)

# Create a tidy data set with the average of each variable
# for each activity and each subject

# first two columns are subject and activity
result <- ddply(all, .(subject, activity), function(x) colMeans(x[, 3:length( names(all) )]))

write.table(result, "averages_data.txt", row.name=FALSE)
