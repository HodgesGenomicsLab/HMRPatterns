# Initialize directories and files


```R
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

B_CL=${HMR_DIR}Bcell_internalClusters_individualHMRs_hpl.txt
B_UN=${HMR_DIR}Bcell_unclustered_hpl.txt

echo "Variables loaded."
```

    Variables loaded.



```R
# H1
echo "H1 ESC - Clustered"
wc -l $H1_CL | awk '{print $1}'

echo "H1 ESC - Unclustered"
wc -l $H1_UN | awk '{print $1}'
```

    H1 ESC - Clustered
    1684
    H1 ESC - Unclustered
    11605



```R
# H1
echo "HSPC - Clustered"
wc -l $HS_CL | awk '{print $1}'

echo "HSPC - Unclustered"
wc -l $HS_UN | awk '{print $1}'
```

    HSPC - Clustered
    8280
    HSPC - Unclustered
    23406



```R
# Macrophage
echo "Macrophage - Clustered"
wc -l $M_CL | awk '{print $1}'

echo "Macrophage - Unclustered"
wc -l $M_UN | awk '{print $1}'
```

    Macrophage - Clustered
    12696
    Macrophage - Unclustered
    23833



```R
# Bcell
echo "Bcell - Clustered"
wc -l $B_CL | awk '{print $1}'

echo "Bcell - Unclustered"
wc -l $B_UN | awk '{print $1}'
```

    Bcell - Clustered
    5974
    Bcell - Unclustered
    17185


# R plot


```R
library(ggplot2)
library(tidyverse)
```

    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.1 ──
    
    [32m✔[39m [34mtibble [39m 3.1.7     [32m✔[39m [34mdplyr  [39m 1.0.9
    [32m✔[39m [34mtidyr  [39m 1.2.0     [32m✔[39m [34mstringr[39m 1.4.0
    [32m✔[39m [34mreadr  [39m 2.1.2     [32m✔[39m [34mforcats[39m 0.5.1
    [32m✔[39m [34mpurrr  [39m 0.3.4     
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    



```R
#Make a data table
df <- data.frame(
    Celltype = c("H1 ESC", "H1 ESC", "HSPC", "HSPC", "Macrophage", "Macrophage", "Bcell", "Bcell"),
    HMRGroup = c(rep(c("Clustered","Unclustered"), 4)),
    Amount = c(1684, 11605, 6316, 17499, 12696, 23833, 5974, 17185)
)

# Order for plotting
df$Celltype <- factor(df$Celltype, levels=c("H1 ESC","HSPC","Bcell","Macrophage"))

df
```


<table class="dataframe">
<caption>A data.frame: 8 × 3</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>HMRGroup</th><th scope=col>Amount</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>H1 ESC    </td><td>Clustered  </td><td> 1684</td></tr>
	<tr><td>H1 ESC    </td><td>Unclustered</td><td>11605</td></tr>
	<tr><td>HSPC      </td><td>Clustered  </td><td> 6316</td></tr>
	<tr><td>HSPC      </td><td>Unclustered</td><td>17499</td></tr>
	<tr><td>Macrophage</td><td>Clustered  </td><td>12696</td></tr>
	<tr><td>Macrophage</td><td>Unclustered</td><td>23833</td></tr>
	<tr><td>Bcell     </td><td>Clustered  </td><td> 5974</td></tr>
	<tr><td>Bcell     </td><td>Unclustered</td><td>17185</td></tr>
</tbody>
</table>




```R
# ggplot
p <- df %>% ggplot(aes(x=Celltype, y=Amount)) +
    geom_bar(aes(fill=HMRGroup), stat="identity", position="fill") +
    theme_minimal() +
    theme(aspect.ratio = 1)

p
```


![png](output_9_0.png)



```R

```


```R
getwd()
```


'/gpfs52/data/hodges_lab/Tim/finalAnalyses_HMRs'



```R
ggsave("/gpfs52/data/hodges_lab/Tim/paper_submission/figs/raws/clustUnclustProportion_barGraph.pdf", p)
```

    Saving 6.67 x 6.67 in image
    



```R

```


```R

```
