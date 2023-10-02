source("./script.R")

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("ESTDatS Restaurant Finder"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "Type",
                        label = "Style of Food:",
                        choices = unique(restaurants$Style),
                        multiple = TRUE,
                        selected = unique(restaurants$Style))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           tmapOutput("locs", height = 800)
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  
  
  output$locs <- renderTmap({
    filtered <- restaurants %>% 
      filter(Style == input$Type)
    
    tm_shape(shp = filtered, name = "Restaurants") +
      tm_dots(col = "Style",
              size = 0.7,
              popup.vars = c(
                Name = "Restaurant",
                Style = "Style",
                Address = "Address",
                Website = "Website", 
                Notes = "Notes"
              ))
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
