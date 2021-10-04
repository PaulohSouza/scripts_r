##Curso Estatística Experimental no SOftware R

##Aula - ANOVA - DIC e DBC

##ANOVA DIC
##Lendo os dados
setwd("C:/Users/hp/OneDrive - Experimental Analytics Corporation/Short course/Experimental statistics in R")

dados<-read.table("DadosDIC.csv", h=T, sep=";")

## modelo y = T + e
## y - variável resposta
## T - efeito de tratamento
## e - erro experimental

##Transformando os efeitos em fatores
dados$TRAT<-as.factor(dados$TRAT)

##Rodando a análise de variância para produtividade
resultado<-aov(dados$PROD~dados$TRAT)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo análise de resíduo
par(mfrow=c(2,2)) #divide a janela gráfica em quatro subjanelas
plot(resultado) #plota os gráficos para análise do resíduo

##Rodando a análise de variância para maturidade
resultado<-aov(dados$MAT~dados$TRAT)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo análise de resíduo
par(mfrow=c(2,2)) #divide a janela gráfica em quatro subjanelas
plot(resultado) #plota os gráficos para análise do resíduo

##Rodando a análise de variância para altura de plantas
resultado<-aov(dados$ALP~dados$TRAT)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo análise de resíduo
par(mfrow=c(2,2)) #divide a janela gráfica em quatro subjanelas
plot(resultado) #plota os gráficos para análise do resíduo


##ANOVA DBC
##Lendo os dados
setwd("C:/Users/hp/OneDrive - Experimental Analytics Corporation/Short course/Experimental statistics in R")

dados<-read.table("DadosDBC.csv", h=T, sep=";")

## modelo y = T + B + e
## y - variável resposta
## T - efeito de tratamento
## B - efeito de blocos
## e - erro experimental

##Transformando os efeitos em fatores
dados$TRAT<-as.factor(dados$TRAT)
dados$REP<-as.factor(dados$REP)

##Rodando a análise de variância para produtividade
resultado<-aov(dados$PROD~dados$TRAT+dados$REP)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo análise de resíduo
par(mfrow=c(2,2)) #divide a janela gráfica em quatro subjanelas
plot(resultado) #plota os gráficos para análise do resíduo

##Rodando a análise de variância para maturidade
resultado<-aov(dados$MAT~dados$TRAT+dados$REP)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo análise de resíduo
par(mfrow=c(2,2)) #divide a janela gráfica em quatro subjanelas
plot(resultado) #plota os gráficos para análise do resíduo

##Rodando a análise de variância para altura de plantas
resultado<-aov(dados$ALP~dados$TRAT+dados$REP)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo análise de resíduo
par(mfrow=c(2,2)) #divide a janela gráfica em quatro subjanelas
plot(resultado) #plota os gráficos para análise do resíduo


##ANOVA DQL
##Lendo os dados
setwd("C:/Users/hp/OneDrive - Experimental Analytics Corporation/Short course/Experimental statistics in R")

dados<-read.table("DadosDQL.csv", h=T, sep=";")

## modelo y = T + C + L + e
## y - variável resposta
## T - efeito de tratamento
## C - efeito da coluna
## L - efeito da linha
## e - erro experimental

##Transformando os efeitos em fatores
dados$TRAT<-as.factor(dados$TRAT)
dados$Coluna<-as.factor(dados$Coluna)
dados$Linha<-as.factor(dados$Linha)

##Rodando a análise de variância para produtividade
resultado<-aov(dados$PROD~dados$TRAT+dados$Coluna+dados$Linha)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo análise de resíduo
par(mfrow=c(2,2)) #divide a janela gráfica em quatro subjanelas
plot(resultado) #plota os gráficos para análise do resíduo

##Rodando a análise de variância para maturidade
resultado<-aov(dados$MAT~dados$TRAT+dados$Coluna+dados$Linha)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo análise de resíduo
par(mfrow=c(2,2)) #divide a janela gráfica em quatro subjanelas
plot(resultado) #plota os gráficos para análise do resíduo

##Rodando a análise de variância para altura de plantas
resultado<-aov(dados$ALP~dados$TRAT+dados$Coluna+dados$Linha)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo análise de resíduo
par(mfrow=c(2,2)) #divide a janela gráfica em quatro subjanelas
plot(resultado) #plota os gráficos para análise do resíduo
