```R

```

# Files


```R
HMR_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/
WORKING_DIR=/data/hodges_lab/Tim/paper_submission/data/cluster_lengths/
cd ${WORKING_DIR}

CL_FILE_DIR=/data/hodges_lab/Tim/paper_submission/data/cluster_lengths/input_files/
mkdir -p ${CL_FILE_DIR}

# Files
mv ${HMR_DIR}*_internalClusters_BED.txt ${CL_FILE_DIR}

```


```R
cd ${CL_FILE_DIR}
ls
```

    Adrenal_internalClusters_BED.txt  fSpinal_internalClusters_BED.txt
    Bcell_internalClusters_BED.txt	  H1ESC_internalClusters_BED.txt
    fHeart_internalClusters_BED.txt   Liver_internalClusters_BED.txt


## Clean files and add Length/ID column


```R
head Adrenal_internalClusters_BED.txt
```

    chr1	564500	570301
    chr1	839737	856914
    chr1	993521	1005100
    chr1	1072225	1077128
    chr1	1092587	1106080
    chr1	1172539	1176674
    chr1	1825860	1831061
    chr1	2053317	2055828
    chr1	2162085	2172003
    chr1	2241779	2247030



```R
cd ${CL_FILE_DIR}

for FILE in *BED.txt
do
    FILENAME="${FILE%%_internalClusters_BED.txt}"
    awk -v ID=$FILENAME 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,($3-$2),ID}' ${FILE} > ${FILENAME}.ID.txt
done
```


```R
# Combine
```


```R
COMB_DIR=/data/hodges_lab/Tim/paper_submission/data/cluster_lengths/combined/
mkdir -p $COMB_DIR
```


```R
cd ${CL_FILE_DIR}
cat *.ID.txt > ${COMB_DIR}cluster_lengths_combined.txt
```


```R
cd ${COMB_DIR}
head *.txt
```

    chr1	564500	570301	5801	Adrenal
    chr1	839737	856914	17177	Adrenal
    chr1	993521	1005100	11579	Adrenal
    chr1	1072225	1077128	4903	Adrenal
    chr1	1092587	1106080	13493	Adrenal
    chr1	1172539	1176674	4135	Adrenal
    chr1	1825860	1831061	5201	Adrenal
    chr1	2053317	2055828	2511	Adrenal
    chr1	2162085	2172003	9918	Adrenal
    chr1	2241779	2247030	5251	Adrenal



```R

```

# R


```R
library(ggplot2)
library(tidyverse)
library(data.table)

setwd("/data/hodges_lab/Tim/paper_submission/data/cluster_lengths/combined/")
```

    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.1 ──
    
    [32m✔[39m [34mtibble [39m 3.1.7     [32m✔[39m [34mdplyr  [39m 1.0.9
    [32m✔[39m [34mtidyr  [39m 1.2.0     [32m✔[39m [34mstringr[39m 1.4.0
    [32m✔[39m [34mreadr  [39m 2.1.2     [32m✔[39m [34mforcats[39m 0.5.1
    [32m✔[39m [34mpurrr  [39m 0.3.4     
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    
    
    Attaching package: ‘data.table’
    
    
    The following objects are masked from ‘package:dplyr’:
    
        between, first, last
    
    
    The following object is masked from ‘package:purrr’:
    
        transpose
    
    



```R
cll <- read_tsv("cluster_lengths_combined.txt", col_names = F)
```

    [1mRows: [22m[34m9343[39m [1mColumns: [22m[34m5[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (2): X1, X5
    [32mdbl[39m (3): X2, X3, X4
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



```R
colnames(cll) <- c("chr","start","end","length","celltype")
```


```R
p_cll <- cll %>%
    ggplot(aes(x=celltype, y = length)) +
        geom_violin() +
        geom_boxplot() +
        theme_minimal() +
        geom_hline(yintercept = 10500, linetype='dashed', size = 1, color = 'red')
p_cll
```


![png](output_16_0.png)



```R
cll %>%
    ggplot(aes(x=celltype, y = length)) +
        geom_boxplot() +
        theme_minimal() +
        geom_hline(yintercept = 10500)
```


```R
getwd()
```


'/gpfs52/data/hodges_lab/Tim/paper_submission/data/cluster_lengths/combined'



```R
ggsave("/data/hodges_lab/Tim/paper_submission/data/cluster_lengths/s2_cluster_lengths.pdf", p_cll)
```

    Saving 6.67 x 6.67 in image
    



```R

```


```R

```


```R

```


```R

```


```R

```


```R

```
