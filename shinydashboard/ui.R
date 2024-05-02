#........................dashboardHeader.........................
header <- dashboardHeader(
  
  # add title ----
  title = span("Mapping Tree Vulnerablity", style = "font-size: 18px;")
  
) # END dashboardHeader


#........................dashboardSidebar........................
sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "About", tabName = "about", icon = icon("house")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("leaf")),
    menuItem(text = "Research", tabName = "research", icon = icon("lightbulb")),
    menuItem(text = "Data", tabName = "data", icon = icon("database"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

#..........................dashboardBody.........................


body <- dashboardBody(
  
  # header; load stylesheet & fontawesome kit ----
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles-sheet.css"),
    tags$script(src = "https://kit.fontawesome.com/b7f4c476ba.js"),
    includeHTML("www/google-analytics.html")
  ), # END header
  
  # tabItems ----
  tabItems(
    
    # welcome tabItem ----
    tabItem(tabName = "about",
            
            # left-hand column ----
            column(width = 12,
                   
                   # background box ----
                   box(width = 12,
                       
                       title = tagList(icon("tree"), strong("Mapping Tree Vulnerabilty ")),
                       includeMarkdown("text/about.md")
                       # tags$img(src = "FishCreekWatershedSiteMap_2020.jpeg", 
                       #          alt = "A map of Northern Alaska, showing Fish Creek Watershed located within the National Petroleum Reserve.",
                       #          style = "max-width: 100%;"),
                       # tags$h6(tags$em("Map Source:", tags$a(href = "http://www.fishcreekwatershed.org/", "FCWO")),
                       #         style = "text-align: center;")
                       
                   ) # END background box
                   
            ), # END left-hand column
            
    ), # END welcome tabItem 
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 12,
                  #start box 
                  flowLayout(
                  
                  # "sliderInputs here"
                  selectInput(inputId = "genus_name",
                              label = "Genus",
                              choices = c("Genus"="",species_data_names$genus),
                              multiple=TRUE,
                              selectize = TRUE,
                              width = NULL,
                              size = NULL),
                  conditionalPanel("input.genus_name",
                                   selectInput(inputId = "species_name",
                              label = "Scientific Name",
                              choices = c("Scientific Name"="",species_data_names$spp),
                              multiple=FALSE,
                              selectize = TRUE,
                              width = NULL,
                              size = NULL)
                  ),
                  selectInput(inputId = "species_code",
                              label = "Species Code",
                              choices = c("4 Letter Code"="",species_data_names$sp_code),
                              multiple=FALSE,
                              selectize = TRUE,
                              width = NULL,
                              size = NULL)
                  
                  ), # end of flow layout
                  verticalLayout(radioButtons(inputId = "map_type_button", 
                                              label = "Choose map type:",
                                              c("Vulnerabilty " = "rwi_pred_change_mean",
                                                "Sensitivity" = "cwd_sens"),
                                              inline = TRUE))
                  
                  
              ), # END input box
              
              # leaflet box ----
              box(width = 8,

                  title = tags$strong("Test Map Output"),

                  #leaflet otuput ----
                  leafletOutput(outputId = "test_map_output") %>%
                    withSpinner(type = 1, color = "cyan4")

              ) # END leaflet box
              
            ) # END fluidRow
            
    ), # END dashboard tabItem
    
    
    tabItem(tabName = "research",
            
            # fluidRow ----
            fluidRow(
              
              # data description box ----
              box(width = 6,
                  
                  "Data Description Here" # END input box
              
              
                  ),# Paper description box ----
              box(width = 6, 
                  
                  "Paper Description Here"
                  
              ) # END leaflet box
              
            ) # END fluidRow
            
    ) # END dashboard tabItem
    
    
  ) # END tabItems
  
) # END dashboardBody

#..................combine all in dashboardPage..................
dashboardPage(header, sidebar, body)