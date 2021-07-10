library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      tags$code("if x > 10 Then"),
      tags$h1("Texto que possui o tamanho de h1"),
      tags$h2("Texto que possui o tamanho de h2"),
      tags$strong("Texto em negrito com strong"),
      tags$em("Texto em italico"),
      tags$br(),
      tags$u("Texto sublinhado")
    )
  )
)

server <- function(input, output){
  
}

shinyApp(ui, server)
