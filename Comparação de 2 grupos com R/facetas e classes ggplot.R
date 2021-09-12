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
  facet_wrap(~class, ncol =2)

# Grid
#Facetas
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(. ~ class)
mpg


mpg

ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point(aes(color=class))+
  geom_smooth()

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(. ~ class)

ggplot(data = diamonds)+
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "dodge"
  )

seq(1,10)

library(tidyverse)

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 6)

filter(diamonds, carat > 3)
