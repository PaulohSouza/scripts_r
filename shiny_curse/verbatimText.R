library(shiny)

ui <- fluidPage(
    sidebarPanel(
        textInput("exemplo", "Digite uma informação")
    ),
    mainPanel(
        textOutput("txtSaida"),
        verbatimTextOutput("verbalText")
    )
)

server <- function(input, output){
    output$txtSaida <- renderText("Meu primeiro valor saida")
    output$verbalText <- renderPrint(version)
}

shinyApp(ui, server)
