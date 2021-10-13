setwd("C:/Users/paulosouza/Desktop/Entomologia/Mariana")

dados
dados<- read.csv("3DA1A.csv", sep = ";", dec = ".")
dados$Trat <- as.factor(dados$Trat)

anova <- aov(dados$Mar ~ dados$Trat)
summary(anova)

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

