#........................dashboardHeader.........................
header <- dashboardHeader(
  
  # add title ----
  title = "Tree Vulnerabilty Mapping",
  titleWidth = 400
  
) # END dashboardHeader

#........................dashboardSidebar........................
sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "About", tabName = "about", icon = icon("house")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("leaf")),
    menuItem(text = "Research", tabName = "research", icon = icon("lightbulb"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

#..........................dashboardBody.........................
body <- dashboardBody(
  
  # tabItems ----
  tabItems(
    
    # welcome tabItem ----
    tabItem(tabName = "about",
            
            # left-hand column ----
            column(width = 12,
                   
                   # background box ----
                   box(width = 12,
                       
                       title = tagList(icon("tree"), strong("Monitoring Tree Vulnerabilty ")),
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
                  textInput("Scientific Name", 
                            label = "Scientific Name", 
                            value = "", 
                            width = "100%",
                            placeholder = "Pinus ponderosa"),
                  textInput("common Name", "Common Name",
                            placeholder = "Western Yellow Pine"),
                  textInput("Sugar Pine", "Species Code (ex. pcgl)",
                            placeholder = "pcgl")
                  ), # end of flow layout
                  verticalLayout(radioButtons("rb", 
                                              label = "Choose map type:",
                                              c("Vulnerabilty " = "norm",
                                                "Sensitivity" = "unif"),
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