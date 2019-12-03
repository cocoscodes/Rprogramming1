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
# Atributtes - names, dimnames, dimensions, class, lenght, other metadata
attributes()

# to create vectors one uses the c() function
x <- c(1+0i, 2+4i)

y <- vector("numeric", length = 10)
y

# Explicit Coercion
# Objects can be explicitly coerced from one class to another using the as.* functions, if available.
x <- 0:6
class(x)

as.numeric(x)

as.logical(x)

as.character(x)

x <- list(1,"a",TRUE,1+4i)
x
