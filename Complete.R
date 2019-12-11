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