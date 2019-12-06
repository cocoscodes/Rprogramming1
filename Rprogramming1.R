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
data.frame() function 
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

# Removing NA
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
x * y
x / y
x %*% y # true matrix multiplication - sort of a sumproduct





