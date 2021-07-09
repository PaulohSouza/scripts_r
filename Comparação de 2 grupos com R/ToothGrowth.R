ToothGrowth
Dados <- ToothGrowth
View(Dados)

Dados$dose <- as.factor(Dados$dose)

names(Dados) <- c("comp", "metodo", "dose")

library(pastecs)

stat.desc(Dados$comp)
by(Dados[,1], Dados$metodo, stat.desc)

plot(comp ~ metodo, data = Dados)
