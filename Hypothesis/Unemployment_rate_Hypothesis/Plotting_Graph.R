library(ggplot2)
library(scales)
library(XML)
library(stats)
library(tseries)
library(forecast)
library(ggplot2)
library(class)
library(lattice)

unemployment_hypothesis <- read.csv("C:/Durvesh/Sem 2/BDAMS/project/Unemployment_Hypothesis.csv")

par(mar = c(5,5,2,5))
with(unemployment_hypothesis,plot(rate,type="l",col="red"))
par(new = T)
with(unemployment_hypothesis, plot(incidences,type="l",axes=F,ylab=NA))

axis(side = 4)

mtext(side = 4, line = 3, 'incidences')

legend("topright",
       legend=c("Unemployment_Rate", "Incidences"),
       lty=c(1,0), pch=c(NA, 16), col=c("red", "black"))

cor(unemployment_hypothesis$rate,unemployment_hypothesis$incidences)
#-0.2221821

