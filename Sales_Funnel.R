#Required Libraries:
library(RColorBrewer) #for color palettes
library(graphics)  #for plotting polygons


#Defining sales_funnel function:
sales_funnel <- function(b, theta, v, phases, FirstIsRed){
    n = length(v)
    h = 10 * v / sum(v)
    colz = brewer.pal(ifelse(n > 2, n, 3), name = "YlGn") 
    colz = c(ifelse(FirstIsRed == TRUE, "Red", colz[1]), c(colz[2:n])) #If the user specified FirstIsRed = True, then the first pahse is red. All other phases are colored (ordered by index) from the yellow-green spectrum
    x = c(0, h[1] / tan(theta), b + h[1] / tan(theta), b + 2 * h[1] / tan(theta))
    y = c(0, h[1], h[1], 0)
    plot.new()
    plot.window(xlim = c(-b / 2 - 1, b + b + 1), ylim = c(-10.5, 0.2))
    polygon(x, - y, col = colz[1], lty = 1, lwd = 2, border = "black")
    for (i in c(2:n)) {
        x = c(x[2], x[2] + h[i] / tan(theta), x[4] - h[i - 1] / tan(theta) - h[i] / tan(theta), x[4] - h[i - 1] / tan(theta))
        y = c(y[2], y[2] + h[i], y[2] + h[i], y[2])
        polygon(x, - y, col = colz[i], lty = 1, lwd = 2, border = "black")
    }
    x = c(x[2], x[2], x[3], x[3])
    y = c(y[2], y[2] + h[n] + 0.5, y[2] + h[n] + 0.5, y[2])
    polygon(x, - y, col = colz[n], lty = 1, lwd = 2, border = "black")
}


#An Example:
sales_funnel(10, pi/3, v = c(10000000, 5000000, 7000000,4500000, 5000000), phases = c("Past Due", "Close", "Qualify", "Contact", "Lead"), FirstIsRed = TRUE)


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
