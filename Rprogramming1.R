getwd()

myfunction <- function(){
  x <- rnorm(100)
  mean(x)
}

ls()# shows the elements in your environment

myfunction()

dir()# shows the files in your directory

source("Rprogramming1.R")

second <- function(x){
  x + rnorm(length(x))
}

second(10)

?dim()# dimensions of an object

# Notes on week 1 -----
# if you would like to add a number with a text type use a capital L next to it "1L"
# "Inf" is a numerical value representing infinity
# NaN - undefined value
# Atributtes - names, dimnames, dimensions, class, lenght, other metadata
attributes()

#Vector ----
# to create vectors one uses the c() function
x <- c(1+0i, 2+4i)

y <- vector("numeric", length = 10)
y

# Explicit Coercion ----
# Objects can be explicitly coerced from one class to another using the as.* functions, if available.
x <- 0:6
class(x)

as.numeric(x)

as.logical(x)

as.character(x)

# List ----
# lists are vectors that can have diffent types
x <- list(1,"a",TRUE,1+4i)
x

# matrices ----
m <- matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)

m <- matrix(1:6, nrow = 2, ncol = 3)
m

m <- 1:10
dim(m) <- c(2,5) # another way of generating a matrix by asigning dimensions to the original vector
m

# binding
z <- 1:3
y <- 10:12
cbind(z,y)
rbind(z,y)

# Factor ----
# a special type of vector to represent categorical data

f <- factor(c("yes", "yes", "no", "yes", "no"))
f
table(f)
unclass(f)# strips the class of a factor
f

f <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no")) # orders the factor
f

# Missing values ----
NaN # undefined mathematical values
NA # missing value
is.na()
is.nan()
# the NA and NaN can have different classes
# a NaN values is a NA but not the reverse

mv <- c(1, 2, NA, NaN, 3)
## Return a logical vector indicating which elements are NA
is.na(mv)
## Return a logical vector indicating which elements are NaN
is.nan(mv)

# Data frame ----
# used to view tabular data with different types

# Data frames are usually created by reading in a dataset using the 
read.table() or 
read.csv().
#However, data frames can also be created explicitly with the 
?data.frame() function 
#or they can be coerced from other types of objects like lists.
#Data frames can be converted to a matrix by calling 
data.matrix(). 
#While it might seem that the
as.matrix() function 
#should be used to coerce a data frame to a matrix, almost always, what you want is the result of 
data.matrix().

df <- data.frame(foo = 1:4, bar = c(T, T, F, F))
df
nrow(df)
ncol(df)

# Names ----
n <- 1:3
names(n)
names(n) <- c("one","two","three")
n
names(n)
# list can also have names
l <- list(a=1,b=2,c=3)
l
# matrices dimensions names
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")
m

# Reading data ----
read.table, read.csv, # for reading tabular data
readLines, # for reading lines of a text file
source, # for reading in R code files (inverse of dump)
dget, #for reading in R code files (inverse of dput)
load, # for reading in saved workspaces
unserialize, # for reading single R objects in binary form

# writting data
write.table, # for writing tabular data to text files (i.e. CSV) or connections
writeLines, # for writing character data line-by-line to a file or connection
dump, # for dumping a textual representation of multiple R objects
dput, # for outputting a textual representation of an R object
save, # for saving an arbitrary number of R objects in binary format (possibly compressed) to a file.
serialize, # for converting an R object into a binary format for outputting to a connection (or file).

# Reading large data set ----
# figure out if your computer's RAM will support the data set
1,500,000 × 120 × 8 bytes/numeric = 1,440,000,000 bytes
= 1,440,000,000 / 2^20 bytes/MB
= 1,373.29 MB
= 1.34 G # rule of thumb you will need double this value to use read.table

# Example to optimize the data set reading - this will allow reduce the memory usage
initial <- read.table("datatable.txt", nrows = 100) # create a small subset
classes <- sapply(initial, class) # define the class type
tabAll <- read.table("datatable.txt", colClasses = classes) # create the final dataset and assign the classes

# Textual data formats ----
# using dput, dget, and dump
y <- data.frame(a=1,b="a")
dput(y)
dput(y,file="y.R")# creates an R script for one object
new.y <- dget("y.R")# creates and object using and R script
new.y

w <- "foo"
y <- data.frame(a=1,b="a")
dump(c("w","y"),file = "data.R")# creates an R script using multiple objects
rm(w,y)# removes objects
source("data.R")# brings back object from an R script
y
w

# Connections: Interfaces to the Outside World ----
file() # opens a connection to a file
gzfile() # opens a connection to a file compressed with gzip
bzfile() # opens a connection to a file compressed with bzip2
url() # opens a connection to a webpage
file.choose() # usefull

# Subsetting ----
x <- c("a", "b", "c", "c", "d", "a")
x[1] ## Extract the first element
x[2] ## Extract the second element
x[1:4]
x[c(1, 3, 4)]

u <- x > "a" # adding a logical parameter
u
x[u]

# Subsetting matrices ----
x <- matrix(1:6, 2, 3)
x
x[1, 2]
x[1, ] ## Extract the first row
x[, 2] ## Extract the second column

x <- matrix(1:6, 2, 3) # when subsetting one element of a matrix you might get a vector instead of a matrix, use the drop argument to avoid this
x[1, ]
x[1, , drop = FALSE]

# Subsetting a list ----
x <- list(foo = 1:4, bar = 0.6)
x[1]
x[[1]]
x[["bar"]]
x$bar

# Subsetting nested elements in a list
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x
## Get the 3rd element of the 1st element
x[[c(1, 3)]]
## Same as above
x[[1]][[3]]

# Extract multiple elements
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

# Patial matching
x <- list(aardvark = 1:5)
x$a
x[["a"]] # NULL
x[["a", exact = FALSE]]

# Removing NA ----
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
print(bad)
x[!bad]# subset which is TRUE

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y) # multiple elements
good
x[good]
y[good]
# you can use complete.cases() in data frames too

# Vectorized operations ----
# to avoid writting many forloops and whileloops
x <- 1:4
y <- 6:9
z <- x + y
z

x > 2 # logical comparison

x - y
x * y
x / y

# Vectorized operations in matrices
x <- matrix(1:4, 2, 2)
y <- matrix(rep(10, 4), 2, 2) # repeat 10 4 times
x * y # element-wise multiplication
x / y
x %*% y # true matrix multiplication - sort of a sumproduct

# Quiz week 1 ----
x <- c(4, "a", TRUE)
class(x)

x <- c(1,3, 5)  
y <- c(3, 2, 10)
cbind(x,y)
x <- list(2, "a", "b", TRUE)
x[[1]]
length(x[[1]])
x <- 1:4 
y <- 2:3
class(x+y)
x <- c(3, 5, 1, 10, 12, 6)
x[x<6]==0
x[x %in% 1:5] <- 0
x
data <- read.csv(file.choose())
head(data)
tail(data)
str(data)
data[47,]
summary(is.na(data[,1]))
data
summary(data)
good <- complete.cases(data)
summary(data[good,])

str(data)
summary(data[data$Ozone>31 & data$Temp>90,])

summary(data[data$Month==6,])

summary(data[data$Month==5,])

x <- 4
class(x)
x

# Notes on week 2 ----
# Dates and Times in R ----
x <- as.Date("1970-01-01")
x
class(x)

unclass(x) # 0 it is the first date
unclass(as.Date("1970-01-02")) # 1, it is second date availble as the sequential list of dates

# Times can be coerced from a character string using the as.POSIXlt or as.POSIXct function
x <- Sys.time()
x
class(x) ## 'POSIXct' object
unclass(x) ## Internal representation
x$sec ## Can't do this with 'POSIXct'! you need a POSIXlt


p <- as.POSIXlt(x)
p
class(p)
names(unclass(p)) 
# "sec" "min" "hour" "mday" "mon" "year" "wday" "yday" "isdst" "zone" "gmtoff"
p$wday ## day of the week  
p$sec ## That's better

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x # strptime() takes a character vector that has dates and times and converts them into to a POSIXlt object.
class(x)
?strptime # to see the format to be displayed

# Operations in dates in R ----
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y # Error
x <- as.POSIXlt(x) # making them compatible allows operations between them
x-y

x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x-y # no need to adjust leap years, leap seconds, daylight savings, and time zones

## My local time zone
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x

# Managing Data Frames with the dplyr package ----
install.packages("dplyr")
library(dplyr)

chicago <- readRDS("chicago")
dim(chicago)
str(chicago)
summary(chicago)
head(chicago)

names(chicago)[1:3]
subset <- select(chicago, city:dptp) # select function simplifies the operation
head(subset)
select(chicago, -(city:dptp)) # as before we can omit values

i <- match("city", names(chicago)) # match brings numerical value
j <- match("dptp", names(chicago))
head(chicago[, -(i:j)])

subset <- select(chicago, ends_with("2"))
str(subset)
subset <- select(chicago, starts_with("d"))
str(subset)
?select

chic.f <- filter(chicago, pm25tmean2 > 30)# filter the data frame using operations
str(chic.f)
summary(chic.f$pm25tmean2)

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
select(chic.f, date, tmpd, pm25tmean2)

chicago <- arrange(chicago, date) # arranging and sorting
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)

chicago <- arrange(chicago, desc(date)) # descending
head(select(chicago, date, pm25tmean2), 3)
tail(select(chicago, date, pm25tmean2), 3)

head(chicago[, 1:5], 3)
chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2) # rename columns
head(chicago[, 1:5], 3)

chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE)) # mutate creates new variables from existign variables
head(chicago)
# There is also the related transmute() function, which does the same thing as mutate() but then drops all non-transformed variables.
head(transmute(chicago, 
               pm10detrend = pm10tmean2 - mean(pm10tmean2, na.rm = TRUE),
               o3detrend = o3tmean2 - mean(o3tmean2, na.rm = TRUE)))

chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
head(chicago)
?DateTimeClasses

years <- group_by(chicago, year) # group_by creaetes a tibble
years
summarize(years, pm25 = mean(pm25, na.rm = TRUE),
          o3 = max(o3tmean2, na.rm = TRUE),
          no2 = median(no2tmean2, na.rm = TRUE)) # it usually is followed by a summarize function 

# getting the results with quintiles of pm25
qq <- quantile(chicago$pm25, seq(0, 1, 0.2), na.rm = TRUE) # quantile calculates the intervals
chicago <- mutate(chicago, pm25.quint = cut(pm25, qq)) # cut converts numeric to factor
head(chicago)
quint <- group_by(chicago, pm25.quint)
quint
summarize(quint, o3 = mean(o3tmean2, na.rm = TRUE),
          no2 = mean(no2tmean2, na.rm = TRUE))

# to avoid nesting functions we can us the operator "pipe" %>%, with this we dont need a set of temporary variables
mutate(chicago, pm25.quint = cut(pm25, qq)) %>%
  group_by(pm25.quint) %>%
  summarize(o3 = mean(o3tmean2, na.rm = TRUE),
            no2 = mean(no2tmean2, na.rm = TRUE))

mutate(chicago, month = as.POSIXlt(date)$mon + 1) %>%
  group_by(month) %>%
  summarize(pm25 = mean(pm25, na.rm = TRUE),
            o3 = max(o3tmean2, na.rm = TRUE),
            no2 = median(no2tmean2, na.rm = TRUE))
# dplyr can work with other data frame “backends” such as SQL databases. There is an SQL interface for relational databases via the DBI package
# dplyr can be integrated with the data.table package for large fast tables

# Control structures ----
if and else # testing a condition and acting on it
  for # execute a loop a fixed number of times
while #execute a loop while a condition is true
repeat # execute an infinite loop (must break out of it to stop)
  break # break the execution of a loop
next # skip an interation of a loop
return # exit a function

# useful for writting programms, but the apply functions are more useful

x <- runif(1, 0, 10) # random deviates for a uniform distribution
if(x > 3) {
  y <- 10
} else {
  y <- 0
}

for(i in 1:10) {
  print(i)
}

x <- c("a", "b", "c", "d")
for(i in 1:4) {
  ## Print out each element of 'x'
  print(x[i])
}

## Generate a sequence based on length of 'x'
for(i in seq_along(x)) { # seq_along generate an integer sequence based on the length of an object
  print(x[i])
}

for(letter in x) {
  print(letter)
}

# For one line loops, the curly braces are not strictly necessary.
for(i in 1:4) print(x[i])

# nested loops
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) { # similar to seq_along, but with length
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}
# be careful not to nest more than 2 or 3 layers, it gets confusing

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}
# while loops can become infinite if not handle with care

z <- 5
set.seed(1) # Set the seed of R‘s random number generator, which is useful for creating simulations or random objects that can be reproduced.
while(z >= 3 && z <= 10) {
  coin <- rbinom(1, 1, 0.5) # flipping a coin - rbinom generates random for binomial distributio
  if(coin == 1) { ## random walk
    z <- z + 1
  } else {
    z <- z - 1
  }
}
print(z)
# & and && indicate logical AND and | and || indicate logical OR. The shorter form performs elementwise comparisons in much the same way as arithmetic operators. The longer form evaluates left to right examining only the first element of each vector. Evaluation proceeds only until the result is determined. The longer form is appropriate for programming control-flow and typically preferred in if clauses.

# repeat, next, break
x0 <- 1
tol <- 1e-8
repeat { # repeat starts an infinite loop that search to get close enough to a value, optimization
  x1 <- computeEstimate() # function not defined, just for the example
  if(abs(x1 - x0) < tol) { ## Close enough?
    break
  } else {
    x0 <- x1
  }
}

# next
for(i in 1:100) {
  if(i <= 20) {
    ## Skip the first 20 iterations
    next
  }
  ## Do something here
}

# break
for(i in 1:100) {
  print(i)
  if(i > 20) {
    ## Stop loop after 20 iterations
    break
  }
}

# Funtions ----
add2 <- function(x,y){
  x+y
}
add2(3,5)

above10 <- function(x){
  use <- x>10
  x[use]
}

x <- 1:20
above10(x)

above <- function(x,n){ # you can specify parameters such as n=10
  use <- x>n
  x[use]
}

x <- 1:20
above(x,12)

columnmean <- function(x){
  nc <- ncol(x)
  means <- numeric(nc)# this turns the number of columns to zeros
  for(i in 1:nc){
    means[i] <- mean(x[,i],na.rm = TRUE)# if you do not specify to remove NAs it will get NA results
  }
  means
}

columnmean(airquality)
head(airquality)

f1 <- function(num) {
  for(i in seq_len(num)) {
    cat("Hello, world!\n")# concatenate and print function cat
  }
}

f1(3)


f2 <- function(num) {
  hello <- "Hello, world!\n"
  for(i in seq_len(num)) {
    cat(hello)
  }
  chars <- nchar(hello) * num
  chars
}

f2(3)

# Argument matching
args(lm) # some arguments are predifined and some are not
# 1. Check for exact match for a named argument
# 2. Check for a partial match
# 3. Check for a positional match
f <- function(a, b = 1, c = 2, d = NULL) {
} # example

# Lazy evaluation - Arguments to functions are evaluated lazily, so they are evaluated only as needed in the body of the function.
f <- function(a, b) {
  a^2
}
f(2)

# The ... argument - often used when extending another function and you don’t want to copy the entire argument list of the original function
myplot <- function(x, y, type = "l", ...) {
  plot(x, y, type = type, ...) ## Pass '...' to 'plot' function
}

mean # Generic functions use ... so that extra arguments can be passed to methods.
args(paste) # The ... argument is necessary when the number of arguments passed to the function cannot be known in advance. This is clear in functions like paste() and cat().
args(cat)

# Scoping rules in R ----

lm <- function(x){x*x} # there is already an R functiion called lm
lm
lm(1)
search() # how does R chooses the right one - click on environment to see the order. One can also click tab to select the right function

# lexical scoping
f <- function(x, y) {
  x^2 + y / z # how do we define a Z (free variable)
}
f(1,2) # Error in f(1, 2) : object 'z' not found 
z <- 3
f(1,2) # now that the Z value has been define in the environment the function can now be used

make.power <- function(n) { # passing a function to define a function
  pow <- function(x) {
    x^n
  }
  pow
}
cube <- make.power(3)
square <- make.power(2)
cube(3)
square(2)

ls(environment(cube))
get("n",environment(cube))

ls(environment(square))
get("n",environment(square))

# Lexical vs Dynamic scoping

y <- 10

f <- function(x) {
  y <- 2
  y^2 + g(x)
}

g <- function(x) {
  x*y
}

f(3) # 34, g function is not defined inside the f function, so the value of Y remains 10


g <- function(x) { # formal object
  a <- 3 # inside object
  x+a+y
  ## 'y' is a free variable
}
g(2)

# Application: optimization ----
# Optimization routines in R like optim(), nlm(), and optimize()

make.NegLogLik <- function(data, fixed = c(FALSE, FALSE)) { # constructor function
  params <- fixed
  function(p) {
    params[!fixed] <- p
    mu <- params[1] # mean
    sigma <- params[2] # standard deviation
    
    ## Calculate the Normal density
    a <- -0.5*length(data)*log(2*pi*sigma^2)
    b <- -0.5*sum((data-mu)^2) / (sigma^2)
    -(a + b)
  }
}
# Note: Optimization functions in R minimize functions, so you need to use the negative loglikelihood.

set.seed(1)
normals <- rnorm(100, 1, 2)
nLL <- make.NegLogLik(normals)
nLL # this is now the negative log likelihood function
## What's in the function environment?
ls(environment(nLL))

# we can now use optim()
optim(c(mu = 0, sigma = 1), nLL)$par

# optimizing only for the mean fixing the SD
nLL <- make.NegLogLik(normals,c(FALSE,2))
optimize(nLL,c(-1,3))$minimum

# optimizing only for the SD fixing the mean
nLL <- make.NegLogLik(normals,c(1,FALSE))
optimize(nLL,c(1e-6,10))$minimum

# plotting the likelihood
## Fix 'mu' to be equalt o 1
nLL <- make.NegLogLik(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len = 100)
## Evaluate 'nLL()' at every point in 'x'
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")

## Fix 'sigma' to be equal to 2
nLL <- make.NegLogLik(normals, c(FALSE, 2))
x <- seq(0.5, 1.5, len = 100)
## Evaluate 'nLL()' at every point in 'x'
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")

# Coding standards ----

# 1.- Always use text files / text editor.
# 2.- Indent your code. (4, or ideally 8 spaces)
# 3.- Limit the width of your code. 80?
# 4.- Limit the length of individual functions.

# Quiz week 2 ----
# Part 1

getwd()
setwd("specdata")
getwd()

pollutantmean <- function(directory,pollutant,id=1:332){
  if(pollutant %in% c("sulfate","nitrate")){
    directory <- getwd()
    monitor <- list.files(directory,full.names = TRUE)
    values <- data.frame()
    for(i in id){
      values <- rbind(values,read.csv(monitor[i]))
    } 
    mean <- mean(values[,pollutant],na.rm = TRUE)
    mean
  } else {
    print("Choose: sulfate or nitrate")
    return()
  }
}

pollutantmean(x,"sulfate",1:10)
pollutantmean(x,"nitrate",70:72)
pollutantmean(x,"nitrate",23)
pollutantmean(x,"nitrata",23)
pollutantmean(x,"sulfate",34)
pollutantmean(x,"nitrate")

# Part 2

complete <- function(directory,id=1:332){
  directory <- getwd()
  monitor <- list.files(directory,full.names = TRUE)
  values <- data.frame()
  for(i in id){
    monitor1 <- read.csv(monitor[i])
    rm <- complete.cases(monitor1)
    monitor2 <- monitor1[rm,]
    values <- rbind(values,c(monitor2[1,4],nrow(monitor2)))
  }
  colnames(values) <- c("id","nobs")
  values
}

complete(x,1)
complete(x,c(2, 4, 8, 10, 12))
complete(x,30:25)
complete(x,3)
cc <- complete(x, c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
cc <- complete(x, 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

# Part 3

corr <- function(directory,threshold=0){
  directory <- getwd()
  monitor <- list.files(directory,full.names = TRUE)
  values <- c()
  for(i in 1:length(monitor)){
    monitor1 <- read.csv(monitor[i])
    rm <- complete.cases(monitor1)
    monitor2 <- monitor1[rm,]
    nobs <- nrow(monitor2)
    if(nobs>threshold){
      values <- c(values,cor(monitor2$sulfate,monitor2$nitrate))
    }
  }
  values
}

cr <- corr(x,150)
head(cr)
summary(cr)
cr <- corr(x,400)
head(cr)
summary(cr)
cr <- corr(x,5000)
head(cr)
summary(cr)
length(cr)
cr <- corr(x)
summary(cr)
length(cr)

cr <- corr(x)                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr(x, 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr(x, 2000)                
n <- length(cr)                
cr <- corr(x, 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))

# Notes on week 3 ----
# Loop functions ----

lapply() # Loop over a list and evaluate a function on each element
sapply() # Same as lapply but try to simplify the result
apply() # Apply a function over the margins of an array. MARGIN is an integer vector indicating which margins should be “retained”.
tapply() # Apply a function over subsets of a vector
mapply() # Multivariate version of lapply

# An auxiliary function 
split 
# is also useful, particularly in conjunction with lapply.

# lapply ----
x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- 1:4
lapply(x, runif)

x <- 1:4
lapply(x, runif, min = 0, max = 10)

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
lapply(x, function(elt) { elt[,1] }) # using anonymous functions

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
sapply(x, mean) # instead of one result per element, it returns one vector with all results

# sapply and split ----

str(split) # The combination of split() and a function like lapply() or sapply() is a common paradigm in R.

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10) # generates factor levels and replicates them
split(x, f) # we are spliting x unsing f as the de group divider
lapply(split(x, f), mean) # tapply might be better than this idiom

library(datasets)
head(airquality)
s <- split(airquality, airquality$Month) # We can split the airquality data frame by the Month variable so that we have separate sub-data frames for each month.
str(s)
lapply(s, function(x) {
  colMeans(x[, c("Ozone", "Solar.R", "Wind")])
})
sapply(s, function(x) {
  colMeans(x[, c("Ozone", "Solar.R", "Wind")])
}) # using sapply might be better to make it more readable

sapply(s, function(x) {
  colMeans(x[, c("Ozone", "Solar.R", "Wind")],
           na.rm = TRUE) # this will eliminate the NAs
})

x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
interaction(f1, f2) ## Create interaction of two factors
str(split(x, list(f1, f2)))
str(split(x, list(f1, f2), drop = TRUE)) # drop the empty values

# tapply ----
str(tapply)
## Simulate some data
x <- c(rnorm(10), runif(10), rnorm(10, 1))
## Define some groups with a factor variable
f <- gl(3, 10)
f

tapply(x, f, mean) # applying the mean to the factor variables f
tapply(x, f, mean, simplify = FALSE) # without simplify we get a list
tapply(x, f, range)

# apply ----
str(apply)
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean) ## Take the mean of each column (value 2, rows 1)
apply(x, 1, sum) ## Take the mean of each row

# optimized apply functions
rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)

x <- matrix(rnorm(200), 20, 10)
## Get row quantiles
apply(x, 1, quantile, probs = c(0.25, 0.75))

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10)) # third dimension 10?
apply(a, c(1, 2), mean) # apply to both columns and rows
rowMeans(a, dims = 2) ## Faster

# mapply ----
str(mapply)
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1)) # difficult to type
mapply(rep, 1:4, 4:1) # with mapply we dont need to write the whole list, it smplifies

noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}
## Simulate 5 randon numbers
noise(5, 1, 2)
## This only simulates 1 set of numbers, not 5
noise(1:5, 1:5, 2)
mapply(noise, 1:5, 1:5, 2) # mapply does loop over all the values and assigns a different mean and the same sd

# Vectorizing a function ----
sumsq <- function(mu, sigma, x) {
  sum(((x - mu) / sigma)^2)
}
x <- rnorm(100) ## Generate some data
sumsq(1:10, 1:10, x) ## This is not what we want. Note that the call to sumsq() only produced one value instead of 10 values.
mapply(sumsq, 1:10, 1:10, MoreArgs = list(x = x))

vsumsq <- Vectorize(sumsq, c("mu", "sigma")) # there is a vectorize function
vsumsq(1:10, 1:10, x)

# Debugging ----
# Conditions when passing a function
# message: A generic notification/diagnostic message produced by the message() function; execution of the function continues
# warning: An indication that something is wrong but not necessarily fatal; execution of the function continues. Warnings are generated by the warning() function
# error: An indication that a fatal problem has occurred and execution of the function stops. Errors are produced by the stop() function.
# condition: A generic concept for indicating that something unexpected has occurred; programmers can create their own custom conditions if they want.

log(-1) # warning example

printmessage <- function(x) {
  if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  ?invisible(x) # invisble prevents autoprinting
}
printmessage(1)
printmessage(NA) # error example

printmessage2 <- function(x) {
  if(is.na(x))
   print("x is a missing value!")
  else if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
 invisible(x)
 }
printmessage2(NA)

x <- log(c(-1, 2)) # warning message
printmessage2(x) # warning message

printmessage3 <- function(x) {
  if(length(x) > 1L)
    stop("'x' has length > 1")
  if(is.na(x))
    print("x is a missing value!")
  else if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  invisible(x)
}
printmessage3(1:2)# error, Vectorizing the function can be accomplished easily with the Vectorize() function.

printmessage4 <- Vectorize(printmessage2)
out <- printmessage4(c(-1, 2)) 

# R tools for debugging
traceback() # prints out the function call stack after an error occurs; does nothing if there’s no error
debug() # flags a function for “debug” mode which allows you to step through execution of a function one line at a time
browser() # suspends the execution of a function wherever it is called and puts the function in debug mode
trace() # # allows you to insert debugging code into a function a specific places
recover() # allows you to modify the error behavior so that you can browse the function call stack

rm(x)

mean(x)
traceback() # you can only use it immediattely after the error occurs

lm(y ~ x)
traceback()

debug(lm) ## Flag the 'lm()' function for interactive debugging
lm(y ~ x) # opens the browser tool every time
undebug(lm) ## Unflag the 'lm()' function for debugging

options(error = recover) ## Change default R error behavior
read.csv("nosuchfile") ## This code doesn't work

 # Quiz week 3 ----
library(datasets)
data(iris)
?iris
tapply(iris$Sepal.Length,iris$Species,mean)
head(iris)

library(datasets)
data(mtcars)
?mtcars
head(mtcars)

tapply(mtcars$mpg,mtcars$cyl,mean)
with(mtcars,tapply(mpg,cyl,mean))
sapply(split(mtcars$mpg,mtcars$cyl),mean)

x <- tapply(mtcars$hp,mtcars$cyl,mean)
round(x[3]-x[1],0)

debug(ls)
ls(x)





