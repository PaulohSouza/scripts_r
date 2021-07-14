df <- read.csv("C:/R/dadosbahiaglp2019.csv", header = TRUE, sep = ";")
devtools::install_github("ramnathv/htmlwidgets#351")
library(shiny)

ui <- fluidPage(
  tableOutput("idtable"),
  DT::dataTableOutput("dtdados")
)

server <- function(input, output){
  output$idtable <- renderTable(head(df))
  output$dtdados <- renderDataTable(df, options = list(pageLength=10))
}

shinyApp(ui, server)
