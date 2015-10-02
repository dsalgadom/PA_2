##################################
# Pair Assignment 1
# Function for computation of standard deviation 
# Lars Mehwald and Daniel Salgado
# 02 October 2015
##################################

# Function "StandardDeviation":
# This function computates the standard deviation of all variables that 
# belong to a data.frame. 
# The output shows the name of the variable and the standard deviation
# rounded to the second digit. 

StandardDeviation <- function(x) # x is the argument for the data.frame
{
  for (i in 1:length(names(x))) 
  #using the number of variable names as upper bond for loop
  { 
    x[, i] %>%
      sd() %>%
      round(digits = 2) %>%
      paste(names(x)[i], ., '\n') %>%  # . directs piping
      cat()
  }
}
