

#Filtragem
subset(dados, cultivares == "BRASMAX Desafop " || cultivares == "NS 7007")

#aggregate
names(dados)
aggregate(VARIAV ~ TRAT, data = DIC, FUN = min)

# BoxPlot
boxplot(VARIAV ~TRAT, data = DIC, las = 2, xlab= "", cex.axis = 0.6)


# Modelo de anova
mod <- aov(DIC$VARIAV ~ DIC$TRAT, dados = DIC)

# Validar a Normalidade dos residual

residual()

#Regras TESTE DE MEDIAS

# <= 6 Medias
# TUKEY 15 % CV
# SNK 20 a 25 CV
# LSD 25% CV

# SCOTT-KNOTT > 6 medias

# Utilizando o EXPDES
library(ExpDes)
args(crd) # exibe a função para o DIC

function (VARIAV, resp, quali = TRUE, mcomp = "tukey", nl = FALSE, 
          hvar = "bartlett", sigT = 0.05, sigF = 0.05)

dados1 <- DIC

str(dados1)

dados1$TRAT <- factor(dados1$TRAT)
dados1$Bloco <- factor(dados
                       
# Fatorial

# Ler os dados

# Transforma em fator

dados2$cultivares <- factor(dados2$cultivares)
dados2$pos <- factor(dados2$pos)
dados2$bloco <- factor(dados2$bloco)

str(dados2)
#box plot fatorial

boxplot(prod ~cultivares:pos, data = dados2,
        las = 2,cex.axis = 0.5, xlab = "", xol = adjustcolor("green")

#Anova fatorial
mod2<- aov(Prdo ~bloco + cultivares * pos, data = dados2)
anova()

#normalidade
res2 <- residuals(mod2)

shapiro.test(Res2)

#homogeneidade de varianciancias
# Neste caso precisa combinar

comb <- dados2$cultivares:dados2$pos
batlett.test(res2 ~ comb)

?aggregate


