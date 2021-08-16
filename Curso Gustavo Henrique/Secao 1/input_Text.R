library(shiny)

ui <- fluidPage(
  titlePanel("Entrada e saida de dados"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("idEntradaTexto", "Informe um texto")
    ),

    mainPanel(
      textOutput("idSaidaTexto")
    )
    
  )
  
)

server <- function(input, output){
  output$idSaidaTexto <- renderText(input$idEntradaTexto)
  
}

shinyApp(ui, server)
