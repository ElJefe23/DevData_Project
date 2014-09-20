logPlot<-seq(-3, 2, by=0.04)
PlotXs<-10^(logPlot)
PlotYs<-100/(1+(1/(sqrt(10)*PlotXs)))
par(bg="white")
plot(logPlot,PlotYs,xlab="log10 Permability",ylab="% Frac Absorbed, Human", type="n")
x<-par("usr")
xRed<-(2*x[1]+x[2])/3
rect(x[1],x[3],xRed,x[4],col="firebrick3")
xGrn<-(x[1]+2*x[2])/3
rect(xGrn,x[3],x[2],x[4],col="lightgreen")
points(logPlot,PlotYs, type="l", col="darkblue", lwd=3)