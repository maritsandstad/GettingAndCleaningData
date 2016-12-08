##Script with different functions to download
##merge and clean data for the 
## Getting and cleaning data assignment


## Function to download
## and unzip the data
downloadUnzip <- function(){
	
	##Installing and loading download library
	install.packages("downloader")
	library("downloader")
	
	##If not in existence, creating data directory
	if(!file.exists("./data")){dir.create("./data")}
	##setting the URL
	zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	##Creating tempfile for the zip file
	temp <- tempfile()
	##downloading
	download.file(zipUrl, temp, method = "curl")
	##Zipping al the files and putting them in a separate directory
	unzip(temp, exdir = "./data/")
	##Taking away the temporary temp file
	unlink(temp)
	## Making a file to save the timestamp of downloading:
	if(!file.exists("./downloadTime.txt")){file.create("./downloadTime.txt")}
	##Fetching the current time for the timestamp
	timestamp <- Sys.time()
	write(as.character(as.Date(timestamp)), file = "./downloadTime.txt")
	timestamp
}


##Reading in the data and merging to coherent train and test
##datasets
## Then merging the train and test sets into a single set
##Finally it averages the data and creates a new narrow and tidy
## dataset, which is written to the file averageData.csv
readAndMerge <- function(download = FALSE){
	
	##In case the function has been called with the download 
	##option true, we start by downloading the files
	if(download){
		timestamp <- downloadUnzip()
	}
	
	
	
	##Step 1:
	
	##Reading in and binding together the test data:
	Xtest <- read.table("./data//UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE)
	Ytest <- read.table("./data//UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)
	subjecttest <- read.table("./data//UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)
	testData <- cbind(Ytest, subjecttest, Xtest)
	
	
	##Reading in and binding together the training data
	Xtrain <- read.table("./data//UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE)
	Ytrain <- read.table("./data//UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE)
	subjecttrain <- read.table("./data//UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)
	trainData <- cbind(Ytrain, subjecttrain, Xtrain)
	
	##Then combining training and test to single dataset:
	fullRawData <- rbind(trainData, testData)

	##Step 4:

	##Making a detour here to step four as having the descriptive
	##variable names will be useful when performing step 2
	##First we fetch the feature names, i.e. the names of the
	## varibles in each observation.
	## These are listed in the features.txt file
	features <- read.table("./data//UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
	
	##The feature names are in the second column, but some of them
	## contain special characters that we would want to avoid:
	featuresOk <- gsub("\\(\\)", "", features[,2])
	featuresOk <- gsub("\\-", ".", featuresOk)
	##As we used column bind to add the activity labels,
	## subject numbers and measurements together (in that order)
	## We get meaningful variable names by concatinating in this way:
	varNames <- c("Activity", "SubjectNo", featuresOk) 
	## Then we make these the column names for our raw data
	names(fullRawData) <- varNames

	##Step 2
	
	
	##Taking out the mean and standard deviation for each measurement
	##i.e. those features that have mean() or std() at the end
	
	##First finding the indices for the variables with standar deviation or mean
	## followed by either (), or ()-XYZ
	meanSTDColumns <- grep("(mean|std)($|..$)", varNames, value = FALSE)
	##Then taking out the data from these columns in addition
	## to the columns for activity and subject labels
	meanStdData <- fullRawData[,c(1,2,meanSTDColumns)]
	
	
	##Step 3:
	
	##Below we have a separate method (setactivity)
	## Which takes in a number from 1-6 and substitutes it
	## with a corresponding descriptive activity name for
	## the six activities measured in the data set.
	## We combine this function with sapply to convert each value
	## in the data set, and finally convert the values to factors
	## before substituting them in the data fram
	meanStdData$Activity <- as.factor(sapply(meanStdData$Activity, setActivityName))
	
	
	##Step 4: Was made previously (before step 2)
	
	##Step 5:
	
	##We want the average of each variable for each
	## separate activity and subject. We use aggregate for this
	## We send the first two columns to aggregate by.
	## We  only aggregate for the the columns other then these
	## as otherwise we will get averages also for the activity and subject
	## numbers
	averagedData <- aggregate(meanStdData[,3:68], by = list(meanStdData$Activity, meanStdData$SubjectNo), FUN = "mean")
	
	##The aggregated data still have Activity and subject number as their two 
	## first columns, however, they have now been named Group.1 and Group.2
	## Hence we need to rename them back to get tidy data:
	names(averagedData)[1] <- "Activity"
	names(averagedData)[2] <- "SubjectNo"
	
	##Then finally we write the data to file
	if(!file.exists("./averagedData.txt")){file.create("./averagedData.txt")}
	write.table(averagedData, file = "./averagedData.txt", row.names = FALSE)
	

}

##Method to translate the activity label
##(integers 1-6) to a descriptive activity 
## label showing what activity the observed
## data belong to
setActivityName <- function(k){
	activityname <- if (k == 1){
		"Walking"
	}else if (k == 2){
		"Walking_upstairs"
	}else if (k == 3){
		"Walking_downstairs"
	}else if (k == 4){
		"Sitting"
	}else if (k == 5){
		"Standing"
	}else if (k == 6){
		"Laying"
	}else{
		NA
	}
	activityname
}
