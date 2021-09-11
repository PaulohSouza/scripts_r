library(ggpubr)
library(tidyverse)

dados <- ToothGrowth
dados_VC <-filter(dados, dados$supp == "VC")
dados_VC
teste <- dados %>% filter(supp == "VC")

ggqqplot(dados_VC$len, main = "Normalidade")

