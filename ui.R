library(shiny)
library(shinydashboard)
library(d3r)
library(htmltools)
library(ggplot2)
library("highcharter")
data(citytemp)
shinyUI(
  dashboardPage(
    dashboardHeader(title = "Shiny Application",
                    dropdownMenu(type = "message",
                                 messageItem(from = "Shriram",message = "Hello!"),
                                 messageItem(from = "Application",message = "This for interview",icon = icon("handshake-o"),time = "20.00"),
                                 messageItem(from = "Shriram",message = "Thank you inteliment!",icon = icon("bar-chart"),time = "20.00")
                      
                    )
                    ),
    dashboardSidebar(
      sliderInput("bins","Number of Breaks",1,100,50),
      #creating menu item
      sidebarMenu(
      menuItem("Simple Histogram",tabName = "histogram"),
      menuItem("Simple D3 Chart",tabName = "d3chart"),
      menuItem("Simple Angular",tabName = "angular"),
      menuItem("Other",tabName = "other")
    )),
    dashboardBody(
      #tabitems
      tabItems(
        tabItem(tabName = "histogram",
                fluidRow(
                  box(plotOutput("histogram"))
                  
                )#row
        ),#tabitem1
        tabItem(tabName = "d3chart",
                fluidRow(
                  plotOutput("plot1", click = "plot_click"),
                  verbatimTextOutput("info")
                  
                )#row
        ),#tabitem2
        tabItem(tabName = "angular",
                fluidRow(
                  plotOutput("plot2", click = "plot_click2"),
                  verbatimTextOutput("info2")
                  
                )#row
        ),#tabitem3
        tabItem(tabName = "other",
                fluidRow(
                  plotOutput("plot4",
                             brush = brushOpts(id = "plot_brush", fill = "#ccc", direction = "x"),
                             height = 250
                  ),
                  column(width = 4, class = "panel",
                         selectInput("type", label = "Type", width = "100%",
                                     choices = c("line", "column", "bar", "spline")), 
                         selectInput("stacked", label = "Stacked",  width = "100%",
                                     choices = c(FALSE, "normal", "percent")),
                         selectInput("theme", label = "Theme",  width = "100%",
                                     choices = c(FALSE, "fivethirtyeight", "economist",
                                                 "darkunica", "gridlight", "sandsignika",
                                                 "null", "handdrwran", "chalk")
                         )
                  ),
                  column(width = 8,
                         highchartOutput("hcontainer",height = "500px")
                  )
                  
                )#row
                
        )#tabitem4
      )
      
    )
  )
)