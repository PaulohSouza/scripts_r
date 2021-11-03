library(survival)
library(survminer)
library(dplyr)
library(ggplot2)
library(egg)

#Selecionando o Arquivo
setwd("C:/Users/paulosouza/Desktop/Entomologia/Dados Tratados")

#Carregando Pasta do arquivo - Separado por instar

dados <- read.csv("bicudo3.csv", sep = ";", dec = ".")

dados$Trat <- as.factor(dados$Trat)


Trat <- survfit(Surv(Dia, Mortalidade)~ Trat, data = dados)
survdiff(formula = Surv(Dia, Mortalidade) ~ Trat, data = dados, rho = 0)



#POR INSTAR

#Plotagem por ggsurvplot

ggsurv <- ggsurvplot(Trat, data = dados, pval = "",
          legend.title = expression("[" (paste(italic("[Anthonomus grandis]")))),
         legend.labs = c("[Testemunha]","Botão floral", "Folha", "Folha + Botão Floral", "Inseto"))+
         xlab("Tempo (Dias)")+
  xlab("Tempo (Dias)")+
  ylab("Sobrevivência estimada")

(ggsurv$plot <- ggsurv$plot+
  ggplot2::annotate("text", x = 6, y = 0.15,
           label = "X² = 41.4; p <0.01**", size = 5))


#Separando por instar
#Gráfico por Instar

geral <- read.csv("Se.csv", sep = ";", dec = ".")


geralTrat <- survfit(Surv(Dia, Mortalidade) ~ Trat, data = geral)

(ggsurvplot_facet(geralTrat, geral, facet.by = "Instar", palette = "jco", pval = TRUE, legend.title = substitute(paste(italic('Spodoptera eridania'))))+
  xlab("Tempo (Dias)")+
  ylab("Sobrevivência estimada"))


#Sobrevivencia

sobrev <- Sc2
sobrev <- read.csv("sobrev_grafico_bicudo.csv", sep = ";", dec = ".")
sobrev

my_tag <- c("X² = 41.4; p <0.01**")

##############################################

g <- ggplot(sobrev, aes(Dia, SOBREV), group= Trat) +
  geom_line(aes(linetype=Trat, group=Trat), # Line type
            size = 0.5) +
  geom_point(aes(group = Trat, shape = Trat))+
  labs(title = expression("Dieta artificial" - paste(italic( "Anthonomus grandis")))) +
  ylab("Sobrevivência (%)")+
  xlab("Tempo (Dias)")+
  ylim(0,100)+
  scale_x_continuous(limits = c(0,8))+
  theme_classic()

g
t <- tag_facet(g,
               x = 4, y = -Inf,
               vjust = -1, hjust = -0.25,
               open = "", close = "",
               fontface = 3,
               size = 6,
               family = "serif",
               tag_pool = my_tag)
t

l <- tag_facet(t,
          x = -Inf, y = -Inf,
          vjust = -1,
          open = "", close = ")",
          tag_pool = LETTERS)


t+theme(axis.text=element_text(size=12),
        axis.title=element_text(size=14,face="bold"))

# RASCUHOS

#Plotagem do primeiro gráfico - Kaplan Meier por Instar

plot(Trat, lty = 1:5, col = 2:5, ylab = "Probabilidade de Sobrevivência", xlab = "Tempo (Dias)",
     conf.int = F, main = expression(italic("Anticarsia gemmatalis") - "Instar I"), axes = F)
axis(1)  #Adicionando eixo x
axis(2)  #Adicionado eixo y
box(bty="L") #Unir Bordas
# Adicionando Legenda
legend(4,0.95,lty = 1:5, col = 2:5,c("Acera 500","Acera 750", "Helymax 350", "Helymax 500", "Testemunha"),lwd=0.3, bty="n")


#Resultado
survdiff(formula = Surv(Dia, Mortalidade) ~ Trat, data = dados, rho = 0)
text(5, 0.1, labels=paste("R²=", "0.9293", sep=""))




g <- ggplot(sobrev, aes(Dia, SOBREV, colour = Trat)) +
  geom_line() +
  geom_point(aes(color = Trat, shape = Trat))+
  facet_wrap(~Instar)+
  labs(title = expression("Sobrevivência por Instar" (paste(italic( "Anticarsia gemmatalis"))))) +
  ylab("Sobrevivência (%)")+
  xlab("Tempo (Dias)")+
  ylim(0,100)+
  theme_classic()

t <- tag_facet(g,
               x = 4, y = 50,
               vjust = -1, hjust = -0.25,
               open = "", close = "",
               fontface = 2,
               size = 4,
               family = "serif",
               tag_pool = my_tag)


tag_facet(t,
          x = -Inf, y = -Inf,
          vjust = -1,
          open = "", close = ")",
          tag_pool = LETTERS)








#Rascunhos
ggplot(dados, aes(x = year, y = lifeExp, colour = Trat)) +
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




