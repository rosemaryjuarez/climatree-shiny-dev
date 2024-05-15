# function for a reactive Leaflet Map 
# input will be the "map_type_button"
leaflet_map <- function(input) {
  
  # used to have reactive making the raster
  # pcgl_data <- reactive ({
  #   #req(input$file)
  #   # make raster of input tabular data 
  #   make_raster(pcgl_pred_data)
  #   
  # })
  
  # make a raster of the data - will usually be outside 
  #pcgl_data <- make_raster(input)
  
  # filter for species  and map type  based on Inputs ----
  # if the map_type_button is vulnerability/sens set string to the type
  # 
  combined_pred_raster <- reactive({
    combined_pred %>%
      rename(lng = x, lat = y) %>%
      dplyr::select(lng, lat, cwd_sens, rwi_pred_change_mean, species_code) %>%
      terra::rast()
    
    combined_pred <- terra::crs(combined_pred)
  })
      
  # do we need to filter
  renderLeaflet({
    
    
      test_map <- leaflet() %>%
        # addProviderTiles(providers$Esri.WorldTerrain, group = "ESRI Terrain",
                         # options = providerTileOptions(maxZoom = 100)) %>% 
        # --- set View to ext of data 
        
        # set view over Santa Barbara
        setView(zoom = 10) %>% 
        # add minimap 
        addMiniMap(toggleDisplay = TRUE) %>% 
        
        # --- add raster image
        # i think this is the problem 
        addRasterImage(combined_pred_raster()[[output$output_map_button]],
                       colors = palette_orange_blue,
                       opacity = 1) 
      
      return(test_map)
    }) # END renderLeaflet
}


# SAMS CODE BELOW

