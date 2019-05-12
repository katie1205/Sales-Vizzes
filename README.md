# Sales-Vizzes 📊 📈 📉

This will serve as the reposository for script and documentation related to an R package and "out-of-the-box" Power BI custom vizzes I'm currently developing. 

The **SalesVizWiz Package** will enable analysts and developers to effortlessly build sales visualizations to address a wide variety of business requirements. The package will include functions to generate highly customizable sales funnels, KPIs, donut charts, bar graphs, pareto charts, and time series plots. Each function will be contained within a custom Power BI visualization and deployed through the marketplace. These functions are designed for immediate PBI integration, but can also stand alone. With minimal preprocessing, functions can be applied independently to sales data and executed directly in a development environment such as R Studio or Visual Studio. Exemplar use cases are provided in the sections below along with preprocessing instructions and detailed descriptions of function inputs. 

## Functions

### Sales_Funnel
Given a vector of sales performance indicator values aggregated by sales phase, this vizz constructs a dynamic sales performance funnel wherein the relative indicator value of each phase is encoded by the section's *height*. Unlike the out-of-the-box PBI sales funnel, which encodes values by width, this viz appears more sleek and "funnel-like". 

#### R function
##### Description
Sales_Funnel draws a sales funnel by iteratively stacking trazoids such that the height of each trapezoid is proportional to an element of the given vector v. Each trapezoid represents the ith phase in a process with a value equal to the ith element of v. A legend is also drawn to label each phase by color. 

##### Usage
Sales_Funnel(v, b = 2.5, phases = sapply(v, FUN= function(x)paste0("phase ", which(v==v)))[,1], theta = pi / 3, FirstIsRed = TRUE, color = brewer.pal(ifelse(length(v) > 2, length(v), 3), name = "YlGn"))

##### Arguments
v: A vector containing the aggregate (eg total) values for each phase in a process arranged in order; determines relative height of each trapezoid/funnel section. The length of v must be between 2 and 10.
  
b: A scalar giving the length of the base of the section for the first phase; defaults to 2.5
  
theta: The base angles, in radians, of each trapezoidal section; defaults to pi/3 radians (60 degrees). Note that all base angles are congruent to allow trapezoids to be stacked neatly.
  
phases: A vector of phase names for the legend labels; defaults to "phase i", where i are the indices of elements in v.
  
FirstIsRed: A logical vector indicating whether or not the first phase should be red, as is common for the "past due" phase in standard sales funnels; set to TRUE by default
  
color: A vector of colors to fill each trapezoidal phase section; defaults to yellow-green palette the same length as the given vector v. 
  
  
 

#### Power BI
In Power BI, the function will be contained within a custom visualization that 

### Sales_Funnel2
This function is a wrapper for sales_funnel that addresses instances for which a funnel visualization would not make sense. The function returns the sales funnel only when there are two or more non-null and positive valued sections. Otherwise, a message is returned.


### Guage

### KPI

### 
