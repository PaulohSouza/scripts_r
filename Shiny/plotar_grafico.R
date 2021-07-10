library(shiny)

ui <-fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderId", "Selecione a quantidade de numeros", min = 100, max=1000, value = 200)
    ),  
    mainPanel(
      plotOutput("graficoHist")
    )
    )
  )

server <- function(input, output){
  output$graficoHist <- renderPlot(hist(sample(input$sliderId)))
}

shinyApp(ui, server)
