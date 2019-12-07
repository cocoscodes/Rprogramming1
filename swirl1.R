install.packages("swirl")
packageVersion("swirl")
library(swirl)
ls()
rm(list=ls())
install_from_swirl("R Programming")
swirl()

bye()

# commands for swirl

# Typing skip() allows you to skip the current question.
# Typing play() lets you experiment with R on your own; swirl will ignore what you
# UNTIL you type nxt() which will regain swirl's attention.
# Typing bye() causes swirl to exit. Your progress will be saved.
# Typing main() returns you to swirl's main menu.
# Typing info() displays these options again.

# hitting up arrow recycles commands!!!
# typing first 2 letters and tab key will provide a list of variables (auto-completion)

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






