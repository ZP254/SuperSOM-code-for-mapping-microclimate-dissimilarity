# SuperSOM code for mapping microclimate dissimilarity at courtyard scale

This is templated tutorial. All **[here]** link will be renewed after the publication of the article.

The files incorporate the Super (Self-)Organising Map (SuperSOM) algorithms to measure the dissimilarity of urban microclimate (see attached paper [here] pending Elsevier publication).

**The model is based on _RStudio 2022.02.3_ for MacOS.**

Further references regarding the urban thermal diversity, UTCI maps and study area can be found **[here]**. The research project was presented at ISUF (International Seminar on Urban Form) conference in Glasgow, UK in 2021.

The data on microclimatic dynamics and built forms between different courtyards was obtained using parametric techniques. The GH codes for built form and UTCI maps can be found **[here]**. To obtain UTCI maps, ENVI-met modelling or static approaches, such as Ladybug and Honeybee, are required. The GH codes to streamline and visualise the ENVI-met outputs can be found **[here]**.

## Spatial UTCI metrics

1. M(UTCI), the spatial mean of UTCI across a surface dataset. This metric indicates the thermal-tempering potential
3. d(UTCI), the spatial deviation of UTCI across a surface dataset. This metric indicates the thermal-enriching potential

## Morphometrics

1. CA (courtyard area)
2. VAR (vertical area ratio)
3. SI (shape index)
4. HAR (horizontal aspect ratio)
5. LAT (long axial tilt)
6. Vc_c_2d (2d vegetation coverage within the courtyard, e.g., grassland)
7. Vc_c_3d (3d vegetation coverage within the courtyard, e.g., trees)

Using 2 UTCI metrics as training input vectors, we demonstrate the unsupervised learning of courtyard microclimatic dissimilarity. Consequently, the below instructions only lead to topological SOM maps based on UTCI and not morphometrics. Note that the 7 morphometrics can also be explored if these vectors are replaced for the training inputs.

# Softwares
The data model is built on and requires

1. Rhino and Grasshopper (https://www.rhino3d.com/)
3. Dragonfly (https://github.com/ladybug-tools/dragonfly-legacy)
4. ENVI-met (https://www.envi-met.com/)

The SuperSOM model is built on and requires

1. RStudio 2022.02.3 (https://www.rstudio.com/products/rstudio/download/#download)
2. All packages specified at the beginning of the code files
   `library(kohonen)`
   `library(ggplot2)`
   `library(dummies)`

The hybrid K-means and HAC SuperSOM codes were redeveloped upon the code published by Love Börjeson in RPub repository (https://api.rpubs.com/loveb/t_sne)

# User guide

Instructions

1. Download four CSV files to execute SuperSOM function in R.
3. Replace the file paths before executing the SuperSOM function in the 'Import SuperSOM.R' file
4. Visualise the UTCI maps in the 'UTCI_Map.R' file
5. Visualise the morphometrics maps in the 'Morphometrics_map.R' file. 

# Code references
1. **[here]**
2. **[here]**


Links

1. https://github.com/ladybug-tools/dragonfly-legacy
2. https://api.rpubs.com/loveb/t_sne
