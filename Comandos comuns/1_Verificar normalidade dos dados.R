library(pastecs)
library(ggpubr) #adicionando gráficos de densidade
#Verificação de Normaidade dos dados

#Verificação por descritividade

#Base de dados geral do R
dados <- ToothGrowth
dados
by(dados[, "len"], dados$supp, summary)
    # Medias e medianas devem estar proximas

by(dados[, "len"], dados$supp, stat.desc)
    #coeficiente de variação moderado

### Verificação por Histogramas ####

dados_OJ <- filter(dados, supp == "OJ")
dados_VC <- filter(dados, supp == "VC")

# Exibindo 2 gráficos

par(mfrow = c(1, 2))

hist(dados_OJ$len)
hist(dados_VC$len)

# Adicionando elemento ao gráfico
#text(x,y)
text(5,8, "Hist()", font=2)

### Verificação por gráfico de densidade

ggdensity(dados_OJ$len, xlab = "Comprimento", main = "Grupo OJ", fill = "lightgray")
# Gráfico de Densidade



