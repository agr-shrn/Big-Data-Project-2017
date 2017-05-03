library(ggplot2)
library(scales)
library(XML)
library(stats)
library(tseries)
library(forecast)
library(ggplot2)
library(class)
library(lattice)

police_hypothesis <- read.csv("C:/Durvesh/Sem 2/BDAMS/project/Police_officials_Hypothesis.csv")

par(mar = c(5,5,2,5))
with(police_hypothesis,plot(count,type="l",col="red"))
par(new = T)
with(police_hypothesis, plot(incidences,type="l",axes=F,ylab=NA))

axis(side = 4)

mtext(side = 4, line = 3, 'incidences')

par(xpd=FALSE)

legend("topright",
       legend=c("Police_count", "Incidences"),
       lty=c(1,0), pch=c(NA, 16), col=c("red", "black"))
