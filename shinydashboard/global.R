# ==== LOAD LIBRARIES ====

# ---- essential libraries ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(shinycssloaders)
library(leaflet)
library(markdown)

# ---- spatial analysis ----
library()

# ==== READ IN DATA ==

# read in spp_predictions_pcgl.rds file from Tsosie
pcgl_pred_data<- readRDS("~/../../capstone/climatree/output/1-process-raw-data/spp_predictions_pcgl.rds")
