(Update. Consider the given .txt files)

Variables

var_names - holds the given variable names
dat_test - dataframe for the "training group"
dat_train - dataframe for the "test group"
merged - dataframe that contains all data (test and training group)
activities_train - dataframe that holds the indices in order to recognize the activities in the train group
activities_test - dataframe that holds the indices in order to recognize the activities in the test group
activities - dataframe that consists of activities_train and activities_test (activities$Activity then is factorised)
subj_train - dataframe that holds the subject data for the train group
subj_test - dataframe that holds subject data for test group
subject - dataframe that consists of subj_test and subj_train (subject$Subject then is factorised)
act_labels - holds the activity labels (in order to give proper names to the activity factor levels)
subs - vector to subset the dataframe (only measurements on the mean and standard deviation)
data - dataframe that holds the subsetted data and activity and subject
by_act_subj - datframe that is grouped by Activity and Subject
data_means - final dataframe with the desired means


