# STATS-Mini-Project-4
# Setting working directory to Proj-4 folder.
setwd("C:/Users/dpd140130/OneDrive - The University of Texas at Dallas/CS 6313/Projects/04")
getwd()
# we need to load the 'boot' package first to load it.
library(boot)
#install.packages("ggpubr")

# Observing our .csv file
records <- read.csv("gpa.csv")
xact <- records$act # vector of ACT scores
ygpa <- records$gpa # vector of GPA scores

rho <- cor(records$gpa,records$act) # finding Pearson's correlation coeff
rho

# found the point estimate of rho
ggpubr::ggscatter(records, x = "act", y = "gpa", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "ACT scores", ylab = "GPA scores")

# bootstrap estimates of bias and standard error for corr coeff
correl <- function(records,subsample){
  X <- records[subsample,1]; Y <- records[subsample,2];
  return( cor(X,Y) )
}
BootStat <- boot(data=records, statistic=correl, R=9999)
BootStat
boot.ci(boot.out = BootStat)
BootR <- boot.ci(data=records, statistic=correl, R=9999)
# 95% CI using percentile bootstrap method.
sort(BootR$t)[c(250, 9750)]