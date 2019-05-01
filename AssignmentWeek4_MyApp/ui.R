#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Setapak, Kuala Lumpur"),
  
  # Sidebar with slider inputs
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderLAT", "Latitude", 3.17, 3.2020, step = 0.0001, value = 3.1976),
       sliderInput("sliderLONG", "Longitude", 101.71, 101.76, step = 0.0001, value = 101.7110),
       
       h3("Facility"),
       checkboxInput("showHospital", "Hospital", value = FALSE),
       checkboxInput("showRestaurant", "Restaurant", value = FALSE),
       checkboxInput("showMall", "Shopping Mall", value = FALSE),
       checkboxInput("showResidence", "Service Residence", value = FALSE)
    ),
    
    # Show plot 
    mainPanel(
       leafletOutput("leaflet1"),
       h3(" "),
       textOutput("text1"),
       textOutput("text2"),
       textOutput("text3"),
       textOutput("text4")
    )
  )

))
