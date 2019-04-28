#Defining the sales_funnel function
#This function creates a sales funnel visualization with each sales phase represented by a trapezoid, where the height represents the total sales
sales_funnel<-function(b, theta, v, phases){
  n = length(v)
  h = 10* v/sum(v)
  v = v/1000000
  colz = brewer.pal(ifelse(n>2,n,3), name = "YlGn")
  colz = c(ifelse(phases[1] == "Past Due", "Red", colz[1]),c(colz[2:n]))
  x = c(0, h[1]/tan(theta),b + h[1]/tan(theta), b + 2*h[1]/tan(theta))
  y = c(0, h[1],h[1],0)
  plot.new()
  plot.window(xlim=c(-b/2 - 1,b+b + 1), ylim=c(-10.5,0.2))
  polygon(x, -y, col = colz[1],lty = 1, lwd = 2, border = "black")
  for (i in c(2:n)){
    x = c(x[2], x[2] + h[i]/tan(theta), x[4] - h[i-1]/tan(theta) - h[i]/tan(theta), x[4] - h[i-1]/tan(theta))
    y = c(y[2], y[2] + h[i], y[2] + h[i], y[2])
    polygon(x, -y, col = colz[i], lty = 1, lwd = 2, border = "black")
  }
  x =  c(x[2], x[2], x[3], x[3])
  y =  c(y[2], y[2] + h[n]+0.5, y[2] + h[n]+0.5, y[2])
  polygon(x, -y, col = colz[n], lty = 1, lwd = 2, border = "black")
  legend("left", legend = paste0(phases, ",        ","$", signif(v,digits = 4), "M"), pt.cex = 1.2, cex =1.0, fill = colz)
}
h<- as.vector(unlist(summary[1]))  #create vector for sales values from the first column of dataset
p<- as.vector(unlist(summary[3])) #create vector for phase names from the third column of dataset

#Build in options for cases where:
# + there are only blanks  -- ie, sum(is.na(h))==length(h)   ==> "No data is available."
# + there are fewer than 2 non missing values -- ie, length(na.omit(h)) > 1 ==> "For phase, the value is"
# + all non missing values are zeros  -- ie, sum(na.omit(h)) == 0  ==> grid.table
# + some non missing values are non zero -- ie, sum(na.omit(h)) != 0 ==> 
if(sum(is.na(h))==length(h)){   #if all h's are NA ===> "no data available"
  plot.new()
  plot.window(xlim=c(-1.2/2 - 1,1.2+1.2/2 + 1), ylim=c(-10.5,0.2))
  text(0.7,0,paste0("No data available."), cex = 2.5)
}else if(length(na.omit(h))==1){   #otherise, if there is only one non missing h ==> show sentence "in phase .., the value of h is .."
  plot.new()
  plot.window(xlim=c(-1.2/2 - 1,1.2+1.2/2 + 1), ylim=c(-10.5,0.2))
  text(0.7,0,paste0("In the ",na.omit(p), " phase, ", "the weighted open quoted opportunity value is $",na.omit(h)), cex = 1.5)
}else if(sum(na.omit(h))==0){    #otherwise, if there aren't any nonzero h's ==> show summary table
  summary<-summary%>%select(Weighted_Quoted_Opportunity_Value, Phases)   
  grid.table(summary, theme = ttheme_default(), cols = c("Opportunity Value", "Opportunity Phase"))
}else if((length(na.omit(h))>1) & (length(h[h!=0])>1)){     #otherwise, if there is more than one non missing h value AND more than one non zero h-value ==> show sales funnel  (condition could maybe be simplified)
  summary<-summary%>%filter(!is.na(Weighted_Quoted_Opportunity_Value)) 
  h<- as.vector(unlist(summary[1]))
  sales_funnel(2, 0.47*pi,h,p)
}else{  # in any other case ==> show summary table
  summary<-summary%>%select(Weighted_Quoted_Opportunity_Value, Phases)
  grid.table(summary, theme = ttheme_default(), cols = c("Opportunity Value", "Opportunity Phase"))
}
