##################################
# Pair Assignment 1
# Lars Mehwald and Daniel Salgado
# 02 October 2015
##################################

# Loading needed packages
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

#Summary statistics: min-max, median, mean, 1st and 3rd quartile
summary(Orange)

#Standard deviation of 6 variables
StandardDeviation(Orange)

# Linear Regression: is the circumference of a tree a good 
# predictor for its age?
OrangeLinearModel <- lm(age ~ circumference, data=Orange)
# defining the linear model: age (y) as a function of circumference (x)
# in the data frame Orange
summary(OrangeLinearModel) # output of results: statistical significant
rm(OrangeLinearModel)
