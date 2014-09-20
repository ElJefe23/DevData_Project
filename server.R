pAppModel<-function(pH, pKa, logP, TPSA) {
  -1.64 + 0.85*logP - 0.025*TPSA - 0.27*(pKa-pH)
}
shinyServer(
  function(input, output) {
  output$oid1<-renderPrint({input$id1})
  output$oid2<-renderPrint({input$id2})  
  output$oid3<-renderPrint({input$id3})  
  output$oid4<-renderPrint({input$id4})
  output$pAppPred<-renderPrint({pAppModel(input$id3, input$id2, input$id1,input$id4)})
  output$fancyPlot<-renderPlot({
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
    points(logPlot,PlotYs, type="l", col="darkgray", lwd=3)
    xCalc<-pAppModel(input$id3, input$id2, input$id1,input$id4)
    xCalc2<-10^xCalc
    yCalc<-100/(1+(1/(sqrt(10)*xCalc2)))
    points(xCalc, yCalc, type="p", pch=16, col="darkblue", cex=4.5)
  })
  }
)