library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(title = "Header da aplicacao"),
    dashboardSidebar(),
    dashboardBody()
    
)

server <- function(input, output){
    
}

shinyApp(ui, server)
