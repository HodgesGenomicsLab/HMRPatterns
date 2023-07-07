# Question: Are accumulated HMRs preferentially established in clusters? 


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

echo "Variables loaded."
```

    Variables loaded.


## H1 ESC Counts


```R
# count for clustered
cat ${H1_CL} | wc -l > ${WRK_DIR}H1_clust_count.txt

# count for unclustered
cat ${H1_UN} | wc -l > ${WRK_DIR}H1_unclust_count.txt

head ${WRK_DIR}H1_*clust_count.txt
```

    ==> /data/hodges_lab/Tim/finalAnalyses_HMRs/Accumulation_enrichedClustersHuh/working_dir/H1_clust_count.txt <==
    1684
    
    ==> /data/hodges_lab/Tim/finalAnalyses_HMRs/Accumulation_enrichedClustersHuh/working_dir/H1_unclust_count.txt <==
    11605


This becomes the comparative ratio. 

1,684 clustered vs. 11,605 unclustered

# HSPC (not from H1 ESC dataset) counts


```R
bedtools intersect -v -a ${HS_CL} -b ${H1_HMRs} | wc -l 
```

    6316



```R
bedtools intersect -v -a ${HS_UN} -b ${H1_HMRs} | wc -l 
```

    17499



```R

```

# Macrophage (not in H1 or HSPC datasets) counts


```R
bedtools intersect -v -a ${M_CL} -b ${HS_HMRs} | wc -l 
```

    3982



```R
bedtools intersect -v -a ${M_UN} -b ${HS_HMRs} | wc -l 
```

    6379



```R

```

# R 


```R
library(tidyverse)

df <- data.frame(
    Celltype = c("H1 ESC", "H1 ESC", "HSPC", "HSPC", "Macrophage", "Macrophage", "Bcell'"),
    HMRGroup = c(rep(c("Clustered","Unclustered"), 3)),
    Amount = c(1684, 11605, 6316, 17499, 3982, 6379)
)

# df$Celltype <- factor(df$Celltype, levels=c("Macrophage", "HSPC", "H1 ESC"))

df
```


<table>
<thead><tr><th scope=col>Celltype</th><th scope=col>HMRGroup</th><th scope=col>Amount</th></tr></thead>
<tbody>
	<tr><td>H1 ESC     </td><td>Clustered  </td><td> 1684      </td></tr>
	<tr><td>H1 ESC     </td><td>Unclustered</td><td>11605      </td></tr>
	<tr><td>HSPC       </td><td>Clustered  </td><td> 6316      </td></tr>
	<tr><td>HSPC       </td><td>Unclustered</td><td>17499      </td></tr>
	<tr><td>Macrophage </td><td>Clustered  </td><td> 3982      </td></tr>
	<tr><td>Macrophage </td><td>Unclustered</td><td> 6379      </td></tr>
</tbody>
</table>




```R
library(ggplot2)

p <- df %>% ggplot(aes(x=Celltype, y=Amount)) +
    geom_bar(aes(fill=HMRGroup), stat="identity", position="fill") +
    theme_minimal()

p
```


![png](output_15_0.png)



```R
ggsave("/data/hodges_lab/Tim/finalAnalyses_HMRs/Accumulation_enrichedClustersHuh/working_dir/clust_unclust_hplineage.png", p)
```

    Saving 6.67 x 6.67 in image



```R
ggsave("/data/hodges_lab/Tim/finalAnalyses_HMRs/Accumulation_enrichedClustersHuh/working_dir/clust_unclust_hplineage.pdf", p)
```

    Saving 6.67 x 6.67 in image



```R
# Convert to proportions

df_prop <- df %>% 
    group_by(Celltype) %>%
    mutate(Prop = Amount / sum(Amount))

df_prop

```


<table>
<thead><tr><th scope=col>Celltype</th><th scope=col>HMRGroup</th><th scope=col>Amount</th><th scope=col>Prop</th></tr></thead>
<tbody>
	<tr><td>H1 ESC     </td><td>Clustered  </td><td> 1684      </td><td>0.1267213  </td></tr>
	<tr><td>H1 ESC     </td><td>Unclustered</td><td>11605      </td><td>0.8732787  </td></tr>
	<tr><td>HSPC       </td><td>Clustered  </td><td> 6316      </td><td>0.2652110  </td></tr>
	<tr><td>HSPC       </td><td>Unclustered</td><td>17499      </td><td>0.7347890  </td></tr>
	<tr><td>Macrophage </td><td>Clustered  </td><td> 3982      </td><td>0.3843258  </td></tr>
	<tr><td>Macrophage </td><td>Unclustered</td><td> 6379      </td><td>0.6156742  </td></tr>
</tbody>
</table>



# Check some stats! 


```R
# HSPC vs H1 ESC
binom.test(6316, (6316+17499), 0.1267213)


# Macrophage vs H1 ESC
binom.test(3982, (3982+6379), 0.1267213)
```


    
    	Exact binomial test
    
    data:  6316 and (6316 + 17499)
    number of successes = 6316, number of trials = 23815, p-value < 2.2e-16
    alternative hypothesis: true probability of success is not equal to 0.1267213
    95 percent confidence interval:
     0.2596123 0.2708670
    sample estimates:
    probability of success 
                  0.265211 




    
    	Exact binomial test
    
    data:  3982 and (3982 + 6379)
    number of successes = 3982, number of trials = 10361, p-value < 2.2e-16
    alternative hypothesis: true probability of success is not equal to 0.1267213
    95 percent confidence interval:
     0.3749448 0.3937719
    sample estimates:
    probability of success 
                 0.3843258 




```R
# Macrophage vs. HSPC
binom.test(3982, (3982+6379), 0.2652110)

```


    
    	Exact binomial test
    
    data:  3982 and (3982 + 6379)
    number of successes = 3982, number of trials = 10361, p-value < 2.2e-16
    alternative hypothesis: true probability of success is not equal to 0.265211
    95 percent confidence interval:
     0.3749448 0.3937719
    sample estimates:
    probability of success 
                 0.3843258 




```R

```


```R

```


```R

```


```R
?ggplot
```

## Try with a chisquared


```R
df_h1_hspc <- matrix(c(1684, 6316, 11605, 17499))
df_h1_hspc
chisq.test(df_h1_hspc)
```


<table>
<tbody>
	<tr><td> 1684</td></tr>
	<tr><td> 6316</td></tr>
	<tr><td>11605</td></tr>
	<tr><td>17499</td></tr>
</tbody>
</table>




    
    	Chi-squared test for given probabilities
    
    data:  df_h1_hspc
    X-squared = 15033, df = 3, p-value < 2.2e-16




```R
df_h1_m <- matrix(c(1684, 3982, 11605, 6379))
df_h1_m
chisq.test(df_h1_m)
```


<table>
<tbody>
	<tr><td> 1684</td></tr>
	<tr><td> 3982</td></tr>
	<tr><td>11605</td></tr>
	<tr><td> 6379</td></tr>
</tbody>
</table>




    
    	Chi-squared test for given probabilities
    
    data:  df_h1_m
    X-squared = 9172, df = 3, p-value < 2.2e-16




```R
chisq.test(table(df$Celltype, df$Amount))
```

    Warning message in chisq.test(table(df$Celltype, df$Amount)):
    “Chi-squared approximation may be incorrect”


    
    	Pearson's Chi-squared test
    
    data:  table(df$Celltype, df$Amount)
    X-squared = 12, df = 10, p-value = 0.2851




```R
table(df$Celltype, df$Amount)
```


                
                 1684 3982 6316 6379 11605 17499
      H1 ESC        1    0    0    0     1     0
      HSPC          0    0    1    0     0     1
      Macrophage    0    1    0    1     0     0

