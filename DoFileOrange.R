##################################
# Pair Assignment 1
# Lars Mehwald and Daniel Salgado Moreno
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
### Daniel: I use the "%>%" to skip one step
log(Orange$age) %>% hist(main = "Age of orange tree")

# Since this this transformation did not improve the distribution,
# the original data is used in the following
rm(Orange)
data(Orange)

# Variance
var(Orange$age)
var(Orange$circumference)

# Standard deviation of three variables
StandardDeviation(Orange)

# Standard error
sderror <- function(x) {sd(x)/sqrt(length(x))}
sderror(Orange$age)
sderror(Orange$circumference)

# Scatter plot for relation between circumference and age
plot(Orange$circumference, Orange$age, 
     main = "Circumference to age relation", 
     xlab = "Circumference of tree in certain year", 
     ylab = "Age of tree")

# Linear Regression: is the circumference a good predictor for age?
OrangeLinearModel <- lm(age ~ circumference, data=Orange)
# defining the linear model: age as a function of circumference 
# in the data.frame Orange
summary(OrangeLinearModel) # output of results: statistical significant
rm(OrangeLinearModel)
