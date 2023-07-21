### Want to produce clustered values for various linking distances

Distances to try: 
- 6 kb (Currently have)
- 10.5 kb (Reflects approximate mean inter-HMR distance among all HMRs across cell types - "average")
- 12.5 kb (Super-enhancer/ROSE-popularized definition for linking distance - derived from ChIP-seq data)

### Can modify the custom clustering algorithm down below


```bash
for celltype in Adrenal Bcell fHeart fSpinal H1ESC Liver
do
	sh annotate_HMRs.sh ${celltype} ${celltype}.minsize50.filtforrefseqTSSexons.txt anti_${celltype}.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/filtRefSeqFiles /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/antiFiles
done

```


```bash
# Variables:
# expects 5 cell type BED files as input
CT=$1
CTFile=$2
OthFile=$3 # e.g. Anti_Bcell.bed; a collection of regions from all other CTs
TSSExonRef=$4 # i.e. blacklist file for merging boundaries in establishing clusters
outDir=$5
inDir=$6
antiDir=$7


# Echo the variable assignments for good measure
echo "Input Directory identified: ${inDir}"
echo "Output Directory identified: ${outDir}"
echo "Cell-type identified: ${CT}"
echo "Cell-type file identified: ${CTFile}"
echo "Other cell-type file identified: ${OthFile}"
echo "Clustering Regions Whitelist identified: ${invFile}"




################################################################################
# Find ALL HMRs
echo "Finding all cell specific and shared HMRs"

##### ((0)) ALL_cellspecific
##### Exclude HMRs overlapping with blacklist | Exclude HMRs from this celltype that overlap with those from other celltypes
bedtools intersect -v -a $inDir/$CTFile -b $TSSExonRef | bedtools intersect -v -a - -b $antiDir/$OthFile > $outDir/$CT\_all_cellspecific.txt
echo "Found cell-specific HMRs."

##### ((00)) ALL_shared
##### Exclude HMRs overlapping with blacklist | Include HMRs from this celltype that overlap with those from other celltypes
bedtools intersect -v -a $inDir/$CTFile -b $TSSExonRef | bedtools intersect -u -a - -b $antiDir/$OthFile > $outDir/$CT\_all_shared.txt
echo "Found shared HMRs."




################################################################################
# Find Unclustered HMRs

##### ((1)) CT_unclustered
#####  Filt for TSS/Exons | Merge together clustered HMRs based on rules | Filter out unclustered
originalHMRDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs/
startingFile=${originalHMRDir}${CT}.hmr.bed

awk 'BEGIN{OFS=FS="\t"}{if (($3-$2)>49) print $1,$2,$3}' ${startingFile} | bedtools merge -c 2 -o count -d 6000 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - | bedtools intersect -v -a - -b ${TSSExonRef} > $outDir/$CT\_unclustered.txt
echo "Found unclustered HMRs."


##### ((2)) CT_unclustered_cellspecific
##### 
# Inverse intersect (1) with comparison file to find (a) ct-specific unclustered HMRs
bedtools intersect -v -a $outDir/$CT\_unclustered.txt -b $antiDir/$OthFile | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > $outDir/$CT\_unclustered_cellspecific.txt
echo "Found cell-specific unclustered HMRs."


##### ((3) CT_unclustered_shared
##### 
# Intersect (1) with comparison file to find (b) ct-shared unclustered HMRs
bedtools intersect -u -a $outDir/$CT\_unclustered.txt -b $antiDir/$OthFile | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > $outDir/$CT\_unclustered_shared.txt
echo "Found shared unclustered HMRs."


################################################################################
# Find Clustered HMRs

##### ((4)) CT_internalClusters
##### 
# internal Clusters that don't cross at TSS/Exon, that also compose 3+ HMRs
# Strategy: 
#		- (pre-a) Create a whitelist from the TSS/Exon blacklist
# 		- (a) Find all inverse regions (Whitelist regions) that contain 3+ HMRs (potential clusters)
# 		- (b) Make BED that has two BED coordinates per line - Left: Whitelist Region; Right: HMR region
#		- (c) Merge using this altered BED-BED file and a custom awk script instead of BEDtools Merge

# (pre-a) Turn blacklist into whitelist
# To download the hg19 chr size file: 
# mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A -e "select chrom, size from hg19.chromInfo"  > hg19.genome
# awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$2}' /scratch/scottt7/paper_wases/HMRs/hg19.genome | bedtools sort -i - > /scratch/scottt7/paper_wases/HMRs/hg19.genome_sorted.txt
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' $TSSExonRef | bedtools sort -i - | bedtools complement -i - -g /scratch/scottt7/paper_wases/HMRs/hg19.chrom.sizes.twoCol.sorted > $outDir/$CT\_whitelist.txt
echo "Made whitelist."


# (a) Find whitelist regions with 3+ HMRs
bedtools intersect -c -F 1.0 -a $outDir/$CT\_whitelist.txt -b $inDir/$CTFile | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print}' - > $outDir/$CT\_whitelistRegions_contain3ormoreHMRs.txt
echo "Found whitelist regions that contain 3+ HMRs."

# (b)Find what HMRs are in these to create a double BED file in a parsable list for custom merging: [1-3]: BED coordinates of Whitelist region [4]: #HMR in Whitelist region, [5-7]: BED coordinates of HMRs in Whitelist region
# Diagnostic: bedtools intersect -loj -F 1.0 -a Bcell_whitelistRegions_contain3ormoreHMRs.txt -b Bcell.HMR.min50.txt | awk 'BEGIN{OFS=FS="\t"}{print}' - | bedtools sort -i - | head
# awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' temp.txt | head

bedtools intersect -loj -F 1.0 -a $outDir/$CT\_whitelistRegions_contain3ormoreHMRs.txt -b $inDir/$CTFile | awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > $outDir/$CT\_whitelistRegions_cluster_individualHMRs_temp.txt
echo "Created double BED for whitelist regions that contain 3+ HMRs."

# (c) Custom merge within these regions
awk -v whitelistStart=1 -v hmrsCount=1 -v clusterChr=1 -v clusterStart=1 -v clusterEnd=2 'BEGIN{OFS=FS="\t";dist=6000;whitelistStart=1;hmrsCount=1;clusterChr=1;clusterStart=1;clusterEnd=2;} {
	# Check if we are in the same WhitelistBoundary
	if ($5!=whitelistStart) {
		print clusterChr,clusterStart,clusterEnd,hmrsCount;
		whitelistStart=$5;
		hmrsCount=1;
		clusterChr=$1;
		clusterStart=$2;
		clusterEnd=$3;
	} else {
		# case if (1) we are staying within a Whitelist boundary, but (2) the previous HMR was >6000bp away
		if (($2-clusterEnd)>6000) {
			print clusterChr,clusterStart,clusterEnd,hmrsCount;
			clusterStart=$2;
			clusterEnd=$3;
			hmrsCount=1;
		} else {
			clusterEnd=$3;
			hmrsCount+=1;
		}
	}
}' $outDir/$CT\_whitelistRegions_cluster_individualHMRs_temp.txt | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print $0}' - > $outDir/$CT\_internalClusters.txt
echo "Found internalClusters containing 3+ HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' $outDir/$CT\_internalClusters.txt > $outDir/$CT\_internalClusters_BED.txt
echo $"\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a $inDir/$CTFile -b $outDir/$CT\_internalClusters_BED.txt > $outDir/$CT\_internalClusters_individualHMRs.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."

##### ((6)) internalClusters_individualHMRs_cellspecific
##### 
# Inverse intersect (1) with our comparison file to find (a) ct-specific and (b) at least partially shared regions
bedtools intersect -v -a $outDir/$CT\_internalClusters_individualHMRs.txt -b $antiDir/$OthFile > $outDir/$CT\_internalClusters_individualHMRs_cellspecific.txt
echo "Found cell-specific clustered HMRs."


##### ((7) CT_internalClusters_individualHMRs_shared
##### 
#	Intersect CT with OtherFile to find shared
bedtools intersect -u -a $outDir/$CT\_internalClusters_individualHMRs.txt -b $antiDir/$OthFile > $outDir/$CT\_internalClusters_individualHMRs_shared.txt
echo "Found shared clustered HMRs."


##### ((8)) internalClusters_containsCS
#####
bedtools intersect -u -a $outDir/$CT\_internalClusters_BED.txt -b $outDir/$CT\_all_cellspecific.txt > $outDir/$CT\_internalClusters_containsCS.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."


##### ((9)) internalClusters_withoutCS 
#####
bedtools intersect -v -a $outDir/$CT\_internalClusters_BED.txt -b $outDir/$CT\_all_cellspecific.txt > $outDir/$CT\_internalClusters_withoutCS.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."
```






















### Modified script - 11 kb


```bash
# Variables:
# The original script took in 7 variables which have been omitted here. 
# These described both input folders and files as well as other referenced files unnecessary
#     for this step. 

CT="Bcell"

OUT_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output/

# update terminal 
echo "Got the variables! Thanks."
echo ${CT}
echo ${OUT_DIR}
cd ${OUT_DIR}
echo 
echo
echo

# (c) Custom merge within these regions
awk -v whitelistStart=1 -v hmrsCount=1 -v clusterChr=1 -v clusterStart=1 -v clusterEnd=2 \
'BEGIN{OFS=FS="\t"; dist=11000; whitelistStart=1; hmrsCount=1; clusterChr=1; clusterStart=1; clusterEnd=2} \
{ if ($5!=whitelistStart) { \
print clusterChr,clusterStart,clusterEnd,hmrsCount;\
whitelistStart=$5;\
hmrsCount=1;\
clusterChr=$1;\
clusterStart=$2;\
clusterEnd=$3;\
} else {\
if (($2-clusterEnd)>dist) {\
print clusterChr,clusterStart,clusterEnd,hmrsCount;\
clusterStart=$2;\
clusterEnd=$3;\
hmrsCount=1;\
} else {\
clusterEnd=$3;\
hmrsCount+=1}}}' /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_whitelistRegions_cluster_individualHMRs_temp_hpl.txt | \
awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print $0}' - > ${OUT_DIR}Bcell_internalClusters_11000.txt

echo "Found internalClusters containing 3+ HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${OUT_DIR}Bcell_internalClusters_11000.txt \
> ${OUT_DIR}Bcell_internalClusters_BED_11000.txt
echo $"\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a \
/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/Bcell.minsize50.filtforrefseqTSSexons.txt -b ${OUT_DIR}Bcell_internalClusters_BED_11000.txt > ${OUT_DIR}Bcell_internalClusters_individualHMRs_11000.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."

```

    Got the variables! Thanks.
    Bcell
    /data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output/
    
    
    
    Found internalClusters containing 3+ HMRs.
    \n
    Found the HMRs composing internalClusters containing 3+ HMRs.



```bash
ls -lhtr 
```

    total 6.4M
    -rw-r--r-- 1 scottt7 hodges_lab  56K Jan 21  2022 Bcell_internalClusters_10500.txt
    -rw-r--r-- 1 scottt7 hodges_lab  51K Jan 21  2022 Bcell_internalClusters_BED_10500.txt
    -rw-r--r-- 1 scottt7 hodges_lab 241K Jan 21  2022 Bcell_internalClusters_individualHMRs_10500.txt
    -rw-r--r-- 1 scottt7 hodges_lab  60K Jan 21  2022 Bcell_internalClusters_12500.txt
    -rw-r--r-- 1 scottt7 hodges_lab  55K Jan 21  2022 Bcell_internalClusters_BED_12500.txt
    -rw-r--r-- 1 scottt7 hodges_lab 266K Jan 21  2022 Bcell_internalClusters_individualHMRs_12500.txt
    -rw-r--r-- 1 scottt7 hodges_lab  37K Jan 21  2022 Bcell_internalClusters_BED.txt
    -rw-r--r-- 1 scottt7 hodges_lab 303K Jan 24  2022 Bcell_unclustered_10500.txt
    -rw-r--r-- 1 scottt7 hodges_lab 273K Jan 24  2022 Bcell_unclustered_12500.txt
    -rw-r--r-- 1 scottt7 hodges_lab 1.4M Jan 24  2022 ChromHMM_BcellUnclustered_10500.txt
    -rw-r--r-- 1 scottt7 hodges_lab 831K Jan 24  2022 ChromHMM_BcellClustered_10500.txt
    -rw-r--r-- 1 scottt7 hodges_lab  366 Jan 24  2022 ChromHMM_BcellUnclustered_counts_10500.txt
    -rw-r--r-- 1 scottt7 hodges_lab  366 Jan 24  2022 ChromHMM_BcellClustered_counts_10500.txt
    -rw-r--r-- 1 scottt7 hodges_lab 1.3M Jan 24  2022 ChromHMM_BcellUnclustered_12500.txt
    -rw-r--r-- 1 scottt7 hodges_lab 928K Jan 24  2022 ChromHMM_BcellClustered_12500.txt
    -rw-r--r-- 1 scottt7 hodges_lab  366 Jan 24  2022 ChromHMM_BcellUnclustered_counts_12500.txt
    -rw-r--r-- 1 scottt7 hodges_lab  366 Jan 24  2022 ChromHMM_BcellClustered_counts_12500.txt
    -rw-r--r-- 1 scottt7 hodges_lab  57K Jul 11 03:29 Bcell_internalClusters_11000.txt
    -rw-r--r-- 1 scottt7 hodges_lab  52K Jul 11 03:29 Bcell_internalClusters_BED_11000.txt
    -rw-r--r-- 1 scottt7 hodges_lab 247K Jul 11 03:29 Bcell_internalClusters_individualHMRs_11000.txt



```bash
wc -l Bcell_internalClusters_individualHMRs*
```

      8805 Bcell_internalClusters_individualHMRs_10500.txt
      9044 Bcell_internalClusters_individualHMRs_11000.txt
      9717 Bcell_internalClusters_individualHMRs_12500.txt
     27566 total


### Unclustered 11 kb


```bash
################################################################################
# Find Unclustered HMRs
TSSExonRef=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt
CT="Bcell"
OUT_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output/

##### ((1)) CT_unclustered
#####  Filt for TSS/Exons | Merge together clustered HMRs based on rules | Filter out unclustered
startingFile=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs/Bcell.hmr.bed

awk 'BEGIN{OFS=FS="\t"}{if (($3-$2)>49) print $1,$2,$3}' ${startingFile} | \
bedtools merge -c 2 -o count -d 11000 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | \
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - | bedtools intersect -v -a - -b ${TSSExonRef} > \
${OUT_DIR}Bcell_unclustered_11000.txt

echo "Found unclustered HMRs."

```

    Found unclustered HMRs.



```bash
wc -l *11000.txt
```

### Modified script - 10.5 kb

Requires a few modifications

(1) New output folder

    - New output folder variable for quick reference later
    
    - /data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output
    
(2) New output file name for clarity


```bash
# Variables:
# The original script took in 7 variables which have been omitted here. 
# These described both input folders and files as well as other referenced files unnecessary
#     for this step. 

CT="Bcell"
inDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_6/HMRs
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output

# update terminal 
echo "Got the variables! Thanks."
echo ${CT}
echo ${outDir}
cd ${outDir}
echo 
echo
echo

# (c) Custom merge within these regions
awk -v whitelistStart=1 -v hmrsCount=1 -v clusterChr=1 -v clusterStart=1 -v clusterEnd=2 \
'BEGIN{OFS=FS="\t"; dist=10500; whitelistStart=1; hmrsCount=1; clusterChr=1; clusterStart=1; clusterEnd=2} \
{ if ($5!=whitelistStart) { \
print clusterChr,clusterStart,clusterEnd,hmrsCount;\
whitelistStart=$5;\
hmrsCount=1;\
clusterChr=$1;\
clusterStart=$2;\
clusterEnd=$3;\
} else {\
if (($2-clusterEnd)>dist) {\
print clusterChr,clusterStart,clusterEnd,hmrsCount;\
clusterStart=$2;\
clusterEnd=$3;\
hmrsCount=1;\
} else {\
clusterEnd=$3;\
hmrsCount+=1}}}' ${inDir}/$CT\_whitelistRegions_cluster_individualHMRs_temp.txt | \
awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print $0}' - > ${outDir}/$CT\_internalClusters_10500.txt

echo "Found internalClusters containing 3+ HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${outDir}/$CT\_internalClusters_10500.txt \
> ${outDir}/$CT\_internalClusters_BED_10500.txt
echo $"\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a \
/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_6/filtRefSeqFiles/Bcell.minsize50.filtforrefseqTSSexons.txt \
-b ${outDir}/$CT\_internalClusters_BED_10500.txt > ${outDir}/$CT\_internalClusters_individualHMRs_10500.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."

```

    Got the variables! Thanks.
    Bcell
    /data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output
    
    
    
    Found internalClusters containing 3+ HMRs.
    \n
    Found the HMRs composing internalClusters containing 3+ HMRs.


### Modified script - 12.5kb

Requires a few modifications
(1) New output folder
    - New output folder variable for quick reference later
    - /data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output
(2) New output file name for clarity


```bash
# Variables:
# The original script took in 7 variables which have been omitted here. 
# These described both input folders and files as well as other referenced files unnecessary
#     for this step. 

CT="Bcell"
inDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_6/HMRs
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output

# update terminal 
echo "Got the variables! Thanks."
echo ${CT}
echo ${outDir}
cd ${outDir}
echo 
echo
echo

# (c) Custom merge within these regions
awk -v whitelistStart=1 -v hmrsCount=1 -v clusterChr=1 -v clusterStart=1 -v clusterEnd=2 \
'BEGIN{OFS=FS="\t"; dist=12500; whitelistStart=1; hmrsCount=1; clusterChr=1; clusterStart=1; clusterEnd=2} \
{ if ($5!=whitelistStart) { \
print clusterChr,clusterStart,clusterEnd,hmrsCount;\
whitelistStart=$5;\
hmrsCount=1;\
clusterChr=$1;\
clusterStart=$2;\
clusterEnd=$3;\
} else {\
if (($2-clusterEnd)>dist) {\
print clusterChr,clusterStart,clusterEnd,hmrsCount;\
clusterStart=$2;\
clusterEnd=$3;\
hmrsCount=1;\
} else {\
clusterEnd=$3;\
hmrsCount+=1}}}' ${inDir}/$CT\_whitelistRegions_cluster_individualHMRs_temp.txt | \
awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print $0}' - > ${outDir}/$CT\_internalClusters_12500.txt

echo "Found internalClusters containing 3+ HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${outDir}/$CT\_internalClusters_12500.txt \
> ${outDir}/$CT\_internalClusters_BED_12500.txt
echo $"\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a \
/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_6/filtRefSeqFiles/Bcell.minsize50.filtforrefseqTSSexons.txt \
-b ${outDir}/$CT\_internalClusters_BED_12500.txt > ${outDir}/$CT\_internalClusters_individualHMRs_12500.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."
```

    Got the variables! Thanks.
    Bcell
    /data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output
    
    
    
    Found internalClusters containing 3+ HMRs.
    \n
    Found the HMRs composing internalClusters containing 3+ HMRs.


### Move the 6-kb file over to output for easier processing


```bash
cp /data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_6/HMRs/Bcell_internalClusters_BED.txt \
/gpfs52/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output

echo "Did it. Moved 6kb."
```

    Did it. Moved 6kb.


### Unclustered 10.5kb


```bash
################################################################################
# Find Unclustered HMRs
TSSExonRef=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt
CT="Bcell"
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output

##### ((1)) CT_unclustered
#####  Filt for TSS/Exons | Merge together clustered HMRs based on rules | Filter out unclustered
originalHMRDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs/
startingFile=${originalHMRDir}${CT}.hmr.bed

awk 'BEGIN{OFS=FS="\t"}{if (($3-$2)>49) print $1,$2,$3}' ${startingFile} | \
bedtools merge -c 2 -o count -d 10500 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | \
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - | bedtools intersect -v -a - -b ${TSSExonRef} > \
$outDir/$CT\_unclustered_10500.txt

echo "Found unclustered HMRs."

```

    Found unclustered HMRs.


### Unclustered 12.5kb


```bash
################################################################################
# Find Unclustered HMRs
TSSExonRef=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt
CT="Bcell"
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/output

##### ((1)) CT_unclustered
#####  Filt for TSS/Exons | Merge together clustered HMRs based on rules | Filter out unclustered
originalHMRDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs/
startingFile=${originalHMRDir}${CT}.hmr.bed

awk 'BEGIN{OFS=FS="\t"}{if (($3-$2)>49) print $1,$2,$3}' ${startingFile} | \
bedtools merge -c 2 -o count -d 12500 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | \
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - | bedtools intersect -v -a - -b ${TSSExonRef} > \
$outDir/$CT\_unclustered_12500.txt

echo "Found unclustered HMRs."

```

    Found unclustered HMRs.


### HMR pipeline: For the pie-bar HMR-annotation plot (3D), we want to know if the relative ratios hold true for other linking distances

To do this, we need to apply the entire pipeline for HMR annotation using the two alternate linking distances

#### 10.5kb linking distance


```bash
# Code for how this is currently run. 
# Here, instead, hand-set these variables

for celltype in Adrenal Bcell fHeart fSpinal H1ESC Liver
do
	sh annotate_HMRs.sh ${celltype} \
    ${celltype}.minsize50.filtforrefseqTSSexons.txt \
    anti_${celltype}.txt \
    /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt \
    /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs \
    /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/filtRefSeqFiles \
    /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/antiFiles
done

```


```bash
# Variables:
# expects 5 cell type BED files as input
CT="Bcell"
CTFile=Bcell.minsize50.filtforrefseqTSSexons.txt
OthFile=anti_Bcell.txt # e.g. anti_Bcell.bed; a collection of regions from all other CTs
TSSExonRef=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt # i.e. blacklist file for merging boundaries in establishing clusters
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_10500
inDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/filtRefSeqFiles
antiDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/antiFiles

# For here, I'm creating a new variable for linking distance for the sake of consistency 
LINKING_DISTANCE=10500


# Echo the variable assignments for good measure
echo "Input Directory identified: ${inDir}"
echo "Output Directory identified: ${outDir}"
echo "Cell-type identified: ${CT}"
echo "Cell-type file identified: ${CTFile}"
echo "Other cell-type file identified: ${OthFile}"
echo "Clustering Regions Whitelist identified: ${invFile}"




################################################################################
# Find ALL HMRs
echo "Finding all cell specific and shared HMRs"

##### ((0)) ALL_cellspecific
##### Exclude HMRs overlapping with blacklist | Exclude HMRs from this celltype that overlap with those from other celltypes
bedtools intersect -v -a $inDir/$CTFile -b $TSSExonRef | bedtools intersect -v -a - -b $antiDir/$OthFile > \
$outDir/$CT\_all_cellspecific.txt
echo "Found cell-specific HMRs."

##### ((00)) ALL_shared
##### Exclude HMRs overlapping with blacklist | Include HMRs from this celltype that overlap with those from other celltypes
bedtools intersect -v -a $inDir/$CTFile -b $TSSExonRef | bedtools intersect -u -a - -b $antiDir/$OthFile > \
$outDir/$CT\_all_shared.txt
echo "Found shared HMRs."




################################################################################
# Find Unclustered HMRs

##### ((1)) CT_unclustered
#####  Filt for TSS/Exons | Merge together clustered HMRs based on rules | Filter out unclustered
originalHMRDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs/
startingFile=${originalHMRDir}${CT}.hmr.bed

awk 'BEGIN{OFS=FS="\t"}{if (($3-$2)>49) print $1,$2,$3}' ${startingFile} | \
bedtools merge -c 2 -o count -d ${LINKING_DISTANCE} -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | \
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - | bedtools intersect -v -a - -b ${TSSExonRef} > \
$outDir/$CT\_unclustered.txt

echo "Found unclustered HMRs."


##### ((2)) CT_unclustered_cellspecific
##### 
# Inverse intersect (1) with comparison file to find (a) ct-specific unclustered HMRs
bedtools intersect -v -a $outDir/$CT\_unclustered.txt -b $antiDir/$OthFile | \
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > $outDir/$CT\_unclustered_cellspecific.txt
echo "Found cell-specific unclustered HMRs."


##### ((3) CT_unclustered_shared
##### 
# Intersect (1) with comparison file to find (b) ct-shared unclustered HMRs
bedtools intersect -u -a $outDir/$CT\_unclustered.txt -b $antiDir/$OthFile | \
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > $outDir/$CT\_unclustered_shared.txt
echo "Found shared unclustered HMRs."


################################################################################
# Find Clustered HMRs

##### ((4)) CT_internalClusters
##### 
# internal Clusters that don't cross at TSS/Exon, that also compose 3+ HMRs
# Strategy: 
#		- (pre-a) Create a whitelist from the TSS/Exon blacklist
# 		- (a) Find all inverse regions (Whitelist regions) that contain 3+ HMRs (potential clusters)
# 		- (b) Make BED that has two BED coordinates per line - Left: Whitelist Region; Right: HMR region
#		- (c) Merge using this altered BED-BED file and a custom awk script instead of BEDtools Merge

# (pre-a) Turn blacklist into whitelist
# To download the hg19 chr size file: 
# mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A -e "select chrom, size from hg19.chromInfo"  > hg19.genome
# awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$2}' /scratch/scottt7/paper_wases/HMRs/hg19.genome | bedtools sort -i - > /scratch/scottt7/paper_wases/HMRs/hg19.genome_sorted.txt
echo "Making whitelist."
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' $TSSExonRef | bedtools sort -i - | \
bedtools complement -i - -g /scratch/scottt7/paper_wases/HMRs/hg19.chrom.sizes.twoCol.sorted > \
$outDir/$CT\_whitelist.txt
echo "Made whitelist."


# (a) Find whitelist regions with 3+ HMRs
bedtools intersect -c -F 1.0 -a $outDir/$CT\_whitelist.txt -b $inDir/$CTFile | \
awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print}' - > $outDir/$CT\_whitelistRegions_contain3ormoreHMRs.txt
echo "Found whitelist regions that contain 3+ HMRs."

# (b)Find what HMRs are in these to create a double BED file in a parsable list for custom merging: [1-3]: BED coordinates of Whitelist region [4]: #HMR in Whitelist region, [5-7]: BED coordinates of HMRs in Whitelist region
# Diagnostic: bedtools intersect -loj -F 1.0 -a Bcell_whitelistRegions_contain3ormoreHMRs.txt -b Bcell.HMR.min50.txt | awk 'BEGIN{OFS=FS="\t"}{print}' - | bedtools sort -i - | head
# awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' temp.txt | head

bedtools intersect -loj -F 1.0 -a $outDir/$CT\_whitelistRegions_contain3ormoreHMRs.txt -b $inDir/$CTFile | \
awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > \
$outDir/$CT\_whitelistRegions_cluster_individualHMRs_temp.txt
echo "Created double BED for whitelist regions that contain 3+ HMRs."

## (c) Custom merge within these regions
awk -v LINKINGDIST=${LINKING_DISTANCE} -v whitelistStart=1 -v hmrsCount=1 -v clusterChr=1 -v clusterStart=1 -v clusterEnd=2 \
'BEGIN{OFS=FS="\t"; whitelistStart=1; hmrsCount=1; clusterChr=1; clusterStart=1; clusterEnd=2} \
{ if ($5!=whitelistStart) { \
print clusterChr,clusterStart,clusterEnd,hmrsCount;\
whitelistStart=$5;\
hmrsCount=1;\
clusterChr=$1;\
clusterStart=$2;\
clusterEnd=$3;\
} else {\
if (($2-clusterEnd)>LINKINGDIST) \
{print clusterChr,clusterStart,clusterEnd,hmrsCount;\
clusterStart=$2;\
clusterEnd=$3;\
hmrsCount=1;\
} else {\
clusterEnd=$3;\
hmrsCount+=1}}}' ${outDir}/$CT\_whitelistRegions_cluster_individualHMRs_temp.txt | \
awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print $0}' - > ${outDir}/$CT\_internalClusters.txt
head ${outDir}/$CT\_internalClusters.txt
echo "Found the internal clusters"

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' $outDir/$CT\_internalClusters.txt > $outDir/$CT\_internalClusters_BED.txt
echo $"\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a $inDir/$CTFile -b $outDir/$CT\_internalClusters_BED.txt > $outDir/$CT\_internalClusters_individualHMRs.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."

##### ((6)) internalClusters_individualHMRs_cellspecific
##### 
# Inverse intersect (1) with our comparison file to find (a) ct-specific and (b) at least partially shared regions
bedtools intersect -v -a $outDir/$CT\_internalClusters_individualHMRs.txt -b $antiDir/$OthFile > $outDir/$CT\_internalClusters_individualHMRs_cellspecific.txt
echo "Found cell-specific clustered HMRs."


##### ((7) CT_internalClusters_individualHMRs_shared
##### 
#	Intersect CT with OtherFile to find shared
bedtools intersect -u -a $outDir/$CT\_internalClusters_individualHMRs.txt -b $antiDir/$OthFile > $outDir/$CT\_internalClusters_individualHMRs_shared.txt
echo "Found shared clustered HMRs."


##### ((8)) internalClusters_containsCS
#####
bedtools intersect -u -a $outDir/$CT\_internalClusters_BED.txt -b $outDir/$CT\_all_cellspecific.txt > $outDir/$CT\_internalClusters_containsCS.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs that contain CS."


##### ((9)) internalClusters_withoutCS 
#####
bedtools intersect -v -a $outDir/$CT\_internalClusters_BED.txt -b $outDir/$CT\_all_cellspecific.txt > $outDir/$CT\_internalClusters_withoutCS.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs that don't contain CS."
```

    Input Directory identified: /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/filtRefSeqFiles
    Output Directory identified: /data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_10500
    Cell-type identified: Bcell
    Cell-type file identified: Bcell.minsize50.filtforrefseqTSSexons.txt
    Other cell-type file identified: anti_Bcell.txt
    Clustering Regions Whitelist identified: 
    Finding all cell specific and shared HMRs
    Found cell-specific HMRs.
    Found shared HMRs.
    Found unclustered HMRs.
    Found cell-specific unclustered HMRs.
    Found shared unclustered HMRs.
    
    a1.txt
    awk
    b1.txt
    Bcell_internalClusters_individualHMRs.txt
    B cell & Liver - Cluster Overlap Comparison.ipynb
    Bcell_Persistence_HSPC_revisement_CLUSTERED.ipynb
    Bcell_Persistence_HSPC_revisement-Copy1.ipynb
    Bcell_Persistence_HSPC_revisement.ipynb
    Bcell_unclustered.txt
    BroadHistone_Download_Log.ipynb
    ChromHMM_10500_12500_linkingDistances.ipynb
    count_Bcell_sh_H1Derived.txt
    count_Bcell_sh_HSPCDerived.txt
    count_HSPC_cs.txt
    count_HSPC_sh_HSPCDerived.txt
    count_HSPSC_sh_H1Derived.txt
    count_HSPSC_sh_HSPCDerived.txt
    count_Macrophage_sh_H1Derived.txt
    count_Macrophage_sh_HSPCDerived.txt
    eQTL_ML_Enrichment_Liver.ipynb
    eQTL_ML_Enrichment_Whole_Blood.ipynb
    H1ESC_immuneFocused_cellspecific.txt
    H1ESC_immuneFocused_clustered.txt
    H1ESC_immuneFocused_shared.txt
    H1ESC_immuneFocused.txt
    H1ESC_immuneFocused_unclustered.txt
    HMR_annotation.ipynb
    HSPCDerived_counts_clustered.txt
    HSPCDerived_counts_unclustered.txt
    HSPC_immuneFocused_cl_shared_H1Derived.txt
    HSPC_immuneFocused_cl_shared_HSPCDerived.txt
    HSPC_immuneFocused_un_shared_H1Derived.txt
    HSPC_immuneFocused_un_shared_HSPCDerived.txt
    .ipynb_checkpoints/
    LDSC_Liver_Developmental.ipynb
    LinkingDistances.ipynb
    Transcriptome Imputation by Hand.ipynb
    Untitled1.ipynb
    Untitled.ipynb
    weights_bcell_clustered.txt
    weights_bcell_unclustered.txt
    weights.bed
    weights_bed_noHeader.txt
    
    a1.txt
    awk
    b1.txt
    Bcell_internalClusters_individualHMRs.txt
    B cell & Liver - Cluster Overlap Comparison.ipynb
    Bcell_Persistence_HSPC_revisement_CLUSTERED.ipynb
    Bcell_Persistence_HSPC_revisement-Copy1.ipynb
    Bcell_Persistence_HSPC_revisement.ipynb
    Bcell_unclustered.txt
    BroadHistone_Download_Log.ipynb
    ChromHMM_10500_12500_linkingDistances.ipynb
    count_Bcell_sh_H1Derived.txt
    count_Bcell_sh_HSPCDerived.txt
    count_HSPC_cs.txt
    count_HSPC_sh_HSPCDerived.txt
    count_HSPSC_sh_H1Derived.txt
    count_HSPSC_sh_HSPCDerived.txt
    count_Macrophage_sh_H1Derived.txt
    count_Macrophage_sh_HSPCDerived.txt
    eQTL_ML_Enrichment_Liver.ipynb
    eQTL_ML_Enrichment_Whole_Blood.ipynb
    H1ESC_immuneFocused_cellspecific.txt
    H1ESC_immuneFocused_clustered.txt
    H1ESC_immuneFocused_shared.txt
    H1ESC_immuneFocused.txt
    H1ESC_immuneFocused_unclustered.txt
    HMR_annotation.ipynb
    HSPCDerived_counts_clustered.txt
    HSPCDerived_counts_unclustered.txt
    HSPC_immuneFocused_cl_shared_H1Derived.txt
    HSPC_immuneFocused_cl_shared_HSPCDerived.txt
    HSPC_immuneFocused_un_shared_H1Derived.txt
    HSPC_immuneFocused_un_shared_HSPCDerived.txt
    .ipynb_checkpoints/
    LDSC_Liver_Developmental.ipynb
    LinkingDistances.ipynb
    Transcriptome Imputation by Hand.ipynb
    Untitled1.ipynb
    Untitled.ipynb
    weights_bcell_clustered.txt
    weights_bcell_unclustered.txt
    weights.bed
    weights_bed_noHeader.txt
    Making whitelist.
    Made whitelist.
    Found whitelist regions that contain 3+ HMRs.
    Created double BED for whitelist regions that contain 3+ HMRs.
    chr1	564470	570301	3
    chr1	794016	805500	3
    chr1	832618	856881	7
    chr1	993725	1006171	6
    chr1	1071770	1080160	3
    chr1	1092645	1106080	5
    chr1	1771819	1779732	3
    chr1	1827360	1841244	6
    chr1	2043760	2065178	8
    chr1	2242977	2247085	3
    Found the internal clusters
    \n
    Found the HMRs composing internalClusters containing 3+ HMRs.
    Found cell-specific clustered HMRs.
    Found shared clustered HMRs.
    Found the HMRs composing internalClusters containing 3+ HMRs that contain CS.
    Found the HMRs composing internalClusters containing 3+ HMRs that don't contain CS.


#### 12.5kb linking distance 


```bash
# Variables:
# expects 5 cell type BED files as input
CT="Bcell"
CTFile=Bcell.minsize50.filtforrefseqTSSexons.txt
OthFile=anti_Bcell.txt # e.g. anti_Bcell.bed; a collection of regions from all other CTs
TSSExonRef=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt # i.e. blacklist file for merging boundaries in establishing clusters
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_12500
inDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/filtRefSeqFiles
antiDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/antiFiles

# For here, I'm creating a new variable for linking distance for the sake of consistency 
LINKING_DISTANCE=12500


# Echo the variable assignments for good measure
echo "Input Directory identified: ${inDir}"
echo "Output Directory identified: ${outDir}"
echo "Cell-type identified: ${CT}"
echo "Cell-type file identified: ${CTFile}"
echo "Other cell-type file identified: ${OthFile}"
echo "Clustering Regions Whitelist identified: ${invFile}"




################################################################################
# Find ALL HMRs
echo "Finding all cell specific and shared HMRs"

##### ((0)) ALL_cellspecific
##### Exclude HMRs overlapping with blacklist | Exclude HMRs from this celltype that overlap with those from other celltypes
bedtools intersect -v -a $inDir/$CTFile -b $TSSExonRef | bedtools intersect -v -a - -b $antiDir/$OthFile > \
$outDir/$CT\_all_cellspecific.txt
echo "Found cell-specific HMRs."

##### ((00)) ALL_shared
##### Exclude HMRs overlapping with blacklist | Include HMRs from this celltype that overlap with those from other celltypes
bedtools intersect -v -a $inDir/$CTFile -b $TSSExonRef | bedtools intersect -u -a - -b $antiDir/$OthFile > \
$outDir/$CT\_all_shared.txt
echo "Found shared HMRs."




################################################################################
# Find Unclustered HMRs

##### ((1)) CT_unclustered
#####  Filt for TSS/Exons | Merge together clustered HMRs based on rules | Filter out unclustered
originalHMRDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs/
startingFile=${originalHMRDir}${CT}.hmr.bed

awk 'BEGIN{OFS=FS="\t"}{if (($3-$2)>49) print $1,$2,$3}' ${startingFile} | \
bedtools merge -c 2 -o count -d ${LINKING_DISTANCE} -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | \
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - | bedtools intersect -v -a - -b ${TSSExonRef} > \
$outDir/$CT\_unclustered.txt

echo "Found unclustered HMRs."


##### ((2)) CT_unclustered_cellspecific
##### 
# Inverse intersect (1) with comparison file to find (a) ct-specific unclustered HMRs
bedtools intersect -v -a $outDir/$CT\_unclustered.txt -b $antiDir/$OthFile | \
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > $outDir/$CT\_unclustered_cellspecific.txt
echo "Found cell-specific unclustered HMRs."


##### ((3) CT_unclustered_shared
##### 
# Intersect (1) with comparison file to find (b) ct-shared unclustered HMRs
bedtools intersect -u -a $outDir/$CT\_unclustered.txt -b $antiDir/$OthFile | \
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > $outDir/$CT\_unclustered_shared.txt
echo "Found shared unclustered HMRs."


################################################################################
# Find Clustered HMRs

##### ((4)) CT_internalClusters
##### 
# internal Clusters that don't cross at TSS/Exon, that also compose 3+ HMRs
# Strategy: 
#		- (pre-a) Create a whitelist from the TSS/Exon blacklist
# 		- (a) Find all inverse regions (Whitelist regions) that contain 3+ HMRs (potential clusters)
# 		- (b) Make BED that has two BED coordinates per line - Left: Whitelist Region; Right: HMR region
#		- (c) Merge using this altered BED-BED file and a custom awk script instead of BEDtools Merge

# (pre-a) Turn blacklist into whitelist
# To download the hg19 chr size file: 
# mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A -e "select chrom, size from hg19.chromInfo"  > hg19.genome
# awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$2}' /scratch/scottt7/paper_wases/HMRs/hg19.genome | bedtools sort -i - > /scratch/scottt7/paper_wases/HMRs/hg19.genome_sorted.txt
echo "Making whitelist."
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' $TSSExonRef | bedtools sort -i - | \
bedtools complement -i - -g /scratch/scottt7/paper_wases/HMRs/hg19.chrom.sizes.twoCol.sorted > \
$outDir/$CT\_whitelist.txt
echo "Made whitelist."


# (a) Find whitelist regions with 3+ HMRs
bedtools intersect -c -F 1.0 -a $outDir/$CT\_whitelist.txt -b $inDir/$CTFile | \
awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print}' - > $outDir/$CT\_whitelistRegions_contain3ormoreHMRs.txt
echo "Found whitelist regions that contain 3+ HMRs."

# (b)Find what HMRs are in these to create a double BED file in a parsable list for custom merging: [1-3]: BED coordinates of Whitelist region [4]: #HMR in Whitelist region, [5-7]: BED coordinates of HMRs in Whitelist region
# Diagnostic: bedtools intersect -loj -F 1.0 -a Bcell_whitelistRegions_contain3ormoreHMRs.txt -b Bcell.HMR.min50.txt | awk 'BEGIN{OFS=FS="\t"}{print}' - | bedtools sort -i - | head
# awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' temp.txt | head

bedtools intersect -loj -F 1.0 -a $outDir/$CT\_whitelistRegions_contain3ormoreHMRs.txt -b $inDir/$CTFile | \
awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > \
$outDir/$CT\_whitelistRegions_cluster_individualHMRs_temp.txt
echo "Created double BED for whitelist regions that contain 3+ HMRs."

## (c) Custom merge within these regions
awk -v LINKINGDIST=${LINKING_DISTANCE} -v whitelistStart=1 -v hmrsCount=1 -v clusterChr=1 -v clusterStart=1 -v clusterEnd=2 \
'BEGIN{OFS=FS="\t"; whitelistStart=1; hmrsCount=1; clusterChr=1; clusterStart=1; clusterEnd=2} \
{ if ($5!=whitelistStart) { \
print clusterChr,clusterStart,clusterEnd,hmrsCount;\
whitelistStart=$5;\
hmrsCount=1;\
clusterChr=$1;\
clusterStart=$2;\
clusterEnd=$3;\
} else {\
if (($2-clusterEnd)>LINKINGDIST) \
{print clusterChr,clusterStart,clusterEnd,hmrsCount;\
clusterStart=$2;\
clusterEnd=$3;\
hmrsCount=1;\
} else {\
clusterEnd=$3;\
hmrsCount+=1}}}' ${outDir}/$CT\_whitelistRegions_cluster_individualHMRs_temp.txt | \
awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print $0}' - > ${outDir}/$CT\_internalClusters.txt
head ${outDir}/$CT\_internalClusters.txt
echo "Found the internal clusters"

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' $outDir/$CT\_internalClusters.txt > $outDir/$CT\_internalClusters_BED.txt
echo $"\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a $inDir/$CTFile -b $outDir/$CT\_internalClusters_BED.txt > $outDir/$CT\_internalClusters_individualHMRs.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."

##### ((6)) internalClusters_individualHMRs_cellspecific
##### 
# Inverse intersect (1) with our comparison file to find (a) ct-specific and (b) at least partially shared regions
bedtools intersect -v -a $outDir/$CT\_internalClusters_individualHMRs.txt -b $antiDir/$OthFile > $outDir/$CT\_internalClusters_individualHMRs_cellspecific.txt
echo "Found cell-specific clustered HMRs."


##### ((7) CT_internalClusters_individualHMRs_shared
##### 
#	Intersect CT with OtherFile to find shared
bedtools intersect -u -a $outDir/$CT\_internalClusters_individualHMRs.txt -b $antiDir/$OthFile > $outDir/$CT\_internalClusters_individualHMRs_shared.txt
echo "Found shared clustered HMRs."


##### ((8)) internalClusters_containsCS
#####
bedtools intersect -u -a $outDir/$CT\_internalClusters_BED.txt -b $outDir/$CT\_all_cellspecific.txt > $outDir/$CT\_internalClusters_containsCS.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs that contain CS."


##### ((9)) internalClusters_withoutCS 
#####
bedtools intersect -v -a $outDir/$CT\_internalClusters_BED.txt -b $outDir/$CT\_all_cellspecific.txt > $outDir/$CT\_internalClusters_withoutCS.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs that don't contain CS."
```

    Input Directory identified: /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/filtRefSeqFiles
    Output Directory identified: /data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_12500
    Cell-type identified: Bcell
    Cell-type file identified: Bcell.minsize50.filtforrefseqTSSexons.txt
    Other cell-type file identified: anti_Bcell.txt
    Clustering Regions Whitelist identified: 
    Finding all cell specific and shared HMRs
    Found cell-specific HMRs.
    Found shared HMRs.
    Found unclustered HMRs.
    Found cell-specific unclustered HMRs.
    Found shared unclustered HMRs.
    
    a1.txt
    awk
    b1.txt
    Bcell_internalClusters_individualHMRs.txt
    B cell & Liver - Cluster Overlap Comparison.ipynb
    Bcell_Persistence_HSPC_revisement_CLUSTERED.ipynb
    Bcell_Persistence_HSPC_revisement-Copy1.ipynb
    Bcell_Persistence_HSPC_revisement.ipynb
    Bcell_unclustered.txt
    BroadHistone_Download_Log.ipynb
    ChromHMM_10500_12500_linkingDistances.ipynb
    count_Bcell_sh_H1Derived.txt
    count_Bcell_sh_HSPCDerived.txt
    count_HSPC_cs.txt
    count_HSPC_sh_HSPCDerived.txt
    count_HSPSC_sh_H1Derived.txt
    count_HSPSC_sh_HSPCDerived.txt
    count_Macrophage_sh_H1Derived.txt
    count_Macrophage_sh_HSPCDerived.txt
    eQTL_ML_Enrichment_Liver.ipynb
    eQTL_ML_Enrichment_Whole_Blood.ipynb
    H1ESC_immuneFocused_cellspecific.txt
    H1ESC_immuneFocused_clustered.txt
    H1ESC_immuneFocused_shared.txt
    H1ESC_immuneFocused.txt
    H1ESC_immuneFocused_unclustered.txt
    HMR_annotation.ipynb
    HSPCDerived_counts_clustered.txt
    HSPCDerived_counts_unclustered.txt
    HSPC_immuneFocused_cl_shared_H1Derived.txt
    HSPC_immuneFocused_cl_shared_HSPCDerived.txt
    HSPC_immuneFocused_un_shared_H1Derived.txt
    HSPC_immuneFocused_un_shared_HSPCDerived.txt
    .ipynb_checkpoints/
    LDSC_Liver_Developmental.ipynb
    LinkingDistances.ipynb
    Transcriptome Imputation by Hand.ipynb
    Untitled1.ipynb
    Untitled.ipynb
    weights_bcell_clustered.txt
    weights_bcell_unclustered.txt
    weights.bed
    weights_bed_noHeader.txt
    
    a1.txt
    awk
    b1.txt
    Bcell_internalClusters_individualHMRs.txt
    B cell & Liver - Cluster Overlap Comparison.ipynb
    Bcell_Persistence_HSPC_revisement_CLUSTERED.ipynb
    Bcell_Persistence_HSPC_revisement-Copy1.ipynb
    Bcell_Persistence_HSPC_revisement.ipynb
    Bcell_unclustered.txt
    BroadHistone_Download_Log.ipynb
    ChromHMM_10500_12500_linkingDistances.ipynb
    count_Bcell_sh_H1Derived.txt
    count_Bcell_sh_HSPCDerived.txt
    count_HSPC_cs.txt
    count_HSPC_sh_HSPCDerived.txt
    count_HSPSC_sh_H1Derived.txt
    count_HSPSC_sh_HSPCDerived.txt
    count_Macrophage_sh_H1Derived.txt
    count_Macrophage_sh_HSPCDerived.txt
    eQTL_ML_Enrichment_Liver.ipynb
    eQTL_ML_Enrichment_Whole_Blood.ipynb
    H1ESC_immuneFocused_cellspecific.txt
    H1ESC_immuneFocused_clustered.txt
    H1ESC_immuneFocused_shared.txt
    H1ESC_immuneFocused.txt
    H1ESC_immuneFocused_unclustered.txt
    HMR_annotation.ipynb
    HSPCDerived_counts_clustered.txt
    HSPCDerived_counts_unclustered.txt
    HSPC_immuneFocused_cl_shared_H1Derived.txt
    HSPC_immuneFocused_cl_shared_HSPCDerived.txt
    HSPC_immuneFocused_un_shared_H1Derived.txt
    HSPC_immuneFocused_un_shared_HSPCDerived.txt
    .ipynb_checkpoints/
    LDSC_Liver_Developmental.ipynb
    LinkingDistances.ipynb
    Transcriptome Imputation by Hand.ipynb
    Untitled1.ipynb
    Untitled.ipynb
    weights_bcell_clustered.txt
    weights_bcell_unclustered.txt
    weights.bed
    weights_bed_noHeader.txt
    Making whitelist.
    Made whitelist.
    Found whitelist regions that contain 3+ HMRs.
    Created double BED for whitelist regions that contain 3+ HMRs.
    chr1	564470	570301	3
    chr1	794016	805500	3
    chr1	832618	856881	7
    chr1	993725	1006171	6
    chr1	1071770	1106080	8
    chr1	1771819	1779732	3
    chr1	1827360	1841244	6
    chr1	2043760	2065178	8
    chr1	2162505	2178389	3
    chr1	2206661	2233250	4
    Found the internal clusters
    \n
    Found the HMRs composing internalClusters containing 3+ HMRs.
    Found cell-specific clustered HMRs.
    Found shared clustered HMRs.
    Found the HMRs composing internalClusters containing 3+ HMRs that contain CS.
    Found the HMRs composing internalClusters containing 3+ HMRs that don't contain CS.



```bash
echo "Hello"
```


```bash

```
