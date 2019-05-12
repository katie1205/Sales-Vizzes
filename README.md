# Sales-Vizzes 📊 📈 📉

This will serve as the reposository for script and documentation related to an R package and "out-of-the-box" Power BI custom vizzes I'm currently developing. 

The **SalesVizWiz Package** will enable analysts and developers to effortlessly build sales visualizations to address a wide variety of business requirements. The package will include functions to generate highly customizable sales funnels, KPIs, donut charts, bar graphs, pareto charts, and time series plots. Each function will be contained within a custom Power BI visualization and deployed through the marketplace. These functions are designed for immediate PBI integration, but can also stand alone. With minimal preprocessing, functions can be applied independently to sales data and executed directly in a development environment such as R Studio or Visual Studio. Exemplar use cases are provided in the sections below along with preprocessing instructions and detailed descriptions of function inputs. 

## Functions

### Sales_Funnel
Given a vector of sales performance indicator values aggregated by sales phase, this vizz constructs a dynamic sales performance funnel wherein the relative indicator value of each phase is encoded by the section's *height*. Unlike the out-of-the-box PBI sales funnel, which encodes values by width, this viz appears more sleek and "funnel-like". 

#### R function
sales_funnel(p, v, sort, FirstIsRed=True, b = 10, theta = pi/3)

#### Power BI
In Power BI, the function will be contained within a custom visualization that 

### Sales_Funnel2
This function is a wrapper for sales_funnel that addresses instances for which a funnel visualization would not make sense. The function returns the sales funnel only when there are two or more non-null and positive valued sections. Otherwise, a message is returned.


### Guage

### KPI

### 
