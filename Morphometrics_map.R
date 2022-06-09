#Change the layout with row and column numbers
par(mfrow=c(1,1))

#Court area
var <- 11 #define CA
var_unscaled <- aggregate(as.numeric(dat_unique1[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat_unique1)[var], shape = "straight", 
     palette.name = fiveyellowcolors,zlim = c(0,10000))

#Vertical area ratio
var <- 12 #define VAR
var_unscaled <- aggregate(as.numeric(dat_unique1[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat_unique1)[var], shape = "straight", 
     palette.name = fouryellowcolors,zlim = c(0,14))

#Shape index
var <- 13 #define SI
var_unscaled <- aggregate(as.numeric(dat_unique1[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat_unique1)[var], shape = "straight", 
     palette.name = fouryellowcolors,zlim = c(1,2.1))

#Horizontal aspect ratio
var <- 14 #define HAR
var_unscaled <- aggregate(as.numeric(dat_unique1[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat_unique1)[var], shape = "straight", 
     palette.name = fouryellowcolors,zlim = c(0,10))

#Long axial tilt
var <- 15 #define LAT
var_unscaled <- aggregate(as.numeric(dat_unique1[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat_unique1)[var], shape = "straight", 
     palette.name = fiveorangecolors, zlim = c(0,180))

#Grassland coverage
var <- 16 #define VC_c_2d
var_unscaled <- aggregate(as.numeric(dat_unique1[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat_unique1)[var], shape = "straight", 
     palette.name = threeterraincolors, zlim = c(0,1))

#Trees coverage
var <- 17 #define VC_c_3d
var_unscaled <- aggregate(as.numeric(dat_unique1[,var]), 
                          by=list(dat.supersom$unit.classif), 
                          FUN=mean, simplify=TRUE)[,2]
plot(dat.supersom, type = "property", property=var_unscaled, 
     main=names(dat_unique1)[var], shape = "straight", 
     palette.name = threeterraincolors, zlim = c(0,1))

