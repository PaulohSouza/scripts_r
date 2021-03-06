#-----------------------------------------------------------------------------
# p�gina de desenvolvimento do pacote
# http://www.bioconductor.org/packages/devel/bioc/html/EBImage.html

# instala��o no linux, no terminal do linux, fazer
# sudo apt-get install libmagickcore-dev libmagickwand-dev

# instalando do bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version='devel')

BiocManager::install("EBImage")
biocLite("EBImage") # pacote EBImage, permite determinar �rea foliar

# instalando do tar.gz, pegar o link da p�gina e rodar no terminal
# R CMD INSTALL EBImage_xxxxx.tar.gz # xxx representa a vers�o

#-----------------------------------------------------------------------------
# carrega o pacote

require(EBImage)

#-----------------------------------------------------------------------------
# lendo o arquivo

# l� imagem com folhas digitalizadas
fol <- readImage("http://www.leg.ufpr.br/~walmes/ridiculas/folhas.jpg")
str(fol)

display(fol) # v� a imagem
hist(fol)    # histograma dos componentes verde, vermelho e azul
# picos de azul est�o mais afastados, separam melhor

#-----------------------------------------------------------------------------
# tratamento

fol2 <- imageData(channel(fol, mode="blue")) # seleciona um canal
fol2 <- 1-fol2                               # inverte as tonalidades
hist(fol2)                                   # histigrama dos tons de cinza

display(fol2) # escala cinza com claro sendo a folha

#-----------------------------------------------------------------------------
# dicotomiza para branco e preto

fol2[fol2<0.5] <- 0
fol2[fol2>=0.5] <- 1

display(fol2)

#-----------------------------------------------------------------------------
# calcula atributos de cada regi�o

fol3 <- bwlabel(fol2)     # coloca os r�tulos nas regi�es disjuntas
kern <- makeBrush(3, shape="disc", step=FALSE)
fol3 <- erode(fol3, kern) # remove alguns ru�dos

display(fol3)

forma <- computeFeatures.shape(fol3)
area <- forma[, "s.area"]
area

# �reas foliares
areacm <- 25*area/min(area) # quadrado de �rea conhecida 25 cm�

#-----------------------------------------------------------------------------
# prepara para exporta��o

fol4 <- paintObjects(fol3, fol, opac=c(NA, 0.45), col=c(NA, "blue"))
display(fol4)

xy <- computeFeatures.moment(fol3, fol)[, c("m.cx", "m.cy")] # centr�ides
font <- drawfont(weight=600, size=15)
fol5 <- drawText(fol4, xy=xy, labels=paste(format(areacm, digits=4), "cm�"),
                 font=font, col="white")
display(fol5)

writeImage(fol5, "f038.jpg")
library(draw)
