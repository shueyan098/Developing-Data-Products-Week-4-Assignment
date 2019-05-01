#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

shinyServer(function(input, output) {

  mymap <- reactive({
        
        coordinatesData <- data.frame(lat = input$sliderLAT, long = input$sliderLONG, label = "User Selection", stringsAsFactors = FALSE)
    
        if(input$showHospital){coordinatesData <- rbind(coordinatesData, c(3.2013, 101.7182, "Hospital"))}
        if(input$showRestaurant){coordinatesData <- rbind(coordinatesData, c(3.1965, 101.7141, "Restaurant"))}
        if(input$showMall){coordinatesData <- rbind(coordinatesData, c(3.2046, 101.7208, "Mall"))}
        if(input$showResidence){coordinatesData <- rbind(coordinatesData, c(3.1997, 101.7201,"Residence"))}
        
        latdata <- as.array(as.numeric(coordinatesData$lat))
        lngdata <- as.array(as.numeric(coordinatesData$long))
        labeldata <- as.array(coordinatesData$label)
        
        mymap <- leaflet() %>% 
          addTiles() %>%
          addMarkers(lat = latdata, lng = lngdata, label = labeldata)
  })

  output$leaflet1 <- renderLeaflet({
    mymap()
  })
    
  output$text1 <- renderText({
    if(input$showHospital) {
      "Columbia Asia Hospital" 
    }
  })
  output$text2 <- renderText({
    if(input$showRestaurant) {
      "Pizza Hut Restaurant"
    }
  })
  output$text3 <- renderText({
    if(input$showMall) {
      "Setapak Central Shopping Mall"  
    }
  })
  output$text4 <- renderText({
    if(input$showResidence) {
      "Residency PV 21" 
    }
  })
  
})
