meus.dados <- data.frame(
  posicao = c("direita", "direita", "esquerda", "esquerda"),
  YY = c("2012", "2012", "2012", "2012"),
  MM = rep("05", 4),
  DD = c("22", "22", "24", "25"),
  especie = c("cf", "cf", "dn", "cf")
)

names(meus.dados)[2:4] <- c("ano", "mes", "dia")

meus.dados
