Variables (update)

For each record it was provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

======================================

The data was given in two sets: The test set and the train set.

First step:

I merged the two sets to one large set with 10299 observation of 561 variables. Therefor I used the
rbind function.

Second step:
I used regular expressions to find variable names that contain the word "Mean", "mean" or "std" to extract
meassurements on the mean and standard deviation.

Third step:
I've read the activity (y_train.txt and y_test.txt) and subject classification files (subject_train.txt
and subject_test.txt) into R, factorised them and aech merged to one dataframe by using rbind.
Then I read in "activity_labels.txt" in order to rename the activiy factors. I did so by using the levels()-
method and the second column of the given file.

Fourth step
I added the subject and activities columns by using the cbind.data.frame()-method and created a dataframe that
holds all information.
I let most of the variable names untouched as I found them quite descriptive. I only edited the variable names
for the two columns I added two "Subject" and "Activity".

Fifth step
In order to provide a dataset that holds the average of each variable for each activity and each subject, I used
some functions from the dplyr-package.
First I grouped the data by activity and subject using the group_by()-function. I then averaged the data for each
variable by using the summarise_each()-function in conjunction with the median() function for each grouped set.
I finally merged the sets together using rbind and changing the first variable name to "ActivityOrSubject" as a
descriptive name.


