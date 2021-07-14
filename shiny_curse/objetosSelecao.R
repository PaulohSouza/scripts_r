library(shiny)

paises <- c("Brasil", "Argentina", "Paraguai")
veiculos <- c("Ambulancia", "Carro", "Onibus")
animais <- c("Cachorro", "Gato", "Cavalo")
ui <- fluidPage(
  sidebarPanel(
    selectInput("selPaises", "Selecione um País", paises),
    radioButtons("rdPaises", "Qual pais escolhid", paises),
    radioButtons("tpveiculos", "Selecione o tipo de veiculo", choiceNames = list(icon("ambulance"), icon("bus"),
                                                                             icon("car")), choiceValues = veiculos),
    #tipo de veiculos
    selectInput("selveic", "veiculados selecionados", veiculos, multiple = TRUE),
    checkboxGroupInput("selanimais", "Selecione opcões: ", animais),
    checkboxInput("internacao", "Foi internado? ", value = FALSE)
    
    )
)

server <- function(input, output){
  
}

shinyApp(ui, server)
