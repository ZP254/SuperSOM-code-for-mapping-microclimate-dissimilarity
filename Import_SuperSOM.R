
#Loading all packages needed

library(kohonen) 
library(ggplot2)
library(ggpubr)
library(dplyr)
library(GGally)
library(RColorBrewer) 
library(factoextra)
library(NbClust)
library(parameters)
library(mclust)
library(see)
library(cluster)
library(reshape)




#Clean slate...:
rm(list = ls())

#Colour palette
terraincolors <- function(n, alpha = 1) {
  terrain.colors(n, alpha=alpha)[n:1]
}

heatcolors <- function(n, alpha = 1) {
  heat.colors(n, alpha=alpha)[n:1]
}

greycolors <- function(n, alpha = 1) {
  grey.colors(n, alpha=alpha)[n:1]
}

fouryellowcolors <- colorRampPalette(c("olivedrab1","yellow","orangered","red"), bias = 2)
fiveyellowcolors <- colorRampPalette(c("olivedrab1","yellow","orangered","red", "darkred"), bias = 3)
fiveorangecolors <- colorRampPalette(c("orangered","tan1","yellow","plum1","orangered"))
threeterraincolors <- colorRampPalette(c("lightgrey","yellow","green4"), bias = 5)




#remember to replace the file paths"/.../"before importing the datasets
#import UTCI mean - summer
dat.AVG.JULY <- read.csv("/Users/.../geometry_AVG_UTCI_JULY.csv")
dat.AVG.JULY  %>%  glimpse()

#import UTCI deviation - summer
dat.SD.JULY <- read.csv("/Users/.../geometry_SD_UTCI_JULY.csv")
dat.SD.JULY  %>%  glimpse()

#import UTCI mean - winter
dat.AVG.JAN <- read.csv("/Users/.../geometry_AVG_UTCI_JAN.csv")
dat.AVG.JAN  %>%  glimpse()

#import UTCI deviation - winter
dat.SD.JAN <- read.csv("/Users/.../geometry_SD_UTCI_JAN.csv")
dat.SD.JAN  %>%  glimpse()

# Remove duplicates
dat_unique1 <- unique(dat.AVG.JULY) 
dat_unique2 <- unique(dat.SD.JULY) 
dat_unique3 <- unique(dat.AVG.JAN) 
dat_unique4 <- unique(dat.SD.JAN) 

#scale data and produce two discrete day/night datasets
dat.sc.b = scale(dat_unique1[, 11:17])

dat.sc.avhs = scale(dat_unique1[, 18:41]) 
dat.sc.avhs.d = scale(dat_unique1[, 18:33]) 
dat.sc.avhs.n = scale(dat_unique1[, 34:41]) 

dat.sc.sdhs = scale(dat_unique2[, 18:41]) 
dat.sc.sdhs.d = scale(dat_unique2[, 18:33]) 
dat.sc.sdhs.n = scale(dat_unique2[, 34:41]) 

dat.sc.avcs = scale(dat_unique3[, 18:41]) 
dat.sc.avcs.d = scale(dat_unique3[, 18:25]) 
dat.sc.avcs.n = scale(dat_unique3[, 26:41]) 

dat.sc.sdcs = scale(dat_unique4[, 18:41]) 
dat.sc.sdcs.d = scale(dat_unique4[, 18:25]) 
dat.sc.sdcs.n = scale(dat_unique4[, 26:41]) 


#Define 8 layers for SuperSOM
mix.data <- c(list(dat.sc.b),
              
              list(dat.sc.avhs.d),list(dat.sc.avhs.n),
              list(dat.sc.sdhs.d),list(dat.sc.sdhs.n),
              list(dat.sc.avcs.d),list(dat.sc.avcs.n),
              list(dat.sc.sdcs.d),list(dat.sc.sdcs.n),
              
              list(as.factor(dat_unique1$C_clg)),
              list(as.factor(dat_unique1$C_c)))

names(mix.data) <- c('b',
                     
                     "avhsd","avhsn",
                     "sdhsd","sdhsn",
                     "avcsd","avcsn",
                     "sdcsd","sdcsn",
                     
                     "C_clg","C_c") 
str(mix.data)


#Run SuperSOM, takes 1 to 3 minutes depending on the CPU
set.seed(200)
dat.supersom <- supersom(mix.data, 
                         somgrid(xdim = 6, ydim= 9, 
                                 topo="hexagonal", toroidal = TRUE),
                         rlen=10000, alpha=c(0.05,0.01),
                         whatmap = 2:9,
                         maxNA.fraction = 0.5,
                         user.weights=c(0,
                                        
                                        12.5,12.5,
                                        12.5,12.5,
                                        12.5,12.5,
                                        12.5,12.5,
                                        
                                        0,
                                        0))




#Check training quality
#close to 0 = good quality
par(mfrow=c(1,1))
plot(dat.supersom, type="quality", 
     main = "Quality plot", shape = "straight",
     palette.name=grey.colors) 

#Check if convergence has been achieved
plot(dat.supersom,"changes",
     lwd = 0.2)

#Check how many samples each neuron has accomodated, in seeds
plot(dat.supersom, type="count", 
     main = "Counts plot", shape = "straight", 
     palette.name=greycolors) 

#Check how many samples each neuron has accomodated, in gradient shading
plot(dat.supersom, "mapping", pchs = 16, 
     col = "black", 
     main = "Counts plot", palette.name=grey.colors,
     border = "black", shape = "straight")

#Check neuron density
#the gradient colour shows the distances to neighbours.
plot(dat.supersom, type="dist.neighbours", 
     main = "Neighbour distance plot", 
     palette.name=grey.colors, shape = "straight") 

#Check the code plots which visualise the weights for all input vectors
par(mfrow=c(2,4))
plot(dat.supersom, type="codes", codeRendering = "stars", border = "grey", 
     main = c("AVG_HS_DAY","AVG_HS_NIGHT",
              "SD_HS_DAY","SD_HS_NIGHT",
              "AVG_CS_DAY","AVG_CS_NIGHT",
              "SD_CS_DAY","SD_CS_NIGHT"), shape = "straight") 




