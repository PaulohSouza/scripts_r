library(shiny)

ui <- fluidPage(
  titlePanel("Numeric Input"),
  sidebarLayout(
    sidebarPanel(
      numericInput("idEntradaNumerica", "informe um numero", 0, min = 0, max= 100, step = 5)
      ),
    mainPanel(
      verbatimTextOutput("idSaida", "Valor informado está fora da faixa")
    )
  )
)

server <- function(input, output){
  
}

shinyApp(ui, server)