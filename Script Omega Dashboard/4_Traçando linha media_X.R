library(shiny)
library(tidyverse)


ui <- shinyUI(
        fluidPage(
            sidebarLayout(
              sidebarPanel(
                sliderInput(inputId = "NUMERO_DE_BARRAS", label = h2("Escolha um número de classes"),
                         value = 10, min = 2, max = 30, step = 1),
                checkboxInput(inputId = "MOSTRAR_MEDIA",
                              label = "Indicar a linha da média",
                              value = FALSE),
                textInput(inputId = "COR_DAS_BARRAS",
                  label = "Escolha uma cor", value = "orange",
                  placeholder = "Exemplo: red, blue, orange"),
              radioButtons(inputId = "COR_DO_CONTORNO",
                           label = "Escolha a cor do contorno: ",
                           choices = c("black", "white", "blue"),
                           selected = "black"),
            ),
              mainPanel(
                plotOutput(outputId = "HISTOGRAMA")
              )

              )
        ))


server <- shinyServer(function(input, output){

    output$HISTOGRAMA <- renderPlot({
     ggplot(data.frame(precip = precip),
         mapping = aes(x = precip))+
      geom_histogram(bins =  input$NUMERO_DE_BARRAS, fill = input$COR_DAS_BARRAS, color = input$COR_DO_CONTORNO)+
       geom_vline(xintercept = ifelse(input$MOSTRAR_MEDIA, mean(precip), mean(NA)))

    })
})

shinyApp(ui,server)
