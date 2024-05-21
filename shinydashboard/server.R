server <- function(input, output, session) {
  
##----------------------------------------------
  
  # Update the choices of the speciesFilter selectInput based on the selected filter type
  observeEvent(input$filterType, {
    if (input$filterType == "Common Name") {
      updateSelectInput(session, "speciesFilter",
                        choices = c("All", unique(combined_pred$common_name)),
                        selected = "All")
    } else if (input$filterType == "Species Code") {
      updateSelectInput(session, "speciesFilter",
                        choices = c("All", unique(combined_pred$spp_code)),
                        selected = "All")
    } else if (input$filterType == "Scientific name") {
      updateSelectInput(session, "speciesFilter",
                        choices = c("All", unique(combined_pred$spp)),
                        selected = "All")
    }
  })
  
  # Filter the tree species data based on user input
  filtered_data <- reactive({
    if (input$filterType == "All") {
      combined_pred
    } else if (input$filterType == "Common Name") {
      if ("All" %in% input$speciesFilter) {
        combined_pred
      } else {
        combined_pred[combined_pred$common_name %in% input$speciesFilter, ]
      }
    } else if (input$filterType == "Species Code") {
      if ("All" %in% input$speciesFilter) {
        combined_pred
      } else {
        combined_pred[combined_pred$spp_code %in% input$speciesFilter, ]
      }
    } else if (input$filterType == "Scientific name") {
      if ("All" %in% input$speciesFilter) {
        combined_pred
      } else {
        combined_pred[combined_pred$spp %in% input$speciesFilter, ]
      }
    }
  })
  
  # Render the filtered data table
  output$speciesTable <- renderDataTable({
    filtered_data()
  })
  
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
