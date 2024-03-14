## ClimaTree Dashboard 
Shiny App Development for ClimaTree

## About the ClimaTree Dashboard 

## Repository structure:

  
    ├── scratch/                                          # scripts for trying out visuals, analyses, etc. before adding to the app
    │   └── practice_script_app1_penguins.R                 # practice filtering & data viz for App #1  
    │   └── practice_script_app2_animals.R                  # practice filtering & data viz for App #2
    │   └── data_processing_app3_shinydashboard.R           # pre-processing data for App #3
    │   └── practice_script_app3_shinydashboard.R           # practice filtering & data viz for App #3
    |   └── create_fresh_theme_shiny.R                      # build theme using {fresh}; applied to App #2
    |   └── create_fresh_theme_shinydashboard.R             # build theme using {fresh}; applied to shiny dashboard
    |── shinydashboard/                                   # folder containing the code for App #3, a shinydashboard 
    |   └── global.R                                        # packages, objects, etc. used by ui & server
    |   └── ui.R                                            # user interface code
    |   └── server.R                                        # server code
    |   └── data/                                         # folder containing pre-processed data used by the app
    |     └── lake_data_processed.csv                       # processed data (.csv) (raw file in ~/raw_data, processing script in ~/R/data_processing_app3_shinydashboard.R)
    |   └── text/                                         # folder containing markdown files with styled text embedded in app
    |     └── intro.md                                      # welcome page background info text      
    |     └── citation.md                                   # welcome page data citation text
    |     └── disclaimer.md                                 # welcome page disclaimer text
    |   └── www/                                          # special directory in shiny for images, stylesheets, etc. 
    |      └── FishCreekWatershedSiteMap_2020.jpeg          # map for welcome page, downloaded from http://www.fishcreekwatershed.org/images/FishCreekWatershedSiteMap_2020.jpg 
