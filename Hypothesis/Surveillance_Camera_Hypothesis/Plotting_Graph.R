library(ggplot2)
library(scales)
library(XML)
library(stats)
library(tseries)
library(forecast)
library(ggplot2)
library(class)
library(lattice)

camera_hypothesis <- read.csv("C:/Durvesh/Sem 2/BDAMS/project/Surveillance_Camera_Hypothesis.csv")

par(mar = c(5,5,2,5))
with(camera_hypothesis,plot(count,type="l",col="red",ylab='Cameras'))
par(new = T)
with(camera_hypothesis, plot(incidences,type="l",axes=F,ylab=NA))

axis(side = 4)

mtext(side = 4, line = 3, 'Crime Incidences')

legend("bottomright",
       legend=c("No Of Cameras", "Crime Incidences"),
       lty=c(1,0), pch=c(NA, 16), col=c("red", "black"))

cor(camera_hypothesis$count,camera_hypothesis$incidences)
#-0.9657