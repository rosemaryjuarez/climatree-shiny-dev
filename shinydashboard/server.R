server <- function(input, output, session) {
  
##----------------------------------------------
    
    # Render the data table with a search bar
    output$speciesTable <- renderDataTable({
      combined_pred
    }, options = list(
      searching = TRUE,
      lengthChange = FALSE,
      pageLength = 10
    ))
    
  }
  #--------------------------------------------
  
# make raster function 
# eventually just read in leaflet_map fuction 
#output$test_map_output <- leaflet_map(input)


# --- correct map START


# reactive 
# pcgl_data <- reactive ({
#   #req(input$file)
#   # make raster of input tabular data 
#   make_raster(pcgl_pred_data)
#   
# })

  # output$test_map_output <-renderLeaflet({
  #
  #   numcolor <- length(unique(pcgl_data()$cwd_sens))
  #   mycolor <- palette_orange_blue
  #   pal <- mycolor[1:numcolor]
  #
  #   leaflet() %>%
  #     addTiles() %>%
  #     # --- set View to ext of data
  #
  #     # --- add raster image
  #     addRasterImage(pcgl_data()[["cwd_sens"]],
  #                    colors = palette_orange_blue,
  #                    opacity = 1) %>%
      # addLegend("bottomleft",
      #           colors = pal,
      #           labels = unique(pcgl_data()$cwd_sens),
      #           #           opacity = 1)
  #     )
  # })

  # correct map END ---
      
  
  
  # combined_pred_raster <- reactive({
  #   combined_pred %>%
  #     #filter(input$)
  #     rename(lng = x, lat = y) %>%
  #     dplyr::select(lng, lat, cwd_sens, rwi_pred_change_mean) %>%
  #     terra::rast()
  #   
  #   terra::crs(pcgl_pred_data)
  #   
  #   test_rast <- pcgl_data[[]]
  # })
  # 
  # # do we need to filter
  # output$test_map_output <-renderLeaflet({
  #   
  #   
  #   leaflet() %>%
  #     # addProviderTiles(providers$Esri.WorldTerrain, group = "ESRI Terrain",
  #     # options = providerTileOptions(maxZoom = 100)) %>% 
  #     # --- set View to ext of data 
  #     
  #     # set view over Santa Barbara
  #     setView(zoom = 10) %>% 
  #     # add minimap 
  #     addMiniMap(toggleDisplay = TRUE) %>% 
  #     
  #     # --- add raster image
  #     # i think this is the problem 
  #     addRasterImage(pcgl_data()[[input$map_type_button]],
  #                    colors = palette_orange_blue,
  #                    opacity = 1) 
    
  # END renderLeaflet
