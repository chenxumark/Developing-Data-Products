#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(shinythemes)
library(dplyr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Set theme
  theme = shinytheme("spacelab"),
  
  # Some help text
  h2("Stock prices for different stocks overlaid with SP500"),
  h4("This Shiny app showcases stock correlations using Plotly"),
  
  # Vertical space
  tags$hr(),
  
  # Window length selector
  selectInput("window", label = "Select Heatmap Correlation Window Length", choices = c(10, 20, 30, 60, 90), selected = 10),
  h5("Please Click the Curves of Diagram"),
  tags$hr(),
  # Plotly Chart Area
  fluidRow(
    column(6, plotlyOutput(outputId = "timeseries", height = "600px")),
    column(6, plotlyOutput(outputId = "correlation", height = "600px"))),
  
  tags$hr(),
  tags$blockquote("Hover over time series chart to fix a specific date. Correlation chart will update with historical 
                  correlations (time span will be hover date +/- selected window length)")
))
