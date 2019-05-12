#Required Libraries:
library(RColorBrewer) #for color palettes
library(graphics)  #for plotting polygons



library(RColorBrewer)
library(graphics)


sales_funnel <- function(v, b = 2.5, phases = sapply(v, FUN= function(x)paste0("phase ", which(v==v)))[,1], theta = pi / 3, FirstIsRed = TRUE, color = brewer.pal(ifelse(length(v) > 2, length(v), 3), name = "YlGn")) {
    n = length(v)
    h = v / sum(v)
    colz = c(ifelse(FirstIsRed == TRUE, "Red", color[1]), c(color[2:n])) #If the user specified FirstIsRed = True, then the first pahse is red. All other phases are colored (ordered by index) from the yellow-green spectrum
    x = c(0, 0, b, 0)
    y = c(0, 0,0,0)
    plot.new()
    plot.window(xlim = c(-1.5*b, 1.5*b), ylim = c(-1.5, 0.3))
    polygon(x, - y, col = colz[1], lty = 1, lwd = 2, border = "black")
    for (i in c(1:n)) {
        x = c(x[2], x[2] + h[i] / tan(theta), x[3]- h[i]/tan(theta), x[3])
        y = c(y[2], y[2] + h[i], y[2] + h[i], y[2])
        polygon(x, - y, col = colz[i], lty = 1, lwd = 2, border = "black")
    }
    x = c(x[2], x[2], x[3], x[3])
    y = c(y[2], y[2] + h[n] + 0.05, y[2] + h[n] + 0.05, y[2])
    polygon(x, - y, col = colz[n], lty = 1, lwd = 2, border = "black")
    legend(-1.25*b, -0.25, legend = paste0(phases, ",       ", signif(h*100, digits = 4), "%"), cex = 0.7, fill = colz)
}


#An Example:
                                                     
#User only supplies mandatory values (to test defaults)                                    
sales_funnel(v = c(10000000, 5000000, 7000000,4500000, 5000000))
                                                     
#User supplies optional values
sales_funnel(b=10, v = c(10000000, 5000000, 7000000,4500000, 5000000), phases = c("Past Due", "Close", "Qualify", "Contact", "Lead"), FirstIsRed = TRUE)

                                                     

#Defining Sales_funnel_2, which calls the sales_funnel function 
#This function addresses situations for which the sales funnel viz would either return an error or 
#would not really make sense and supplies a summary message in place of the funnel
salez_funnel_2 <- function(b, theta, v, phases, FirstIsRed) {
    # + some non missing values are non zero -- ie, sum(na.omit(h)) != 0 ==> 
    if (sum(is.na(v)) == length(v)) {
        #if all h's are NA ===> "no data available"
        plot.new()
        plot.window(xlim = c(-1.2 / 2 - 1, 1.2 + 1.2 / 2 + 1), ylim = c(-10.5, 0.2))
        text(0.7, 0, paste0("No data available."), cex = 2.5)
    } else if (length(na.omit(v)) == 1) {
        #otherise, if there is only one non missing h ==> show sentence "in phase .., the value of h is .."
        plot.new()
        plot.window(xlim = c(-1.2 / 2 - 1, 1.2 + 1.2 / 2 + 1), ylim = c(-10.5, 0.2))
        text(0.7, 0, paste0("In the ", na.omit(phases), " phase, ", "the total value is $", na.omit(v)), cex = 1.5)
    } else if (sum(na.omit(v)) == 0) {
        #otherwise, if there aren't any nonzero h's ==> show summary table
        text(0.7, 0, "There are no phases with nonzero values", cex = 1.5)
    } else ((length(na.omit(h)) > 1) & (length(h[h != 0]) > 1)) {
        #otherwise, if there is more than one non missing h value AND more than one non zero h-value ==> show sales funnel  (condition could maybe be simplified)
        sales_funnel(b, theta, v, phases, FirstIsRed)
    }
}
