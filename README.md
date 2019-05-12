# Sales-Vizzes 📊 📈 📉

This will serve as the reposository for script and documentation related to an R package and "out-of-the-box" Power BI custom vizzes I'm currently developing. 

The **SalesVizWiz Package** will enable analysts and developers to effortlessly build sales visualizations to address a wide variety of business requirements. The package will include functions to generate highly customizable sales funnels, KPIs, donut charts, bar graphs, pareto charts, and time series plots. Each function will be contained within a custom Power BI visualization and deployed through the marketplace. These functions are designed for immediate PBI integration, but can also stand alone. With minimal preprocessing, functions can be applied independently to sales data and executed directly in a development environment such as R Studio or Visual Studio. Exemplar use cases are provided in the sections below along with preprocessing instructions and detailed descriptions of function inputs. 

## Functions

### Sales_Funnel
Given a vector of sales performance indicator values aggregated by sales phase, this vizz constructs a dynamic sales performance funnel wherein the relative indicator value of each phase is encoded by the section's *height*. Unlike the out-of-the-box PBI sales funnel, which encodes values by width, this viz appears more sleek and "funnel-like". 

#### R function
##### Description
Sales_Funnel draws a sales funnel by iteratively stacking trazoids such that the height of each trapezoid is proportional to an element of the given vector v. Each trapezoid represents the ith phase in a process with a value equal to the ith element of v, and a legend is also drawn to label each phase by color. The polygon function from the graphics package is called to construct each trapezoid based on the coordinates of its vertices, which are determined based on the base angle theta, base length b, and the height which is proportional to elements in the given vector v. Each phase is assigned the default name "phase i" and is filled using the ith color in the default red-yellow-green palette. The user can optionally specify an alternative color pallette and a vector of phase names. The shape of the trapezoid can also be customized by specifying the length of the base, b, of the widest section, and the base angle, theta, in radians. The base length and angle default to 2.5 and pi/3 radians (60 degrees) respectively. 

##### Usage
Sales_Funnel(v, b = 2.5, phases = sapply(v, FUN= function(x)paste0("phase ", which(v==v)))[,1], theta = pi / 3, FirstIsRed = TRUE, color = brewer.pal(ifelse(length(v) > 2, length(v), 3), name = "YlGn"))


#### Power BI
In Power BI, the function will be contained within a custom visualization that 

### Sales_Funnel2
This function is a wrapper for sales_funnel that addresses instances for which a funnel visualization would not make sense. The function returns the sales funnel only when there are two or more non-null and positive valued sections. Otherwise, a message is returned.


### Guage

### KPI

### 
