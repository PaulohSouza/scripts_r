library(ggplot2)

# Por cores
ggplot(data= mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) + #poderia ser size ai invés de color
  xlab("Variavel X")+
  ylab("Variavel Y")


# Formato das figurasggplotb(data= mpg) +
ggplot(data= mpg) +
geom_point(mapping = aes(x = displ, y = hwy, shape = class)) + #poderia ser size ai invés de color
  xlab("Variavel X")+
  ylab("Variavel Y")

#Facetas
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_wrap(~class, nrow =2)
