setwd("C:/R")
df<-read.csv("dadosbahiaglp2019.csv",header = TRUE,sep = ";")
devtools::install_github("ramnathv/htmlwidgets#351")
########################################################

##comeca script shiny


library(ggplot2)
library(shinydashboard)
source("data.R")
library(shiny)
library(ggplot2)
library(ggthemes)
library(plotly)

install.packages("htmlwidgets")

library(shiny)
ui<-fluidPage(
  sidebarPanel(),
  mainPanel(
    plotlyOutput("plot2"),
  )
)

server<-function(input,output,session){
  
  output$plot2 <- renderPlotly({ggplotly(ggplot(data = df, aes(x=as.factor(Bandeira), fill=as.factor(Bandeira) )) + 
                             geom_bar( ) +
                             scale_fill_brewer(palette = "Set1") +
                             theme(legend.position="none") +
                             xlab("Bandeira") + 
                             ylab("Numero"))
                              
    
  })
}

ggplot() aes()

shinyApp(ui,server)






