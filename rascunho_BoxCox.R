setwd("C:/Users/paulosouza/Desktop/Entomologia/Mariana")
library(nortest)
library(lawstat)
library(MASS)
library(ggplot2)
library(fpp)


dados<- read.csv("3DA1A.csv", sep = ";", dec = ".")
dados$Trat <- as.factor(dados$Trat)


bc <- boxcox(Mar + 1 ~ Trat, data = dados, lambda = seq(-5, 5, len = 20))

plot(bc)

hist(bc$y)


shapiro.test(bc$y)

x<- log(dados$Mar + 1)
df <- data.frame(dados$Trat, dados$Rep, z)


anova <- aov(z ~ Trat , data = dados)
summary(anova)

shapiro.test(anova$residuals)

z <- sqrt(dados$Mar + 1)

hist(x)

library(ExpDes.pt)

data(ex6)
respAd
View(est21Ad)
Felipe$Material <- as.factor(Felipe$Material)
Felipe$Adubodebase <- as.factor(Felipe$Adubodebase)
Felipe$Adubodecobertura <- as.factor(Felipe$Adubodecobertura)
c<- na.omit(rc_isolado2$nitratobase...9)
View(c)

Felipe <- rc_isolado2
Felipe$base <- as.factor(Felipe$base)
Felipe$cobertura<- as.factor(Felipe$base)
Felipe$cobertura <- as.factor(Felipe$cobertura)

x <- fat3.ad.dbc(Felipe$Material, Felipe$base, Felipe$cobertura, Felipe$Bloco, Felipe$produtividadescs...8, c,
            quali = c(TRUE, TRUE, TRUE), mcomp = "snk", fac.names =
              c("Material", "Adubo de Base", "Adubo de Cobertura"), sigT=0.05, sigF = 0.05)

shapiro.test(x$residuos)

hist(x$medias.fator2)


data(ex6)
attach(ex6)
data(respAd)
fat3.ad.dbc(fatorA, fatorB, fatorC, rep, resp, respAd,
            quali = c(TRUE, TRUE, TRUE), mcomp = "snk", fac.names =
              c("Fator A", "Fator B", "Fator C"), sigT=0.05, sigF = 0.05)

respAd


plot(Mar ~Trat, data = dados)

mod <- lm(Mar+1 ~ Trat, data = dados)
summary(mod)

plot(mod)

boxcox(mod)

#Normalidade
lillie.test(pbpibc)

levene.test(dados$Mar, dados$Trat)

#DISTRIBUICAO NORMAL
ggplot(dados, aes(x = dados$Mar))+
  geom_histogram(aes(y=..density..),bins=10,colour="black",fill="white")+geom_density(alpha=0.2, fill="#FF6666")
#Determinacao lambda
boxcox(dados.Mar...0.1 ~ Trat, data = df, lam= seq(-1,1,1/10))
x
dados
df
anova <- aov(df$dados.Mar...0.1 ~ dados$Trat)
summary(anova)
anova <- aov(rc_isolado2$produtividadescs...8 ~ rc_isolado2$Material + rc_isolado2$Bloco)
summary(anova)

shapiro.test(anova$residuals)


saida <- ea1(dados, design=1, alpha=0.05, list = TRUE, p.adjust = 1, plot=1)
print(saida)

shapiro.test(dados$Mar)

fligner.test(dados$Mar~dados$Trat)

install.packages("fpp")
library(fpp)
attach(dados)

hist()
shapiro.test(log(dados$Mar + 1))

lambda <- BoxCox.lambda(dados$Mar, method=c("loglik"), lower=-5, upper= 5) ## Valor de Lambda
lambda ## é o valor da potência
d <- BoxCox (dados$Mar, lambda) ## Transformação Box-Cox
d # Variável transformada com Box-Cox

#lixo
dados1 <- dados1[!dados1$Mar %in% boxplot.stats(dados1$Mar)$out,]
hist(dados1$Mar)


df <- data.frame(dados$Trat, dados$Rep, ))
hist(df$sqrt.dados.Mar...1.)

shapiro.test(dados1$Mar)

anova <- lm(dados$Mar ~ dados$Trat, data = dados)
shapiro.test(anova$residuals)

hist(anova$residuals)

library(ExpDes.pt)

dic(dados$Trat, dados$Mar, quali = TRUE, hvar = 'bartlett', sigF = 0.05)

#BOXCOX

