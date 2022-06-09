#Average 96-hour data into 8 day/night time frames

dat.AVG.JAN$day <- rowMeans(dat.AVG.JAN[ , c(18:25)], na.rm=TRUE)
dat.AVG.JAN$night <- rowMeans(dat.AVG.JAN[ , c(26:41)], na.rm=TRUE)
dat.SD.JAN$day <- rowMeans(dat.SD.JAN[ , c(18:25)], na.rm=TRUE)
dat.SD.JAN$night <- rowMeans(dat.SD.JAN[ , c(26:41)], na.rm=TRUE)

dat.AVG.JULY$day <- rowMeans(dat.AVG.JULY[ , c(18:33)], na.rm=TRUE)
dat.AVG.JULY$night <- rowMeans(dat.AVG.JULY[ , c(34:41)], na.rm=TRUE)
dat.SD.JULY$day <- rowMeans(dat.SD.JULY[ , c(18:33)], na.rm=TRUE)
dat.SD.JULY$night <- rowMeans(dat.SD.JULY[ , c(34:41)], na.rm=TRUE)


#UTCI-mean summer day
var <- 42 #define AVG_HS_D
var_unscaled <- aggregate(as.numeric(dat.AVG.JULY[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat.AVG.JULY)[var], shape = "straight", 
     palette.name = hscolors,zlim = c(29,35))

#UTCI-mean summer night
var <- 43 #define AVG_HS_N
var_unscaled <- aggregate(as.numeric(dat.AVG.JULY[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat.AVG.JULY)[var], shape = "straight", 
     palette.name = hscolors,zlim = c(17,20))

#UTCI-mean winter day
var <- 42 #define AVG_CS_D
var_unscaled <- aggregate(as.numeric(dat.AVG.JAN[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat.AVG.JAN)[var], shape = "straight", 
     palette.name = cscolors,zlim = c(5,8))

#UTCI-mean winter night
var <- 43 #define AVG_CS_N
var_unscaled <- aggregate(as.numeric(dat.AVG.JAN[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat.AVG.JAN)[var], shape = "straight", 
     palette.name = cscolors,zlim = c(-2,1))



#UTCI-deviation summer day
var <- 42 #define SD_HS_D
var_unscaled <- aggregate(as.numeric(dat.SD.JULY[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat.SD.JULY)[var], shape = "straight", 
     palette.name = dcolors,zlim = c(0,3))

#UTCI-deviation summer night
var <- 43 #define SD_HS_N
var_unscaled <- aggregate(as.numeric(dat.SD.JULY[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat.SD.JULY)[var], shape = "straight", 
     palette.name = dcolors,zlim = c(0,3))

#UTCI-deviation winter day
var <- 42 #define SD_CS_D
var_unscaled <- aggregate(as.numeric(dat.SD.JAN[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat.SD.JAN)[var], shape = "straight", 
     palette.name = dcolors,zlim = c(0,3))

#UTCI-deviation winter night
var <- 43 #define SD_CS_N
var_unscaled <- aggregate(as.numeric(dat.SD.JAN[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat.SD.JAN)[var], shape = "straight", 
     palette.name = dcolors,zlim = c(0,3))

