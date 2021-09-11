install.packages('survminer')
library(ggplot2)
library(survminer)
library(survival)
library('RcmdrPlugin.survival')
attach(dados)
attach(Dados_Lucia)
Sur <- Surv(time= Dia, event = Mortalidade)
class(Sur)

myfit <- survfit(Sur~Trat)
myfit <- survfit(Sur ~ Trat)
myfit

plot(myfit, col = c("blue", "orange", "black", "red", "gray", "green"))

Surv(Dia, Mortalidade)

plot(survfit(Surv(Dia, Mortalidade)~1),
     xlab = "Days",
     ylab = "Overall survival probability")

ggsurvplot(
  fit = survfit(Surv(Dia, Mortalidade) ~ 1, data = lung),
  xlab = "Days",
  ylab = "Overall survival probability")

hist(Peso_Pupas$Peso.Pupa.mg)
dados<- Peso_Pupas
attach(dados)
anova <- aov(Peso_Pupas$Peso.Pupa.mg ~ Peso_Pupas$Trat * Peso_Pupas$Instar)
ls(anova)
summary(aov)
library(ExpDes)
fat2.crd(Trat,Instar,Peso.Pupa.mg,quali=c(TRUE,TRUE),mcomp="tukey",fac.names=c("Tratamento","Instar"),sigT=0.05,sigF=0.05)
