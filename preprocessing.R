# Data Preprocessing

# Importing the dataset
dataset = read.csv('NAME_OF_FILE.csv')

# Taking care of missing data (replace with mean)
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)

#encoding categorical data (assign numbers to each categorial variable)
dataset$Country = factor(dataset$Country,
                         levels = c('Column1','Column2','Column3'),
                         labels = c(1,2,3))
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No','Yes'),
                           labels = c(0,1))

#splitting data set into Training Set and Test Set
#install.packages('caTools')
library(caTools)     
set.seed(123)    
split = sample.split(dataset$Purchased, SplitRatio = 0.8)   
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature Scaling
training_set[,2:3] = scale(training_set[,2:3])    #only feature scale the non-categorical columns
test_set[,2:3] = scale(test_set[,2:3])

