# June 2022; 
# Convert Nextstrain newick/nexus files to 
# clear R's brain
rm( list = ls())

# load libraries
preq = c( "tidyverse", "ggplot2", "readxl", "readr", 
          "stats", "ade4", "ape", "adegenet", "gitcreds" )
#for (y in preq) install.packages(y, dep = TRUE)
sapply(preq, library, character.only=T)

inloc <- "./"