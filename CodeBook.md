# Codebook 
##for the Getting and Cleaning Data assignment

#### The data is located in the file: averagedData.txt

###On the original raw data:

From the original raw data's README file, the following is known of the observations:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

###Transformations made to obtain current data set

To obtain the current dataset  from this I have used the raw data, column binding together the subject numbers, activity numbers and observations, and then row binding the training and test data. Thereafter I have added descriptive variable names to each of the columns, choosing "Activity" for the column of activities and "SubjectNo" for the column containing subject numbers. For the remaining variables I have chosen the names given in the features.txt file that came with the raw data, however, I have deleted special characters from the names taking out "()" and exchanging "-" for ".". 

In addition I have chosen to keep only the variables of mean and standard deviations, i.e. those features with feature names containing either "mean" or "std", zero or two characters from the end of the name.

Finally I have created a new data set, where I have only kept the averaged value of each of these observation made for identical subject numbers and activities. 
###Variables and observations in the current data set

#### Overview

The first two variables in the dataset are the names of the activities, in the first column called "Activity" and the volunteer subject number in the second column called "SubjectNo". All other variables are averaged values of the raw data for each combination of activity and subject number. There were 6 different activities and 30 volunteers, and each of the subjects has been observed performing each of the activities. Hence there are in total 180 observations in this averaged data set. 

The variables 3-68 that are the averaged observed mean and standard deviation measurements for each activity and subject. The variable names signify what they represent in the following summarised manner. The first letter of the variable name is either t or f. Variables starting with t are direct over time measurements, whereas f represent fast Fourier transforms of the same types of measurements. This letter is followed by either Body or Gravity, this partition is made because the measurements have been filtered to separate Body acceleration from Gravitational acceleration. The Body or Gravity part of the name signify which of these parts of the measurement are considered. Variables 63-68 for some reason have a double "Body" in their names as in the original features. Then the names have either Acc or Gyro depending on whether the measurement they denote are acceleration measurements or gyroscopic signals. For certain of the values this proceeded by the keyword "Jerk" which means that the measurement is not the gyro or acceleration measurement, but the rate of change of this measurement. Finally all measurements have either ".mean" or ".std" depending on whether they are mean or standard deviation measurements. All variables also either end in a ".X", ".Y" or ".Z" if they are measurements along each of these coordinates, or have a "Mag" preceding the ".mean" or ".std" for magnitude of total measured value.



#### Detailed list

1. Activity : This variable lists the activity as a, which can be one of the six options: "Walking", "Walking\_upstairs", "Walking\_downstairs", "Sitting", "Standing", "Laying". Used as described in the original README-file of the raw data. These are descriptive of the activities for which the observations have been made which I have substituted for the original activity numbers in the raw data. 

2. SubjectNo : Gives the subject number of the volunteer subject who bore the equipment and performed the activity for which the observations where made. There where 30 volunteers, hence the subject numbers take on values from 1 to 30. 

3. tBodyAcc.mean.X : Is the mean of all the measurements of the time averaged mean Body acceleration in the X direction measured for the given subject performing the given activity. 

4.  tBodyAcc.mean.Y : Is the mean of all the measurements of the time averaged mean Body acceleration in the Y direction measured for the given subject performing the given activity.

5. tBodyAcc.mean.Z : Is the mean of all the measurements of the time averaged mean Body acceleration in the Z direction measured for the given subject performing the given activity. 

6. tBodyAcc.std.X : Is the mean of all the measurements of the standard deviations of the time measured Body acceleration in the X direction measured for the given subject performing the given activity. 

7. tBodyAcc.std.Y : Is the mean of all the measurements of the standard deviations of the time measured Body acceleration in the Y direction measured for the given subject performing the given activity. 

8. tBodyAcc.std.Z : Is the mean of all the measurements of the standard deviations of the time measured Body acceleration in the Z direction measured for the given subject performing the given activity. 

9. tGravityAcc.mean.X : Is the mean of all the measurements of the time averaged mean Gravitational acceleration in the X direction measured for the given subject performing the given activity. 

10. tGravityAcc.mean.Y : Is the mean of all the measurements of the time averaged mean Gravitational acceleration in the Y direction measured for the given subject performing the given activity. 

11. tGravityAcc.mean.Z : Is the mean of all the measurements of the time averaged mean Gravitational acceleration in the Z direction measured for the given subject performing the given activity. 

12. tGravityAcc.std.X : Is the mean of all the measurements of the standard deviations of the time measured Gravitational acceleration in the X direction measured for the given subject performing the given activity.

13. tGravityAcc.std.Y : Is the mean of all the measurements of the standard deviations of the time measured Gravitational acceleration in the Y direction measured for the given subject performing the given activity. 

14. tGravityAcc.std.Z : Is the mean of all the measurements of the standard deviations of the time measured Gravitational acceleration in the Z direction measured for the given subject performing the given activity.

15. tBodyAccJerk.mean.X : Is the mean of all the measurements of the time averaged mean Body Jerk or rate of change of Body acceleration in the X direction measured for the given subject performing the given activity. 

16. tBodyAccJerk.mean.Y : Is the mean of all the measurements of the time averaged mean Body Jerk or rate of change of Body acceleration in the Y direction measured for the given subject performing the given activity. 

17. tBodyAccJerk.mean.Z : Is the mean of all the measurements of the time averaged mean Body Jerk or rate of change of Body acceleration in the Z direction measured for the given subject performing the given activity. 

18. tBodyAccJerk.std.X : Is the mean of all the measurements of the standard deviations of the Body Jerk or rate of change of Body acceleration in the X direction measured for the given subject performing the given activity. 

19. tBodyAccJerk.std.Y : Is the mean of all the measurements of the standard deviations of the Body Jerk or rate of change of Body acceleration in the Y direction measured for the given subject performing the given activity. 

20. tBodyAccJerk.std.Z : Is the mean of all the measurements of the standard deviations of the Body Jerk or rate of change of Body acceleration in the Z direction measured for the given subject performing the given activity. 

21. tBodyGyro.mean.X : Is the mean of all the measurements of the time averaged mean gyroscope signal in the X direction measured for the given subject performing the given activity.

22. tBodyGyro.mean.Y : Is the mean of all the measurements of the time averaged mean gyroscope signal in the Y direction measured for the given subject performing the given activity.

23. tBodyGyro.mean.Z : Is the mean of all the measurements of the time averaged mean gyroscope signal in the Z direction measured for the given subject performing the given activity.

24. tBodyGyro.std.X : Is the mean of all the measurements of the standard deviation of the gyroscope signal in the X direction measured for the given subject performing the given activity.

25. tBodyGyro.std.Y : Is the mean of all the measurements of the standard deviation of the gyroscope signal in the Y direction measured for the given subject performing the given activity.

26. tBodyGyro.std.Z : Is the mean of all the measurements of the standard deviation of the gyroscope signal in the Z direction measured for the given subject performing the given activity.

27. tBodyGyroJerk.mean.X : Is the mean of all the measurements of the time averaged mean Jerk of the gyroscope signal in the X direction measured for the given subject performing the given activity.

28. tBodyGyroJerk.mean.Y : Is the mean of all the measurements of the time averaged mean Jerk of the gyroscope signal in the Y direction measured for the given subject performing the given activity.

29. tBodyGyroJerk.mean.Z : Is the mean of all the measurements of the time averaged mean Jerk of the gyroscope signal in the Z direction measured for the given subject performing the given activity.

30. tBodyGyroJerk.std.X : Is the mean of all the measurements of the standard deviation of the Jerk of the gyroscope signal in the X direction measured for the given subject performing the given activity.

31. tBodyGyroJerk.std.Y : Is the mean of all the measurements of the standard deviation of the Jerk of the gyroscope signal in the Y direction measured for the given subject performing the given activity.

32. tBodyGyroJerk.std.Z : Is the mean of all the measurements of the standard deviation of the Jerk of the gyroscope signal in the Z direction measured for the given subject performing the given activity.

33. tBodyAccMag.mean : Is the mean of all the measurements of the time averaged mean of the total magnitude of the Body acceleration measured for the given subject performing the given activity.

34. tBodyAccMag.std : Is the mean of all the measurements of the standard deviation of the total magnitude of the Body acceleration measured for the given subject performing the given activity.

35. tGravityAccMag.mean : Is the mean of all the measurements of the time averaged mean of the total magnitude of the Gravitational acceleration measured for the given subject performing the given activity.

36. tGravityAccMag.std : Is the mean of all the measurements of the standard deviation of the total magnitude of the Gravitational acceleration measured for the given subject performing the given activity.

37. tBodyAccJerkMag.mean : Is the mean of all the measurements of the time averaged mean of the total magnitude of the Body Jerk or the rate of change of acceleration measured for the given subject performing the given activity.

38. tBodyAccJerkMag.std : Is the mean of all the measurements of the standard deviation of the total magnitude of the Body Jerk or the rate of change of acceleration measured for the given subject performing the given activity.

39. tBodyGyroMag.mean : Is the mean of all the measurements of the time averaged mean of the total magnitude of the gyroscope signal measured for the given subject performing the given activity.

40. tBodyGyroMag.std : Is the mean of all the measurements of the standard deviation of the total magnitude of the gyroscope signal measured for the given subject performing the given activity.

41. tBodyGyroJerkMag.mean : Is the mean of all the measurements of the time averaged mean of the total magnitude of the Jerk of the gyroscope signal measured for the given subject performing the given activity.

42. tBodyGyroJerkMag.std : Is the mean of all the measurements of standard deviation of the total magnitude of the Jerk of the gyroscope signal measured for the given subject performing the given activity.

43. fBodyAcc.mean.X : Is the mean of all the measurements of the mean of the fast Fourier transform of the Body acceleration in the X direction measured for the given subject performing the given activity. 

44. fBodyAcc.mean.Y : Is the mean of all the measurements of the mean of the fast Fourier transform of the Body acceleration in the Y direction measured for the given subject performing the given activity. 

45. fBodyAcc.mean.Z : Is the mean of all the measurements of the mean of the fast Fourier transform of the Body acceleration in the Z direction measured for the given subject performing the given activity. 

46. fBodyAcc.std.X : Is the mean of all the measurements of the standard deviation of the fast Fourier transform of the Body acceleration in the X direction measured for the given subject performing the given activity. 

47. fBodyAcc.std.Y : Is the mean of all the measurements of the standard deviation of the fast Fourier transform of the Body acceleration in the Y direction measured for the given subject performing the given activity. 

48. fBodyAcc.std.Z : Is the mean of all the measurements of the standard deviation of the fast Fourier transform of the Body acceleration in the Z direction measured for the given subject performing the given activity. 

49. fBodyAccJerk.mean.X : Is the mean of all the measurements of the mean of the fast Fourier transform of the Body acceleration Jerk in the X direction measured for the given subject performing the given activity. 

50. fBodyAccJerk.mean.Y : Is the mean of all the measurements of the mean of the fast Fourier transform of the Body acceleration Jerk in the Y direction measured for the given subject performing the given activity. 

51. fBodyAccJerk.mean.Z : Is the mean of all the measurements of the mean of the fast Fourier transform of the Body acceleration Jerk in the Z direction measured for the given subject performing the given activity. 

52. fBodyAccJerk.std.X : Is the mean of all the measurements of the standard deviation of the fast Fourier transform of the Body acceleration Jerk in the X direction measured for the given subject performing the given activity. 

53. fBodyAccJerk.std.Y : Is the mean of all the measurements of the standard deviation of the fast Fourier transform of the Body acceleration Jerk in the Y direction measured for the given subject performing the given activity. 

54. fBodyAccJerk.std.Z : Is the mean of all the measurements of the standard deviation of the fast Fourier transform of the Body acceleration Jerk in the Z direction measured for the given subject performing the given activity. 

55. fBodyGyro.mean.X : Is the mean of all the measurements of the mean of the fast Fourier transform of the Body gyroscope signal in the X direction measured for the given subject performing the given activity. 

56. fBodyGyro.mean.Y : Is the mean of all the measurements of the mean of the fast Fourier transform of the Body gyroscope signal in the Y direction measured for the given subject performing the given activity. 

57. fBodyGyro.mean.Z : Is the mean of all the measurements of the mean of the fast Fourier transform of the Body gyroscope signal in the Z direction measured for the given subject performing the given activity. 

58. fBodyGyro.std.X : Is the mean of all the measurements of the standard deviation of the fast Fourier transform of the Body gyroscope signal in the X direction measured for the given subject performing the given activity. 

59. fBodyGyro.std.Y : Is the mean of all the measurements of the standard deviation of the fast Fourier transform of the Body gyroscope signal in the Y direction measured for the given subject performing the given activity. 

60. fBodyGyro.std.Z : Is the mean of all the measurements of the standard deviation of the fast Fourier transform of the Body gyroscope signal in the Z direction measured for the given subject performing the given activity. 

61. fBodyAccMag.mean : Is the mean of all the measurements of the mean of the total magnitude of the fast Fourier transform of the Body acceleration measured for the given subject performing the given activity.

62. fBodyAccMag.std : Is the mean of all the measurements of the standard deviation of the total magnitude of the fast Fourier transform of the Body acceleration measured for the given subject performing the given activity.

63. fBodyBodyAccJerkMag.mean : Is the mean of all the measurements of the mean of the total magnitude of the fast Fourier transform of the Body acceleration Jerk measured for the given subject performing the given activity.

64. fBodyBodyAccJerkMag.std : Is the mean of all the measurements of the standard deviation of the total magnitude of the fast Fourier transform of the Body acceleration Jerk measured for the given subject performing the given activity.

65. fBodyBodyGyroMag.mean : Is the mean of all the measurements of the mean of the total magnitude of the fast Fourier transform of the Body gyroscope signal measured for the given subject performing the given activity.

66. fBodyBodyGyroMag.std : Is the mean of all the measurements of the standard deviation of the total magnitude of the fast Fourier transform of the Body gyroscope signal measured for the given subject performing the given activity.

67. fBodyBodyGyroJerkMag.mean : Is the mean of all the measurements of the mean of the total magnitude of the fast Fourier transform of the Jerk of the Body gyroscope signal measured for the given subject performing the given activity.

68. fBodyBodyGyroJerkMag.std : Is the mean of all the measurements of the standard deviation of the total magnitude of the fast Fourier transform of the Jerk of the Body gyroscope signal measured for the given subject performing the given activity.
