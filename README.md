#README for peer-review assignment in Getting and Cleaning Data with R

This folder contains the following files
* This file, README.md, which will guide you through all other files
* The script file scriptGetCleanData.R used to download, read tidy and write the data
* The file containing the data averageData.csv containing the final narrow data set
* The code book CodeBook.md specifying the data to be found in the data file
* The text file dowloadTime.txt which just includes the timestamp for the download of the raw data

###Obtaining and analysing the data -- scriptGetCleanData.R
The script used to perform the analysis described in the assignment text. The script is commented so it should be clear from reading the code what is being done where. The script includes 3 functions:
* dowloadUnzip() 
* readAndMerge()
* setActivityName()

#### downloadUnzip
In case the code needs to be run on a system where the data have not been downloaded this function exists to download the zip-file and unzip it. This operation may take some time and is not strictly part of the steps described in the assignment, hence it seemed natural to keep this functionality in a separate function. However, the main analysis function readAndMerge() includes an option download, which is default set to FALSE. If this download option is set to TRUE, the downloadUnzip functionality will be called before the rest of the function. Hence if you are trying to run the readAndMerge code and run into trouble because the data is missing, trying running with runAndMerg(download=TRUE).

To download and unzip the zip-file, the downloadUnzip function uses the library downloader. Hence the function starts by installing and loading this library. Then it checks for, and if not present creates a ./data subdirectory in the the working directory from which it is called. In this directory it downloads the zip-file from the url indicated in the assignment description, and then unzips it. Finally it notes the time a writes it to a file downloadTime.txt not in the the ./data subdirectory, but in the working directory. This so that the even if we delete the raw data, the timestamp for our download will be available.

#### readAndMerge
This is our main analysis file. It mainly follows the steps according to the assignment description, however there are a couple of exceptions. 

First the code checks for the download argument in order to check if the downloadUnzip() function should be called.

Then it proceeds to step 1, where the different data files are read. We start by column binding the test and train files respectively, having the two first columns be the activity number, from y\_test.txt and y\_train.txt respectively, and the subject number, from subject\_test.txt and subject\_train.txt respectively, followed by the observation data, from X\_test.txt and X\_train.txt. Then we row bind the train and test data. 

Then, as the names are useful in the filtering process, we proceed to step 4, and fetch all the variable names for the observations in the features.txt file. We add the names "Activity" and "SubjectNo" for the first two columns to the list of names from the feature files, and then add all these names to our combinde data frame.

Armed with the column names we pick out the columns with names including mean or std to or four characters from the end of the name, using grep. This concludes step 2.

In step 3, we need to change the activity numbers from the y-files into meaningful activity names. Here I have chosen to write a separate function setActivityName() which takes in a number, checks which number it is, and returns the corresponding descriptive activity name. I then use sapply to apply this function to all of the entries in the Activity column and then recast them as factors. 

As step 4 has already been made, and te columns are named appropriately, we go directly to step 5. Here we use aggregate to find the mean for each observation made when the same subject has performed the same activity. This results in a data frame with the wanted data, but which has Group.1 and Group.2 as column names for the Activity and SubjectNo columns, hence we rename these, and our data has reached the desired state. 

Finally we create the file averagedData.csv, and write our final data frame to this file.


#### setActivityName
This function is a helpful function to match an activity number between 1 and 6 with the corresponding descriptive activity name. As it takes a few lines of code, I found that it would be better to have it as a separate function, then including it as an anonymous function to be sent to sapply from inside readAndMerge. All it does is take in an integer and sing an if-else-branching setting the activityname according to this number. Then the activityname is returned. This function can then be used by sapply to translate all the activity numbers in the data to descriptive activity names.

###The final clean and lean data -- averageData.csv
The final averaged and cleaned data with descriptive variable names and activity names containing both training and test data, can be found in this file. I have chosen comma separated formatting for this file.

###The code book -- CodeBook.md
The codebook contains descriptions of each of the variables contained in the data file averadData.csv

###The timestamp file -- downloadTime.txt
This file contains just the write out of the POSIXt systems time when the raw data used to obtain the clean data was downloaded.
