# function for a reactive Leaflet Map 
# input will be the "map_type_button"
leaflet-map <- function(input) {
  
  pcgl_data <- reactive ({
    #req(input$file)
    # make raster of input tabular data 
    make_raster(pcgl_pred_data)
    
  })

  
  # if the map_type_button is vulnerabilty/sens set string to the type
  pcgl_data
  
  # do we need to fileter
  
  output$test_map_output <-renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      # --- set View to ext of data  
      
      # --- add raster image
      addRasterImage(pcgl_data()[["rwi_pred_change_mean"]],
                     colors = palette_orange_blue,
                     opacity = 1) %>% 
      addLegend("bottomleft",
                #           colors = "Set1",
                labels = c("Sens."), 
                #           opacity = 1)
      )
  })
}