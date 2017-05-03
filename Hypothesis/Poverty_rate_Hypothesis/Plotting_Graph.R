library(ggplot2)
library(scales)
library(XML)
library(stats)
library(tseries)
library(forecast)
library(ggplot2)
library(class)
library(lattice)

poverty_rate_hypothesis <- read.csv("C:/Durvesh/Sem 2/BDAMS/project/Poverty_rate_Hypothesis.csv")

par(mar = c(5,5,2,5))
with(poverty_rate_hypothesis,plot(rate,type="l",col="red"))
par(new = T)
with(poverty_rate_hypothesis, plot(incidences,type="l",axes=F,ylab=NA))

axis(side = 4)

mtext(side = 4, line = 3, 'felony/theft')

legend("bottomright",
       legend=c("Poverty_Rate", "Felony/Theft"),
       lty=c(1,0), pch=c(NA, 16), col=c("red", "black"))

cor(poverty_rate_hypothesis$rate,poverty_rate_hypothesis$incidences)
#0.6699623