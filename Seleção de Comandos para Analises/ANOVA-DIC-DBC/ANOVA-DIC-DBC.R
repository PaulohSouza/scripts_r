##Aula - ANOVA - DIC e DBC

##ANOVA DIC
##Lendo os dados

dados<-read.table("DadosDIC.csv", h=T, sep=";")
## modelo y = T + e
## y - vari?vel resposta
## T - efeito de tratamento
## e - erro experimental

##Transformando os efeitos em fatores
dados$TRAT<-as.factor(dados$TRAT)
require(GExpDes)

GExpDesView()




##Rodando a an?lise de vari?ncia para produtividade
resultado<-aov(dados$PROD~dados$TRAT)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo an?lise de res?duo
par(mfrow=c(2,2)) #divide a janela gr?fica em quatro subjanelas
plot(resultado) #plota os gr?ficos para an?lise do res?duo

##Rodando a an?lise de vari?ncia para maturidade
resultado<-aov(dados$MAT~dados$TRAT)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo an?lise de res?duo
par(mfrow=c(2,2)) #divide a janela gr?fica em quatro subjanelas
plot(resultado) #plota os gr?ficos para an?lise do res?duo

##Rodando a an?lise de vari?ncia para altura de plantas
resultado<-aov(dados$ALP~dados$TRAT)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo an?lise de res?duo
par(mfrow=c(2,2)) #divide a janela gr?fica em quatro subjanelas
plot(resultado) #plota os gr?ficos para an?lise do res?duo


##ANOVA DBC
##Lendo os dados
setwd("C:/Users/hp/OneDrive - Experimental Analytics Corporation/Short course/Experimental statistics in R")

dados<-read.table("DadosDBC.csv", h=T, sep=";")

## modelo y = T + B + e
## y - vari?vel resposta
## T - efeito de tratamento
## B - efeito de blocos
## e - erro experimental

##Transformando os efeitos em fatores
dados$TRAT<-as.factor(dados$TRAT)
dados$REP<-as.factor(dados$REP)

##Rodando a an?lise de vari?ncia para produtividade
resultado<-aov(dados$PROD~dados$TRAT+dados$REP)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo an?lise de res?duo
par(mfrow=c(2,2)) #divide a janela gr?fica em quatro subjanelas
plot(resultado) #plota os gr?ficos para an?lise do res?duo

##Rodando a an?lise de vari?ncia para maturidade
resultado<-aov(dados$MAT~dados$TRAT+dados$REP)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo an?lise de res?duo
par(mfrow=c(2,2)) #divide a janela gr?fica em quatro subjanelas
plot(resultado) #plota os gr?ficos para an?lise do res?duo

##Rodando a an?lise de vari?ncia para altura de plantas
resultado<-aov(dados$ALP~dados$TRAT+dados$REP)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo an?lise de res?duo
par(mfrow=c(2,2)) #divide a janela gr?fica em quatro subjanelas
plot(resultado) #plota os gr?ficos para an?lise do res?duo


##ANOVA DQL
##Lendo os dados
setwd("C:/Users/hp/OneDrive - Experimental Analytics Corporation/Short course/Experimental statistics in R")

dados<-read.table("DadosDQL.csv", h=T, sep=";")

## modelo y = T + C + L + e
## y - vari?vel resposta
## T - efeito de tratamento
## C - efeito da coluna
## L - efeito da linha
## e - erro experimental

##Transformando os efeitos em fatores
dados$TRAT<-as.factor(dados$TRAT)
dados$Coluna<-as.factor(dados$Coluna)
dados$Linha<-as.factor(dados$Linha)

##Rodando a an?lise de vari?ncia para produtividade
resultado<-aov(dados$PROD~dados$TRAT+dados$Coluna+dados$Linha)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo an?lise de res?duo
par(mfrow=c(2,2)) #divide a janela gr?fica em quatro subjanelas
plot(resultado) #plota os gr?ficos para an?lise do res?duo

##Rodando a an?lise de vari?ncia para maturidade
resultado<-aov(dados$MAT~dados$TRAT+dados$Coluna+dados$Linha)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo an?lise de res?duo
par(mfrow=c(2,2)) #divide a janela gr?fica em quatro subjanelas
plot(resultado) #plota os gr?ficos para an?lise do res?duo

##Rodando a an?lise de vari?ncia para altura de plantas
resultado<-aov(dados$ALP~dados$TRAT+dados$Coluna+dados$Linha)

#Exibindo os resultados
anova(resultado)
summary(resultado)

##Fazendo an?lise de res?duo
par(mfrow=c(2,2)) #divide a janela gr?fica em quatro subjanelas
plot(resultado) #plota os gr?ficos para an?lise do res?duo
