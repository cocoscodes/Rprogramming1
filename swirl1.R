install.packages("swirl")
packageVersion("swirl")
library(swirl)
ls()
rm(list=ls())
install_from_swirl("R Programming")
swirl()

bye()

# Commands for swirl ----

# Typing skip() allows you to skip the current question.
# Typing play() lets you experiment with R on your own; swirl will ignore what you
# UNTIL you type nxt() which will regain swirl's attention.
# Typing bye() causes swirl to exit. Your progress will be saved.
# Typing main() returns you to swirl's main menu.
# Typing info() displays these options again.

# hitting up arrow recycles commands!!!
# typing first 2 letters and tab key will provide a list of variables (auto-completion)

# Workspace and files ----

getwd()
setwd
ls()

dir() or list.files() # look into your files in your working directory

args() # sees the arguments of a function

dir.create("testdir") # creates a directory in the current WD

file.create("mytest.R") # creates a file in your dir

file.exists("mytest.R") # checks if a file exists

file.info("mytest.R") # access file info

file.info("mytest.R")$mode # to grab specific items.

file.rename("mytest.R","mytest2.R") # change the file name

file.copy("mytest2.R","mytest3.R") # copy file

file.path("mytest3.R") # Provide the relative path to the file

file.path('folder1','folder2') # construct file and directory paths that are independent of the operating system your R code

dir.create(file.path("testdir2","testdir3"),recursive = TRUE) # create directories and subdirectories by changing recursive argument to TRUE

setwd(old.dir) # go back to an original working directory SAVED AS A VARIABLE

file.remove("testdir/")

swirl()

# Creating a sequence of numbers with operators ----
1:20 
pi:10
15:1
?`:`
seq(1:20)
seq(0,10,by=0.5) # determines the increments
my_seq<-seq(5, 10, length=30) # sequence of number between certain values
length(my_seq)
# generate a sequence from the length of my_seq
1:length(my_seq) # option 1
seq(along.with = my_seq) # option 2
seq_along(my_seq) # option 3
# repeat a number
rep(0,times=40)
rep(c(0, 1, 2), times = 10)
rep(c(0, 1, 2), each = 10)

bye()
0
swirl()

# Vectors ----
# vectors can use logical operators such as: <, >, >=, <=,==, |, &

my_char<-c("My","name","is")
paste(my_char,collapse = " ") # collpase tells the function how to separate the elements to be paste
my_name<-c(my_char,"Alex")
paste(my_name,collapse = " ")

paste("Hello", "world!", sep = " ")
paste(c(1:3),c("X", "Y","Z"),sep = "")

paste(LETTERS, 1:4, sep = "-") #LETTERS is a predefined variable with all the letters of the english alphabet

bye()
0
swirl()

# Missing values ----

x<-c(44,NA,5,NA)
x*3

y<-rnorm(1000) # rnorm creates random values
z <- rep(NA, 1000)
my_data<-sample(c(y,z),100) # sample takes a "sample" of 100 values in this case out of this two vectors
my_na<-is.na(my_data)
my_data==NA # this will not evaluate the NA but return a complete vector of NAs
sum(my_na)
0/0 # NaN
Inf-Inf # NaN

# Subsetting vectors ----

x[1:10]
x[is.na(x)] # a vector will NAs
y <- x[!is.na(x)] # a vector will all the numerical values
y[y > 0] # this will exclude all NAs and negative values
x[x > 0] # this will keep the NAs
x[!is.na(x) & x > 0] # combining operations

x[c(3,5,7)]
x[0] # R is 1 numeric indexing not like python which is a zero based indexing language
x[3000]

x[c(-2, -10)] # by adding the "-" you can create a vector with all EXCEPT the two values specified
x[-c(2, 10)] # alternative put the "-" befoce the c()

vect <- c(foo = 11, bar = 2, norf = NA) # named vectors
names(vect)
vect2<-c(11,2,NA)
names(vect2) <-c("foo", "bar", "norf") # adding names to a vector
identical(vect,vect2)
vect["bar"]
vect[c("foo", "bar")]

# Matrices and data frames ----

my_vector<-1:20
dim(my_vector) # NULL
length(my_vector) # 20
dim(my_vector)<-c(4,5) # add dimensions
attributes(my_vector) # we can see the new attributes
class(my_vector) # now it is a matrix
my_matrix<-my_vector # it is no longer a vector
?matrix() # also works for createing a mtrix
my_matrix2<-matrix(1:20,nrow = 4, ncol = 5)
identical(my_matrix,my_matrix2)

patients<-c("Bill","Gina","Kelly","Sean")
cbind(patients,my_matrix) # new matrix is character, matrices can only contain one type of variable
my_data<-data.frame(patients,my_matrix)
class(my_data)
cnames<-c("patient", "age", "weight","bp", "rating", "test") #vector for columns names
colnames(my_data)<-cnames

swirl()












