# Load in libraries
library("ggplot2")
library("tidyverse")
library(ggrepel)
library(RColorBrewer)
library(reshape2)
library(magrittr)
library(pheatmap)
library(wesanderson)
library(ggsci)
library(ggpubr)
library(gridExtra)
library(cowplot)

# Set working directory 
setwd("/Users/scottt7/Desktop/hp_lineage/TrackingSummaries")

# Load in summary tables 
all_df <- read_tsv("ALL_SUMMARY.txt", col_names = F) %>%
  separate(col = X2, into = c("CELLTYPE", "TYPE"), sep = " ") %>%
  set_colnames(c("NumberHMRs","CELLTYPE","TYPE")) 

cl_df <- read_tsv("CL_SUMMARY_090121.txt", col_names = F) %>%
  separate(col = X2, into = c("CELLTYPE", "TYPE"), sep = " ") %>%
  set_colnames(c("NumberHMRs","CELLTYPE","TYPE"))

un_df <- read_tsv("UN_SUMMARY_072321.txt", col_names = F) %>%
  separate(col = X2, into = c("CELLTYPE", "TYPE"), sep = " ") %>%
  set_colnames(c("NumberHMRs","CELLTYPE","TYPE"))







# Generate a graph for ACCUMULATION
all_df_accum <- all_df %>% 
  filter(CELLTYPE %in% c("H1ESC","HSC","Macrophage","Bcell"))

all_df_accum$CELLTYPE=factor(all_df_accum$CELLTYPE, levels = rev(c("H1ESC","HSC","Macrophage","Bcell")))
all_df_accum$TYPE=factor(all_df_accum$TYPE, levels = c("CellSpecific","Bcell-Shared","Macrophage-Shared", "MN-Shared","BT-Shared", "HSC-Derived","H1ESC-Derived"))


all_df_accum %>%
  ggplot(aes(x=CELLTYPE, y=NumberHMRs, fill=CELLTYPE)) +
  geom_bar(position="stack", stat="identity") +
  theme_minimal() +
  ggtitle("All - Accumulation Subset") +
  xlab(NULL) + ylab(NULL) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position="left",
        legend.text=element_text(size=6),
        plot.title=element_text(hjust = 0))


########### Accumulation
### With Bcell and Macrophage next to each other
# 

all_df_accum_sum <- all_df_accum %>% aggregate(. ~ CELLTYPE, ., sum)
all_df_accum_sum$CELLTYPE <- factor(all_df_accum_sum$CELLTYPE,
                                    levels=c("H1ESC","HSC","Macrophage","Bcell"))
all_df_accum_sum <- all_df_accum_sum %>%
  mutate(LVL=c("3","3","2","1"))

all_df_accum_sum %>%
  ggplot(aes(x=LVL, y=NumberHMRs, fill=CELLTYPE)) +
  geom_bar(position=position_dodge(width=.65), stat="identity",
           width = .5) +
  geom_text(aes(label=NumberHMRs), position=position_dodge(width=0.9), vjust=-0.25) +
  theme_classic() +
  ggtitle("All - Accumulation Subset") +
  xlab(NULL) + ylab(NULL) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position="left",
        legend.text=element_text(size=6),
        plot.title=element_text(hjust = 0)) +
  theme(
    plot.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  )

#### Generate a datatable
# Sums are extracted from .minsize50.filtforrefseq.txt files 
tot_hmr <- data.frame(
  celltypes = c("H1ESC","HSC","Macrophage","Bcell"),
  numhmr = c(18235, 46056, 54331, 34070)
)

tot_hmr$celltypes %<>% factor(., levels = c("H1ESC","HSC","Macrophage","Bcell") )

# Plot
ggplot(tot_hmr, aes(x=celltypes, y=numhmr, fill=celltypes)) +
  geom_bar(position=position_dodge(width=.65), stat="identity",
           width = .5) +
  geom_text(aes(label=numhmr), position=position_dodge(width=0.9), vjust=-0.25) +
  theme_classic() +
  ggtitle("All - Accumulation Subset") +
  xlab(NULL) + ylab(NULL) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position="left",
        legend.text=element_text(size=6),
        plot.title=element_text(hjust = 0)) +
  theme(
    plot.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  )





####################### PERSISTENCE


######## PERSISTENCE - H1ESC

##### H1-derived 
all_df_pers <- all_df %>% 
  filter(TYPE=="H1ESC-Derived") %>%
  filter(CELLTYPE %in% c("H1ESC","HSC","Macrophage","Bcell"))

all_df_pers$CELLTYPE=factor(all_df_pers$CELLTYPE, levels = rev(c("H1ESC","HSC","Bcell","Macrophage")))

all_df_pers_devOrder <- all_df_pers %>%
  mutate(LVL=c("1","2","3","3"))

p_h1 <- all_df_pers_devOrder %>% 
  ggplot(aes(x=LVL, y=NumberHMRs, fill=factor(CELLTYPE))) +
  geom_bar(position=position_dodge(width=.65), stat="identity", width = 0.5) +
  geom_text(aes(label=NumberHMRs), position=position_dodge(width=0.9), vjust=-0.25) +
  theme_classic() +
  ggtitle("H1ESC - Persistence") +
  xlab(NULL) + ylab(NULL) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position="left",
        legend.text=element_text(size=6),
        plot.title=element_text(hjust = 0)) +
  theme(
    plot.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  )
p_h1
  # +
  # coord_flip() + 
  # scale_x_discrete(position = "top") +
  # scale_y_reverse()



######## PERSISTENCE - HSC 

##### HSC-derived 
all_df_pers_hsc <- all_df %>% 
  filter(TYPE=="HSC-Derived") %>%
  filter(CELLTYPE %in% c("H1ESC","HSC","Macrophage","Bcell"))

all_df_pers_hsc_H1add <- all_df_pers_hsc %>%
  rbind(., data.frame(NumberHMRs = 0,
                      CELLTYPE = "H1ESC",
                      TYPE = "HSC-Derived"))

all_df_pers_hsc_H1add$CELLTYPE=factor(all_df_pers_hsc_H1add$CELLTYPE, levels = rev(c("H1ESC","HSC","Bcell","Macrophage")))
all_df_pers_hsc_H1add$TYPE=factor(all_df_pers_hsc_H1add$TYPE, levels = c("HSC-Derived"))

all_df_pers_hsc_H1add_devOrder <- all_df_pers_hsc_H1add %>%
  mutate(LVL=c("2","3","3","1"))

p_hspc <- all_df_pers_hsc_H1add_devOrder %>%
  ggplot(aes(x=LVL, y=NumberHMRs, fill=factor(CELLTYPE))) +
  geom_bar(position=position_dodge(width=.65), stat="identity", width = 0.5) +
  geom_text(aes(label=NumberHMRs), position=position_dodge(width=0.9), vjust=1) +
  theme_classic() +
  xlab(NULL) + ylab(NULL) +
  theme(plot.title = element_text(NULL)) +
  theme(legend.position="left",
        legend.text=element_text(size=6),
        plot.title=element_text(hjust = 0)) +
  scale_y_reverse() + scale_x_discrete(position = 'top') +
  theme(
    plot.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  )
p_hspc

####### COMBINE
####### H1ESC and HPSC-derived PERSISTENCE Graphs
ggpubr::ggarrange(p_h1, p_hspc, nrow=2,
                  common.legend = T)

















#######################################################
#######################################################
# Want to look at persistence and accumulation, delineated by clustering behavior


##################### DOTPLOTSSSSSSSSSS

########### PERSISTENCE - H1ESC


##### H1-derived ----- clustered
cl_df_pers <- cl_df %>% 
  filter(TYPE=="H1ESC-Derived") %>%
  filter(CELLTYPE %in% c("H1ESC","HSC","Macrophage","Bcell"))

cl_df_pers$CELLTYPE=factor(cl_df_pers$CELLTYPE, levels = rev(c("H1ESC","HSC","Macrophage","Bcell")))
cl_df_pers$TYPE=factor(cl_df_pers$TYPE, levels = c("H1ESC-Derived"))
cl_df_pers_devOrder <- cl_df_pers %>%
  mutate(LVL=c("1","2","3","3"))


##### H1-derived ----- unclustered
un_df_pers <- un_df %>% 
  filter( TYPE=="H1ESC-Derived") %>%
  filter(CELLTYPE %in% c("H1ESC","HSC","Macrophage","Bcell"))

un_df_pers$CELLTYPE=factor(un_df_pers$CELLTYPE, levels = rev(c("H1ESC","HSC","Macrophage","Bcell")))
un_df_pers$TYPE=factor(un_df_pers$TYPE, levels = c("H1ESC-Derived"))
un_df_pers_devOrder <- un_df_pers %>%
  mutate(LVL=c("1","2","3","3"))

# Combine All/Clust/Unclust - H1-dervied
all_cl_un_df_pers <- rbind((all_df_pers_devOrder %>% mutate(HMRGRP = "AllHMRs")),
      (cl_df_pers_devOrder %>% mutate(HMRGRP = "Clustered")),
      (un_df_pers_devOrder %>% mutate(HMRGRP = "Unclustered")))
all_cl_un_df_pers$CELLTYPE=factor(all_cl_un_df_pers$CELLTYPE, levels = rev(c("H1ESC","HSC","Macrophage","Bcell")))
all_cl_un_df_pers$HMRGRP=factor(all_cl_un_df_pers$HMRGRP, levels = rev(c("AllHMRs","Clustered","Unclustered")))


##################
##################
# Plot - Persist_H1ESCderived_1
all_cl_un_df_pers %>%
  select(NumberHMRs, CELLTYPE, HMRGRP) %>%
  mutate(CELLTYPE_NUM = c(rep(c(1,2,3,3),3))) %>%
  ggplot(aes(x=CELLTYPE_NUM, y=NumberHMRs, color=HMRGRP)) + 
  geom_point(size=4) +
  geom_line() +
  theme_classic() +
  ggtitle("Persistence - HSPC dervied HMRs") +
  geom_text(aes(label=NumberHMRs), position=position_dodge(width=0.9), vjust=-0.25) +
  xlab(NULL) + ylab(NULL) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position="left",
        legend.text=element_text(size=6),
        plot.title=element_text(hjust = 0))





# all_cl_un_df_pers %>%
#   ggplot(aes(x=CELLTYPE, y=NumberHMRs, color=factor(CELLTYPE))) + 
#   geom_point(aes(shape = HMRGRP)) +
#   geom_line(aes(color=factor(HMRGRP)))
# 
# all_cl_un_df_pers %>%
#   ggplot(aes(x=CELLTYPE, y=NumberHMRs, color=factor(CELLTYPE))) + 
#   geom_point(aes(shape = HMRGRP), position=position_dodge(width=0.5)) +
#   geom_line(aes(x=CELLTYPE, y=NumberHMRs, color=factor(CELLTYPE)))
# 
# all_cl_un_df_pers %>%
#   select(NumberHMRs, CELLTYPE, HMRGRP) %>%
#   mutate(CELLTYPE_NUM = c(rep(c(1,2,3,4),3))) %>%
#   ggplot(aes(x=CELLTYPE_NUM, y=NumberHMRs, color=HMRGRP)) + 
#   geom_point() +
#   geom_line() +
#   theme_minimal()



#   
#   geom_bar(position=position_dodge(width=.65), stat="identity", width = 0.5) +
#   geom_text(aes(label=NumberHMRs), position=position_dodge(width=0.9), vjust=1) +
#   theme_minimal() +
#   xlab(NULL) + ylab(NULL) +
#   theme(plot.title = element_text(NULL)) +
#   theme(legend.position="left",
#         legend.text=element_text(size=6),
#         plot.title=element_text(hjust = 0)) +
#   scale_y_reverse() + scale_x_discrete(position = 'top')
# p_hspc
# 


########### PERSISTENCE - HSPC

##### HSC-derived ----- clustered
cl_df_pers_hsc <- cl_df %>% 
  filter(TYPE=="HSC-Derived") %>%
  filter(CELLTYPE %in% c("H1ESC","HSC","Macrophage","Bcell"))

cl_df_pers_hsc$CELLTYPE=factor(cl_df_pers_hsc$CELLTYPE, levels = rev(c("H1ESC","HSC","Macrophage","Bcell")))
cl_df_pers_hsc$TYPE=factor(cl_df_pers_hsc$TYPE, levels = c("CellSpecific","HSC-Derived"))
cl_df_pers_hsc_devOrder <- cl_df_pers_hsc %>%
  mutate(LVL=c(2,3,3)) 
cl_df_pers_hsc_devOrder <- cl_df_pers_hsc_devOrder %>%
  rbind(., data.frame(NumberHMRs = 0,
                      CELLTYPE = "H1ESC",
                      TYPE = "HSC-Derived",
                      LVL = 1))


##### HSC-derived ----- unclustered
un_df_pers_hsc <- un_df %>% 
  filter( TYPE=="HSC-Derived") %>%
  filter(CELLTYPE %in% c("H1ESC","HSC","Macrophage","Bcell"))

un_df_pers_hsc$CELLTYPE=factor(un_df_pers_hsc$CELLTYPE, levels = rev(c("HSC","Macrophage","Bcell")))
un_df_pers_hsc$TYPE=factor(un_df_pers_hsc$TYPE, levels = c("CellSpecific","HSC-Derived"))
un_df_pers_hsc_devOrder <- un_df_pers_hsc %>%
  mutate(LVL=c(2,3,3)) 
un_df_pers_hsc_devOrder_H1add <- un_df_pers_hsc_devOrder %>%
  rbind(., data.frame(NumberHMRs = 0,
                      CELLTYPE = "H1ESC",
                      TYPE = "HSC-Derived",
                      LVL = 1))


# Combine All/Clust/Unclust - HSPC-dervied
all_df_pers_hsc_H1add_devOrder_LVLdbl <- all_df_pers_hsc_H1add_devOrder %>%
  select(NumberHMRs, CELLTYPE, TYPE) %>% mutate(LVL = c(2,3,3,1))


all_cl_un_df_pers_hspc <- rbind((all_df_pers_hsc_H1add_devOrder_LVLdbl %>% mutate(HMRGRP = "AllHMRs")),
                           (cl_df_pers_hsc_devOrder %>% mutate(HMRGRP = "Clustered")),
                           (un_df_pers_hsc_devOrder %>% mutate(HMRGRP = "Unclustered")))
all_cl_un_df_pers_hspc$CELLTYPE=factor(all_cl_un_df_pers_hspc$CELLTYPE, levels = rev(c("H1ESC","HSC","Macrophage","Bcell")))
all_cl_un_df_pers_hspc$HMRGRP=factor(all_cl_un_df_pers_hspc$HMRGRP, levels = rev(c("AllHMRs","Clustered","Unclustered")))


####################
####################
# Plot - Persist_HSPCderived_1 
# HSPC_derived - all/clusterd/unclustered
all_cl_un_df_pers_hspc %>%
  select(NumberHMRs, CELLTYPE, HMRGRP, LVL) %>%
  ggplot(aes(x=LVL, y=NumberHMRs, color=HMRGRP)) + 
  geom_point(size=4) +
  geom_line() +
  theme_classic() +
  ggtitle("Persistence - HSPC dervied HMRs") +
  geom_text(aes(label=NumberHMRs), position=position_dodge(width=0.9), vjust=-0.25) +
  xlab(NULL) + ylab(NULL) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.position="left",
        legend.text=element_text(size=6),
        plot.title=element_text(hjust = 0))



##################
################# STATS
################
# Z-score test of proportions

##### H1ESC-derived

# Macrophage 
# All vs. Unclust
prop.test(x = c(11036, 5344),
          n = c(15619, 5982))

# All vs. Clust
prop.test(x = c(11036, 3150),
          n = c(15619, 3530))

# Clust vs. Unclust
prop.test(x = c(5344, 3150),
          n = c(5982, 3530))

# Bcell 
# All vs. Unclust
prop.test(x = c(10393, 4842),
          n = c(15619, 5982))

# All vs. Clust
prop.test(x = c(11036, 3058),
          n = c(15619, 3530))

# Clust vs. Unclust
prop.test(x = c(4842, 3058),
          n = c(5982, 3530))



# HSPC retention proportion
# All vs. Unclust 
prop.test(x = c(11451, 5463),
          n = c(15619, 5982))

# All vs. Clust
prop.test(x = c(11451, 2973),
          n = c(15619, 3530))

t# Clust vs. Unclust
prop.test(x = c(5463, 2973),
          n = c(5982, 3530))
















##### H1SPC-derived

# Macrophage 
# All vs. Unclust
prop.test(x = c(27307, 13402),
          n = c(31746, 14522))

# All vs. Clust
prop.test(x = c(27307, 7486),
          n = c(31746, 7903))

# Clust vs. Unclust
prop.test(x = c(13402, 7486),
          n = c(14522, 7903))

# Bcell 
# All vs. Unclust
prop.test(x = c(27307, 7487),
          n = c(31746, 14522))

# All vs. Clust
prop.test(x = c(27307, 4787),
          n = c(31746, 7903))

# Clust vs. Unclust
prop.test(x = c(7487, 4787),
          n = c(14522, 7903))























