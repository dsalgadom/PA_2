##################################
# Pair Assignment 1
# Lars Mehwald and Daniel Salgado
# 02 October 2015
##################################

# Loading needed packages
search()
library('ggplot2')
library('magrittr')

# Loading  own function to calculate standard deviation
source('FunctionStandardDeviation.R')

#Loading R datasets: Orange
data()
data(Orange)
?Orange
class(Orange) <- "data.frame"

##################################
#Analysis of Orange dataset
##################################


# Getting to know the data frame
?Orange
names(Orange)

# Summary statistics: min-max, median, mean, 1st and 3rd quartile
summary(Orange)

# Histogram for variables: age, circumference 
hist(Orange$age, main = "Age of orange tree")
hist(Orange$circumference, main = "Circumference of orange tree")

# The histogram revealed that the variable age is skewed:
# therefore the variable is transformed (log)
Orange$age <- log(Orange$age)
hist(Orange$age, main = "Age of orange tree")

# Since this this transformation did not improve the distribution,
# the original data is used in the following
rm(Orange)
data(Orange)

# Standard deviation of 6 variables
StandardDeviation(Orange)

# Linear Regression: is the circumference a good predictor for age?
OrangeLinearModel <- lm(age ~ circumference, data=Orange)
# defining the linear model: age as a function of circumference 
# in the data.frame Orange
summary(OrangeLinearModel) # output of results: statistical significant
rm(OrangeLinearModel)
