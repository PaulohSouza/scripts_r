library(easyanova)

Dic <- read.table("C:R/Dados.txt",  head = TRUE)
analise <- ea1(Dic, design=1, plot= 3)
analise
analise$`Analise de Variancia`
analise$Means$tukey

DIC$TRAT <- factor(DIC$TRAT) 
  str(DIC)

ea1(DIC$VARIAV, design = 2, alpha = 0.05, list = FALSE, p.adjust = 1, 
          plot = 2) 
