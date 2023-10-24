library(shiny)

# Load the UI and server components
source("ui.R")
source("server.R")

# Run the application
shinyApp(ui = ui, server = server)
