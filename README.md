README

All files can be downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The task was the following:

"You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

Consider the README.txt from the given data.

In addition this dataset provides a  dataset, that holds  the average of each variable for each 
activity and each subject from observations from test and train groups.


The script is pretty straight forward and basic, but you'll need the dplyr-package to run it.

Explanation of the Code:

First step:

I merged the two sets to one large set with 10299 observation of 561 variables. Therefor I used the
rbind function.

Second step:

Third step:
I've read the activity (y_train.txt and y_test.txt) and subject classification files (subject_train.txt
and subject_test.txt) into R, factorised them and aech merged to one dataframe by using rbind.
Then I read in "activity_labels.txt" in order to rename the activiy factors. I did so by using the levels()-
method and the second column of the given file.

Fourth step
I used regular expressions to find variable names that contain the word "Mean", "mean" or "std" to extract
meassurements on the mean and standard deviation.
I added the subject and activities columns by using the cbind.data.frame()-method and created a dataframe that
holds all desired information.
I let most of the variable names untouched as I found them quite descriptive. I only edited the variable names
for the two columns I added two "Subject" and "Activity".

Fifth step
In order to provide a dataset that holds the average of each variable for each activity and each subject, I used
some functions from the dplyr-package.
First I grouped the data by activity and subject using the group_by()-function. I then averaged the data for each
variable by using the summarise_each()-function in conjunction with the mean() function for each grouped set.
