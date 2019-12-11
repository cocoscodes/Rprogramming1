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