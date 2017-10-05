#Simple Linear Regression

# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Simple linear Regression to Training Set
regressor = lm(formula=Salary ~ YearsExperience,
               data = training_set)    #we're saying salary is proportional to years experience

#Predicting the Test Set Results
y_pred = predict(regressor,newdata=test_set)   #gives vector of predictions for dependent variable based on values in test set

# Visualising the Training Set Results
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),
             colour = 'red') +
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata=training_set)),
            colour = 'blue') +
  ggtitle("Salary vs Years Experience (Training Set)") +
  xlab("Years of Experience") +
  ylab("Salary")


#Now test the model on the Test Set
ggplot() +
  geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary),
             colour = 'red') +
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata=training_set)),
            colour = 'blue') +
  ggtitle("Salary vs Years Experience (Test Set)") +
  xlab("Years of Experience") +
  ylab("Salary")
  