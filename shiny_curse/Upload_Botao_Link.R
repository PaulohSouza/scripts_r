library(shiny)

ui <- fluidPage(
  sidebarPanel(
  fileInput("dados", "Selecione o Arquivo a ser carregado: "),
  actionButton("btcarregar", "Clique Aqui"),
  actionLink("actLink", "Site Dados App:", icon = icon("github"), href = "https:github.com", 
             onclick= "window,open('https://github.com','_blank')")
  )
)

server <- function(input, output){
  
}

shinyApp(ui, server)
