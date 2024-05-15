# fuction to rasterize tablular prediction data outside of shiny
make_raster <- function(input) {
  
#   prediction_data <- pcgl_pred_data %>%
#     rename(lng = x, lat = y) %>%
#     dplyr::select(lng, lat, cwd_sens, rwi_pred_change_mean) %>%
#     terra::rast()
# 
#   terra::crs(prediction_data) <-"epsg:25831"
# 
#   return(prediction_data)
# }
  pcgl_data <-  reactive({
    pcgl_data <- pcgl_pred_data %>%
    rename(lng = x, lat = y) %>%
    dplyr::select(lng, lat, cwd_sens, rwi_pred_change_mean) %>%
    terra::rast()

  terra::crs(pcgl_pred_data)
  })
}