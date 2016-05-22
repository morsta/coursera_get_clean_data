#read the variable names from the given file:
var_names <- read.table("features.txt", stringsAsFactors = FALSE)
dat_test <- read.table("test/X_test.txt", col.names = var_names[,2])
dat_train <- read.table("train/X_train.txt", col.names = var_names[,2])
merged <- rbind(dat_train, dat_test)
#subs <- grep(".([Mm]ean|std).", names(merged))
#dat_mean_std <- merged[subs]

#read in activity data
activities_train <- read.table("train/y_train.txt", col.names = "Activity")
activities_test <- read.table("test/y_test.txt", col.names = "Activity")
activities <- rbind(activities_train, activities_test)
activities$Activity <- factor(activities$Activity)
#read in subject data
subj_train <- read.table("train/subject_train.txt", col.names ="Subject")
subj_test <- read.table("test/subject_test.txt", col.names ="Subject")
subject <- rbind(subj_train, subj_test)
subject$Subject <- factor(subject$Subject)
#rename the activities (descriptive names)
act_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
levels(activities$Activity) <- act_labels$V2

library(dplyr)
#extract the meassurement on the mean and standard derivation:
subs <- grep(".([Mm]ean|std).", names(merged))
data <- cbind.data.frame(subject, activities, merged[subs])
#group by activity and subject:
by_act_subj <- group_by(data, Activity, Subject)
#calculate median based on the grouped variables:
data_means <- summarise_each(by_act_subj, funs(mean(., na.rm=TRUE)))

