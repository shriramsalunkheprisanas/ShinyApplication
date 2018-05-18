library(shiny)
library(shinydashboard)
library(ggplot2)
library("highcharter")
shinyServer(function(input,output){
  #hist
  output$histogram<-renderPlot({
    hist(faithful$eruptions,breaks = input$bins)
  })
  
  #scatter
  output$plot1 <- renderPlot({
    plot(mtcars$wt, mtcars$mpg)
  })
  
  output$info <- renderText({
    paste0("x=", input$plot_click$x, "\ny=", input$plot_click$y)
  })
  
  #mtcars
  output$plot2 <- renderPlot({
    ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
  })
  
  output$info2 <- renderPrint({
    # With ggplot2, no need to tell it what the x and y variables are.
    # threshold: set max distance, in pixels
    # maxpoints: maximum number of rows to return
    # addDist: add column with distance, in pixels
    nearPoints(mtcars, input$plot_click, threshold = 10, maxpoints = 1,
               addDist = TRUE)
  })
  #plot4
  output$plot4 <- renderPlot({
    ggplot(ChickWeight, aes(x=Time, y=weight, colour=factor(Chick))) +
      geom_line() +
      guides(colour=FALSE) +
      theme_bw()
  })
  output$hcontainer <- renderHighchart({
    
    hc <- hc %>%
      hc_rm_series("Berlin") %>% 
      hc_chart(type = input$type)
    
    if (input$stacked != FALSE) {
      hc <- hc %>%
        hc_plotOptions(series = list(stacking = input$stacked))
    }
    
    if (input$theme != FALSE) {
      theme <- switch(input$theme,
                      null = hc_theme_null(),
                      darkunica = hc_theme_darkunica(),
                      gridlight = hc_theme_gridlight(),
                      sandsignika = hc_theme_sandsignika(),
                      fivethirtyeight = hc_theme_538(),
                      economist = hc_theme_economist(),
                      chalk = hc_theme_chalk(),
                      handdrwran = hc_theme_handdrawn()
      )
      
      hc <- hc %>% hc_add_theme(theme)
      
    }
    
    
  })
})