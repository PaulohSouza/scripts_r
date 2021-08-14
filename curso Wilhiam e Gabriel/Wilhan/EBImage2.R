library(EBImage)
########

img <- readImage(file.choose())

display(img, method = "raster")

ExB <- img[,,3]/(img)
iv <- 1 - img[,,3]
display(iv)
