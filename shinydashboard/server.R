server <- function(input, output) {
  
  
  # filter for specific columns x, y cwd_change, cwd_sens, rwi_pred_change_mean
cw_mean_raster <- reactive ({
  cwd_raster %>% mean()
  })

aet_raster <- reactive({
  aet_raster %>% mean()
})
  
  # build leaflet map 
  output$test_map_output <-renderLeaflet({
    leaflet() %>% 
      
      addTiles(options = tileOptions(minZoom = 2)) %>%
      addRasterImage(cw_mean_raster(),
                     colors = palette_orange_blue,
                     layerId = "cwd_layer",
                     opacity = 1) 
      
                  
    # fillColor = "transparent", 
                  # color = "black", 
                  # weight = 1) %>%
    
    # # Add raster data
    # addRasterImage(filtered_pcgl_pred_data() %>% drop_na(), 
    #                colors = "Set1", 
    #                opacity = 1, 
    #                project = FALSE, 
    #                layerId = "raster_layer") %>%
    
    # Define legend
    # addLegend("bottomleft",
    #           colors = "Set1", 
    #           labels = c("Sens."), 
    #           opacity = 1)
    
    # Set map view
    #setView(lng = mean(lon_lims), lat = mean(lat_lims), zoom = 3)
      
  })
}