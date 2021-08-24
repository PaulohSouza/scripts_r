library(shiny)
library(ggplot2)


dataset <- diamonds

ui <- fluidPage(
   sidebarLayout(
     sidebarPanel(
       textInput("idEntrada", "informe um valor de Entrada")
     ),
     mainPanel(
        textOutput("idSaida1"),
        textInput("idEntrada2", "Informe entrada 2"),
        textOutput("idSaida2")
     )
   )
  )

server <- function(input, output){
  output$idSaida1 <- renderText(input$idEntrada)
  output$idSaida2 <- renderText(input$idEntrada2)
}

shinyApp(ui,server)
