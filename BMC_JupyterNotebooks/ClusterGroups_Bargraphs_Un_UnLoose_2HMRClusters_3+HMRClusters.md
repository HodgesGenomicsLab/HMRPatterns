# B cell: Compute cluster groups 


```R
WRK_DIR=/data/hodges_lab/Tim/ClusterTesting/
mkdir -p ${WRK_DIR}
```


```R
# RefSeq TSS/Exon file
TSSExon_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt 
```


```R
# B cell - filtered for RefSeq TSS/Exon file 
BCL_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/Bcell.minsize50.filtforrefseqTSSexons.txt

wc -l ${BCL_FILE}
```

    34070 /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/Bcell.minsize50.filtforrefseqTSSexons.txt



```R
# B cell - HMR file as downloaded
BCL_BASE_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs/Bcell.hmr.bed
wc -l ${BCL_BASE_FILE}
```

    54998 /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs/Bcell.hmr.bed



```R

```

## Unclustered - current method 


```R
awk 'BEGIN{OFS=FS="\t"}{if (($3-$2)>49) print $1,$2,$3}' ${BCL_BASE_FILE} | bedtools merge -c 2 -o count -d 6000 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - | bedtools intersect -v -a - -b ${TSSExon_FILE} > ${WRK_DIR}Bcell_unclustered_hpl.current.txt

echo "Found unclustered HMRs."
```

    Found unclustered HMRs.


## Unclustered - RefSeq filter first (More inclusive)


```R
bedtools merge -c 2 -o count -d 6000 -i ${BCL_FILE} | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > ${WRK_DIR}Bcell_unclustered_hpl.RefSeqFilterFirst.txt

echo "Done."
```

    Done.


### Unclustered - RefSeq - cell specific 


```R
bedtools intersect -u -a ${WRK_DIR}Bcell_unclustered_hpl.RefSeqFilterFirst.txt -b /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_all_cellspecific_hpl.txt > ${WRK_DIR}Bcell_unclustered_hpl.RefSeqFilterFirst.cellspecific.txt
```


```R

```


```R

```

## Clusters of two - internal clusters 


```R
### Old way 
```


```R
bedtools merge -c 2 -o count -d 6000 -i /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/Bcell.minsize50.filtforrefseqTSSexons.txt | awk 'BEGIN{FS=OFS="\t"}{if ($4==2) print}' - | wc -l
```

    3734



```R
### New way start
```


```R
head ${TSSExon_FILE}
```

    chr1	67090	70090	NM_001005484.1
    chr1	69090	70008	NM_001005484.1
    chr1	365658	368658	NM_001005221.2
    chr1	367658	368597	NM_001005221.2
    chr1	621034	624034	NM_001005277.1
    chr1	621095	622034	NM_001005277.1
    chr1	859110	862110	NM_152486.3
    chr1	861110	861180	NM_152486.3
    chr1	861301	861393	NM_152486.3
    chr1	865534	865716	NM_152486.3



```R
head /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/hg19.chrom.sizes.twoCol.sorted
```

    chr1	249250621
    chr10	135534747
    chr11	135006516
    chr12	133851895
    chr13	115169878
    chr14	107349540
    chr15	102531392
    chr16	90354753
    chr17	81195210
    chr18	78077248



```R
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${TSSExon_FILE} | bedtools sort -i - | bedtools complement -i - -g /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/hg19.chrom.sizes.twoCol.sorted > ${WRK_DIR}Bcell_whitelist.txt
echo "Made whitelist."

```

    Made whitelist.



```R
head ${WRK_DIR}Bcell_whitelist.txt
head ${WRK_DIR}Bcell_whitelistRegions_contain2ormoreHMRs_hpl.txt
```

    chr1	0	67090
    chr1	70090	365658
    chr1	368658	621034
    chr1	624034	859110
    chr1	862110	865534
    chr1	865716	866418
    chr1	866469	871151
    chr1	871276	874419
    chr1	874509	874654
    chr1	874840	876523
    chr1	368658	621034	4
    chr1	624034	859110	13
    chr1	866469	871151	2
    chr1	919473	934343	2
    chr1	991496	1006346	6
    chr1	1011686	1017202	2
    chr1	1053469	1107259	9
    chr1	1184102	1189291	2
    chr1	1512243	1533391	2
    chr1	1537515	1548794	2



```R
head -n 55 ${WRK_DIR}Bcell_whitelistRegions_cluster_contain2ormoreHMRs_individualHMRs_temp_hpl.txt
```

    chr1	521533	521660	chr1	368658	621034	4
    chr1	564470	566009	chr1	368658	621034	4
    chr1	566458	566879	chr1	368658	621034	4
    chr1	567166	570301	chr1	368658	621034	4
    chr1	713671	715041	chr1	624034	859110	13
    chr1	724219	724516	chr1	624034	859110	13
    chr1	762003	763205	chr1	624034	859110	13
    chr1	794016	794456	chr1	624034	859110	13
    chr1	801089	801505	chr1	624034	859110	13
    chr1	804991	805500	chr1	624034	859110	13
    chr1	832618	833196	chr1	624034	859110	13
    chr1	833785	834596	chr1	624034	859110	13
    chr1	839724	841039	chr1	624034	859110	13
    chr1	842095	842689	chr1	624034	859110	13
    chr1	845310	845847	chr1	624034	859110	13
    chr1	848051	848467	chr1	624034	859110	13
    chr1	855967	856881	chr1	624034	859110	13
    chr1	867226	867418	chr1	866469	871151	2
    chr1	869149	870886	chr1	866469	871151	2
    chr1	931262	932201	chr1	919473	934343	2
    chr1	932815	933045	chr1	919473	934343	2
    chr1	993725	995717	chr1	991496	1006346	6
    chr1	997402	998086	chr1	991496	1006346	6
    chr1	999033	1000573	chr1	991496	1006346	6
    chr1	1003631	1005100	chr1	991496	1006346	6
    chr1	1005383	1005519	chr1	991496	1006346	6
    chr1	1005817	1006171	chr1	991496	1006346	6
    chr1	1013125	1013636	chr1	1011686	1017202	2
    chr1	1014655	1016103	chr1	1011686	1017202	2
    chr1	1057380	1058017	chr1	1053469	1107259	9
    chr1	1071770	1073219	chr1	1053469	1107259	9
    chr1	1076605	1076862	chr1	1053469	1107259	9
    chr1	1079449	1080160	chr1	1053469	1107259	9
    chr1	1092645	1093973	chr1	1053469	1107259	9
    chr1	1099552	1099651	chr1	1053469	1107259	9
    chr1	1101641	1101896	chr1	1053469	1107259	9
    chr1	1105132	1105321	chr1	1053469	1107259	9
    chr1	1105477	1106080	chr1	1053469	1107259	9
    chr1	1185531	1185784	chr1	1184102	1189291	2
    chr1	1186356	1186514	chr1	1184102	1189291	2
    chr1	1521621	1521912	chr1	1512243	1533391	2
    chr1	1532681	1533152	chr1	1512243	1533391	2
    chr1	1538029	1538273	chr1	1537515	1548794	2
    chr1	1542535	1542805	chr1	1537515	1548794	2
    chr1	1609040	1610006	chr1	1608285	1622414	2
    chr1	1610479	1610648	chr1	1608285	1622414	2
    chr1	1771819	1771926	chr1	1770677	1821526	5
    chr1	1774186	1774504	chr1	1770677	1821526	5
    chr1	1779539	1779732	chr1	1770677	1821526	5
    chr1	1792416	1792619	chr1	1770677	1821526	5
    chr1	1796124	1796593	chr1	1770677	1821526	5
    chr1	1827360	1827924	chr1	1824556	1844698	6
    chr1	1830655	1831404	chr1	1824556	1844698	6
    chr1	1833498	1833790	chr1	1824556	1844698	6
    chr1	1837578	1838044	chr1	1824556	1844698	6



```R
head ${WRK_DIR}Bcell_internalClusters_contain2HMRs_hpl.txt
```

    chr1	801089	805500	2
    chr1	867226	870886	2
    chr1	931262	933045	2
    chr1	1013125	1016103	2
    chr1	1185531	1186514	2
    chr1	1538029	1542805	2
    chr1	1609040	1610648	2
    chr1	1792416	1796593	2
    chr1	1941843	1946688	2
    chr1	1976113	1978261	2



```R
head -n 50 /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/Bcell.minsize50.filtforrefseqTSSexons.txt
```

    chr1	28511	29460	949
    chr1	237055	237877	822
    chr1	521533	521660	127
    chr1	564470	566009	1539
    chr1	566458	566879	421
    chr1	567166	570301	3135
    chr1	713671	715041	1370
    chr1	724219	724516	297
    chr1	762003	763205	1202
    chr1	794016	794456	440
    chr1	801089	801505	416
    chr1	804991	805500	509
    chr1	832618	833196	578
    chr1	833785	834596	811
    chr1	839724	841039	1315
    chr1	842095	842689	594
    chr1	845310	845847	537
    chr1	848051	848467	416
    chr1	855967	856881	914
    chr1	867226	867418	192
    chr1	869149	870886	1737
    chr1	931262	932201	939
    chr1	932815	933045	230
    chr1	939973	940923	950
    chr1	958316	958626	310
    chr1	993725	995717	1992
    chr1	997402	998086	684
    chr1	999033	1000573	1540
    chr1	1003631	1005100	1469
    chr1	1005383	1005519	136
    chr1	1005817	1006171	354
    chr1	1013125	1013636	511
    chr1	1014655	1016103	1448
    chr1	1057380	1058017	637
    chr1	1071770	1073219	1449
    chr1	1076605	1076862	257
    chr1	1079449	1080160	711
    chr1	1092645	1093973	1328
    chr1	1099552	1099651	99
    chr1	1101641	1101896	255
    chr1	1105132	1105321	189
    chr1	1105477	1106080	603
    chr1	1136149	1137591	1442
    chr1	1173359	1173622	263
    chr1	1185531	1185784	253
    chr1	1186356	1186514	158
    chr1	1240198	1240647	449
    chr1	1251076	1251208	132
    chr1	1306762	1307920	1158
    chr1	1367787	1367984	197



```R
head ${WRK_DIR}Bcell_internalClusters_contain2HMRs_hpl.txt
```

    chr1	801089	805500	2
    chr1	867226	870886	2
    chr1	931262	933045	2
    chr1	1013125	1016103	2
    chr1	1185531	1186514	2
    chr1	1538029	1542805	2
    chr1	1609040	1610648	2
    chr1	1792416	1796593	2
    chr1	1941843	1946688	2
    chr1	1976113	1978261	2



```R
wc -l ${WRK_DIR}Bcell_internalClusters_contain2HMRs_hpl_BED.txt
wc -l ${WRK_DIR}Bcell_internalClusters_contain2HMRs_individualHMRs_hpl.txt
```

    3602 /data/hodges_lab/Tim/ClusterTesting/Bcell_internalClusters_contain2HMRs_hpl_BED.txt
    7204 /data/hodges_lab/Tim/ClusterTesting/Bcell_internalClusters_contain2HMRs_individualHMRs_hpl.txt



```R
echo "Start."

awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${TSSExon_FILE} | bedtools sort -i - | bedtools complement -i - -g /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/hg19.chrom.sizes.twoCol.sorted > ${WRK_DIR}Bcell_whitelist.txt
echo "Made whitelist."


# (a) Find whitelist regions with 2+ HMRs
bedtools intersect -c -F 1.0 -a ${WRK_DIR}Bcell_whitelist.txt -b ${BCL_FILE} | awk 'BEGIN{OFS=FS="\t"}{if ($4>1) print}' - > ${WRK_DIR}Bcell_whitelistRegions_contain2ormoreHMRs_hpl.txt
echo "Found whitelist regions that contain 2+ HMRs."

# (b)Find what HMRs are in these to create a double BED file in a parsable list for custom merging: [1-3]: BED coordinates of Whitelist region [4]: #HMR in Whitelist region, [5-7]: BED coordinates of HMRs in Whitelist region
# Diagnostic: bedtools intersect -loj -F 1.0 -a Bcell_whitelistRegions_contain3ormoreHMRs.txt -b Bcell.HMR.min50.txt | awk 'BEGIN{OFS=FS="\t"}{print}' - | bedtools sort -i - | head
# awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' temp.txt | head

bedtools intersect -loj -F 1.0 -a ${WRK_DIR}Bcell_whitelistRegions_contain2ormoreHMRs_hpl.txt -b ${BCL_FILE} | awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > ${WRK_DIR}Bcell_whitelistRegions_cluster_contain2ormoreHMRs_individualHMRs_temp_hpl.txt
echo "Created double BED for whitelist regions that contain 2+ HMRs."

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
}' ${WRK_DIR}Bcell_whitelistRegions_cluster_contain2ormoreHMRs_individualHMRs_temp_hpl.txt | awk 'BEGIN{OFS=FS="\t"}{if ($4==2) print $0}' - > ${WRK_DIR}Bcell_internalClusters_contain2HMRs_hpl.txt

echo "Found internalClusters containing exactly 2 HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${WRK_DIR}Bcell_internalClusters_contain2HMRs_hpl.txt > ${WRK_DIR}Bcell_internalClusters_contain2HMRs_hpl_BED.txt
echo -e "\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a ${BCL_FILE} -b ${WRK_DIR}Bcell_internalClusters_contain2HMRs_hpl_BED.txt > ${WRK_DIR}Bcell_internalClusters_contain2HMRs_individualHMRs_hpl.txt
echo "Found the HMRs composing internalClusters containing exactly 2 HMRs."



```

    Start.
    Made whitelist.
    Found whitelist regions that contain 2+ HMRs.
    Created double BED for whitelist regions that contain 2+ HMRs.
    Found internalClusters containing exactly 2 HMRs.
    
    
    Found the HMRs composing internalClusters containing 3+ HMRs.


## Clusters of three - internal clusters


```R
echo "Starting."

awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${TSSExon_FILE} | bedtools sort -i - | bedtools complement -i - -g /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/hg19.chrom.sizes.twoCol.sorted > ${WRK_DIR}Bcell_whitelist.txt
echo "Made whitelist."


# (a) Find whitelist regions with 3+ HMRs
bedtools intersect -c -F 1.0 -a ${WRK_DIR}Bcell_whitelist.txt -b ${BCL_FILE} | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print}' - > ${WRK_DIR}Bcell_whitelistRegions_contain3ormoreHMRs_hpl.txt
echo "Found whitelist regions that contain 3+ HMRs."


bedtools intersect -loj -F 1.0 -a ${WRK_DIR}Bcell_whitelistRegions_contain3ormoreHMRs_hpl.txt -b ${BCL_FILE} | awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > ${WRK_DIR}Bcell_whitelistRegions_cluster_individualHMRs_temp_hpl.txt

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
}' ${WRK_DIR}Bcell_whitelistRegions_cluster_individualHMRs_temp_hpl.txt | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print $0}' - > ${WRK_DIR}Bcell_internalClusters_hpl.txt
echo "Found internalClusters containing 3+ HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${WRK_DIR}Bcell_internalClusters_hpl.txt > ${WRK_DIR}Bcell_internalClusters_hpl_BED.txt
echo -e "\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a ${BCL_FILE} -b ${WRK_DIR}Bcell_internalClusters_hpl_BED.txt > ${WRK_DIR}Bcell_internalClusters_individualHMRs_hpl.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."



```

    Starting.
    Made whitelist.
    Found whitelist regions that contain 3+ HMRs.
    Created double BED for whitelist regions that contain 3+ HMRs.
    Found internalClusters containing 3+ HMRs.
    
    
    Found the HMRs composing internalClusters containing 3+ HMRs.



```R
 bedtools merge -c 2 -o count -d 6000 -i ${BCL_FILE} | awk 'BEGIN{FS=OFS="\t"}{if ($4==2) print}' - | wc -l
```

    3734



```R
bedtools merge -c 2 -o count -d 6000 -i /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/Bcell.minsize50.filtforrefseqTSSexons.txt | awk 'BEGIN{FS=OFS="\t"}{if ($4==2) print}' - | wc -l
```

    3734



```R
wc -l ${WRK_DIR}Bcell_internalClusters_contain2HMRs_hpl.txt
```

    3602 /data/hodges_lab/Tim/ClusterTesting/Bcell_internalClusters_contain2HMRs_hpl.txt



```R
wc -l ${WRK_DIR}Bcell_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}Bcell_internalClusters_individualHMRs_hpl.txt

```

    7204 /data/hodges_lab/Tim/ClusterTesting/Bcell_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    5974 /data/hodges_lab/Tim/ClusterTesting/Bcell_internalClusters_individualHMRs_hpl.txt



```R
wc -l ${WRK_DIR}Bcell_unclustered_hpl.current.txt
wc -l ${WRK_DIR}Bcell_unclustered_hpl.RefSeqFilterFirst.txt
wc -l ${WRK_DIR}Bcell_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}Bcell_internalClusters_individualHMRs_hpl.txt
```

    17185 /data/hodges_lab/Tim/ClusterTesting/Bcell_unclustered_hpl.current.txt
    19959 /data/hodges_lab/Tim/ClusterTesting/Bcell_unclustered_hpl.RefSeqFilterFirst.txt
    7204 /data/hodges_lab/Tim/ClusterTesting/Bcell_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    5974 /data/hodges_lab/Tim/ClusterTesting/Bcell_internalClusters_individualHMRs_hpl.txt


# Liver 


```R
# Liver: Compute cluster groups 

CELLTYPE="Liver" #${CELLTYPE}

WRK_DIR=/data/hodges_lab/Tim/ClusterTesting/
mkdir -p ${WRK_DIR}

# RefSeq TSS/Exon file
TSSExon_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt 

# B cell - filtered for RefSeq TSS/Exon file 
FiltRefSeq_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/${CELLTYPE}.minsize50.filtforrefseqTSSexons.txt # Was BCL_FILE

wc -l ${FiltRefSeq_FILE}

# B cell - HMR file as downloaded
BASE_HMR_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs/Human_${CELLTYPE}.hmr.bed
wc -l ${BASE_HMR_FILE}



## Unclustered - current method 

awk 'BEGIN{OFS=FS="\t"}{if (($3-$2)>49) print $1,$2,$3}' ${BASE_HMR_FILE} | bedtools merge -c 2 -o count -d 6000 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - | bedtools intersect -v -a - -b ${TSSExon_FILE} > ${WRK_DIR}${CELLTYPE}_unclustered_hpl.current.txt

echo "Found unclustered HMRs."

## Unclustered - RefSeq filter first (More inclusive)

bedtools merge -c 2 -o count -d 6000 -i ${FiltRefSeq_FILE} | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > ${WRK_DIR}${CELLTYPE}_unclustered_hpl.RefSeqFilterFirst.txt

echo "Done."

### Unclustered - RefSeq - cell specific 

# bedtools intersect -u -a ${WRK_DIR}${CELLTYPE}_unclustered_hpl.RefSeqFilterFirst.txt -b /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/${CELLTYPE}_all_cellspecific_hpl.txt > ${WRK_DIR}${CELLTYPE}_unclustered_hpl.RefSeqFilterFirst.cellspecific.txt



## Clusters of two - internal clusters 

awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${TSSExon_FILE} | bedtools sort -i - | bedtools complement -i - -g /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/hg19.chrom.sizes.twoCol.sorted > ${WRK_DIR}${CELLTYPE}_whitelist.txt
echo "Made whitelist."

echo "Starting cluster compilation."

# (a) Find whitelist regions with 2+ HMRs
bedtools intersect -c -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelist.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{if ($4>1) print}' - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain2ormoreHMRs_hpl.txt
echo "Found whitelist regions that contain 2+ HMRs."





# (b)Find what HMRs are in these to create a double BED file in a parsable list for custom merging: [1-3]: BED coordinates of Whitelist region [4]: #HMR in Whitelist region, [5-7]: BED coordinates of HMRs in Whitelist region
# Diagnostic: bedtools intersect -loj -F 1.0 -a Bcell_whitelistRegions_contain3ormoreHMRs.txt -b Bcell.HMR.min50.txt | awk 'BEGIN{OFS=FS="\t"}{print}' - | bedtools sort -i - | head
# awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' temp.txt | head

bedtools intersect -loj -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain2ormoreHMRs_hpl.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_contain2ormoreHMRs_individualHMRs_temp_hpl.txt
echo "Created double BED for whitelist regions that contain 2+ HMRs."

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
}' ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_contain2ormoreHMRs_individualHMRs_temp_hpl.txt | awk 'BEGIN{OFS=FS="\t"}{if ($4==2) print $0}' - > ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl.txt

echo "Found internalClusters containing exactly 2 HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl_BED.txt
echo -e "\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a ${FiltRefSeq_FILE} -b ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl_BED.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_individualHMRs_hpl.txt
echo "Found the HMRs composing internalClusters containing exactly 2 HMRs."




## Clusters of three - internal clusters

echo "Starting 3+ cluster compilation."

# (a) Find whitelist regions with 3+ HMRs
bedtools intersect -c -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelist.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print}' - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain3ormoreHMRs_hpl.txt
echo "Found whitelist regions that contain 3+ HMRs."


bedtools intersect -loj -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain3ormoreHMRs_hpl.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_individualHMRs_temp_hpl.txt

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
}' ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_individualHMRs_temp_hpl.txt | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print $0}' - > ${WRK_DIR}${CELLTYPE}_internalClusters_hpl.txt
echo "Found internalClusters containing 3+ HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${WRK_DIR}${CELLTYPE}_internalClusters_hpl.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_hpl_BED.txt
echo -e "\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a ${FiltRefSeq_FILE} -b ${WRK_DIR}${CELLTYPE}_internalClusters_hpl_BED.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_individualHMRs_hpl.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."



echo "All merge -c 2 -d 6000 - naive"
 bedtools merge -c 2 -o count -d 6000 -i ${FiltRefSeq_FILE} | awk 'BEGIN{FS=OFS="\t"}{if ($4==2) print}' - | wc -l

wc -l ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl.txt
wc -l ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}${CELLTYPE}_internalClusters_individualHMRs_hpl.txt

```

    38132 /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/Liver.minsize50.filtforrefseqTSSexons.txt
    58652 /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs/Human_Liver.hmr.bed
    Found unclustered HMRs.
    Done.
    Made whitelist.
    Starting cluster compilation.
    Found whitelist regions that contain 2+ HMRs.
    Created double BED for whitelist regions that contain 2+ HMRs.
    Found internalClusters containing exactly 2 HMRs.
    
    
    Found the HMRs composing internalClusters containing exactly 2 HMRs.
    Starting 3+ cluster compilation.
    Found whitelist regions that contain 3+ HMRs.
    Created double BED for whitelist regions that contain 3+ HMRs.
    Found internalClusters containing 3+ HMRs.
    
    
    Found the HMRs composing internalClusters containing 3+ HMRs.
    All merge -c 2 -d 6000 - naive
    3770
    3667 /data/hodges_lab/Tim/ClusterTesting/Liver_internalClusters_contain2HMRs_hpl.txt
    7334 /data/hodges_lab/Tim/ClusterTesting/Liver_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    6636 /data/hodges_lab/Tim/ClusterTesting/Liver_internalClusters_individualHMRs_hpl.txt



```R
wc -l ${WRK_DIR}${CELLTYPE}_unclustered_hpl.current.txt
wc -l ${WRK_DIR}${CELLTYPE}_unclustered_hpl.RefSeqFilterFirst.txt
wc -l ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}${CELLTYPE}_internalClusters_individualHMRs_hpl.txt
```

    20470 /data/hodges_lab/Tim/ClusterTesting/Liver_unclustered_hpl.current.txt
    23460 /data/hodges_lab/Tim/ClusterTesting/Liver_unclustered_hpl.RefSeqFilterFirst.txt
    7334 /data/hodges_lab/Tim/ClusterTesting/Liver_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    6636 /data/hodges_lab/Tim/ClusterTesting/Liver_internalClusters_individualHMRs_hpl.txt


# H1 ESC


```R
# Liver: Compute cluster groups 

CELLTYPE="H1ESC" #${CELLTYPE}

WRK_DIR=/data/hodges_lab/Tim/ClusterTesting/
mkdir -p ${WRK_DIR}

# RefSeq TSS/Exon file
TSSExon_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt 

# B cell - filtered for RefSeq TSS/Exon file 
FiltRefSeq_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/${CELLTYPE}.minsize50.filtforrefseqTSSexons.txt # Was BCL_FILE

wc -l ${FiltRefSeq_FILE}

# B cell - HMR file as downloaded
BASE_HMR_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs/Human_${CELLTYPE}.hmr.bed
wc -l ${BASE_HMR_FILE}



## Unclustered - current method 

awk 'BEGIN{OFS=FS="\t"}{if (($3-$2)>49) print $1,$2,$3}' ${BASE_HMR_FILE} | bedtools merge -c 2 -o count -d 6000 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - | bedtools intersect -v -a - -b ${TSSExon_FILE} > ${WRK_DIR}${CELLTYPE}_unclustered_hpl.current.txt

echo "Found unclustered HMRs."

## Unclustered - RefSeq filter first (More inclusive)

bedtools merge -c 2 -o count -d 6000 -i ${FiltRefSeq_FILE} | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > ${WRK_DIR}${CELLTYPE}_unclustered_hpl.RefSeqFilterFirst.txt

echo "Done."

### Unclustered - RefSeq - cell specific 

# bedtools intersect -u -a ${WRK_DIR}${CELLTYPE}_unclustered_hpl.RefSeqFilterFirst.txt -b /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/${CELLTYPE}_all_cellspecific_hpl.txt > ${WRK_DIR}${CELLTYPE}_unclustered_hpl.RefSeqFilterFirst.cellspecific.txt



## Clusters of two - internal clusters 

awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${TSSExon_FILE} | bedtools sort -i - | bedtools complement -i - -g /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/hg19.chrom.sizes.twoCol.sorted > ${WRK_DIR}${CELLTYPE}_whitelist.txt
echo "Made whitelist."

echo "Starting cluster compilation."

# (a) Find whitelist regions with 2+ HMRs
bedtools intersect -c -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelist.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{if ($4>1) print}' - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain2ormoreHMRs_hpl.txt
echo "Found whitelist regions that contain 2+ HMRs."





# (b)Find what HMRs are in these to create a double BED file in a parsable list for custom merging: [1-3]: BED coordinates of Whitelist region [4]: #HMR in Whitelist region, [5-7]: BED coordinates of HMRs in Whitelist region
# Diagnostic: bedtools intersect -loj -F 1.0 -a Bcell_whitelistRegions_contain3ormoreHMRs.txt -b Bcell.HMR.min50.txt | awk 'BEGIN{OFS=FS="\t"}{print}' - | bedtools sort -i - | head
# awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' temp.txt | head

bedtools intersect -loj -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain2ormoreHMRs_hpl.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_contain2ormoreHMRs_individualHMRs_temp_hpl.txt
echo "Created double BED for whitelist regions that contain 2+ HMRs."

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
}' ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_contain2ormoreHMRs_individualHMRs_temp_hpl.txt | awk 'BEGIN{OFS=FS="\t"}{if ($4==2) print $0}' - > ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl.txt

echo "Found internalClusters containing exactly 2 HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl_BED.txt
echo -e "\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a ${FiltRefSeq_FILE} -b ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl_BED.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_individualHMRs_hpl.txt
echo "Found the HMRs composing internalClusters containing exactly 2 HMRs."




## Clusters of three - internal clusters

echo "Starting 3+ cluster compilation."

# (a) Find whitelist regions with 3+ HMRs
bedtools intersect -c -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelist.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print}' - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain3ormoreHMRs_hpl.txt
echo "Found whitelist regions that contain 3+ HMRs."


bedtools intersect -loj -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain3ormoreHMRs_hpl.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_individualHMRs_temp_hpl.txt

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
}' ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_individualHMRs_temp_hpl.txt | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print $0}' - > ${WRK_DIR}${CELLTYPE}_internalClusters_hpl.txt
echo "Found internalClusters containing 3+ HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${WRK_DIR}${CELLTYPE}_internalClusters_hpl.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_hpl_BED.txt
echo -e "\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a ${FiltRefSeq_FILE} -b ${WRK_DIR}${CELLTYPE}_internalClusters_hpl_BED.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_individualHMRs_hpl.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."



echo "All merge -c 2 -d 6000 - naive"
 bedtools merge -c 2 -o count -d 6000 -i ${FiltRefSeq_FILE} | awk 'BEGIN{FS=OFS="\t"}{if ($4==2) print}' - | wc -l

wc -l ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl.txt
wc -l ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}${CELLTYPE}_internalClusters_individualHMRs_hpl.txt

```

    18235 /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/H1ESC.minsize50.filtforrefseqTSSexons.txt
    36359 /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs/Human_H1ESC.hmr.bed
    Found unclustered HMRs.
    Done.
    Made whitelist.
    Starting cluster compilation.
    Found whitelist regions that contain 2+ HMRs.
    Created double BED for whitelist regions that contain 2+ HMRs.
    Found internalClusters containing exactly 2 HMRs.
    
    
    Found the HMRs composing internalClusters containing exactly 2 HMRs.
    Starting 3+ cluster compilation.
    Found whitelist regions that contain 3+ HMRs.
    Created double BED for whitelist regions that contain 3+ HMRs.
    Found internalClusters containing 3+ HMRs.
    
    
    Found the HMRs composing internalClusters containing 3+ HMRs.
    All merge -c 2 -d 6000 - naive
    1661
    1581 /data/hodges_lab/Tim/ClusterTesting/H1ESC_internalClusters_contain2HMRs_hpl.txt
    3162 /data/hodges_lab/Tim/ClusterTesting/H1ESC_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    1684 /data/hodges_lab/Tim/ClusterTesting/H1ESC_internalClusters_individualHMRs_hpl.txt



```R
wc -l ${WRK_DIR}H1ESC_unclustered_hpl.current.txt
wc -l ${WRK_DIR}H1ESC_unclustered_hpl.RefSeqFilterFirst.txt
wc -l ${WRK_DIR}H1ESC_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}H1ESC_internalClusters_individualHMRs_hpl.txt
```

    11605 /data/hodges_lab/Tim/ClusterTesting/H1ESC_unclustered_hpl.current.txt
    13152 /data/hodges_lab/Tim/ClusterTesting/H1ESC_unclustered_hpl.RefSeqFilterFirst.txt
    3162 /data/hodges_lab/Tim/ClusterTesting/H1ESC_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    1684 /data/hodges_lab/Tim/ClusterTesting/H1ESC_internalClusters_individualHMRs_hpl.txt



```R

```

# HSPC 


```R
# Liver: Compute cluster groups 

CELLTYPE="HSPC" #${CELLTYPE}

WRK_DIR=/data/hodges_lab/Tim/ClusterTesting/
mkdir -p ${WRK_DIR}

# RefSeq TSS/Exon file
TSSExon_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt 

# B cell - filtered for RefSeq TSS/Exon file 
FiltRefSeq_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/HSC.minsize50.filtforrefseqTSSexons.txt # Was BCL_FILE

wc -l ${FiltRefSeq_FILE}

# B cell - HMR file as downloaded
BASE_HMR_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs/Human_HSC.hmr.bed
wc -l ${BASE_HMR_FILE}



## Unclustered - current method 

awk 'BEGIN{OFS=FS="\t"}{if (($3-$2)>49) print $1,$2,$3}' ${BASE_HMR_FILE} | bedtools merge -c 2 -o count -d 6000 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - | bedtools intersect -v -a - -b ${TSSExon_FILE} > ${WRK_DIR}${CELLTYPE}_unclustered_hpl.current.txt

echo "Found unclustered HMRs."

## Unclustered - RefSeq filter first (More inclusive)

bedtools merge -c 2 -o count -d 6000 -i ${FiltRefSeq_FILE} | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > ${WRK_DIR}${CELLTYPE}_unclustered_hpl.RefSeqFilterFirst.txt

echo "Done."

### Unclustered - RefSeq - cell specific 

# bedtools intersect -u -a ${WRK_DIR}${CELLTYPE}_unclustered_hpl.RefSeqFilterFirst.txt -b /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/${CELLTYPE}_all_cellspecific_hpl.txt > ${WRK_DIR}${CELLTYPE}_unclustered_hpl.RefSeqFilterFirst.cellspecific.txt



## Clusters of two - internal clusters 

awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${TSSExon_FILE} | bedtools sort -i - | bedtools complement -i - -g /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/hg19.chrom.sizes.twoCol.sorted > ${WRK_DIR}${CELLTYPE}_whitelist.txt
echo "Made whitelist."

echo "Starting cluster compilation."

# (a) Find whitelist regions with 2+ HMRs
bedtools intersect -c -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelist.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{if ($4>1) print}' - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain2ormoreHMRs_hpl.txt
echo "Found whitelist regions that contain 2+ HMRs."





# (b)Find what HMRs are in these to create a double BED file in a parsable list for custom merging: [1-3]: BED coordinates of Whitelist region [4]: #HMR in Whitelist region, [5-7]: BED coordinates of HMRs in Whitelist region
# Diagnostic: bedtools intersect -loj -F 1.0 -a Bcell_whitelistRegions_contain3ormoreHMRs.txt -b Bcell.HMR.min50.txt | awk 'BEGIN{OFS=FS="\t"}{print}' - | bedtools sort -i - | head
# awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' temp.txt | head

bedtools intersect -loj -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain2ormoreHMRs_hpl.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_contain2ormoreHMRs_individualHMRs_temp_hpl.txt
echo "Created double BED for whitelist regions that contain 2+ HMRs."

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
}' ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_contain2ormoreHMRs_individualHMRs_temp_hpl.txt | awk 'BEGIN{OFS=FS="\t"}{if ($4==2) print $0}' - > ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl.txt

echo "Found internalClusters containing exactly 2 HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl_BED.txt
echo -e "\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a ${FiltRefSeq_FILE} -b ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl_BED.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_individualHMRs_hpl.txt
echo "Found the HMRs composing internalClusters containing exactly 2 HMRs."




## Clusters of three - internal clusters

echo "Starting 3+ cluster compilation."

# (a) Find whitelist regions with 3+ HMRs
bedtools intersect -c -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelist.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print}' - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain3ormoreHMRs_hpl.txt
echo "Found whitelist regions that contain 3+ HMRs."


bedtools intersect -loj -F 1.0 -a ${WRK_DIR}${CELLTYPE}_whitelistRegions_contain3ormoreHMRs_hpl.txt -b ${FiltRefSeq_FILE} | awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_individualHMRs_temp_hpl.txt

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
}' ${WRK_DIR}${CELLTYPE}_whitelistRegions_cluster_individualHMRs_temp_hpl.txt | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print $0}' - > ${WRK_DIR}${CELLTYPE}_internalClusters_hpl.txt
echo "Found internalClusters containing 3+ HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' ${WRK_DIR}${CELLTYPE}_internalClusters_hpl.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_hpl_BED.txt
echo -e "\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a ${FiltRefSeq_FILE} -b ${WRK_DIR}${CELLTYPE}_internalClusters_hpl_BED.txt > ${WRK_DIR}${CELLTYPE}_internalClusters_individualHMRs_hpl.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."



echo "All merge -c 2 -d 6000 - naive"
 bedtools merge -c 2 -o count -d 6000 -i ${FiltRefSeq_FILE} | awk 'BEGIN{FS=OFS="\t"}{if ($4==2) print}' - | wc -l

wc -l ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_hpl.txt
wc -l ${WRK_DIR}${CELLTYPE}_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}${CELLTYPE}_internalClusters_individualHMRs_hpl.txt

```

    46056 /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/HSC.minsize50.filtforrefseqTSSexons.txt
    67223 /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs/Human_HSC.hmr.bed
    Found unclustered HMRs.
    Done.
    Made whitelist.
    Starting cluster compilation.
    Found whitelist regions that contain 2+ HMRs.
    Created double BED for whitelist regions that contain 2+ HMRs.
    Found internalClusters containing exactly 2 HMRs.
    
    
    Found the HMRs composing internalClusters containing exactly 2 HMRs.
    Starting 3+ cluster compilation.
    Found whitelist regions that contain 3+ HMRs.
    Created double BED for whitelist regions that contain 3+ HMRs.
    Found internalClusters containing 3+ HMRs.
    
    
    Found the HMRs composing internalClusters containing 3+ HMRs.
    All merge -c 2 -d 6000 - naive
    5102
    4959 /data/hodges_lab/Tim/ClusterTesting/HSPC_internalClusters_contain2HMRs_hpl.txt
    9918 /data/hodges_lab/Tim/ClusterTesting/HSPC_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    8280 /data/hodges_lab/Tim/ClusterTesting/HSPC_internalClusters_individualHMRs_hpl.txt



```R
wc -l ${WRK_DIR}HSPC_unclustered_hpl.current.txt
wc -l ${WRK_DIR}HSPC_unclustered_hpl.RefSeqFilterFirst.txt
wc -l ${WRK_DIR}HSPC_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}HSPC_internalClusters_individualHMRs_hpl.txt
```

    23406 /data/hodges_lab/Tim/ClusterTesting/HSPC_unclustered_hpl.current.txt
    26732 /data/hodges_lab/Tim/ClusterTesting/HSPC_unclustered_hpl.RefSeqFilterFirst.txt
    9918 /data/hodges_lab/Tim/ClusterTesting/HSPC_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    8280 /data/hodges_lab/Tim/ClusterTesting/HSPC_internalClusters_individualHMRs_hpl.txt


# Numbers summary


```R
WRK_DIR=/data/hodges_lab/Tim/ClusterTesting/
```


```R
wc -l ${WRK_DIR}Bcell_unclustered_hpl.current.txt
wc -l ${WRK_DIR}Bcell_unclustered_hpl.RefSeqFilterFirst.txt
wc -l ${WRK_DIR}Bcell_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}Bcell_internalClusters_individualHMRs_hpl.txt

# 17185, 19959, 7204, 5974
```

    17185 /data/hodges_lab/Tim/ClusterTesting/Bcell_unclustered_hpl.current.txt
    19959 /data/hodges_lab/Tim/ClusterTesting/Bcell_unclustered_hpl.RefSeqFilterFirst.txt
    7204 /data/hodges_lab/Tim/ClusterTesting/Bcell_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    5974 /data/hodges_lab/Tim/ClusterTesting/Bcell_internalClusters_individualHMRs_hpl.txt



```R
wc -l ${WRK_DIR}Liver_unclustered_hpl.current.txt
wc -l ${WRK_DIR}Liver_unclustered_hpl.RefSeqFilterFirst.txt
wc -l ${WRK_DIR}Liver_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}Liver_internalClusters_individualHMRs_hpl.txt

# 20470, 23460, 7334, 6636
```

    20470 /data/hodges_lab/Tim/ClusterTesting/Liver_unclustered_hpl.current.txt
    23460 /data/hodges_lab/Tim/ClusterTesting/Liver_unclustered_hpl.RefSeqFilterFirst.txt
    7334 /data/hodges_lab/Tim/ClusterTesting/Liver_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    6636 /data/hodges_lab/Tim/ClusterTesting/Liver_internalClusters_individualHMRs_hpl.txt



```R
wc -l ${WRK_DIR}H1ESC_unclustered_hpl.current.txt
wc -l ${WRK_DIR}H1ESC_unclustered_hpl.RefSeqFilterFirst.txt
wc -l ${WRK_DIR}H1ESC_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}H1ESC_internalClusters_individualHMRs_hpl.txt

# 11605, 13152, 3162, 1684
```

    11605 /data/hodges_lab/Tim/ClusterTesting/H1ESC_unclustered_hpl.current.txt
    13152 /data/hodges_lab/Tim/ClusterTesting/H1ESC_unclustered_hpl.RefSeqFilterFirst.txt
    3162 /data/hodges_lab/Tim/ClusterTesting/H1ESC_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    1684 /data/hodges_lab/Tim/ClusterTesting/H1ESC_internalClusters_individualHMRs_hpl.txt



```R
wc -l ${WRK_DIR}HSPC_unclustered_hpl.current.txt
wc -l ${WRK_DIR}HSPC_unclustered_hpl.RefSeqFilterFirst.txt
wc -l ${WRK_DIR}HSPC_internalClusters_contain2HMRs_individualHMRs_hpl.txt
wc -l ${WRK_DIR}HSPC_internalClusters_individualHMRs_hpl.txt

# 23406, 26732, 9918, 8280
```

    23406 /data/hodges_lab/Tim/ClusterTesting/HSPC_unclustered_hpl.current.txt
    26732 /data/hodges_lab/Tim/ClusterTesting/HSPC_unclustered_hpl.RefSeqFilterFirst.txt
    9918 /data/hodges_lab/Tim/ClusterTesting/HSPC_internalClusters_contain2HMRs_individualHMRs_hpl.txt
    8280 /data/hodges_lab/Tim/ClusterTesting/HSPC_internalClusters_individualHMRs_hpl.txt


# Plot


```R
library(tidyverse)
library(ggplot2)
```

    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.1 ──
    
    [32m✔[39m [34mggplot2[39m 3.3.6     [32m✔[39m [34mpurrr  [39m 1.0.1
    [32m✔[39m [34mtibble [39m 3.2.1     [32m✔[39m [34mdplyr  [39m 1.1.1
    [32m✔[39m [34mtidyr  [39m 1.3.0     [32m✔[39m [34mstringr[39m 1.5.0
    [32m✔[39m [34mreadr  [39m 2.1.2     [32m✔[39m [34mforcats[39m 0.5.1
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    



```R
setwd("/data/hodges_lab/Tim/ClusterTesting/")
```

## Dataframe


```R
#> pwd
#/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles
#> wc -l *
#   34070 Bcell.minsize50.filtforrefseqTSSexons.txt
#   18235 H1ESC.minsize50.filtforrefseqTSSexons.txt
#   46056 HSC.minsize50.filtforrefseqTSSexons.txt
#   38132 Liver.minsize50.filtforrefseqTSSexons.txt

```


```R
# Unclustered:TSS/Exon-proximal
```


```R
df <- tibble(
    Celltype = c(rep("H1ESC", 5), rep("HSPC", 5), rep("B cell", 5), rep("Liver", 5)),
    HMRGroup = rep(c("Unclustered","Unclustered:Loose", "Unclustered:TSS/Exon-proximal", "2-HMR clusters", "3+HMR clusters"), 4),
    Count = c(11605, 13152, (13152-11605), 3162, 1684, 
              23406, 26732, (26732-23406), 9918, 8280, 
              17185, 19959, (19959-17185), 7204, 5974, 
              20470, 23460, (23460-20470), 7334, 6636),
    HMRTotal = c(rep(18235, 5), rep(46056, 5), rep(34070, 5), rep(38132, 5))
)
df
```


<table class="dataframe">
<caption>A tibble: 20 × 4</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>HMRGroup</th><th scope=col>Count</th><th scope=col>HMRTotal</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>H1ESC </td><td>Unclustered                  </td><td>11605</td><td>18235</td></tr>
	<tr><td>H1ESC </td><td>Unclustered:Loose            </td><td>13152</td><td>18235</td></tr>
	<tr><td>H1ESC </td><td>Unclustered:TSS/Exon-proximal</td><td> 1547</td><td>18235</td></tr>
	<tr><td>H1ESC </td><td>2-HMR clusters               </td><td> 3162</td><td>18235</td></tr>
	<tr><td>H1ESC </td><td>3+HMR clusters               </td><td> 1684</td><td>18235</td></tr>
	<tr><td>HSPC  </td><td>Unclustered                  </td><td>23406</td><td>46056</td></tr>
	<tr><td>HSPC  </td><td>Unclustered:Loose            </td><td>26732</td><td>46056</td></tr>
	<tr><td>HSPC  </td><td>Unclustered:TSS/Exon-proximal</td><td> 3326</td><td>46056</td></tr>
	<tr><td>HSPC  </td><td>2-HMR clusters               </td><td> 9918</td><td>46056</td></tr>
	<tr><td>HSPC  </td><td>3+HMR clusters               </td><td> 8280</td><td>46056</td></tr>
	<tr><td>B cell</td><td>Unclustered                  </td><td>17185</td><td>34070</td></tr>
	<tr><td>B cell</td><td>Unclustered:Loose            </td><td>19959</td><td>34070</td></tr>
	<tr><td>B cell</td><td>Unclustered:TSS/Exon-proximal</td><td> 2774</td><td>34070</td></tr>
	<tr><td>B cell</td><td>2-HMR clusters               </td><td> 7204</td><td>34070</td></tr>
	<tr><td>B cell</td><td>3+HMR clusters               </td><td> 5974</td><td>34070</td></tr>
	<tr><td>Liver </td><td>Unclustered                  </td><td>20470</td><td>38132</td></tr>
	<tr><td>Liver </td><td>Unclustered:Loose            </td><td>23460</td><td>38132</td></tr>
	<tr><td>Liver </td><td>Unclustered:TSS/Exon-proximal</td><td> 2990</td><td>38132</td></tr>
	<tr><td>Liver </td><td>2-HMR clusters               </td><td> 7334</td><td>38132</td></tr>
	<tr><td>Liver </td><td>3+HMR clusters               </td><td> 6636</td><td>38132</td></tr>
</tbody>
</table>




```R
df_frac <- df %>% mutate(Proportion = (Count/HMRTotal))

# Order cell types and HMR groups
df_frac$Celltype <- factor(df_frac$Celltype, levels = c("H1ESC","HSPC","B cell","Liver"))
df_frac$HMRGroup <- factor(df_frac$HMRGroup, levels = c("Unclustered","Unclustered:TSS/Exon-proximal","2-HMR clusters","3+HMR clusters","Unclustered:Loose"))

df_frac
```


<table class="dataframe">
<caption>A tibble: 20 × 5</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>HMRGroup</th><th scope=col>Count</th><th scope=col>HMRTotal</th><th scope=col>Proportion</th></tr>
	<tr><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>H1ESC </td><td>Unclustered                  </td><td>11605</td><td>18235</td><td>0.63641349</td></tr>
	<tr><td>H1ESC </td><td>Unclustered:Loose            </td><td>13152</td><td>18235</td><td>0.72125034</td></tr>
	<tr><td>H1ESC </td><td>Unclustered:TSS/Exon-proximal</td><td> 1547</td><td>18235</td><td>0.08483685</td></tr>
	<tr><td>H1ESC </td><td>2-HMR clusters               </td><td> 3162</td><td>18235</td><td>0.17340280</td></tr>
	<tr><td>H1ESC </td><td>3+HMR clusters               </td><td> 1684</td><td>18235</td><td>0.09234988</td></tr>
	<tr><td>HSPC  </td><td>Unclustered                  </td><td>23406</td><td>46056</td><td>0.50820740</td></tr>
	<tr><td>HSPC  </td><td>Unclustered:Loose            </td><td>26732</td><td>46056</td><td>0.58042383</td></tr>
	<tr><td>HSPC  </td><td>Unclustered:TSS/Exon-proximal</td><td> 3326</td><td>46056</td><td>0.07221643</td></tr>
	<tr><td>HSPC  </td><td>2-HMR clusters               </td><td> 9918</td><td>46056</td><td>0.21534653</td></tr>
	<tr><td>HSPC  </td><td>3+HMR clusters               </td><td> 8280</td><td>46056</td><td>0.17978114</td></tr>
	<tr><td>B cell</td><td>Unclustered                  </td><td>17185</td><td>34070</td><td>0.50440270</td></tr>
	<tr><td>B cell</td><td>Unclustered:Loose            </td><td>19959</td><td>34070</td><td>0.58582330</td></tr>
	<tr><td>B cell</td><td>Unclustered:TSS/Exon-proximal</td><td> 2774</td><td>34070</td><td>0.08142060</td></tr>
	<tr><td>B cell</td><td>2-HMR clusters               </td><td> 7204</td><td>34070</td><td>0.21144702</td></tr>
	<tr><td>B cell</td><td>3+HMR clusters               </td><td> 5974</td><td>34070</td><td>0.17534488</td></tr>
	<tr><td>Liver </td><td>Unclustered                  </td><td>20470</td><td>38132</td><td>0.53681947</td></tr>
	<tr><td>Liver </td><td>Unclustered:Loose            </td><td>23460</td><td>38132</td><td>0.61523130</td></tr>
	<tr><td>Liver </td><td>Unclustered:TSS/Exon-proximal</td><td> 2990</td><td>38132</td><td>0.07841183</td></tr>
	<tr><td>Liver </td><td>2-HMR clusters               </td><td> 7334</td><td>38132</td><td>0.19233190</td></tr>
	<tr><td>Liver </td><td>3+HMR clusters               </td><td> 6636</td><td>38132</td><td>0.17402706</td></tr>
</tbody>
</table>



## GGPlot2 call 


```R
pdf("/data/hodges_lab/Tim/HMRGroups_Bargraph.pdf")

pg <- df_frac %>% filter(!HMRGroup %in% c("Unclustered:Loose")) %>%
ggplot(aes(x = HMRGroup, y = Proportion, fill = Celltype)) +
geom_bar(width = .7, stat = "identity",  position = position_dodge(width=.9)) +
theme_minimal() +
scale_fill_manual(values=c("#615f5f","#87c4ba", "#389686", "#72b1db")) +
theme(aspect.ratio = .5)
pg

dev.off()
```


<strong>png:</strong> 2



```R

```


```R

```
