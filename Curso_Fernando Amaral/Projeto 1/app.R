library(shiny)
setwd("C:/R/bases")


uid <- fluidPage(
  titlePanel("Previsão de custo inicial par amontar uma franquia")
  fluidRow(
      column(4,
        h2("Dados"),
        tableOutput("Dados")
      ),
      column(8,
         plotOutput("Graf")
      )
  ),
  fluidRow(
      column(6,
          h3("Valor Anual da Franquia").
          numericInput("NovoValor", "Insira Novo valor", 1500, ,min - 1, max = 99999),
          actionButton("Processar", "Processar")
      ),
      column(6,
         h1(textOutput("Resultado"))
      )
  )
)

server 
  