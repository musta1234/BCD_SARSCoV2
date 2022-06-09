# June 2022; 
# Convert Nextstrain newick/nexus files to 
# clear R's brain
rm( list = ls())

# load libraries
preq = c( "tidyverse", "ggplot2", "readxl", "readr", 
          "stats", "ade4", "ape", "adegenet" )
#for (y in preq) install.packages(y, dep = TRUE)
sapply(preq, library, character.only=T)
rm( list = ls())

inloc <- "./data/"
#import nexus and nwk files
df <- file.info(list.files(inloc, full.names = T))
df$filename <- row.names(df)
df_nwk <- df %>% 
  filter( . , grepl("nwk$", filename, perl = T )) %>% 
  filter(mtime == max(mtime)) %>% select(filename) %>% 
  unlist()
df_nex <- df %>% 
  filter( . , grepl("nexus$", filename, perl = T )) %>% 
  filter(mtime == max(mtime)) %>% select(filename) %>%
  unlist()

nex_tree <- read.nexus(df_nex)
nwk_tree <- read.tree(df_nwk)
#plot(nex_tree); #View(cophenetic(nwk_tree))

nwk_mat <-  cophenetic(nwk_tree)

nwk_list <- t(combn(colnames(nwk_mat), 2) )
        
nwk_df <- data.frame(nwk_list, dist=nwk_mat[nwk_list])

#xy <- t(combn(colnames(m), 2))
data.frame(xy, dist=m[xy])

View(nex_tree[1])
nex_tree <- ape::read.nexus(df_nex[[1]])

ape::read.nexus(filename)
