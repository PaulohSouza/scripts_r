library(shiny)
library(shinydashboard)

ui <- fluidPage(
    sliderInput(inputId = "number",
                label = "Selecione numero de dados",
                value = 500, min = 25, max = 1000),
    plotOutput("hist")
)

server <- function(input, output){
    output$hist <- renderPlot({
        hist(runif(input$number, min = 0, max = 1), xlab= "value",
             main=paste(input$number, 'Dashboard - Dados selecionados'))
    }
    )
}

shinyApp(ui, server)
