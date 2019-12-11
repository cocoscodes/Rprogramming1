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