##Curso Estatística Experimental no SOftware R

##Aula - Estatística descritiva

##Lendo os dados
setwd("C:/Users/hp/OneDrive - Experimental Analytics Corporation/Short course/Experimental statistics in R")

dados<-read.table("DadosDIC.csv", h=T, sep=";")

##Média
m<-mean(dados$PROD, na.rm = T)
m1<-colMeans(dados)

##Mediana
me<-median(dados$PROD, na.rm = T)

## Amplitude total
AT<-max(dados$PROD, na.rm = T)-min(dados$PROD, na.rm = T)

##Variância
va<-var(dados$PROD, na.rm = T)

##Desvio padrão
dp<-sd(dados$PROD)
dp1<-sqrt(var(dados$PROD))

##Erro padrão da média
epm<-dp/length(dados$PROD)

##Correlação
co<-cor(dados[,2:4])

##Covariância
covar<-cov(dados[,2:4])

##Coeficiente de variação
CV<-(dp/m)*100

##Teste de homogeneidade e normalidade de variância
##Calculando assimetria e curtose no R
## Tipos de curtose:
## C=3 - mesocurtica
## C>3 - platicúrtica
## C<3 - leptocúrtica
## Tipos de assimetria
## AS=0 - Média, moda e mediana coincidem
## AS>0 - cauda da distribuição do lado direito do gráfico
## AS<0 - cauda da distribuição do lado esquerdo do gráfico
require(e1071)
kurtosis(dados$PROD, na.rm = TRUE,type=3)
kurtosis(dados$MAT, na.rm = TRUE,type=3)
kurtosis(dados$ALP, na.rm = TRUE,type=3)
skewness(dados$PROD,type=1)
skewness(dados$MAT,type=1)
skewness(dados$ALP,type=1)
library(fBasics)
basicStats(dados$PROD)
basicStats(dados$MAT)
basicStats(dados$ALP)

##Rodando o teste de Kolmogorov-Smirnov
ks.test(dados$PROD,"pnorm")
ks.test(dados$MAT,"pnorm")
ks.test(dados$ALP,"pnorm")

##Rodando o teste de Shapiro-wilk
shapiro.test(dados$PROD)
shapiro.test(dados$MAT)
shapiro.test(dados$ALP)

## Calculando teste de Bartlet
bartlett.test(dados$PROD~dados$TRAT, dados)
bartlett.test(dados$MAT~dados$TRAT, dados)
bartlett.test(dados$ALP~dados$TRAT, dados)

##Remoção de outliers
#------------------------------------------------------------------------------------------
# identificar/remover os pontos discrepantes/influentes
dados$TRAT<-as.factor(dados$TRAT)
m<-aov(MAT~TRAT,dados)
layout(1)
plot(residuals(m)~TRAT, dados)
dados1<-dados[!dados$MAT %in% boxplot.stats(dados$MAT)$out,]

#
#------------------------------------------------------------------------------------------
# análise com os pontos removidos
m1<-aov(MAT~TRAT,dados1)

