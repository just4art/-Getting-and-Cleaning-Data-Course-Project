# Read measurements
measurements <- read.table('UCI HAR Dataset/features.txt', colClasses = c('numeric', 'character'), comment.char = '')
colnames(measurements) <- c('id', 'name')

# "2. Extract only the measurements on the mean and standard deviation for each
# measurement"

measurements_wanted <- grepl('-(mean|std)', measurements$name)
widths = c()
for (i in seq_along(measurements_wanted)) {
    wanted <- measurements_wanted[i]
    widths <- append(widths, if (wanted) c(-1, 15) else -16)
}

# Read 'training' data
train <- read.fwf('UCI HAR Dataset/train/X_train.txt', widths = widths, colClasses = 'numeric', comment.char = '')
train$activitycode <- read.fwf('UCI HAR Dataset/train/y_train.txt', widths = 1, colClasses = 'numeric', comment.char = '')[, 1]
train$subject <- read.fwf('UCI HAR Dataset/train/subject_train.txt', widths = 2, colClasses = 'numeric', comment.char = '')[, 1]

# Read 'test' data
test <- read.fwf('UCI HAR Dataset/test/X_test.txt', widths = widths, colClasses = 'numeric', comment.char = '')
test$activitycode <- read.fwf('UCI HAR Dataset/test/y_test.txt', widths = 1, colClasses = 'numeric', comment.char = '')[, 1]
test$subject <- read.fwf('UCI HAR Dataset/test/subject_test.txt', widths = 2, colClasses = 'numeric', comment.char = '')[,1]

# "1. Merge the training and the test sets to create one data set"

all <- merge(train, test, all = T)

# "3. Use descriptive activity names to name the activities in the data set"
activities <- read.table('UCI HAR Dataset/activity_labels.txt', colClasses = c('numeric', 'character'), comment.char = '')
colnames(activities) <- c('id', 'name')
all$activityname <- factor(all$activitycode, levels = activities$id, labels = activities$name)

# "4. Appropriately label the data set with descriptive activity names"

measurement_indexes <- which(measurements_wanted)
measurement_names <- measurements[measurement_indexes, 'name']
colnames(all)[seq_along(measurement_names)] <- measurement_names

# "5. Create a second, independent tidy data set with the average of each variable for
# each activity and each subject"
molten <- melt(all, measure.vars = measurement_names)
tidy <- dcast(molten, subject + activitycode + activityname ~ variable, mean)

# Write the tidy dataset to file
write.csv(tidy, file = 'tidy.txt')