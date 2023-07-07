# Reverse B cell Sankey
Same as other Sankeys, but with only the HMRs that are present in B cells


```bash

```

## Initialize the important ones


```bash
# Set reference directories for HMRs
FILTREF_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/
HMR_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/

# Set output and working directory
OUT_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/Accumulation_enrichedClustersHuh/
WRK_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/Accumulation_enrichedClustersHuh/working_dir/
mkdir -p ${WRK_DIR}

# Set variable to reference different cell type specific HMRs
H1_HMRs=${FILTREF_DIR}H1ESC.minsize50.filtforrefseqTSSexons.txt
H1_CL=${HMR_DIR}H1ESC_internalClusters_individualHMRs_hpl.txt
H1_UN=${HMR_DIR}H1ESC_unclustered_hpl.txt

HS_HMRs=${FILTREF_DIR}HSC.minsize50.filtforrefseqTSSexons.txt
HS_CL=${HMR_DIR}HSC_internalClusters_individualHMRs_hpl.txt
HS_UN=${HMR_DIR}HSC_unclustered_hpl.txt

M_HMRs=${FILTREF_DIR}Macrophage.minsize50.filtforrefseqTSSexons.txt
M_CL=${HMR_DIR}Macrophage_internalClusters_individualHMRs_hpl.txt
M_UN=${HMR_DIR}Macrophage_unclustered_hpl.txt

B_HMRs=${FILTREF_DIR}Bcell.minsize50.filtforrefseqTSSexons.txt
B_CL=${HMR_DIR}Bcell_internalClusters_individualHMRs_hpl.txt
B_UN=${HMR_DIR}Bcell_unclustered_hpl.txt
B_SH=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_all_shared.txt
B_CS=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_all_cellspecific.txt

echo "Variables loaded."
```

    Variables loaded.


## Cackalashuns

### B cell clustered and unclustered flows


```bash
OUT_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/sankey/sankey_reverse/intersect_files/
mkdir -p ${OUT_DIR} 

# 34070 Bcell.minsize50.filtforrefseqTSSexons.txt
# B cell clustered = 5974
echo "### B cell clustered"
echo -e "B cell clustered HMRs from HSPC clustered"
echo -e "HSPC clustered --> Bcell clustered"
bedtools intersect -u -a ${B_CL} -b ${HS_CL} > ${OUT_DIR}HSCL_to_BCL.txt
HSCL_to_BCL=${OUT_DIR}HSCL_to_BCL.txt
wc -l ${HSCL_to_BCL} | awk '{print $1}' -
echo -e "\n"

echo -e "B cell clustered HMRs from HSPC unclustered"
echo -e "HSPC unclustered --> Bcell clustered"
bedtools intersect -u -a ${B_CL} -b ${HS_UN} > ${OUT_DIR}HSUN_to_BCL.txt
HSUN_to_BCL=${OUT_DIR}HSUN_to_BCL.txt
wc -l ${HSUN_to_BCL} | awk '{print $1}' -
echo -e "\n"

echo -e "B cell clustered shared, but not with HSPC"
echo -e "Bcell shared -/-HSPC --> Bcell clustered"
bedtools intersect -u -a ${B_CL} -b ${B_SH} | bedtools intersect -v -a - -b ${HS_HMRs} > ${OUT_DIR}BCL_shared_notHSPC.txt
BCL_shared=${OUT_DIR}BCL_shared_notHSPC.txt
wc -l ${BCL_shared} | awk '{print $1}' -
echo -e "\n"

echo -e "B cell clustered cell specific"
echo -e "Cellspecific --> Bcell clustered"
bedtools intersect -u -a ${B_CL} -b ${B_CS} > ${OUT_DIR}BCL_cs.txt 
BCL_CS=${OUT_DIR}BCL_cs.txt 
wc -l ${BCL_CS} | awk '{print $1}' -




echo -e "\n\n\n\n"
echo "### B cell unclustered"
echo -e "B cell unclustered HMRs from HSPC clustered"
echo -e "HSPC clustered --> Bcell unclustered"
bedtools intersect -u -a ${B_UN} -b ${HS_CL} > ${OUT_DIR}HSCL_to_BUN.txt
HSCL_to_BUN=${OUT_DIR}HSCL_to_BUN.txt
wc -l ${HSCL_to_BUN} | awk '{print $1}' -
echo -e "\n"

echo -e "B cell unclustered HMRs from HSPC unclustered"
echo -e "HSPC unclustered --> Bcell unclustered"
bedtools intersect -u -a ${B_UN} -b ${HS_UN} > ${OUT_DIR}HSUN_to_BUN.txt
HSUN_to_BUN=${OUT_DIR}HSUN_to_BUN.txt
wc -l ${HSUN_to_BUN} | awk '{print $1}' -
echo -e "\n"

echo -e "B cell unclustered shared, but not with HSPC"
echo -e "Shared -/-HSPC --> Bcell clustered"
bedtools intersect -u -a ${B_UN} -b ${B_SH} | bedtools intersect -v -a - -b ${HS_HMRs} > ${OUT_DIR}BUN_shared_notHSPC.txt
BUN_shared=${OUT_DIR}BUN_shared_notHSPC.txt
wc -l ${BUN_shared} | awk '{print $1}' -
echo -e "\n"

echo -e "B cell unclustered cell specific"
echo -e "Cellspecific --> Bcell clustered"
bedtools intersect -u -a ${B_UN} -b ${B_CS} > ${OUT_DIR}BUN_cs.txt 
BUN_CS=${OUT_DIR}BUN_cs.txt 
wc -l ${BUN_CS} | awk '{print $1}' -
echo -e "\n"


```

    ### B cell clustered
    B cell clustered HMRs from HSPC clustered
    HSPC clustered --> Bcell clustered
    2932
    
    
    B cell clustered HMRs from HSPC unclustered
    HSPC unclustered --> Bcell clustered
    359
    
    
    B cell clustered shared, but not with HSPC
    Bcell shared -/-HSPC --> Bcell clustered
    456
    
    
    B cell clustered cell specific
    Cellspecific --> Bcell clustered
    2218
    
    
    
    
    
    ### B cell unclustered
    B cell unclustered HMRs from HSPC clustered
    HSPC clustered --> Bcell unclustered
    663
    
    
    B cell unclustered HMRs from HSPC unclustered
    HSPC unclustered --> Bcell unclustered
    10847
    
    
    B cell unclustered shared, but not with HSPC
    Shared -/-HSPC --> Bcell clustered
    792
    
    
    B cell unclustered cell specific
    Cellspecific --> Bcell clustered
    6463
    
    


### B cell ---> HPSC flows


```bash
echo "### HSPC clustered from B cell"

# Create file
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${HSCL_to_BCL} > ${OUT_DIR}tmp.hscl_bcl.3col.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${HSCL_to_BUN} > ${OUT_DIR}tmp.hscl_bun.3col.txt

cat ${OUT_DIR}tmp.hscl_bcl.3col.txt ${OUT_DIR}tmp.hscl_bun.3col.txt | bedtools sort -i - > ${OUT_DIR}HSCL_to_Bcell.txt
HSCL_to_B=${OUT_DIR}HSCL_to_Bcell.txt




echo -e "[HSPC clustered HMRs from B cell] from H1ESC clustered"
echo -e "H1ESC clustered --> [HSPC clustered --> B cell]"
bedtools intersect -u -a ${H1_CL} -b ${HSCL_to_B} > ${OUT_DIR}H1CL_to_HSCL_to_Bcell.txt
H1CL_to_HSCL_to_Bcell=${OUT_DIR}H1CL_to_HSCL_to_Bcell.txt
wc -l ${H1CL_to_HSCL_to_Bcell} | awk '{print $1}' -
echo -e "\n"

echo -e "[HSPC clustered HMRs from B cell] from H1ESC unclustered"
echo -e "H1ESC unclustered --> [HSPC clustered --> B cell]"
bedtools intersect -u -a ${H1_UN} -b ${HSCL_to_B} > ${OUT_DIR}H1UN_to_HSCL_to_Bcell.txt
H1UN_to_HSCL_to_Bcell=${OUT_DIR}H1UN_to_HSCL_to_Bcell.txt
wc -l ${H1UN_to_HSCL_to_Bcell} | awk '{print $1}' -
echo -e "\n"





echo -e "\n\n"
echo "### HSPC unclustered"

# Create file
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${HSUN_to_BCL} > ${OUT_DIR}tmp.hsun_bcl.3col.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${HSUN_to_BUN} > ${OUT_DIR}tmp.hsun_bun.3col.txt

cat ${OUT_DIR}tmp.hsun_bcl.3col.txt ${OUT_DIR}tmp.hsun_bun.3col.txt | bedtools sort -i - > ${OUT_DIR}HSUN_to_Bcell.txt
HSUN_to_B=${OUT_DIR}HSUN_to_Bcell.txt
# Remove evidence
rm ${OUT_DIR}tmp*txt


echo -e "[HSPC unclustered HMRs from B cell] from H1ESC clustered"
echo -e "H1ESC clustered --> [HSPC unclustered --> B cell]"
bedtools intersect -u -a ${H1_CL} -b ${HSUN_to_B} > ${OUT_DIR}H1CL_to_HSUN_to_Bcell.txt
H1CL_to_HSUN_to_Bcell=${OUT_DIR}H1CL_to_HSUN_to_Bcell.txt
wc -l ${H1CL_to_HSUN_to_Bcell} | awk '{print $1}' -
echo -e "\n"

echo -e "[HSPC unclustered HMRs from B cell] from H1ESC unclustered"
echo -e "H1ESC unclustered --> [HSPC unclustered --> B cell]"
bedtools intersect -u -a ${H1_UN} -b ${HSUN_to_B} > ${OUT_DIR}H1UN_to_HSUN_to_Bcell.txt
H1UN_to_HSUN_to_Bcell=${OUT_DIR}H1UN_to_HSUN_to_Bcell.txt
wc -l ${H1UN_to_HSUN_to_Bcell} | awk '{print $1}' -
echo -e "\n"




```

    ### HSPC clustered from B cell
    [HSPC clustered HMRs from B cell] from H1ESC clustered
    H1ESC clustered --> [HSPC clustered --> B cell]
    489
    
    
    [HSPC clustered HMRs from B cell] from H1ESC unclustered
    H1ESC unclustered --> [HSPC clustered --> B cell]
    444
    
    
    
    
    
    ### HSPC unclustered
    [HSPC unclustered HMRs from B cell] from H1ESC clustered
    H1ESC clustered --> [HSPC unclustered --> B cell]
    139
    
    
    [HSPC unclustered HMRs from B cell] from H1ESC unclustered
    H1ESC unclustered --> [HSPC unclustered --> B cell]
    4127
    
    


## R

### Libraries


```bash
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


```


```bash

```


```bash

```


```bash

```


```bash

```


```bash

```


```bash

```
