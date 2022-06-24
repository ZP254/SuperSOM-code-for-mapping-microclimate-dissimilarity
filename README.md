# SuperSOM code for mapping microclimate dissimilarity at courtyard scale

(This is templated tutorial. All [here] link will be renewed after the publication of the article)

The files incorporate the Super (Self-)Organising Map (SuperSOM) algorithms to measure the dissimilarity of urban microclimate (see attached paper [here] pending Elsevier publication).

The model is based on RStudio 2022.02.3 for MacOS.

Further references regarding the urban thermal diversity, UTCI maps and study area can be found [here]. The research project was presented at ISUF (International Seminar on Urban Form) conference in Glasgow, UK in 2021.

The data on microclimatic dynamics and built forms between different courtyards was obtained using parametric techniques. The GH codes for built form and UTCI maps can be found [here]. To obtain UTCI maps, ENVI-met modelling or static approaches, such as Ladybug and Honeybee, are required. The GH codes to streamline and visualise the ENVI-met outputs can be found [here].

Two UTCI-based spatial-thermal metrics were defined:

     (1) M(UTCI), the spatial mean of UTCI across a surface dataset. The metric indicate the thermal-tempering potential
     (2) d(UTCI), the spatial deviation of UTCI across a surface dataset. The metric indicate the thermal-enriching potential

Seven courtyard morphometrics were defined:

     (1) CA (courtyard area)
     (2) VAR (vertical area ratio)
     (3) SI (shape index)
     (4) HAR (horizontal aspect ratio)
     (5) LAT (long axial tilt)
     (6) Vc_c_2d (2d vegetation coverage within the courtyard, e.g., grassland)
     (7) Vc_c_3d (3d vegetation coverage within the courtyard, e.g., trees)

Using 2 UTCI metrics as training input vectors, we demonstrate the unsupervised learning of courtyard microclimatic dissimilarity. Consequently, the below instructions only lead to topological SOM maps based on UTCI and not morphometrics. Note that the 7 morphometrics can also be explored if these vectors are replaced for the training inputs.

# Software
The data model is built on and requires
     (1) Rhino and Grasshopper
     (2) Dragonfly
     (3) ENVI-met

The SuperSOM model is built on and requires
     (1) RStudio
     (2) All packages specified at the beginning of the codes

# User guide

1, download all files, including four CSV files required to execute SuperSOM.
2, click into the 'Import SuperSOM.R' file. Replace the file paths before executing the SuperSOM function.
3, explore the UTCI maps in the 'UTCI_Map.R' file after SuperSOM completes iterations.
4, explore the morphometrics maps in the 'Morphometrics_map.R' file. Note that Morphometrics are not included in SuperSOM's input vectors.

# Code references

