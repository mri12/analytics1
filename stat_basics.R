# Basic stats

x = ceiling(rnorm(10000,mean=60,sd=20))
mean(x)
median(x)

#there is no mode function for mode stats
table(x) #calculates frequency of each value in the data
sort(table(x),decreasing=T)

install.packages('modeest')
library(modeest)
mlv(x,method='shorth')

quantile(x)
quantile(x,seq(.1,1,by=.1)) #decile
quantile(x,seq(.01,1,by=.01)) #percentile

install.packages('e1071')
library(e1071)  #load e1071
plot(density(x))

e1071::skewness(x)  #apply the skewnes
kurtosis(x)

sd(x):var(x)

cov(women$weight,women$height)
cor(women$height,women$height)

stem(x)

#Freq table
install.packages('fdth')
library(fdth)
ftable1=fdt(x)
ftable1
plot(ftable1)


















