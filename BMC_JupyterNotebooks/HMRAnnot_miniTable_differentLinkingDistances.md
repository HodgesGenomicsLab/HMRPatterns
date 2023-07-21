# HMR Annotation by clustering group
### Options:
-Unclustered<br>
-Cluster of 2: Promoter proximal (One of the two elements is a promoter)<br>
-Cluster of 2<br>
-Cluster of 3+<br>

## Previous code used in a slrm script


```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=0:30:00
#SBATCH --mem=10G
#SBATCH --output=HMRAnnot.out

HMRAnnoDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/PieChart
cd ${HMRAnnoDir}

# TSSExonRef
TSSExonRef="/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt"

for celltype in H1ESC fSpinal Bcell HSC Liver 
do
	echo ${celltype}
	startingBEDFileDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs
	baseFile=$startingBEDFileDir/${celltype}.hmr.bed

	# Count unclustered
	echo "Unclustered: "${celltype}
	wc -l /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/${celltype}\_unclustered.txt 

#	# Count otherwise unclustered, but near promoters/exons
#	bedtools intersect -v -a ${baseFile} -b ${TSSExonRef} | bedtools merge -c 2 -o count -d 6000 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - > temp_unclustered.txt
#	echo "Unclustered - ALL:"${celltype}
#	wc -l temp_unclustered.txt

#	# Count clusters of 2 
#	echo "Clusters of 2: "${celltype}
#	bedtools intersect -v -a ${baseFile} -b ${TSSExonRef} | bedtools merge -c 2 -o count -d 6000 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4==2) print}' - | wc -l

	# Count clusters of 3+ 
	echo "Clustered 3+: "${celltype}
	wc -l /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/${celltype}\_internalClusters_individualHMRs.txt  
	echo ""
	echo ""
	echo ""
	echo ""
done

```


```bash
HMRAnnoDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/PieChart
cd ${HMRAnnoDir}

# TSSExonRef
TSSExonRef="/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt"

for celltype in Bcell
do
	echo ${celltype}
	startingBEDFileDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs
	baseFile=$startingBEDFileDir/${celltype}.hmr.bed

	# Count unclustered
	echo "Unclustered: "${celltype}
	wc -l /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/${celltype}\_unclustered_hpl.txt 

#	# Count otherwise unclustered, but near promoters/exons
#	bedtools intersect -v -a ${baseFile} -b ${TSSExonRef} | bedtools merge -c 2 -o count -d 6000 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - > temp_unclustered.1.txt
#	echo "Unclustered - ALL:"${celltype}
#	wc -l temp_unclustered.1.txt

#	# Count clusters of 2 
#	echo "Clusters of 2: "${celltype}
#	bedtools intersect -v -a ${baseFile} -b ${TSSExonRef} | bedtools merge -c 2 -o count -d 6000 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4==2) print}' - | wc -l

	# Count clusters of 3+ 
	echo "Clustered 3+: "${celltype}
	wc -l /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/${celltype}\_internalClusters_individualHMRs.txt  
	echo ""
	echo ""
	echo ""
	echo ""
done
```

    Bcell
    Unclustered: Bcell
    17185 /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_unclustered_hpl.txt
    Unclustered - ALL:Bcell
    20021 temp_unclustered.1.txt
    Clusters of 2: Bcell
    3745
    Clustered 3+: Bcell
    5974 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters_individualHMRs.txt
    
    
    
    


# Need to run this process against HMRs clustered based on two different linking distances: 10,500bp and 12,500bp


```bash
HMRAnnoDir_10500=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_10500/
HMRAnnoDir_12500=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_12500/
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRAnnoCounts_10500_12500/
mkdir -p $outDir


# TSSExonRef
TSSExonRef="/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/referenceFiles/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt"

# In this case, will perform on Bcell only 
for linkDist in 10500 12500
do
	echo ${linkDist}
	startingBEDFileDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs
	baseFile=$startingBEDFileDir/Bcell.hmr.bed

	# Count unclustered
	echo "Unclustered: Bcell"
	wc -l /data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_${linkDist}/Bcell_unclustered.txt > out1.temp.txt

#	# Count otherwise unclustered, but near promoters/exons
#	bedtools intersect -v -a ${baseFile} -b ${TSSExonRef} | bedtools merge -c 2 -o count -d ${linkDist} -i - | \
#awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - > temp_unclustered.txt
#	echo "Unclustered - Promoter Proximal: Bcell"
#	wc -l temp_unclustered.txt > out2.temp.temp.txt
    paste out1.temp.txt out2.temp.temp.txt | awk '{print $3-$1,"Unclustered: Promoter proximal"}' > out2.temp.txt

#	# Count clusters of 2 
#	echo "Clusters of 2: Bcell"
#    echo "Unclustered 2" > outName.temp.txt
#	bedtools intersect -v -a ${baseFile} -b ${TSSExonRef} | bedtools merge -c 2 -o count -d ${linkDist} -i - | \
#    awk 'BEGIN{FS=OFS="\t"}{if ($4==2) print}' - | wc -l | paste - outName.temp.txt > out3.temp.txt

	# Count clusters of 3+ 
	echo "Clustered 3+: Bcell"
	wc -l /data/hodges_lab/Tim/finalAnalyses_HMRs/linkingDists/HMRs_${linkDist}/Bcell_internalClusters_individualHMRs.txt \
    > out4.temp.txt
    
    
    # Combine and save in txt file
    cat out1.temp.txt out2.temp.txt out3.temp.txt out4.temp.txt \
    > ${outDir}HMRClustGroupCount_${linkDist}.txt
	echo ""
	echo ""
	echo ""
	echo ""
    rm out*.temp.txt
done

```

    10500
    Unclustered: Bcell
    Unclustered - Promoter Proximal: Bcell
    Clusters of 2: Bcell
    Clustered 3+: Bcell
    
    
    
    
    12500
    Unclustered: Bcell
    Unclustered - Promoter Proximal: Bcell
    Clusters of 2: Bcell
    Clustered 3+: Bcell
    
    
    
    

