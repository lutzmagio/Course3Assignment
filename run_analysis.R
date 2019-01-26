############################################################################
# run_analysis.R
############################################################################

# Script expects folder with data "UCI HAR Dataset" in the working directory

p <- "UCI HAR Dataset"

# load data
subject_train <- read.table(file.path(p, "train", "subject_train.txt"))
X_train <- read.table(file.path(p, "train", "X_train.txt"))
y_train <- read.table(file.path(p, "train", "y_train.txt"))
subject_test <- read.table(file.path(p, "test", "subject_test.txt"))
X_test <- read.table(file.path(p, "test", "X_test.txt"))
y_test <- read.table(file.path(p, "test", "y_test.txt"))

# load features labels and convert to character
features <- read.table(file.path(p, "features.txt"))
features$V2 <- as.character(features$V2)

# remove braces and commas from feature labels
features$V2 <- gsub("\\(\\)", "", features$V2)
features$V2 <- gsub("\\(", "-", features$V2)
features$V2 <- gsub("\\)$", "", features$V2)
features$V2 <- gsub(",", "-", features$V2)

# create column names
names(X_train) <- features$V2
names(X_test) <- features$V2

# create ID columns
m_train <- dim(X_train)[1]
m_test <- dim(X_test)[1]
subject_train <- cbind.data.frame("ID" = 1:m_train, subject_train[,])
X_train <- cbind.data.frame("ID" = 1:m_train, X_train[,])
y_train <- cbind.data.frame("ID" = 1:m_train, y_train[,])
subject_test <- cbind.data.frame("ID" = (m_train+1):(m_train+m_test), subject_test[,])
X_test <- cbind.data.frame("ID" = (m_train+1):(m_train+m_test), X_test[,])
y_test <- cbind.data.frame("ID" = (m_train+1):(m_train+m_test), y_test[,])

# rename y columns
names(subject_train) <- c("ID", "subject")
names(y_train) <- c("ID", "activity")
names(subject_test) <- c("ID", "subject")
names(y_test) <- c("ID", "activity")

# merge training data
data <- merge(X_train, y_train, all = TRUE, by = "ID")
data <- merge(data, subject_train, all = TRUE, by = "ID")

# merge test data
data_test <- merge(merge(X_test, y_test, all = TRUE, by = "ID"),
          subject_test, all = TRUE, by = "ID")

# stick together for combined dataset
data <- rbind.data.frame(data, data_test)




# load activity labels
activity_labels <- read.table(file.path(p, "activity_labels.txt"))

# make activity column a factor with levels = activity labels
data$activity <- as.factor(data$activity)
levels(data$activity) = as.character(activity_labels$V2)

# select only the columns containing mean or std (standard deviation) values
#   (for some reason grep returns indices twices so unique is used)
my_columns <- unique(
    c(1, grep("mean|std|activity|subject", names(data)), dim(data)[2])
)
data <- data[, my_columns]

# remove variable not further necessary from workspace
rm(features, X_test, X_train, y_test, y_train, m_test, m_train, data_test,
   subject_train, subject_test, my_columns, activity_labels)

# make new dataset with this shape that contains the mean of each variable
# subject     activity    meanXYZ (79 x)
# ..
# ...
# ....

# firstly, prepare list with each mean and the categorization data
lmeans <- lapply(
    # create the split by subject
    split(data, data$subject), function(this_subject) {
        # ans <- data.frame("subject" = this_subject$subject[1],
        #                   "activity" = 
        #                   )
        
        # nested call of lapply for each activity
        
        ans <- lapply(
            split(this_subject, this_subject$activity),
            function(this_activity) {
                # separate columns actually containing data from categorization
                temp_data <- this_activity
                temp_data$ID <- NULL
                temp_data$activity <- NULL
                temp_data$subject <- NULL
                
                # column means for columns NOT named ID / activity / subject
                colMeans(temp_data)
            }
            
            
            
        )
        
        
    }
)

# convert list to data frame
nvar <- length(lmeans[[1]][[1]])
varnames <- names(lmeans[[1]][[1]])
nsubject <- length(lmeans)
nactivity <- length(lmeans[[1]])
means <- data.frame(matrix(ncol = 2 + nvar, nrow = nsubject))

# give names
colnames(means) <- c("subject", "activity", varnames)

# extract numbers from list to data frame:
i_means <- 1
# go through each subject
for (i_subject in 1:nsubject) {
    
    # go through each activity
    for (i_activity in 1:nactivity) {
        means[i_means, "subject"] <- names(lmeans[i_subject])
        means[i_means, "activity"] <- names(lmeans[[i_subject]][i_activity])
        
        means[i_means, 3:dim(means)[2]] <-
            lmeans[[i_subject]][[i_activity]]
        
        i_means <- i_means + 1
    }

}

# remove variable not further necessary from workspace
rm(lmeans, i_activity, i_means, i_subject, nactivity, nsubject, nvar,
   p, varnames)

# export means as a text file
write.table(means, file = "summary.txt", row.names = FALSE)