# ATAC-STARR-seq & HMR Comparison
Goal: Compare Tyler's GM12878 ATAC-STARR-seq regulatory regions with B cell HMRs (stratified by developmental lineage) 


```bash
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/
```


```bash
# Lift over the three B cell files (from_H1ESC, from_HSPC, B cell specific) to hg38 for intersection
# with Tyler's active/silent regions.
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/

# B cell HMRs from H1, through HSPC
echo "Lifting over B cell HMRs from H1ESC."
./liftOver Bcell_all_shared_SHAREDWITH_H1ESC_AND_HSC.txt hg19ToHg38.over.chain.gz \
Bcell_fromH1ESC.hg38.bed unlifted.B_H1.bed

# B cell HMRs from HSPC, not H1
echo "Lifting over B cell HMRs from HSPC."
./liftOver Bcell_all_shared_SHAREDWITH_HSC_NOT_H1ESC.txt hg19ToHg38.over.chain.gz \
Bcell_fromHSPC.hg38.bed unlifted.B_HS.bed

# B cell specific 
echo "Lifting over B cell specific HMRs."
./liftOver Bcell_all_cellspecific_hpl.txt hg19ToHg38.over.chain.gz \
Bcell_all_cellspecific_hpl.hg38.bed unlifted.B_cs.bed

echo "Done lifting over."
```

    bash: cd: ./liftOver: Not a directory
    Lifting over B cell HMRs from H1ESC.
    Reading liftover chains
    Mapping coordinates
    Lifting over B cell HMRs from HSPC.
    Reading liftover chains
    Mapping coordinates
    Lifting over B cell specific HMRs.
    Reading liftover chains
    Mapping coordinates
    Done lifting over.



```bash
### CLUSTERED HMR LIFTOVER
# Lift over the three CLUSTERED B cell files (from_H1ESC, from_HSPC, B cell specific) to hg38 for intersection
# with Tyler's active/silent regions.
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/liftOver

# B cell HMRs from H1, through HSPC
echo "Lifting over B cell clustered HMRs from H1ESC."
./liftOver Bcell_internalClusters_individualHMRs_shared_SHAREDWITH_H1ESC_AND_HSC.txt hg19ToHg38.over.chain.gz \
Bcell_clustered_fromH1ESC.hg38.bed unlifted.B_cl_H1.bed

# B cell HMRs from HSPC, not H1
echo "Lifting over B cell clustered HMRs from HSPC."
./liftOver Bcell_internalClusters_individualHMRs_shared_SHAREDWITH_HSC_NOT_H1ESC.txt hg19ToHg38.over.chain.gz \
Bcell_clustered_fromHSPC.hg38.bed unlifted.B_cl_HS.bed

# B cell specific 
echo "Lifting over B cell specific clustered HMRs."
./liftOver Bcell_internalClusters_individualHMRs_cellspecific_hpl.txt hg19ToHg38.over.chain.gz \
Bcell_clustered_cellspecific_hpl.hg38.bed unlifted.B_cl_cs.bed

echo "Done lifting over."
```

    Lifting over B cell clustered HMRs from H1ESC.
    Reading liftover chains
    Mapping coordinates
    Lifting over B cell clustered HMRs from HSPC.
    Reading liftover chains
    Mapping coordinates
    Lifting over B cell specific clustered HMRs.
    Reading liftover chains
    Mapping coordinates
    Done lifting over.



```bash
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/
```

## Perform intersections
### Here, trying to identify HMRs that overlap an active region. 


```bash
mkdir -p /data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/intersections/
int_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/intersections/
bed_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/liftOver/
atac_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/

### Active STARRseq regions
###
# B cell from H1ESC
bedtools intersect -u -a ${bed_dir}Bcell_fromH1ESC.hg38.bed -b ${atac_dir}active_regions.bed > \
${int_dir}Bcell_fromH1ESC.hg38.containsActiveReg.txt

# B cell from HSPC
bedtools intersect -u -a ${bed_dir}Bcell_fromHSPC.hg38.bed -b ${atac_dir}active_regions.bed > \
${int_dir}Bcell_fromHSPC.hg38.containsActiveReg.txt

# B cell specific
bedtools intersect -u -a ${bed_dir}Bcell_all_cellspecific_hpl.hg38.bed -b ${atac_dir}active_regions.bed > \
${int_dir}Bcell_all_cellspecific_hpl.hg38.containsActiveReg.txt

echo "Intersected HMRs with active regions."
```

    Intersected HMRs with active regions.



```bash
mkdir -p /data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/intersections/
int_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/intersections/
bed_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/liftOver/
atac_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/

### Silent STARRseq regions
###
# B cell from H1ESC
bedtools intersect -u -a ${bed_dir}Bcell_fromH1ESC.hg38.bed -b ${atac_dir}silent_regions.bed > \
${int_dir}Bcell_fromH1ESC.hg38.containsSilentReg.txt

# B cell from HSPC
bedtools intersect -u -a ${bed_dir}Bcell_fromHSPC.hg38.bed -b ${atac_dir}silent_regions.bed > \
${int_dir}Bcell_fromHSPC.hg38.containsSilentReg.txt

# B cell specific
bedtools intersect -u -a ${bed_dir}Bcell_all_cellspecific_hpl.hg38.bed -b ${atac_dir}silent_regions.bed > \
${int_dir}Bcell_all_cellspecific_hpl.hg38.containsSilentReg.txt

echo "Intersected HMRs with silent regions."
```

    Intersected HMRs with silent regions.



```bash
# Combine for whatever reason.
# B cell from H1ESC
cat ${int_dir}Bcell_fromH1ESC.hg38.containsActiveReg.txt ${int_dir}Bcell_fromH1ESC.hg38.containsSilentReg.txt | \
bedtools sort -i - > ${int_dir}Bcell_fromH1ESC.hg38.containsActiveOrSilentReg.txt

# B cell from HSPC
cat ${int_dir}Bcell_fromHSPC.hg38.containsActiveReg.txt ${int_dir}Bcell_fromHSPC.hg38.containsSilentReg.txt | \
bedtools sort -i - > ${int_dir}Bcell_fromHSPC.hg38.containsActiveOrSilentReg.txt

# B cell specific
cat ${int_dir}Bcell_all_cellspecific_hpl.hg38.containsActiveReg.txt ${int_dir}Bcell_all_cellspecific_hpl.hg38.containsSilentReg.txt | \
bedtools sort -i - > ${int_dir}Bcell_all_cellspecific_hpl.hg38.containsActiveOrSilentReg.txt

echo "Combined files"
```

    Combined files


# Identify files for use with Eulerr


```bash
# B cell clustered 
echo "Lifting over B cell specific HMRs."
./liftOver Bcell_internalClusters_individualHMRs_hpl.txt hg19ToHg38.over.chain.gz \
Bcell_internalClusters_individualHMRs_hpl.hg38.bed unlifted.B_cl.bed
```

    Lifting over B cell specific HMRs.
    Reading liftover chains
    Mapping coordinates



```bash
# All HMRs
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/liftOver

# Check num. all B cell HMRs
wc -l ../Bcell.minsize50.filtforrefseqTSSexons.hg38.withLengthCol.txt

# Active
bedtools intersect -u -a ../Bcell.minsize50.filtforrefseqTSSexons.hg38.withLengthCol.txt \
-b ../active_regions.bed | wc -l 

# Silent
bedtools intersect -u -a ../Bcell.minsize50.filtforrefseqTSSexons.hg38.withLengthCol.txt \
-b ../silent_regions.bed | wc -l 

```

    34003 ../Bcell.minsize50.filtforrefseqTSSexons.hg38.withLengthCol.txt
    4797
    2478



```bash
# All HMRs
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/liftOver

# Check num. all B cell HMRs
wc -l Bcell_internalClusters_hpl.hg38.bed

# Active
bedtools intersect -u -a Bcell_internalClusters_individualHMRs_hpl.hg38.bed -b ../active_regions.bed | wc -l 

# Silent
bedtools intersect -u -a Bcell_internalClusters_individualHMRs_hpl.hg38.bed -b ../silent_regions.bed | wc -l 

```

    1574 Bcell_internalClusters_hpl.hg38.bed
    968
    462



```bash
# All HMRs
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/liftOver/
out_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/activityRegions_forEulerr/

# Check num. all B cell HMRs
wc -l ../Bcell.minsize50.filtforrefseqTSSexons.hg38.withLengthCol.txt

# Active
bedtools intersect -u -a ../Bcell.minsize50.filtforrefseqTSSexons.hg38.withLengthCol.txt \
-b ../active_regions.bed > ${out_dir}active_in_Bcell.txt

bedtools intersect -v -a ../active_regions.bed \
-b ../Bcell.minsize50.filtforrefseqTSSexons.hg38.withLengthCol.txt > ${out_dir}active_not_Bcell.txt

# Silent
bedtools intersect -u -a ../Bcell.minsize50.filtforrefseqTSSexons.hg38.withLengthCol.txt \
-b ../silent_regions.bed > ${out_dir}silent_in_Bcell.txt

bedtools intersect -v -a ../silent_regions.bed \
-b ../Bcell.minsize50.filtforrefseqTSSexons.hg38.withLengthCol.txt > ${out_dir}silent_not_Bcell.txt

```

    34003 ../Bcell.minsize50.filtforrefseqTSSexons.hg38.withLengthCol.txt



```bash
# Clustered HMRs
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/liftOver/
out_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/TylerATAC/activityRegions_forEulerr/

# Check num. all B cell HMRs
wc -l Bcell_internalClusters_individualHMRs_hpl.hg38.bed

# Active
bedtools intersect -u -a Bcell_internalClusters_individualHMRs_hpl.hg38.bed \
-b ../active_regions.bed > ${out_dir}active_in_Bcell_clustered.txt

bedtools intersect -v -a ../active_regions.bed \
-b Bcell_internalClusters_individualHMRs_hpl.hg38.bed > ${out_dir}active_not_Bcell_clustered.txt

# Silent
bedtools intersect -u -a Bcell_internalClusters_individualHMRs_hpl.hg38.bed \
-b ../silent_regions.bed > ${out_dir}silent_in_Bcell_clustered.txt

bedtools intersect -v -a ../silent_regions.bed \
-b Bcell_internalClusters_individualHMRs_hpl.hg38.bed > ${out_dir}silent_not_Bcell_clustered.txt

```

    5960 Bcell_internalClusters_individualHMRs_hpl.hg38.bed



```bash

```


```bash

```
