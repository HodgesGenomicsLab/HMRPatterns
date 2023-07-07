library(ggplot2)
library(tidyverse)
library(readr)
library(data.table)
library(org.Hs.eg.db)
library(RColorBrewer)
library(RecordLinkage)
library(purrr)
library(reshape2)
library(plyr)
library(scales)

setwd("/Users/scottt7/Desktop/SE_tripleVenn")

syn_al <- read_tsv("Syn_All.txt", col_names=c("chr","start","end","region")) 
syn_cl <- read_tsv("Syn_Cl.txt", col_names=c("chr","start","end","region")) 
syn_se <- read_tsv("Syn_SEs.txt", col_names=c("chr","start","end","region")) 


syn_l <- list(
  SEs = syn_se$region,
  Clustered = syn_cl$region,
  All = syn_al$region
)



library(eulerr)
plot(euler(syn_l, shape = "ellipse"), 
     quantities = TRUE,
     #edges = list(col = "white", lex = 2),
     lty = 3)

plot(euler(syn_l, shape = "ellipse"), 
     quantities = TRUE,
     edges = list(col = "white", lex = 2),
     lty = 1)


plot(euler(syn_l), 
     quantities = TRUE,
     edges = list(col = "white", lex = 2),
     lty = 1)

plot(euler(syn_l, shape = "ellipse"))


install.packages("venneuler")
library(venneuler)
plot(venneuler(syn_l))






library(ggvenn)
ggvenn(
  syn_l, 
  fill_color = c("#0073C2FF", "#53e6b5", "#dee3e1"),
  stroke_size = 0.5, set_name_size = 4
)


library(UpSetR)
upset(fromList(syn_l), order.by = "freq")
