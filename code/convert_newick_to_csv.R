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

df_nex <- df %>% 
  filter( . , grepl("nwk", filename ))


latest_newick <- 
  
rownames(df)[which.max(df$mtime)]

#[1] "/path/to/your/directory/Interested_file.xlsx"
