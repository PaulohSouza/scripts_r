library(survival)
library(survminer)
library(dplyr)

#Selecionando o Arquivo
setwd("C:/Users/paulosouza/Desktop/Entomologia/Dados Tratados")

#Carregando Pasta do arquivo - Separado por instar

dados <- read.csv("Ag_InstarI.csv", sep = ";", dec = ".")

#Formula

Trat <- survfit(Surv(Dia, Mortalidade)~ Trat, data = dados)


#Plotagem do primeiro gráfico - Kaplan Meier por Instar

plot(Trat, lty = 1:5, col = 2:5, ylab = "Sobrevivência", xlab = "Dias",
     conf.int = F, main = expression(italic("Anticarsia gemmatalis") - "Instar I"), axes = F)
axis(1)  #Adicionando eixo x
axis(2)  #Adicionado eixo y
box(bty="L") #Unir Bordas

# Adicionando Legenda
legend(4,0.95,lty = 1:5, col = 2:5,c("Acera 500","Acera 750", "Helymax 350", "Helymax 500", "Testemunha"),lwd=0.3, bty="n")

#Resultado
survdiff(formula = Surv(Dia, Mortalidade) ~ Trat, data = dados, rho = 0)
text(5, 0.1, labels=paste("R²=", "0.9293", sep=""))


#Plotagem por ggsurvplot

ggsurv <- ggsurvplot(Trat, data = dados, pval = "",
           legend.title = "",
           legend.labs = c("Acera 500", "Acera 750", "Helymax 350", "Helymax 500", "Testemunha"))+
  xlab("Tempo (Dias)")+
  ylab("Probabilidade Sobrevivência")

(ggsurv$plot <- ggsurv$plot+
  ggplot2::annotate("text", x = 6, y = 0.75,
           label = "X² = 10.3, \n p < 0.001", size = 5))

#Separando por instar
#Gráfico por Instar

geral <- read.csv("Ag.csv", sep = ";", dec = ".")

titulo <- substitute(paste(italic('this text is italic')))
titulo
geralTrat <- survfit(Surv(Dia, Mortalidade) ~ Trat, data = geral)
ggsurvplot_facet(geralTrat, geral, facet.by = "Instar", palette = "jco", pval = TRUE, legend.title = titulo)+
  xlab("Tempo (Dias)")+
  ylab("Probabilidade Sobrevivência")


#Rascunhos
ggplot(dados, aes(x = year, y = lifeExp, color = Trat)) +
  geom_line() +
  geom_point(aes(shape = continent))  +
  labs(title = "Evolução da expectativa de vida por continente",
       x = "Ano",
       y = "Anos de vida",
       color = "Continente",
       shape = "Continente")+
  theme_bw()

p <- ggplot(data = geral, aes(x = Dia, y = Mortalidade, color = Trat)) + geom_point()
p + facet_wrap(~Instar)

geral

