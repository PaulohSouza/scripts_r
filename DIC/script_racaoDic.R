#resposta ao exercicio 1.6
# https://smolski.github.io/livroavancado/delin.html#exercicios

#Armazenar os dados do DataFrame
nome_trat <-  rep(c("A", "B", "C", "D", "E"), each=4)
bloco <- rep(c(1,2,3,4),5)

#Scan para digitar os dados
# Peso <- scan(dec=",", nmax = 20)
Peso <- c(
  6.4, 10.9, 12.0, 11.2,
  6.2, 11.6, 10.9, 11.6,
  6.2, 11.4, 11.5, 10.9,
  7.1, 10.4, 11.1, 12.1,
  6.6, 12.4, 11.8, 10.1)

#Criar o Data Frame
ex01 <- data.frame(nome_trat, bloco, Peso)
attach(ex01)

#Realizar Anova
anova <- aov(Peso ~ nome_trat, data = ex01)
summary(anova)

# Teste de homogeneidade e distribuicao
shapiro.test(anova$residuals)

#Teste de homocestacidade das variãncias
bartlett.test(anova$residuals ~ nome_trat)
hist(Peso)


#criar_Grafico
residuo = residuals(anova)
ajustados = fitted(anova)
plot(ajustados, residuo)
abline(h=0)

#Teste de médias - Tukey - utilizando pacote agricolae
library(agricolae)
HSD.test(anova, as.factor("nome_trat"), console = TRUE)
