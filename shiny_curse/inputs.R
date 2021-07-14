library(shiny)

#App Shiny
#Base aplicativo

ui <- fluidPage(
  #Objetos de entrada de texto
  textInput("txt", "informe um salario"),
  textAreaInput("txtA", "Entre com o resumo da área"),
  passwordInput("password", "Senha"),
  
  #objetos de Entrada Numerica
  sliderInput("sld", "selecioner o valor: ", 0,  10, c(4,6), 2),
  numericInput("numI", "Informe um número", 0, 0, 10),
  
  #Datas
  dateInput("dI", "Informe a data da solicitação", format = "dd-mm-yyyy")

)

server <- function(input, output, session){

}

shinyApp(ui, server)
