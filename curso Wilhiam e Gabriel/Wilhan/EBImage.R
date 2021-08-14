#############################

library(EBImage)

im <- readImage(file.choose())
display(im, method = "raster") #aparece a imagem
display(im[,,2])   #Pode dar zoom
hist(im)

par(mfrow = c(1,3))
plot(density(im[,,1]), col = "blue", type = "h")
plot(density(im[,,2]), col = "green", type = "h")
plot(density(im[,,3]), col = "red", type = "h")

iv <- 1 - im[,,1]
display(iv, method = "raster")

