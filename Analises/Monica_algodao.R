
dados <- PRODREG

plot(y = dados$MANCHA,
     x = dados$PRODT,
     main = 'Relação entre Severidade Mancha Alvo e Produtividade',
     ylab = 'Severidade (AACP Mancha Alvo)',
     xlab = 'Produtividade',
     pch = 16,
     col = 'black')

regressao <- lm(dados$MANCHA ~ dados$PRODT)
regressao

abline(a = -6.1150 , b= 0.2532)

library(ggplot2)
library(ggpubr)

ggplot(dados, aes(y=dados$PRODT, x = dados$MANCHA))+
    geom_point(size=2.5, pch=21, col='brown4', fill ='coral')+
    geom_smooth(formula ='y~x', method = 'lm', se=FALSE)+
    stat_regline_equation()+
    xlab("Severidade Mancha Alvo")+
    ylab('Produtividade da Soja')
