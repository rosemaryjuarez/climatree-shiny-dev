#........................dashboardHeader.........................
header <- dashboardHeader(
  
  # add title ----
  title = span("Mapping Tree Sensitivity", style = "font-size: 18px;")

) # END dashboardHeader


#........................dashboardSidebar........................
sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "About", tabName = "about", icon = icon("house")),
    menuItem(text = "Sensitivity Maps", tabName = "dashboard", icon = icon("leaf")),
    #menuItem(text = "Research", tabName = "research", icon = icon("lightbulb")),
    menuItem(text = "Data", tabName = "data", icon = icon("floppy-disk"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

#..........................dashboardBody.........................


body <- dashboardBody(
  
  # header; load stylesheet & fontawesome kit ----
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "sass-styles.css"),
    tags$script(src = "https://kit.fontawesome.com/b7f4c476ba.js"),
    includeHTML("www/google-analytics.html")
  ), # END header
  
  # tabItems ----
  tabItems(
    
    # welcome tabItem ----
    tabItem(tabName = "about",
            
            # left-hand column ----
            fluidRow(width = 10,
                   
                   # background box ----
                   box(width = 10,
                       
                       #includeMarkdown("text/background.md"),
                       tags$img(src = "range_26.jpg", 
                                alt = "A Map of 26 species within a global context. A majority of our range is within the Northern Hemisphere.",
                                style = "max-width:80%; text-align: center;display: block; margin-left: auto; margin-right: auto;")
                       
                   ) # END background box
                   
            ),# END left-hand column
            
            # fluidRow
            fluidRow(
              box(width = 10,
                  title = tagList(icon("tree"), strong("Available Tree Species")),
                  dataTableOutput("speciesTable")
                  
              ),
              # box(width = 6,
              #     title = tagList(icon("tree"), strong("Research")),
              #     includeMarkdown("text/research.md")
              #     
              #     )
              
              
            ) # end of fluidRow
            
            
            
            
            
    ), # END about tabItem 
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 8,
                  title = tagList(icon("tree"), strong("Mapping Tree Sensitivity ")),
                  #includeMarkdown("text/mapping-tree-vulnerability.md"),
                  #start box 
                  flowLayout(
                    
                  
                  # "selectInputs here"
                  selectInput(inputId = "common_name",
                              label = "Common Name",
                              choices = c("Common Name"="",species_data_names$common_name),
                              multiple=TRUE,
                              selectize = TRUE,
                              width = NULL,
                              size = NULL),
                  selectInput(inputId = "species_name",
                              label = "Scientific Name",
                              choices = c("Scientific Name"="",species_data_names$spp),
                              multiple=FALSE,
                              selectize = TRUE,
                              width = NULL,
                              size = NULL),
                  selectInput(inputId = "species_code",
                              label = "Species Code",
                              choices = c("4 Letter Code"="",species_data_names$sp_code),
                              multiple=FALSE,
                              selectize = TRUE,
                              width = NULL,
                              size = NULL)
                  ), # end sliderinputs 
                  # "map input here" 
                  verticalLayout(
                    radioButtons(inputId = "map_type_button", 
                                              label = "Choose map type:",
                                              c("Vulnerabilty " = "rwi_pred_change_mean",
                                                "Sensitivity" = "cwd_sens"),
                                              inline = TRUE))
                  
              ), # END input box
              # map interpretation box ---
              box(width = 4,
                  title = tags$strong("Interpretation"),
                  includeMarkdown("text/interpretion.md")
                  )
            ), # end fluid row
              
              # leaflet box ----
              box(width = 8,

                  title = tags$strong("Test Map Output"),

                  #leaflet otuput ----
                  leafletOutput(outputId = "test_map_output") %>%
                    withSpinner(type = 1, color = "cyan4")

              ), # END leaflet box
              
              
            #), # END fluidRow
            
              
              # map interpretation box ---
              box(width = 4,
                  title = tags$strong("Interpretation")
                  ) # end interpretation box 
              
            
            
            
    ), # END dashboard tabItem
    tabItem(tabName = "data",
            
            # fluidRow ----
            fluidRow(
              # input species codebox ----
              box(width = 12,
                  title = tagList(icon("floppy-disk"), strong("Data"))
              )# end species code box 
            )# END fluidRow
    ) # END data tabItem
    
  ) # END tabItems
  
) # END dashboardBody

#..................combine all in dashboardPage..................
dashboardPage(header, sidebar, body,
              fresh::use_theme("fresh-theme.css"))





