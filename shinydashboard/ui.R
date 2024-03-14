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
    menuItem(text = "Research", tabName = "reasearch", icon = icon("lightbulb"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

#..........................dashboardBody.........................
body <- dashboardBody(
  
  # tabItems ----
  tabItems(
    
    # welcome tabItem ----
    tabItem(tabName = "about",
            
            # left-hand column ----
            column(width = 8,
                   
                   # background box ----
                   box(width = NULL,
                       
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
              box(width = 4,
                  
                  "sliderInputs here"
                  
              ), # END input box
              
              # leaflet box ----
              box(width = 8, 
                  
                  "leafletOutput here"
                  
              ) # END leaflet box
              
            ) # END fluidRow
            
    ) # END dashboard tabItem
    
  ) # END tabItems
  
) # END dashboardBody

#..................combine all in dashboardPage..................
dashboardPage(header, sidebar, body)