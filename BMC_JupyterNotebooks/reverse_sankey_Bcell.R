library(networkD3)
library(ggplot2)
library(htmlwidgets)
library(shiny)


##### Sankey Dataframe Preparation
links_rv <- data.frame(
  source = c(
    rep("H1_Clustered", 2),
    rep("H1_Unclustered", 2),
    rep("HS_Clustered", 2),
    rep("HS_Unclustered", 2),
    rep("Shared_beyondHS", 2),
    rep("CellSpecific", 2)
  ),
  target = c(
    rep(c("HS_Clustered","HS_Unclustered"), 2),
    rep(c("B_Clustered", "B_Unclustered"), 4)
  ),
  value = c(
    489, 139, 
    444, 4127,
    2932, 663,
    359, 10847,
    456, 792,
    2218, 6463
  )
)

# From these flows we need to create a node data frame: it lists every entities involved in the flow
nodes_rv <- data.frame(
  name=c(as.character(links_rv$source), 
         as.character(links_rv$target)) %>% unique()
)

# With networkD3, connection must be provided using id, not using real name like in the links dataframe.. So we need to reformat it.
links_rv$IDsource <- match(links_rv$source, nodes_rv$name)-1 
links_rv$IDtarget <- match(links_rv$target, nodes_rv$name)-1

# Make the Network
p <- sankeyNetwork(Links = links_rv, Nodes = nodes_rv,
                   Source = "IDsource", Target = "IDtarget",
                   Value = "value", NodeID = "name", 
                   sinksRight=T,
                   iterations = 0,
                   nodeWidth = 45, nodePadding = 120)

p

