# Sales-Vizzes 📊 📈 📉

This will serve as the reposository for items related to an R package I'm (hoping) to develop. 

The **SalesVizWiz Package** will allow users to effortlessly create sales visualizations. All functions within the package were designed to integrate seamlessly with Power BI, allowing for dynamic and highly customizable vizzes. 


## Functions

**sales_Funnel()**
Given a vector of sales performance indicator values aggregated by sales phase, this function constructs a dynamic sales performance funnel wherein the relative indicator value of each phase is encoded by the section's *height*. Unlike the-of-the-box PBI sales funnel, which encodes values by width, this viz appears more sleek and "funnel-like". 

**sales_funnel2()**
This function is a wrapper for sales_funnel that addresses instances for which a funnel visualization would not make sense. The function returns the sales funnel only when there are two or more non-null and positive valued sections. Otherwise, a message is returned.

**KPI()**

**Guage()**

** 
