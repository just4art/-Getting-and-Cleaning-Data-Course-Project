## Data

### Input

Human Activity Recognition Using Smartphones

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The source dataset was "built from the recordings of 30 subjects performing
activities of daily living while carrying a waist-mounted smartphone with
embedded inertial sensors".

Each person performed 6 activities.  The code table of the activities is in the
file `activity_labels.txt` in the source dataset.

The dataset contains 10299 observations of 561 measurements derived from the
raw measurements.

The dataset is divided into 2 groups: "training" data (70% of
subjects) and "test" data (30% of subjects).  Data files for each group are in
similarly named subdirectories, `train` and `test` respectively.

The observations are split in 3-3 files for each group:

 * `train/X_train.txt` and `test/X_test.txt` contain the measurements in a
   fixed-width format (561 columns with 1 space + 15 characters for each column),
 * `train/y_train.txt` and `test/y_test.txt` list the activity codes
   corresponding to the observations (1 column, range: 1-6),
 * `train/subject_train.txt` and `test/subject_test.txt` list the identifier of
   the subjects who performed the activity (type: numeric, range: 1-30).

The name of each measurement corresponding to columns of the "X" files are
listed in `features.txt`.

### Output

The tidy dataset produced by the `run_analysis.R` script contains 180
observations (30 subjects * 6 activities) of 82 variables:

 * `subject`: identifier of the subject volunteer
 * `activitycode`: identifier of the activity
 * `activityname`: name of the activity corresponding to `activitycode`
 * 79 measurement variables: average of the respective variable for the given
   subject and activity.  Out of the 561 original variables, only those
   containing mean and standard deviation are present.  Column names match the
   names of the original measurement variables, eg. `tBodyAcc-mean()-X`.
