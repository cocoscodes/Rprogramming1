getwd()

myfunction <- function(){
  x <- rnorm(100)
  mean(x)
}

ls()# shows the elements in your environment

myfunction()

dir()# shows the files in your directory

?source("Rprogramming1.R")

second <- function(x){
  x + rnorm(length(x))
}

second(10)

?dim()# dimensions of an object


# notes on Week 1 -----
# if you would like to add a number with a text type use a capital L next to it "1L"
# "Inf" is a numerical value representing infinity
# NaN - undefined value