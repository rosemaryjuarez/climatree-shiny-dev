server <- function(input, output) {
  
  
  # filter for specific columns cwd_change, cwd_sens, rwi_pred_change_mean
  filtered_pcgl_pred_data <- reactive ({
    pcgl_pred_data %>% 
      rename(lng = x, lat = y) %>% 
      select(lng, lat, cwd_change, cwd_sens, rwi_pred_change_mean)
  })
  
  
  
  # build leaflet map 
  output$test_map_output <-renderLeaflet({
    leaflet() %>% 
      
      # add tiles 
      # add tiles
      addProviderTiles(providers$Esri.WorldImagery) %>% 
      
      # set view over
      setView(zoom = 6) %>% 
      
      # add mini map
      addMiniMap(toggleDisplay = TRUE, minimized = TRUE) 
      
      # plot
      addPolygons(filtered_pcgl_pred_data())
      
      
      
  })

}