# Copy over files to interHMRDistance directory


```R
cp /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/HSC.minsize50.filtforrefseqTSSexons.txt
/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/refSeqFilteredBEDs

cp /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/Macrophage.minsize50.filtforrefseqTSSexons.txt
/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/refSeqFilteredBEDs

cp /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/Tcell.minsize50.filtforrefseqTSSexons.txt
/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/refSeqFilteredBEDs
```

# Run shuffle - simulation - scripts


```R
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/runScripts

sbatch run_interHMRDists_HSPC.slrm
sbatch run_interHMRDists_Macrophage.slrm
sbatch run_interHMRDists_Tcell.slrm
```

## HSPC


```R
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=30:00:00
#SBATCH --mem=100G
#SBATCH --output=interHMR_nullRandom_HSPC.out

dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/

numIterations=10000
whiteList="ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt"
HMRDir="/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/refSeqFilteredBEDs/"

cd ${dir}

######## Code to shuffle and compare closest HMR-HMR distances. Row-by-row dists and avg for a shuffle are each saved in different files. 
# I want the individual average distances, too. I think it's important to keep. 
# HSPC
for i in $(seq 0 ${numIterations})
do
	# perform shuffle and record results
    # shuffle once
	bedtools shuffle -excl ${whiteList} -i ${HMRDir}HSC.minsize50.filtforrefseqTSSexons.txt -g ${dir}hg19.chromSizes.txt | awk 'BEGIN{FS=OFS="\t"}{print $1,$2,$3}' - | bedtools sort -i - > ${dir}temps/HSPC.shuffle_tmp1.txt
    # shuffle again
	bedtools shuffle -excl ${whiteList} -i ${HMRDir}HSC.minsize50.filtforrefseqTSSexons.txt -g ${dir}hg19.chromSizes.txt | awk 'BEGIN{FS=OFS="\t"}{print $1,$2,$3}' - | bedtools sort -i - > ${dir}temps/HSPC.shuffle_tmp2.txt
    # calculate distances
	bedtools closest -io -d -a ${dir}temps/HSPC.shuffle_tmp1.txt -b ${dir}temps/HSPC.shuffle_tmp2.txt | awk 'BEGIN{OFS=FS="\t"}{print $7}' > ${dir}tablesWithIndivDists/HSPC.shuffle.${i}.txt
	# calculate the average distance for this shuffle run and save
	awk 'BEGIN{OFS=FS="\t";i=0}{i=(i+$1)}END{print i,(i/NR)}' ${dir}tablesWithIndivDists/HSPC.shuffle.${i}.txt > ${dir}temps/HSPC.avgInterHMRDist.${i}.temp.txt
done
# summarize shuffle results and store as an output file
cat ${dir}temps/HSPC.avgInterHMRDist.*.temp.txt > ${dir}finalCounts/HSPC.avgInterHMRDist.all.txt

```

## Macrophage


```R
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=30:00:00
#SBATCH --mem=100G
#SBATCH --output=interHMR_nullRandom_Macrophage.out

dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/

numIterations=10000
whiteList="ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt"
HMRDir="/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/refSeqFilteredBEDs/"

cd ${dir}

######## Code to shuffle and compare closest HMR-HMR distances. Row-by-row dists and avg for a shuffle are each saved in different files. 
# I want the individual average distances, too. I think it's important to keep. 
# Macrophage
for i in $(seq 0 ${numIterations})
do
	# perform shuffle and record results
    # shuffle once
	bedtools shuffle -excl ${whiteList} -i ${HMRDir}Macrophage.minsize50.filtforrefseqTSSexons.txt -g ${dir}hg19.chromSizes.txt | awk 'BEGIN{FS=OFS="\t"}{print $1,$2,$3}' - | bedtools sort -i - > ${dir}temps/Macrophage.shuffle_tmp1.txt
    # shuffle again
	bedtools shuffle -excl ${whiteList} -i ${HMRDir}Macrophage.minsize50.filtforrefseqTSSexons.txt -g ${dir}hg19.chromSizes.txt | awk 'BEGIN{FS=OFS="\t"}{print $1,$2,$3}' - | bedtools sort -i - > ${dir}temps/Macrophage.shuffle_tmp2.txt
    # calculate distances
	bedtools closest -io -d -a ${dir}temps/Macrophage.shuffle_tmp1.txt -b ${dir}temps/Macrophage.shuffle_tmp2.txt | awk 'BEGIN{OFS=FS="\t"}{print $7}' > ${dir}tablesWithIndivDists/Macrophage.shuffle.${i}.txt
	# calculate the average distance for this shuffle run and save
	awk 'BEGIN{OFS=FS="\t";i=0}{i=(i+$1)}END{print i,(i/NR)}' ${dir}tablesWithIndivDists/Macrophage.shuffle.${i}.txt > ${dir}temps/Macrophage.avgInterHMRDist.${i}.temp.txt
done
# summarize shuffle results and store as an output file
cat ${dir}temps/Macrophage.avgInterHMRDist.*.temp.txt > ${dir}finalCounts/Macrophage.avgInterHMRDist.all.txt

```

## T cell 


```R
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=30:00:00
#SBATCH --mem=100G
#SBATCH --output=interHMR_nullRandom_Tcell.out

dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/

numIterations=10000
whiteList="ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt"
HMRDir="/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/refSeqFilteredBEDs/"

cd ${dir}

######## Code to shuffle and compare closest HMR-HMR distances. Row-by-row dists and avg for a shuffle are each saved in different files. 
# I want the individual average distances, too. I think it's important to keep. 
# Tcell
for i in $(seq 0 ${numIterations})
do
	# perform shuffle and record results
    # shuffle once
	bedtools shuffle -excl ${whiteList} -i ${HMRDir}Tcell.minsize50.filtforrefseqTSSexons.txt -g ${dir}hg19.chromSizes.txt | awk 'BEGIN{FS=OFS="\t"}{print $1,$2,$3}' - | bedtools sort -i - > ${dir}temps/Tcell.shuffle_tmp1.txt
    # shuffle again
	bedtools shuffle -excl ${whiteList} -i ${HMRDir}Tcell.minsize50.filtforrefseqTSSexons.txt -g ${dir}hg19.chromSizes.txt | awk 'BEGIN{FS=OFS="\t"}{print $1,$2,$3}' - | bedtools sort -i - > ${dir}temps/Tcell.shuffle_tmp2.txt
    # calculate distances
	bedtools closest -io -d -a ${dir}temps/Tcell.shuffle_tmp1.txt -b ${dir}temps/Tcell.shuffle_tmp2.txt | awk 'BEGIN{OFS=FS="\t"}{print $7}' > ${dir}tablesWithIndivDists/Tcell.shuffle.${i}.txt
	# calculate the average distance for this shuffle run and save
	awk 'BEGIN{OFS=FS="\t";i=0}{i=(i+$1)}END{print i,(i/NR)}' ${dir}tablesWithIndivDists/Tcell.shuffle.${i}.txt > ${dir}temps/Tcell.avgInterHMRDist.${i}.temp.txt
done
# summarize shuffle results and store as an output file
cat ${dir}temps/Tcell.avgInterHMRDist.*.temp.txt > ${dir}finalCounts/Tcell.avgInterHMRDist.all.txt

```

# Summarize the shuffle results


```R
countDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/finalCounts/
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/finalCounts/

cd $outDir
```


```R
# Iterate over celltypes
for celltype in HSPC Macrophage Tcell 
do
	awk -v ctype="${celltype}" 'BEGIN{OFS=FS="\t"}{print $2,ctype}' ${countDir}${celltype}.avgInterHMRDist.all.txt > ${outDir}${celltype}.expDistances.txt
done

rm ${outDir}AllCTs.expDistances.txt
cat ${outDir}*expDistances.txt > ${outDir}AllCTs.expDistances.txt

```


```R
ls -lhtr | tail
```

    -rw-r--r-- 1 scottt7 hodges_lab 155K Apr 19  2021 fSpinal.expDistances.txt
    -rw-r--r-- 1 scottt7 hodges_lab 135K Apr 19  2021 H1ESC.expDistances.txt
    -rw-r--r-- 1 scottt7 hodges_lab 135K Apr 19  2021 Liver.expDistances.txt
    -rw-r--r-- 1 scottt7 hodges_lab 184K Jun 23 23:10 Tcell.avgInterHMRDist.all.txt
    -rw-r--r-- 1 scottt7 hodges_lab 184K Jun 23 23:13 HSPC.avgInterHMRDist.all.txt
    -rw-r--r-- 1 scottt7 hodges_lab 184K Jun 24 01:00 Macrophage.avgInterHMRDist.all.txt
    -rw-r--r-- 1 scottt7 hodges_lab 126K Jun 25 13:53 HSPC.expDistances.txt
    -rw-r--r-- 1 scottt7 hodges_lab 184K Jun 25 13:53 Macrophage.expDistances.txt
    -rw-r--r-- 1 scottt7 hodges_lab 135K Jun 25 13:53 Tcell.expDistances.txt
    -rw-r--r-- 1 scottt7 hodges_lab 1.3M Jun 25 13:53 AllCTs.expDistances.txt



```R
head HSPC.expDistances.txt
head Macrophage.expDistances.txt
```

    34463.2	HSPC
    33972.6	HSPC
    34139.8	HSPC
    33724.7	HSPC
    33992.1	HSPC
    33772.5	HSPC
    33960.9	HSPC
    33696.8	HSPC
    33742.5	HSPC
    34090.4	HSPC
    29173.7	Macrophage
    28841.3	Macrophage
    28819.2	Macrophage
    28736.3	Macrophage
    28736	Macrophage
    28778.9	Macrophage
    28967.4	Macrophage
    28607.4	Macrophage
    28724.7	Macrophage
    28916.7	Macrophage


# Calculate and summarize the observed results


```R
HMR_Dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/refSeqFilteredBEDs/
outDir_original=/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/obsDistances/
OUT_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/obsDistances_reperformedJun252023/
mkdir -p $OUT_DIR

cd $HMR_Dir

for CELLTYPE in Adrenal Bcell fSpinal fHeart H1ESC Liver Macrophage Tcell 
do
bedtools closest -io -d -a ${CELLTYPE}.minsize50.filtforrefseqTSSexons.txt -b ${CELLTYPE}.minsize50.filtforrefseqTSSexons.txt | awk -v ctype="${CELLTYPE}" 'BEGIN{OFS=FS="\t"}{print $9,ctype}' > ${OUT_DIR}${CELLTYPE}.obsDistances.txt
done

for CELLTYPE in HSC
do
bedtools closest -io -d -a ${CELLTYPE}.minsize50.filtforrefseqTSSexons.txt -b ${CELLTYPE}.minsize50.filtforrefseqTSSexons.txt | awk -v ctype="HSPC" 'BEGIN{OFS=FS="\t"}{print $9,ctype}' > ${OUT_DIR}HSPC.obsDistances.txt
done

cat ${OUT_DIR}*.obsDistances.txt > ${OUT_DIR}AllCTs.obsDistances.txt
```

# Plot


```R
library("rstatix")
```

    
    Attaching package: ‘rstatix’
    
    
    The following object is masked from ‘package:stats’:
    
        filter
    
    



```R
library("ggplot2")
library("tidyverse")
library("broom")

# Set working directory 
setwd("/data/hodges_lab/Tim/finalAnalyses_HMRs/interHMRdistances/")
list.files()

```

    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.1 ──
    
    [32m✔[39m [34mtibble [39m 3.2.1     [32m✔[39m [34mdplyr  [39m 1.1.1
    [32m✔[39m [34mtidyr  [39m 1.3.0     [32m✔[39m [34mstringr[39m 1.5.0
    [32m✔[39m [34mreadr  [39m 2.1.2     [32m✔[39m [34mforcats[39m 0.5.1
    [32m✔[39m [34mpurrr  [39m 1.0.1     
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    



<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'Adrenal.minsize50.filtforrefseqTSSexons.txt'</li><li>'Bcell.minsize50.filtforrefseqTSSexons.txt'</li><li>'fHeart.minsize50.filtforrefseqTSSexons.txt'</li><li>'finalCounts'</li><li>'fSpinal.minsize50.filtforrefseqTSSexons.txt'</li><li>'graph_interHMRDists.R'</li><li>'H1ESC.minsize50.filtforrefseqTSSexons.txt'</li><li>'hg19.chromSizes.txt'</li><li>'interHMRDistances.9celltypes.June252023.AllDistUnder150000.pdf'</li><li>'interHMRDistances.9celltypes.June252023.AllDistUnder500000.pdf'</li><li>'Liver.minsize50.filtforrefseqTSSexons.txt'</li><li>'ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt'</li><li>'obsDistances'</li><li>'obsDistances_reperformedJun252023'</li><li>'refSeqFilteredBEDs'</li><li>'runScripts'</li><li>'startingBEDs'</li><li>'tablesWithIndivDists'</li><li>'temps'</li></ol>



## Load in data 


```R
# Load in table of "simulated" shuffled values
AllObsDist <- read_tsv("./obsDistances_reperformedJun252023/AllCTs.obsDistances.txt", col_names=c("Distance","Celltype")) %>%
  mutate(Group="Observed")
AllObsDistUnder150000 <- AllObsDist %>%
  dplyr::filter(Distance<150000)
AllObsDistUnder500000 <- AllObsDist %>%
  dplyr::filter(Distance<500000)
AllObsDistUnder1000000 <- AllObsDist %>%
  dplyr::filter(Distance<1000000)

```

    [1mRows: [22m[34m347677[39m [1mColumns: [22m[34m2[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): Celltype
    [32mdbl[39m (1): Distance
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



```R
# Load expected values table 
AllExpDist <- read_tsv("./finalCounts/AllCTs.expDistances.txt", col_names=c("Distance","Celltype")) %>%
  mutate(Group="Expected")

```

    [1mRows: [22m[34m90009[39m [1mColumns: [22m[34m2[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): Celltype
    [32mdbl[39m (1): Distance
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


## Try to factor for ordering


```R
# Combine and filter by length (length max affects the density resolution in plottinng)
AllDist <- rbind(AllObsDist,AllExpDist)
AllDistUnder150000 <- rbind(AllObsDistUnder150000,AllExpDist)
AllDistUnder500000 <- rbind(AllObsDistUnder500000,AllExpDist)
AllDistUnder1000000 <- rbind(AllObsDistUnder1000000,AllExpDist)

AllDist$Celltype <- factor(AllDist$Celltype, levels=c("H1ESC","fSpinal","fHeart","Adrenal","Liver","HSPC","Macrophage","Bcell","Tcell"))
AllDistUnder150000$Celltype <- factor(AllDistUnder150000$Celltype, levels=c("H1ESC","fSpinal","fHeart","Adrenal","Liver","HSPC","Macrophage","Bcell","Tcell"))
AllDistUnder500000$Celltype <- factor(AllDistUnder500000$Celltype, levels=c("H1ESC","fSpinal","fHeart","Adrenal","Liver","HSPC","Macrophage","Bcell","Tcell"))
AllDistUnder1000000$Celltype <- factor(AllDistUnder1000000$Celltype, levels=c("H1ESC","fSpinal","fHeart","Adrenal","Liver","HSPC","Macrophage","Bcell","Tcell"))

print("Done.")
```

    [1] "Done."



```R
AllDistUnder500000 %>% filter(Group=="Observed") %>% select(Celltype) %>% unique()
```

## Stats


```R
AllDistUnder500000
```


<table class="dataframe">
<caption>A tibble: 436073 × 3</caption>
<thead>
	<tr><th scope=col>Distance</th><th scope=col>Celltype</th><th scope=col>Group</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>61704</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>61704</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>42841</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>  510</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>  288</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>  153</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>  151</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>  135</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>  135</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>36539</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td> 7262</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td> 7262</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>   62</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>   62</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>10573</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td> 3486</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td> 1364</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td> 1364</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td> 2553</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td> 2553</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>10231</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td> 8166</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>  202</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>  202</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>   53</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>   53</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>  836</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>  836</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td> 3385</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td> 1680</td><td>Adrenal</td><td>Observed</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>47713.8</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>49081.0</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>47953.0</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48451.2</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48256.1</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48111.1</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>49300.4</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>47650.2</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48092.4</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48596.2</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>49002.6</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>47948.8</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>47852.5</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>47880.9</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>47948.7</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48818.5</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48778.7</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48353.9</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48670.1</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>47963.3</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>47944.1</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48152.3</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>47982.7</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48524.0</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48197.7</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48358.6</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48429.3</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48217.4</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48061.1</td><td>Tcell</td><td>Expected</td></tr>
	<tr><td>48500.0</td><td>Tcell</td><td>Expected</td></tr>
</tbody>
</table>



EXP vs OBS for each Cell type


```R
AllDistUnder500000 %>%
  nest(data = c(-Celltype)) %>%
  mutate(data = map(data, ~ wilcox.test(Distance ~ Group, data = .x)),
         data = map(data, tidy)) %>% 
  unnest(data)
```


<table class="dataframe">
<caption>A tibble: 9 × 5</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>statistic</th><th scope=col>p.value</th><th scope=col>method</th><th scope=col>alternative</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Adrenal   </td><td>292072010</td><td>0</td><td>Wilcoxon rank sum test with continuity correction</td><td>two.sided</td></tr>
	<tr><td>Bcell     </td><td>281841108</td><td>0</td><td>Wilcoxon rank sum test with continuity correction</td><td>two.sided</td></tr>
	<tr><td>fHeart    </td><td>351610130</td><td>0</td><td>Wilcoxon rank sum test with continuity correction</td><td>two.sided</td></tr>
	<tr><td>fSpinal   </td><td>359719779</td><td>0</td><td>Wilcoxon rank sum test with continuity correction</td><td>two.sided</td></tr>
	<tr><td>H1ESC     </td><td>143367414</td><td>0</td><td>Wilcoxon rank sum test with continuity correction</td><td>two.sided</td></tr>
	<tr><td>HSPC      </td><td>369864714</td><td>0</td><td>Wilcoxon rank sum test with continuity correction</td><td>two.sided</td></tr>
	<tr><td>Liver     </td><td>300094006</td><td>0</td><td>Wilcoxon rank sum test with continuity correction</td><td>two.sided</td></tr>
	<tr><td>Macrophage</td><td>445083206</td><td>0</td><td>Wilcoxon rank sum test with continuity correction</td><td>two.sided</td></tr>
	<tr><td>Tcell     </td><td>259523905</td><td>0</td><td>Wilcoxon rank sum test with continuity correction</td><td>two.sided</td></tr>
</tbody>
</table>



Adam's method


```R
stat.test <- AllDistUnder500000 %>%
  group_by(Celltype) %>%
  wilcox_test(Distance ~ Group) %>%
  adjust_pvalue(method = "fdr") %>%
  add_significance("p.adj")

stat.test
```


<table class="dataframe">
<caption>A rstatix_test: 9 × 10</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>.y.</th><th scope=col>group1</th><th scope=col>group2</th><th scope=col>n1</th><th scope=col>n2</th><th scope=col>statistic</th><th scope=col>p</th><th scope=col>p.adj</th><th scope=col>p.adj.signif</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>H1ESC     </td><td>Distance</td><td>Expected</td><td>Observed</td><td>10001</td><td>17907</td><td>143367414</td><td>0</td><td>0</td><td>****</td></tr>
	<tr><td>fSpinal   </td><td>Distance</td><td>Expected</td><td>Observed</td><td>10001</td><td>44209</td><td>359719779</td><td>0</td><td>0</td><td>****</td></tr>
	<tr><td>fHeart    </td><td>Distance</td><td>Expected</td><td>Observed</td><td>10001</td><td>43314</td><td>351610130</td><td>0</td><td>0</td><td>****</td></tr>
	<tr><td>Adrenal   </td><td>Distance</td><td>Expected</td><td>Observed</td><td>10001</td><td>36426</td><td>292072010</td><td>0</td><td>0</td><td>****</td></tr>
	<tr><td>Liver     </td><td>Distance</td><td>Expected</td><td>Observed</td><td>10001</td><td>38025</td><td>300094006</td><td>0</td><td>0</td><td>****</td></tr>
	<tr><td>HSPC      </td><td>Distance</td><td>Expected</td><td>Observed</td><td>10001</td><td>45939</td><td>369864714</td><td>0</td><td>0</td><td>****</td></tr>
	<tr><td>Macrophage</td><td>Distance</td><td>Expected</td><td>Observed</td><td>10001</td><td>54209</td><td>445083206</td><td>0</td><td>0</td><td>****</td></tr>
	<tr><td>Bcell     </td><td>Distance</td><td>Expected</td><td>Observed</td><td>10001</td><td>33861</td><td>281841108</td><td>0</td><td>0</td><td>****</td></tr>
	<tr><td>Tcell     </td><td>Distance</td><td>Expected</td><td>Observed</td><td>10001</td><td>32174</td><td>259523905</td><td>0</td><td>0</td><td>****</td></tr>
</tbody>
</table>



By hand to double check 


```R
AllDistUnder500000_adrenal <- AllDistUnder500000 %>% filter(Celltype=="Adrenal")
AllDistUnder500000_adrenal_exp <- AllDistUnder500000_adrenal %>% filter(Group=="Expected")
AllDistUnder500000_adrenal_obs <- AllDistUnder500000_adrenal %>% filter(Group=="Observed")
```


```R
wilcox.test(AllDistUnder500000_adrenal_exp$Distance, AllDistUnder500000_adrenal_obs$Distance)
```


    
    	Wilcoxon rank sum test with continuity correction
    
    data:  AllDistUnder500000_adrenal_exp$Distance and AllDistUnder500000_adrenal_obs$Distance
    W = 292072010, p-value < 2.2e-16
    alternative hypothesis: true location shift is not equal to 0




```R
t.test(AllDistUnder500000_adrenal_exp$Distance, AllDistUnder500000_adrenal_obs$Distance)
```


    
    	Welch Two Sample t-test
    
    data:  AllDistUnder500000_adrenal_exp$Distance and AllDistUnder500000_adrenal_obs$Distance
    t = 42.105, df = 36434, p-value < 2.2e-16
    alternative hypothesis: true difference in means is not equal to 0
    95 percent confidence interval:
     11468.02 12587.85
    sample estimates:
    mean of x mean of y 
     42741.98  30714.05 



Exploratory and median defining


```R

# Create a reference for median measures for exp and observed
med_vals <- AllObsDist %>% 
  group_by(Celltype) %>%
  summarize(medianDis=median(Distance))

#mean_vals <- AllObsDist %>% 
#  group_by(Celltype) %>%
#  summarize(meanDis=mean(Distance))

#mode_vals <- AllObsDist %>% 
#  group_by(Celltype) %>%
#  summarize(modeDis=mode(Distance))


####### Request
# Find the maximum of each observed density plot per cell type
d_a <- density( (AllObsDist %>% filter(Celltype=="Adrenal"))$Distance )
d_b <- density( (AllObsDist %>% filter(Celltype=="Bcell"))$Distance )
d_h <- density( (AllObsDist %>% filter(Celltype=="fHeart"))$Distance )
d_s <- density( (AllObsDist %>% filter(Celltype=="fSpinal"))$Distance )
d_e <- density( (AllObsDist %>% filter(Celltype=="H1ESC"))$Distance )
d_l <- density( (AllObsDist %>% filter(Celltype=="Liver"))$Distance )

maxy_a <- which.max(d_a$y)
maxy_b <- which.max(d_b$y)
maxy_h <- which.max(d_h$y)
maxy_s <- which.max(d_s$y)
maxy_e <- which.max(d_e$y)
maxy_l <- which.max(d_l$y)

maxx_a <- d_a$x[maxy_a]
maxx_b <- d_b$x[maxy_b]
maxx_h <- d_h$x[maxy_h]
maxx_s <- d_s$x[maxy_s]
maxx_e <- d_e$x[maxy_e]
maxx_l <- d_l$x[maxy_l]

# Get IQR, median, etc. 
summary((AllObsDist %>% filter(Celltype=="Adrenal"))$Distance)

# Get quantiles
quantile((AllObsDist %>% filter(Celltype=="Adrenal"))$Distance,
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))
quantile((AllObsDist %>% filter(Celltype=="Bcell"))$Distance,
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))
quantile((AllObsDist %>% filter(Celltype=="fHeart"))$Distance,
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))
quantile((AllObsDist %>% filter(Celltype=="fSpinal"))$Distance,
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))
quantile((AllObsDist %>% filter(Celltype=="H1ESC"))$Distance,
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))
quantile((AllObsDist %>% filter(Celltype=="Liver"))$Distance,
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))

# Get quantiles after length filter of:

for (celltype in c("H1ESC","fSpinal","fHeart","Adrenal","Liver","Bcell")) {
  print(celltype)
  print(quantile(((AllObsDist %>% filter(Celltype==celltype &
                                     Distance < 50000))$Distance),
           c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9)))
  cat("\n")
}



quantile(((AllObsDist %>% filter(Celltype=="Adrenal" &
                                          Distance < 50000))$Distance),
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))
quantile(((AllObsDist %>% filter(Celltype=="Bcell" &
                                   Distance < 50000))$Distance),
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))
quantile(((AllObsDist %>% filter(Celltype=="fHeart" &
                                   Distance < 50000))$Distance),
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))
quantile(((AllObsDist %>% filter(Celltype=="fSpinal" &
                                   Distance < 50000))$Distance),
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))
quantile(((AllObsDist %>% filter(Celltype=="H1ESC" &
                                   Distance < 50000))$Distance),
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))
quantile(((AllObsDist %>% filter(Celltype=="Liver" &
                                   Distance < 50000))$Distance),
         c(.1,.2,.3,.4,.45,.5,.55,.6,.7,.8,.9))




list_maxx <- data.frame(
  celltype = c("Adrenal","Bcell","fHeart","fSpinal","H1ESC","Liver"),
  peak_xval = c(maxx_a, maxx_b, maxx_h, maxx_s, maxx_e, maxx_l)
)
print(list_maxx)

max <- which.max(density(AllObsDist$Distance)$y)
AllObsDist %>% 
  group_by(Celltype) %>%
  summarize(densMax=density(Distance)$x[max])

# Expected 
med_vals_exp <- AllExpDist %>% 
  group_by(Celltype) %>%
  summarize(medianDis=median(Distance))


# Scaling is HARD
# Plot AllDist
#ggplot(AllDist, aes(x=Distance, y=..ndensity..)) +
#  geom_density(aes(color=Group, fill=Group), alpha=.6) +
#  theme_classic() +
#  facet_wrap(~Celltype, ncol=1) +
#  coord_cartesian(xlim=c(0,110000)) +
#  geom_vline(data = med_vals, mapping=aes(xintercept = medianDis), size=1.5, color="red") +
#  scale_x_continuous(breaks = seq(0, 130000, by = 10000))

#ggplot(AllDistUnder150000, aes(x=Distance, y=..ndensity..)) +
#  geom_density(aes(color=Group, fill=Group), alpha=.6) +
#  theme_classic() +
#  facet_wrap(~Celltype, ncol=1) +
#  coord_cartesian(xlim=c(0,110000)) +
#  geom_vline(data = med_vals, mapping=aes(xintercept = medianDis), size=1.5, color="red") + 
#  scale_x_continuous(breaks = seq(0, 130000, by = 10000))


#ggplot(AllDistUnder500000, aes(x=Distance, y=..ndensity..)) +
#  geom_density(aes(color=Group, fill=Group), alpha=.6) +
#  theme_classic() +
#  facet_wrap(~Celltype, ncol=1) +
#  coord_cartesian(xlim=c(0,110000)) +
#  geom_vline(data = med_vals, mapping=aes(xintercept = medianDis), size=1.5, color="red") + 
#  scale_x_continuous(breaks = seq(0, 130000, by = 10000))





###
# ggplot(AllDist, aes(x=Distance, y=..ndensity.., group=Group, fill=Group, color=Group)) +
#  geom_density() + 
#  facet_grid(Celltype~.) + 
#  theme_classic() +
#  coord_cartesian(xlim=c(0,110000)) +
#  geom_vline(data = med_vals, mapping=aes(xintercept = medianDis), size=1.5, color="#126870") +
#  scale_x_continuous(breaks = seq(0, 130000, by = 10000))


# ggplot(AllDistUnder1000000, aes(x=Distance, y=..ndensity.., group=Group, fill=Group, color=Group)) +
#  geom_density() + 
#  facet_grid(Celltype~.) + 
#  theme_classic() +
#  coord_cartesian(xlim=c(0,110000)) +
#  geom_vline(data = med_vals, mapping=aes(xintercept = medianDis), size=1.5, color="#126870") +
#  scale_x_continuous(breaks = seq(0, 130000, by = 10000))

```


       Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
         -1    3014   10738   34290   33231 2464681 



<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>880</dd><dt>20%</dt><dd>2149</dd><dt>30%</dt><dd>4067.3</dd><dt>40%</dt><dd>6896</dd><dt>45%</dt><dd>8643</dd><dt>50%</dt><dd>10738</dd><dt>55%</dt><dd>13421.25</dd><dt>60%</dt><dd>16630.8</dd><dt>70%</dt><dd>25960.5</dd><dt>80%</dt><dd>43301.8</dd><dt>90%</dt><dd>83937.5</dd></dl>




<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>571</dd><dt>20%</dt><dd>1674</dd><dt>30%</dt><dd>3320.3</dd><dt>40%</dt><dd>5584.4</dd><dt>45%</dt><dd>7095.85</dd><dt>50%</dt><dd>8960.5</dd><dt>55%</dt><dd>11441.05</dd><dt>60%</dt><dd>14331</dd><dt>70%</dt><dd>22855.8</dd><dt>80%</dt><dd>38981</dd><dt>90%</dt><dd>80101.5</dd></dl>




<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>890</dd><dt>20%</dt><dd>1944</dd><dt>30%</dt><dd>3502</dd><dt>40%</dt><dd>5600</dd><dt>45%</dt><dd>6890.3</dd><dt>50%</dt><dd>8564</dd><dt>55%</dt><dd>10568.4</dd><dt>60%</dt><dd>13033.2</dd><dt>70%</dt><dd>20398</dd><dt>80%</dt><dd>34109.6</dd><dt>90%</dt><dd>67244.5999999999</dd></dl>




<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>1006</dd><dt>20%</dt><dd>2110</dd><dt>30%</dt><dd>3642.7</dd><dt>40%</dt><dd>5714</dd><dt>45%</dt><dd>7001</dd><dt>50%</dt><dd>8548</dd><dt>55%</dt><dd>10503</dd><dt>60%</dt><dd>12950.4</dd><dt>70%</dt><dd>19924.9</dd><dt>80%</dt><dd>33194.4</dd><dt>90%</dt><dd>65064.5</dd></dl>




<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>636</dd><dt>20%</dt><dd>2843</dd><dt>30%</dt><dd>6867</dd><dt>40%</dt><dd>12866.8</dd><dt>45%</dt><dd>16780</dd><dt>50%</dt><dd>21711</dd><dt>55%</dt><dd>27897.4</dd><dt>60%</dt><dd>35055</dd><dt>70%</dt><dd>55379</dd><dt>80%</dt><dd>93447</dd><dt>90%</dt><dd>179337.400000001</dd></dl>




<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>814.400000000001</dd><dt>20%</dt><dd>1971</dd><dt>30%</dt><dd>3760</dd><dt>40%</dt><dd>6489</dd><dt>45%</dt><dd>8374.4</dd><dt>50%</dt><dd>10474</dd><dt>55%</dt><dd>13157</dd><dt>60%</dt><dd>16549.8</dd><dt>70%</dt><dd>26163.4</dd><dt>80%</dt><dd>43844</dd><dt>90%</dt><dd>84747.8000000001</dd></dl>



    [1] "H1ESC"
         10%      20%      30%      40%      45%      50%      55%      60% 
      227.00  1283.00  2953.80  5626.60  7102.65  8921.00 11013.15 13299.80 
         70%      80%      90% 
    18970.00 26779.00 37041.20 
    
    [1] "fSpinal"
      10%   20%   30%   40%   45%   50%   55%   60%   70%   80%   90% 
      881  1770  2960  4574  5485  6555  7805  9237 13267 19213 29618 
    
    [1] "fHeart"
      10%   20%   30%   40%   45%   50%   55%   60%   70%   80%   90% 
      761  1626  2787  4329  5309  6361  7689  9183 13231 19414 29903 
    
    [1] "Adrenal"
        10%     20%     30%     40%     45%     50%     55%     60%     70%     80% 
      673.0  1678.0  2969.0  4777.0  5990.0  7311.0  8799.3 10524.0 15105.6 21739.2 
        90% 
    32016.2 
    
    [1] "Liver"
        10%     20%     30%     40%     45%     50%     55%     60%     70%     80% 
      633.0  1508.0  2716.8  4441.4  5540.0  6846.0  8461.0 10148.2 14803.0 21582.0 
        90% 
    31880.6 
    
    [1] "Bcell"
        10%     20%     30%     40%     45%     50%     55%     60%     70%     80% 
      436.3  1259.0  2410.0  4030.0  4998.0  6142.0  7474.0  9112.8 13573.1 19841.2 
        90% 
    30592.7 
    



<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>673</dd><dt>20%</dt><dd>1678</dd><dt>30%</dt><dd>2969</dd><dt>40%</dt><dd>4777</dd><dt>45%</dt><dd>5990</dd><dt>50%</dt><dd>7311</dd><dt>55%</dt><dd>8799.3</dd><dt>60%</dt><dd>10524</dd><dt>70%</dt><dd>15105.6</dd><dt>80%</dt><dd>21739.2</dd><dt>90%</dt><dd>32016.2</dd></dl>




<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>436.3</dd><dt>20%</dt><dd>1259</dd><dt>30%</dt><dd>2410</dd><dt>40%</dt><dd>4030</dd><dt>45%</dt><dd>4998</dd><dt>50%</dt><dd>6142</dd><dt>55%</dt><dd>7474</dd><dt>60%</dt><dd>9112.8</dd><dt>70%</dt><dd>13573.1</dd><dt>80%</dt><dd>19841.2</dd><dt>90%</dt><dd>30592.7</dd></dl>




<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>761</dd><dt>20%</dt><dd>1626</dd><dt>30%</dt><dd>2787</dd><dt>40%</dt><dd>4329</dd><dt>45%</dt><dd>5309</dd><dt>50%</dt><dd>6361</dd><dt>55%</dt><dd>7689</dd><dt>60%</dt><dd>9183</dd><dt>70%</dt><dd>13231</dd><dt>80%</dt><dd>19414</dd><dt>90%</dt><dd>29903</dd></dl>




<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>881</dd><dt>20%</dt><dd>1770</dd><dt>30%</dt><dd>2960</dd><dt>40%</dt><dd>4574</dd><dt>45%</dt><dd>5485</dd><dt>50%</dt><dd>6555</dd><dt>55%</dt><dd>7805</dd><dt>60%</dt><dd>9237</dd><dt>70%</dt><dd>13267</dd><dt>80%</dt><dd>19213</dd><dt>90%</dt><dd>29618</dd></dl>




<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>227</dd><dt>20%</dt><dd>1283</dd><dt>30%</dt><dd>2953.8</dd><dt>40%</dt><dd>5626.6</dd><dt>45%</dt><dd>7102.65</dd><dt>50%</dt><dd>8921</dd><dt>55%</dt><dd>11013.15</dd><dt>60%</dt><dd>13299.8</dd><dt>70%</dt><dd>18970</dd><dt>80%</dt><dd>26779</dd><dt>90%</dt><dd>37041.2</dd></dl>




<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>10%</dt><dd>633</dd><dt>20%</dt><dd>1508</dd><dt>30%</dt><dd>2716.8</dd><dt>40%</dt><dd>4441.4</dd><dt>45%</dt><dd>5540</dd><dt>50%</dt><dd>6846</dd><dt>55%</dt><dd>8461</dd><dt>60%</dt><dd>10148.2</dd><dt>70%</dt><dd>14803</dd><dt>80%</dt><dd>21582</dd><dt>90%</dt><dd>31880.6</dd></dl>



      celltype peak_xval
    1  Adrenal  2260.067
    2    Bcell  3725.153
    3   fHeart  3466.545
    4  fSpinal  4636.350
    5    H1ESC  8814.038
    6    Liver  2157.265



<table class="dataframe">
<caption>A tibble: 9 × 2</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>densMax</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Adrenal   </td><td> -2592.3197</td></tr>
	<tr><td>Bcell     </td><td> -1559.0021</td></tr>
	<tr><td>H1ESC     </td><td>-11757.7962</td></tr>
	<tr><td>HSPC      </td><td> -1141.4146</td></tr>
	<tr><td>Liver     </td><td> -5120.9527</td></tr>
	<tr><td>Macrophage</td><td>   713.6248</td></tr>
	<tr><td>Tcell     </td><td> -4489.3419</td></tr>
	<tr><td>fHeart    </td><td> -1052.1653</td></tr>
	<tr><td>fSpinal   </td><td>  -357.8520</td></tr>
</tbody>
</table>



## Actual plot 


```R
str(AllDistUnder150000$Celltype)
```

     Factor w/ 9 levels "H1ESC","fSpinal",..: 4 4 4 4 4 4 4 4 4 4 ...



```R
Celltype_Plotting_Order <- c("H1ESC","fSpinal","fHeart","Adrenal","Liver","HSPC","Macrophage","Bcell","Tcell")
```


```R
pdf("interHMRDistances.9celltypes.June252023.AllDistUnder150000.pdf")

p15 <- ggplot(AllDistUnder150000, aes(x=Distance, y=..ndensity.., group=Group, fill=Group, color=Group)) +
  geom_density() + 
  facet_grid(factor(Celltype, levels = Celltype_Plotting_Order) ~.) + 
  theme_classic() +
  coord_cartesian(xlim=c(0,110000)) +
  geom_vline(data = med_vals, mapping=aes(xintercept = medianDis), size=1.5, color="#04263f") +
  scale_x_continuous(breaks = seq(0, 130000, by = 10000)) +
  scale_fill_manual( values = c("#AAAAAA","#b3e2cd")) +
  scale_color_manual( values = c("#AAAAAA","#b3e2cd"))
p15

dev.off()
p15
```


<strong>png:</strong> 2



![png](output_41_1.png)



```R
pdf("interHMRDistances.9celltypes.June252023.AllDistUnder500000.pdf")

p50 <- ggplot(AllDistUnder500000, aes(x=Distance, y=..ndensity.., group=Group, fill=Group, color=Group)) +
  geom_density() + 
  facet_grid(factor(Celltype, levels = Celltype_Plotting_Order) ~.) + 
  theme_classic() +
  coord_cartesian(xlim=c(0,110000)) +
  geom_vline(data = med_vals, mapping=aes(xintercept = medianDis), size=1.5, color="#04263f") +
  scale_x_continuous(breaks = seq(0, 130000, by = 10000)) +
  scale_fill_manual( values = c("#AAAAAA","#b3e2cd")) +
  scale_color_manual( values = c("#AAAAAA","#b3e2cd"))
p50

dev.off()

p50
```


<strong>png:</strong> 2



![png](output_42_1.png)

