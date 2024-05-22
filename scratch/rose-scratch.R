meta_df <- read_csv("~/../../capstone/climatree/input/external/species_metadata.csv") %>% 
  rename(sp_code = species_id) %>% 
  dplyr::select(sp_code, spp, common_name)

combined_pred <- read_csv("~/../../capstone/climatree/output/final-output/combined_predictions.csv") %>% 
  rename(sp_code = species_code) %>% 
  left_join(meta_df, join_by(sp_code)) %>% 
  select(-x, -y, -cwd_sens) %>% 
  distinct(sp_code, .keep_all = TRUE)
