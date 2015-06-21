## Description about the program
I mostly worked it out according the instructions form the web.
# Merge Data
I first merged data from tran and test, also get some naming information from features.txt.
The subject assignment information comes form sub_train/text files.
# Clean Data
After getting the data, I replaced the activity from number to description inside activity_labels.txt.
Also only data related to mean and std are remained.
# Make a New Table
I used a loop to go through each column of observations.
After taking average according to their subjects and activities, each column gives me a matrix of 30*6, 30 for the subjects, and 6 for activities.
I then flattened this one matix in to one column again, attached related information about subject and activity, and combined all columns from observations into the final table.

