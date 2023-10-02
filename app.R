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
                        choices = unique(osm.d$Style),
                        multiple = FALSE)
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
      tm_shape(shp = restaurants, name = "Restaurants") +
        tm_markers(col = "Style",
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
