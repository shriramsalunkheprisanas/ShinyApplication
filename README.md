# ShinyApplication
This is the shiny dashboard application where we can visualize different charts.

What is shiny:
Shiny is an open source R package that provides an elegant and powerful web framework for building web applications using R. Shiny helps us turn our analyses into interactive web applications without requiring HTML, CSS, or JavaScript knowledge.
#Website:https://shiny.rstudio.com/



#steps to follow to run this application
1. Install Rstudio
2.Add following packages by writing
install.packages("package_name")
  HERE IS LIST OF PACKAGES I HAVE USED.
  1.library(shiny)
  2.library(shinydashboard)
  3.library(d3r)
  4.library(htmltools)
  5.library(ggplot2)
  6.library("highcharter")


#IMPORTANT
KEEP UI.R AND SERVER.R IN SAME DIRECTORY

#Images:
images output1,line-chart shows the original output of this shiny dashboard.

#Issues:
1.I have tried to use d3r library in R. but while creating the chart it shows and error to the plot function.
There are several other libraries by using which we can create interactive web applications using R.

Thank you!
Author:Shriram Salunkhe.
