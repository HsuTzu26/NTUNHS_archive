install.packages("readr")
library(readr)
setwd("d:/rtemp")
test <- read.csv("WHO.csv", sep=",",header=TRUE,stringsAsFactors=FALSE) # Ū???ɮ?

head(test)
str(test)
attach(test)
