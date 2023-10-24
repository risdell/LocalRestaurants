source("./scripts/script.R")

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
