if (!require("pacman")) install.packages("pacman")
pacman::p_load(readr, dplyr, tibble, ggplot2, car, agricolae)

dados <- read_csv2(
  "https://github.com/italocegatta/italocegatta.github.io_source/raw/master/content/dados/base_progenie.csv"
)

dados

ggplot(dados, aes(progenie, volume)) +
  geom_boxplot(fill = "grey60", alpha = 0.8) +
  theme_bw(16)

#Anova
anova <-  aov(volume ~ progenie, data=dados)

#Shapiro and Wilk
shapiro.test(resid(anova))

tukey <- HSD.test(anova, "progenie")

tukey

#Gráfico de Barras com letras
tukey$groups %>%
  rownames_to_column(var = "trt") %>%
  #mutate(trt = reorder(trt, -volume, mean)) %>%
  ggplot(aes(trt, volume)) +
  geom_col(alpha = 0.7, color = "black") +
  geom_text(aes(label = groups), vjust = 1.6, size = 6, color = "white") +
  labs(x = "Progênies", y = "Médias") +
  theme_bw(16)
