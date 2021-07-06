#DBC Balanceado com gráfico de Barras
#Paulo H N Souza
#Script - Analise geral
library(agricolae)
library(multcompView)
library(multcomp)
library(ggplot2)
library(ggthemes)
library(dplyr)

#Abrir o Arquivo - Encontre sua planilha de dados
abrir_arquivo <- file.choose()

#carrega Dados
base <- read.csv(abrir_arquivo, sep = ";", dec = ",")
Trat <- base[,1]
bloco <- base[,2]


#Informe aqui o nome dos dados - Altere

resposta <- base$VARIAV       #informe aqui o nome da variavel que queria analisar

#Definir Fatores e criando Data Frame

dados <- data.frame(resposta, Trat, bloco)
dados$Trat <- factor(dados$Trat)
dados$bloco <- factor(dados$bloco)

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
anova <-aov(dados$resposta ~ dados$Trat + dados$bloco, data = dados)
summary(anova)

#Printa boxplot
boxplot(dados$resposta ~ dados$Trat)

#Efetua teste de normalidade a partir dos residuos
residuo <- anova$residuals
shapiro.test(residuo)

#Teste de barlett
bartlett.test(residuo ~ Trat)

#Tesde te Levene
library(car)
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


# Tukey com gráfico de letras
attach(dados)
anova <- aov(resposta ~ Trat + bloco, data = dados)

tukey <- TukeyHSD(anova)

# compact letter display
cld <- multcompLetters4(anova, tukey)

# tabela com fatores e 3º quantil
dt <- group_by(dados, Trat) %>%
  summarise(w=mean(resposta), sd = sd(resposta)) %>%
  arrange(desc(w))

# extrair a exibição de letras compactas e adicionar à tabela Tk
cld <- as.data.frame.list(cld$Trat)
dt$cld <- cld$Letters

print(dt)

ggplot(dt, aes(Trat, w)) + 
  geom_bar(stat = "identity", aes(fill = w), show.legend = FALSE) +
  geom_errorbar(aes(ymin = w-sd, ymax=w+sd), width = 0.2) +
  labs(x = "Tratamentos", y = "Produtividade") +
  geom_text(aes(label = cld, y = w + sd), vjust = -0.5) +
  ylim(0,410) +
  theme_few()

# saving the final figure
ggsave("C:/R/barplot.png", width = 4.2, height = 3, dpi = 1000)

