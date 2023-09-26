# STATS-Mini-Project-4
# Setting working directory to Proj-4 folder.
setwd("C:/Users/dpd140130/OneDrive - The University of Texas at Dallas/CS 6313/Projects/04")
getwd()

#Load the 'Boot' Package
library(boot)

# Observing our .csv file
companyrecs <- read.csv("voltage.csv")
remotebr <- companyrecs[companyrecs$location==0,]
localbr <- companyrecs[companyrecs$location==1,]

#Creating Boxplot
boxplot(localbr$voltage,remotebr$voltage,names = c("local","remote"), col='skyblue')

#Creating Summary Statistics
summary(remotebr$voltage)
summary(localbr$voltage)

#Creating QQ Plots
qqnorm(remotebr$voltage, main = 'Normal Q-Q Plot For Remote Voltage')
qqline(remotebr$voltage, col='red')
qqnorm(localbr$voltage, main = 'Normal Q-Q Plot For Local Voltage')
qqline(localbr$voltage, col='blue')

#Finding Variance
remotebr_var <- var(remotebr$voltage)
remotebr_var
localbr_var <- var(localbr$voltage)
localbr_var

mean_diff <- function(data, index) {
  mean(data[index,1]) - mean(data[index,2])
}

boot_res <- boot(data = data.frame(remotebr$voltage,localbr$voltage),statistic = mean_diff, R=9999)
boot.ci(boot_res)
boot_res$t0

#Evaluating Null Hypothesis
t.test(remotebr$voltage,localbr$voltage,paired = F, var.equal = F, conf.level = 0.95)

