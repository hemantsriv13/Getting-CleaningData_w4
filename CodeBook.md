# Project Code Book

This is a reference document identifying each variable used in the given R script, *run_Analysis.R*.

A general overview and definition of each variable is given below.

## Variables in the dataset:

These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1. tBodyAcc-XYZ
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
4. tBodyGyro-XYZ
5. tBodyGyroJerk-XYZ
6. tBodyAccMag
7. tGravityAccMag
8. tBodyAccJerkMag
9. tBodyGyroMag
10. tBodyGyroJerkMag
11. fBodyAcc-XYZ
12. fBodyAccJerk-XYZ
13. fBodyGyro-XYZ
14. fBodyAccMag
15. fBodyAccJerkMag
16. fBodyGyroMag
17. fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

1. mean(): Mean value
2. std(): Standard deviation
3. mad(): Median absolute deviation 
4. max(): Largest value in array
5. min(): Smallest value in array
6. sma(): Signal magnitude area
7. energy(): Energy measure. Sum of the squares divided by the number of values. 
8. iqr(): Interquartile range 
9. entropy(): Signal entropy
10. arCoeff(): Autorregresion coefficients with Burg order equal to 4
11. correlation(): correlation coefficient between two signals
12. maxInds(): index of the frequency component with largest magnitude
13. meanFreq(): Weighted average of the frequency components to obtain a mean frequency
14. skewness(): skewness of the frequency domain signal 
15. kurtosis(): kurtosis of the frequency domain signal 
16. bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
17. angle(): Angle between to vectors.


## Variables used in *run_analysis.R* :

1. ***x_train*** : Data frame containing the values stored in **x_train.txt** file.
2. ***y_train*** : Data frame containing the activity IDs stored in **y_train.txt** file.
3. ***sub_train*** : Data frame containing the subject IDs stored in **subject_train.txt** file.
4. ***feat*** :Data frame containing the column names / measurement variables stored in **features.txt** file.
5. ***train*** : Column binded data frame containing the all variables stored in **x_train.txt**, **y_train.txt**, **sub_train.txt** file.
6. ***ind_mean*** : Numeric vector storing the column indices that have mean values in the dataset. 
7. ***ind_std*** : Numeric vector storing the column indices that have standard deviation values in the dataset.
8. ***sub1*** : Subset of the dataset **train** with all the **mean** columns and all the rows.
9. ***sub2*** : Subset of the dataset **train** with all the **standard deviation** columns and all the rows.
10. ***merged_train*** : Merged data frame with **sub1** and **sub2** columns combined.
11. ***x_test*** : Data frame containing the values stored in **x_test.txt** file.
12. ***y_test*** : Data frame containing the activity IDs stored in **y_test.txt** file.
13. ***sub_test*** : Data frame containing the subject IDs stored in **subject_test.txt** file.
14. ***test*** : Column binded data frame containing the all variables stored in **x_test.txt**, **y_test.txt**, **sub_test.txt** file.
15. ***sub1*** : Subset of the dataset **test** with all the **mean** columns and all the rows.
16. ***sub2*** : Subset of the dataset **test** with all the **standard deviation** columns and all the rows.
17. ***merged_test*** : Merged data frame with **sub1** and **sub2** columns combined.
18. ***merged_set*** : Row binded data frame combining data from **merged_train** and **merged_test**.
19. ***cnames*** : Vector storing all column names of **the merged_set**.
20. ***tidy_dataset*** : Data set with average value of each variable, for each activity, and each subject.

## Transformations on data 

1. ***Adding column names*** : The data frame **x_train** and **x_test** are given colun=mn names from the values of **feat** vector.
2. ***Taking subset for mean and sd*** : **sub1** and **sub2** are extracted using the "**select()**" function and then merged.
3. ***Merging "train" and "test"*** : In order to receive the final dataset with the mean and standard deviation values.
4. ***Editing column names*** : The string **"Body"** was removed from each column name to give space to more relevant info.
5. ***Providing labels to activityID*** : **"grep()"** function is used to provide each **activityLabel** it's actual activity name.
6. ***Creating the tidy set*** : Finally **"aggregate()"** function is used to create the **tidy_dataset.txt** which consists of average of each variable, for each activity, and each subject

