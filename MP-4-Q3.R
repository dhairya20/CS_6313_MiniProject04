# STATS-Mini-Project-4
# Setting working directory to Proj-4 folder.
setwd("C:/Users/dpd140130/OneDrive - The University of Texas at Dallas/CS 6313/Projects/04")
getwd()

# Observing our .csv file
gasstats <- read.csv("vapor.csv")
#gasstats
theoval <- gasstats$theoretical
expval <- gasstats$experimental

t.test(theoval, expval, paired = FALSE, var.equal = TRUE,alternative = c("two.sided"))
