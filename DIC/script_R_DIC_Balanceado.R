#DIC - Balanceado
#Script - Analise geral
library(agricolae)
library(multcompView)
library(pyr)
library(ggplot2)

#Abrir o Arquivo - Encontre sua planilha de dados
abrir_arquivo <- file.choose()

#carrega Dados
base <- read.csv(abrir_arquivo, sep = ";", dec = ",")
Trat <- base[,1]
Rep <- base[,2]

#Informe aqui o nome dos dados - Altere

resposta <- base$VARIAV       #informe aqui o nome da variavel que queria analisar

#Definir Fatores e criando Data Frame

dados <- data.frame(resposta, Trat, Rep)
dados$Trat <- factor(dados$Trat)
Rep <- factor(dados$Rep)

#nomes eixos
xname = "Tratamentos"
yname = "Severidade"

#Estatisticas descritiva
# Por tratamento
médias = with(dados, tapply(resposta, Trat, mean))
variâncias = with(dados, tapply(resposta, Trat, var))
desvios = with(dados, tapply(resposta, Trat, sd))
cv = desvios / médias * 100

# Descritiva por tratamento
(tab.desc = rbind(Médias=médias, Variâncias=variâncias, Desvios=desvios, CV=cv))

# Analise de Variancia
anova <-aov(dados$resposta ~ dados$Trat, data = dados)
summary(anova)

#Printa boxplot
boxplot(dados$resposta ~ dados$Trat)

#Efetua teste de normalidade a partir dos residuos
residuo <- anova$residuals
shapiro.test(residuo)

#Teste de barlett
bartlett.test(residuo ~ Trat)

#Tesde te Levene
with(dados, leveneTest(anova$residuals ~ Trat, center=mean))


#criar_Grafico dos residuos
res = residuo
ajustados = fitted(anova)
plot(ajustados, res)
abline(h=0)


#Teste de médias - Tukey - utilizando pacote agricolae


TUKEY <- HSD.test(anova, "dados$Trat")

TUKEY

#Plotando Dados
ggplot(dados, aes(Trat, resposta)) +
  geom_boxplot(fill = "grey60", alpha = 0.8) +
  theme_bw(16)

#verificando outliers

ggplot(dados) +
  aes(x = "", y = resposta) +
  geom_boxplot(fill = "#0c4c8a") +
  theme_minimal()

library(outliers)
#Hipotese que tem outliers = p > 0,05 não rejeita hipotese de outlier
outlcima <- grubbs.test(dados$resposta)
outlbaixo <- outlcima <- grubbs.test(dados$resposta, opposite = TRUE) 
outlcima
outlbaixo

install.packages("multcompView", dep = TRUE)
require(multcomp)
require(multcompView)

#montando Grafico com barras de letras

multcompBoxplot(resposta ~ Trat, data = dados, sortFn = median, horizontal = TRUE, compFn = "TukeyHSD", decreasing = FALSE,
                plotList=list(
                  boxplot=list(fig=c(0,  1,  0,  1),  las=3,
                               cex.axis=1.3),                      
                  multcompLetters=list(
                    fig=c(0.85,  0.98,  0.10,  0.91), # (c(y bottom, y top,x L, x R))
                    type='Letters') ) )
     
#BoxPlot
require(car)

with(dados, Boxplot(resposta ~ Trat, las =1 , col='lightyellow', xlab = xname, ylab= yname))
points(médias, pch='+', cex=1.5, col='red')
