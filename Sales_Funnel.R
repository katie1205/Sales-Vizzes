library(dplyr)
library(graphics)
library(RColorBrewer)

sales_funnel<-function(b, theta, h, phases){
  n = length(h)
  h = h/sum(h)
  colz = brewer.pal(ifelse(n>2,n,3), name = "RdBu")
  x = c(0, h[1]/tan(theta),b + h[1]/tan(theta), b + 2*h[1]/tan(theta))
  y = c(0, h[1],h[1],0)
  plot.new()
  plot.window(xlim=c(-b/4,b+b/4), ylim=c(-1.5,0.2))
  polygon(x, -y, col = colz[1], lty = 1, lwd = 2, border = "black")
  text(mean(x),-mean(y),phases[1],cex = 0.85)
  for (i in c(2:n)){
    x = c(x[2], x[2] + h[i]/tan(theta), x[4] - h[i-1]/tan(theta) - h[i]/tan(theta), x[4] - h[i-1]/tan(theta))
    y = c(y[2], y[2] + h[i], y[2] + h[i], y[2])
    polygon(x, -y, col = colz[i], lty = 1, lwd = 2, border = "black")
    text(mean(x),-mean(y),phases[i],cex = 0.85)
  }
}
