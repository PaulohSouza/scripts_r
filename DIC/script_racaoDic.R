#resposta ao exercicio 1.6
# https://smolski.github.io/livroavancado/delin.html#exercicios

nome_trat <-  rep(c("A", "B", "C", "D", "E"), each=4)
bloco <- rep(c(1,2,3,4),5)
Peso <- scan(dec=",", nmax = 20)

ex01 <- data.frame(nome_trat, bloco, Peso)
attach(ex01)

anova <- aov(Peso ~ nome_trat, data = ex01)
summary(mod)

shapiro.test(mod$residuals)

bartlett.test(mod$residuals ~ nome_trat)

hist(Peso)

library(agricolae)

?agricolae
anova(mod)

HSD.test(anova, as.factor("nome_trat"), console = TRUE)
