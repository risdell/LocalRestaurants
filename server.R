source("./scripts/script.R")

library(shiny)

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
