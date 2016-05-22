var_names <- read.table("features.txt", stringsAsFactors = FALSE)
dat_test <- read.table("test/X_test.txt", col.names = var_names[,2])
dat_train <- read.table("train/X_train.txt", col.names = var_names[,2])
merged <- rbind(dat_train, dat_test)
subs <- grep(".([Mm]ean|std).", names(merged))
dat_mean_std <- merged[subs]

activities_train <- read.table("train/y_train.txt", col.names = "Activity")
activities_test <- read.table("test/y_test.txt", col.names = "Activity")
activities <- rbind(activities_train, activities_test)
activities$Activity <- factor(activities$Activity)

subj_train <- read.table("train/subject_train.txt", col.names ="Subject")
subj_test <- read.table("test/subject_test.txt", col.names ="Subject")
subject <- rbind(subj_train, subj_test)
subject$Subject <- factor(subject$Subject)

act_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
levels(activities$Activity) <- act_labels$V2

library(dplyr)
data_full <- cbind.data.frame(merged, subject, activities)
by_act <- group_by(data_full, Activity)
by_subj <- group_by(data_full, Subject)
data_means <- summarise_each(by_act, funs(median(., na.rm=TRUE)), -Subject)
means_subj <- summarise_each(by_subj, funs(median(., na.rm=TRUE)), -Activity)
names(data_means)[1] <- "ActivityOrSubject"
names(means_subj)[1] <- "ActivityOrSubject"
data_means <- rbind(data_means, means_subj)
