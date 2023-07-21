```bash
# HMR Annotation - Hematopoietic Lineage
```

# Format RefSeq promoters and exons


```bash

# Working directory: 
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles

######  Get promoters
# Starting files: ncbiRefSeqCurated_promotersUpstream2000.txt
#### (1) Add ID column baed on the current ID column ($4) so that IDs match across files (e.g. NM_001308203.2_exon_0_0_chr1_66999276_f --> NM_001308203.2); truncate after second _
paste ncbiRefSeqCurated_promotersUpstream2000.txt <(awk 'BEGIN{OFS=FS="\t"}{print $4}' ncbiRefSeqCurated_promotersUpstream2000.txt | awk 'BEGIN{OFS="_";FS="_"}{print $1,$2}' - ) > ncbiRefSeqCurated_promotersUpstream2000.IDcolAdded.txt 
#### (2) Filter out extras cols and rows that are not NM genes
awk 'BEGIN{OFS=FS="\t"}{if ($7~/NM/) print $1,$2,$3,$7,$6}' ncbiRefSeqCurated_promotersUpstream2000.IDcolAdded.txt > ncbiRefSeqCurated_NM.promotersUpstream2000.txt # 59425
# 		(2a) Sort with bash 
sort -t$'\t' -k1,1 -k2,2n -k3,3n ncbiRefSeqCurated_NM.promotersUpstream2000.txt > ncbiRefSeqCurated_NM.promotersUpstream2000.bashSorted.txt # 59425


#### (3) Check the strand direction, and add 1000 downstream to each promoter
# Instead of writing a horrible awk script, might be clearer and safer to write two awk scripts, one for each strand
# 		(3a) Add a few columns at the end  to check genome lengths 
# sort -k1,1n -k2,2n -k3,3n  hg19.chrom.sizes > hg19.chrom.sizes.sorted
join -t$'\t' -j 1 -o 1.1,1.2,1.3,1.4,1.5,2.2 <(sort -t$'\t' -k1,1 -k2,2n -k3,3n ncbiRefSeqCurated_NM.promotersUpstream2000.bashSorted.txt) <(sort -t$'\t' -k1,1 -k2,2n -k3,3n hg19.chrom.sizes.sorted) > ncbiRefSeqCurated_NM.promotersUpstream2000_withChromLengths.txt # 56099
###	 	(3a1) CHECK TO MAKE SURE THIS SHORTER FILE IS KOSHER
 #  59425 ncbiRefSeqCurated_NM.promotersUpstream2000.txt
 #  56099 ncbiRefSeqCurated_NM.promotersUpstream2000_withChromLengths.txt

# WHY IS THE withChromLength file shorter! Find the lines lost
comm -2 -3 <(sort ncbiRefSeqCurated_NM.promotersUpstream2000.bashSorted.txt) <(sort <(awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,$4,$5}' ncbiRefSeqCurated_NM.promotersUpstream2000_withChromLengths.txt)) | sort -t$'\t' -k1,1 -k2,2n -k3,3n - > PromotersWithoutAChromSizeRef.txt

# Okay, check if any HMRs are on these contigs
awk 'BEGIN{OFS=FS="\t"}{print $1}' /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs/Adrenal.hmr.bed > Adrenal.hmr.bed.chrCol.txt
awk 'BEGIN{OFS=FS="\t"}{print $1}' /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs/Bcell.hmr.bed > Bcell.hmr.bed.chrCol.txt
awk 'BEGIN{OFS=FS="\t"}{print $1}' /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs/fHeart.hmr.bed > fHeart.hmr.bed.chrCol.txt
awk 'BEGIN{OFS=FS="\t"}{print $1}' /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs/fSpinal.hmr.bed > fSpinal.hmr.bed.chrCol.txt
awk 'BEGIN{OFS=FS="\t"}{print $1}' /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs/H1ESC.hmr.bed > H1ESC.hmr.bed.chrCol.txt
awk 'BEGIN{OFS=FS="\t"}{print $1}' /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/startingBEDs/Liver.hmr.bed > Liver.hmr.bed.chrCol.txt

awk 'BEGIN{OFS=FS="\t"}{print $1}' PromotersWithoutAChromSizeRef.txt > PromotersWithoutAChromSizeRef.chrCol.txt
comm -1 -2 <(sort Adrenal.hmr.bed.chrCol.txt) <(sort PromotersWithoutAChromSizeRef.chrCol.txt)
comm -1 -2 <(sort Bcell.hmr.bed.chrCol.txt) <(sort PromotersWithoutAChromSizeRef.chrCol.txt)
comm -1 -2 <(sort fHeart.hmr.bed.chrCol.txt) <(sort PromotersWithoutAChromSizeRef.chrCol.txt)
comm -1 -2 <(sort fSpinal.hmr.bed.chrCol.txt) <(sort PromotersWithoutAChromSizeRef.chrCol.txt)
comm -1 -2 <(sort H1ESC.hmr.bed.chrCol.txt) <(sort PromotersWithoutAChromSizeRef.chrCol.txt)
comm -1 -2 <(sort Liver.hmr.bed.chrCol.txt) <(sort PromotersWithoutAChromSizeRef.chrCol.txt)
# NONE ARE IN THE CONTIGS! Throw them out! Maybe. 


#  ADD DOWNSTREAM 1000
###		(3b) + strand; Add 1000, check if this passes the genome boundary, and if so, print that
awk 'BEGIN{OFS=FS="\t"}{if ($5=="+") print}'  ncbiRefSeqCurated_NM.promotersUpstream2000_withChromLengths.txt > ncbiRefSeqCurated_NM.promotersUpstream2000_withChromLengths.plusStrand.txt
# Use the last col (Chromosome length) to compare ChrEnd value +1000
awk 'BEGIN{OFS=FS="\t"}{if (($3+1000)<$6) print $1,$2,($3+1000),$4,$5; else print $1,$2,$6,$4,$5}' ncbiRefSeqCurated_NM.promotersUpstream2000_withChromLengths.plusStrand.txt > ncbiRefSeqCurated_NM.promotersUpstream2000.plusStrand.downstream1000.txt

#		(3c) - strand; Subtract 1000, check if this passes the genome boundary, and if so, print that 
awk 'BEGIN{OFS=FS="\t"}{if ($5=="-") print}'  ncbiRefSeqCurated_NM.promotersUpstream2000_withChromLengths.txt > ncbiRefSeqCurated_NM.promotersUpstream2000_withChromLengths.minusStrand.txt
# Check to make sure adding 1000 downtream of a minus strand promoter won't go below 0
awk 'BEGIN{OFS=FS="\t"}{if (($2-1000)>0) print $1,($2-1000),$3,$4,$5; else print $1,0,$3,$4,$5}' ncbiRefSeqCurated_NM.promotersUpstream2000_withChromLengths.minusStrand.txt > ncbiRefSeqCurated_NM.promotersUpstream2000.minusStrand.downstream1000.txt

### (4) Combine [+] and [-] strands
cat ncbiRefSeqCurated_NM.promotersUpstream2000.plusStrand.downstream1000.txt ncbiRefSeqCurated_NM.promotersUpstream2000.minusStrand.downstream1000.txt | bedtools sort -i - > ncbiRefSeqCurated_NM.promoters.Upstream2000Downstream1000.txt



#### Get exons
# Starting file: ncbiRefSeqCurated_exonsBED.txt 
# (1) Add ID column baed on the current ID column so that IDs match across files (e.g. NM_001308203.2_exon_0_0_chr1_66999276_f --> NM_001308203); truncate after second _
# (2) Selet rows(exons) that correspond to "NM" genes as per the ID
paste ncbiRefSeqCurated_exonsBED.txt <(awk 'BEGIN{OFS=FS="\t"}{print $4}' ncbiRefSeqCurated_exonsBED.txt | awk 'BEGIN{OFS="_";FS="_"}{print $1,$2}' - ) > ncbiRefSeqCurated_exonsBED.IDcolAdded.txt # 774,7442
# Filter out extras cols and rows that are not NM genes
awk 'BEGIN{OFS=FS="\t"}{if ($7~/NM/) print $1,$2,$3,$7}' ncbiRefSeqCurated_exonsBED.IDcolAdded.txt > ncbiRefSeqCurated_NM.exons.txt # 668009




#### Combine promoters and exons
cat <(awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,$4}' ncbiRefSeqCurated_NM.promoters.Upstream2000Downstream1000.txt) ncbiRefSeqCurated_NM.exons.txt | bedtools sort -i > ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt 





```

# Download and format HMRs


```bash
# DOWNLOADS
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs

# [ CT ] - [ Coverage % ]
# Adrenal - 71.558
# http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Adrenal-gland/tracks_hg19/
# wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Adrenal-gland/tracks_hg19/Human_Adrenal-gland.hmr.bb

# B cell - 11.855
# http://smithdata.usc.edu/methbase/data/Hodges-Human-2011/Human_BCell/tracks_hg19/
# wget http://smithdata.usc.edu/methbase/data/Hodges-Human-2011/Human_BCell/tracks_hg19/Human_BCell.hmr.bb

# Fetal Heart - 37.134
# http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Fetal-Heart/tracks_hg19/
# wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Fetal-Heart/tracks_hg19/Human_Fetal-Heart.hmr.bb

# Fetal Spinal - 33.623
# http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Fetal-Spinal-Cord/tracks_hg19/
# wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Fetal-Spinal-Cord/tracks_hg19/Human_Fetal-Spinal-Cord.hmr.bb

# H1ESC - 25.933
# http://smithdata.usc.edu/methbase/data/Lister-ESC-2009/Human_H1ESC/tracks_hg19/
# wget http://smithdata.usc.edu/methbase/data/Lister-ESC-2009/Human_H1ESC/tracks_hg19/Human_H1ESC.hmr.bb

# Liver - 49.478
# http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Liver/tracks_hg19/
# wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Liver/tracks_hg19/Human_Liver.hmr.bb

# Macrophage - 36.130
# http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Macrophage/tracks_hg19/
# wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Macrophage/tracks_hg19/Human_Macrophage.hmr.bb

# Neutrophil - 11.329
# http://smithdata.usc.edu/methbase/data/Hodges-Human-2011/Human_Neut/tracks_hg19/
# wget http://smithdata.usc.edu/methbase/data/Hodges-Human-2011/Human_Neut/tracks_hg19/Human_Neut.hmr.bb

# T cell - 11.855
# http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Tcell/tracks_hg19/
# wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Tcell/tracks_hg19/Human_Tcell.hmr.bb

# HSC - 37.562
# http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Tcell/tracks_hg19/
# wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_HSC/tracks_hg19/Human_HSC.hmr.bb

# Inconsistent 3-5 columns
# Convert to Bed
./bigBedToBed Human_Adrenal-gland.hmr.bb Human_Adrenal-gland.hmr.bed
./bigBedToBed Human_BCell.hmr.bb Human_BCell.hmr.bed
./bigBedToBed Human_Fetal-Heart.hmr.bb Human_Fetal-Heart.hmr.bed
./bigBedToBed Human_Fetal-Spinal-Cord.hmr.bb Human_Fetal-Spinal-Cord.hmr.bed
./bigBedToBed Human_H1ESC.hmr.bb Human_H1ESC.hmr.bed
./bigBedToBed Human_Liver.hmr.bb Human_Liver.hmr.bed
./bigBedToBed Human_Macrophage.hmr.bb Human_Macrophage.hmr.bed
./bigBedToBed Human_Neut.hmr.bb Human_Neut.hmr.bed
./bigBedToBed Human_Tcell.hmr.bb Human_Tcell.hmr.bed
./bigBedToBed Human_HSC.hmr.bb Human_HSC.hmr.bed


# Trim to 3 columns
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' Human_Adrenal-gland.hmr.bed > Adrenal.hmr.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' Human_BCell.hmr.bed > Bcell.hmr.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' Human_Fetal-Heart.hmr.bed > fHeart.hmr.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' Human_Fetal-Spinal-Cord.hmr.bed > fSpinal.hmr.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' Human_H1ESC.hmr.bed > H1ESC.hmr.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' Human_Liver.hmr.bed > Liver.hmr.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' Human_Macrophage.hmr.bed > Macrophage.hmr.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' Human_Neut.hmr.bed > Neutrophil.hmr.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' Human_Tcell.hmr.bed > Tcell.hmr.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' Human_HSC.hmr.bed > HSC.hmr.bed


# Add a size column as a new file
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,($3-$2)}' Adrenal.hmr.bed > Adrenal.hmr.sizes.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,($3-$2)}' Bcell.hmr.bed > Bcell.hmr.sizes.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,($3-$2)}' fHeart.hmr.bed > fHeart.hmr.sizes.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,($3-$2)}' fSpinal.hmr.bed > fSpinal.hmr.sizes.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,($3-$2)}' H1ESC.hmr.bed > H1ESC.hmr.sizes.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,($3-$2)}' Liver.hmr.bed > Liver.hmr.sizes.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,($3-$2)}' Macrophage.hmr.bed > Macrophage.hmr.sizes.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,($3-$2)}' Neutrophil.hmr.bed > Neutrophil.hmr.sizes.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,($3-$2)}' Tcell.hmr.bed > Tcell.hmr.sizes.bed
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,($3-$2)}' HSC.hmr.bed > HSC.hmr.sizes.bed


# Look at minimum sizes
for CELL in Adrenal Bcell fHeart fSpinal H1ESC Liver Macrophage Neutrophil Tcell
do
echo ${CELL}
sort -k 4n ${CELL}.hmr.sizes.bed | head -n 10
done


```

## Make Hematopoietic lineage files if needed 


```bash
# 2_01_make_hplineage_filtsizeandrefseq_files_hpl.sh
# short script to combine B/T, M/N, and M/N/T/B

# COMBINE HMR.BED FILES
# Directory and in_files:
HMRBED_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs
BCELL_HMRBEDFILE=${HMRBED_DIR}/Bcell.hmr.bed
TCELL_HMRBEDFILE=${HMRBED_DIR}/Tcell.hmr.bed
MACRO_HMRBEDFILE=${HMRBED_DIR}/Macrophage.hmr.bed
NEUT_HMRBEDFILE=${HMRBED_DIR}/Neutrophil.hmr.bed

# Out_files:
BT_HMRBEDOUTFILE=${HMRBED_DIR}/BT.hmr.bed
MN_HMRBEDOUTFILE=${HMRBED_DIR}/MN.hmr.bed
MNBT_HMRBEDOUTFILE=${HMRBED_DIR}/MNBT.hmr.bed


# B/T
cat ${BCELL_HMRBEDFILE} ${TCELL_HMRBEDFILE} | bedtools sort -i - | bedtools merge -c 2 -o count -i - | awk 'BEGIN{OFS=FS="\t"}{if ($4>1) print}' - > ${BT_HMRBEDOUTFILE}

# M/N
cat ${MACRO_HMRBEDFILE} ${NEUT_HMRBEDFILE} | bedtools sort -i - | bedtools merge -c 2 -o count -i - | awk 'BEGIN{OFS=FS="\t"}{if ($4>1) print}' - > ${MN_HMRBEDOUTFILE}

# M/N/B/T
awk 'BEGIN{OFS=FS="\t"}{print $0,"Bcell"}' ${BCELL_HMRBEDFILE} > ${BCELL_HMRBEDFILE}.temp
awk 'BEGIN{OFS=FS="\t"}{print $0,"Tcell"}' ${TCELL_HMRBEDFILE} > ${TCELL_HMRBEDFILE}.temp
awk 'BEGIN{OFS=FS="\t"}{print $0,"Macro"}' ${MACRO_HMRBEDFILE} > ${MACRO_HMRBEDFILE}.temp
awk 'BEGIN{OFS=FS="\t"}{print $0,"Neut"}' ${NEUT_HMRBEDFILE} > ${NEUT_HMRBEDFILE}.temp
cat ${BCELL_HMRBEDFILE}.temp ${TCELL_HMRBEDFILE}.temp ${MACRO_HMRBEDFILE}.temp ${NEUT_HMRBEDFILE}.temp | bedtools sort -i - | bedtools merge -c 4 -o count_distinct -i - | awk 'BEGIN{OFS=FS="\t"}{if ($4>3) print}' - > ${MNBT_HMRBEDOUTFILE}



awk 'BEGIN{OFS=FS="\t"}{print $0,Bcell}' ${BCELL_HMRBEDFILE} | head



# COMBINE FILT REF SEQ FILES
# Directory and in_files:
HMR_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles
BCELL_FILE=${HMR_DIR}/Bcell.minsize50.filtforrefseqTSSexons.txt
TCELL_FILE=${HMR_DIR}/Tcell.minsize50.filtforrefseqTSSexons.txt
MACRO_FILE=${HMR_DIR}/Macrophage.minsize50.filtforrefseqTSSexons.txt
NEUT_FILE=${HMR_DIR}/Neutrophil.minsize50.filtforrefseqTSSexons.txt

# Out_files:
BT_OUTFILE=${HMR_DIR}/BT.minsize50.filtforrefseqTSSexons.txt
MN_OUTFILE=${HMR_DIR}/MN.minsize50.filtforrefseqTSSexons.txt
MNBT_OUTFILE=${HMR_DIR}/MNBT.minsize50.filtforrefseqTSSexons.txt


# B/T
cat ${BCELL_FILE} ${TCELL_FILE} | bedtools sort -i - | bedtools merge -c 2 -o count -i - | awk 'BEGIN{OFS=FS="\t"}{if ($4>1) print}' - > ${BT_OUTFILE}

# M/N
cat ${MACRO_FILE} ${NEUT_FILE} | bedtools sort -i - | bedtools merge -c 2 -o count -i - | awk 'BEGIN{OFS=FS="\t"}{if ($4>1) print}' - > ${MN_OUTFILE}

# M/N/B/T
awk 'BEGIN{OFS=FS="\t"}{print $0,"Bcell"}' ${BCELL_FILE} > ${BCELL_FILE}.temp
awk 'BEGIN{OFS=FS="\t"}{print $0,"Tcell"}' ${TCELL_FILE} > ${TCELL_FILE}.temp
awk 'BEGIN{OFS=FS="\t"}{print $0,"Macro"}' ${MACRO_FILE} > ${MACRO_FILE}.temp
awk 'BEGIN{OFS=FS="\t"}{print $0,"Neut"}' ${NEUT_FILE} > ${NEUT_FILE}.temp
cat ${BCELL_FILE}.temp ${TCELL_FILE}.temp ${MACRO_FILE}.temp ${NEUT_FILE}.temp | bedtools sort -i - | bedtools merge -c 4 -o count_distinct -i - | awk 'BEGIN{OFS=FS="\t"}{if ($4>3) print}' - > ${MNBT_OUTFILE}






```

# Filter size and RefSeq 

## Script code


```bash
# Script to size filter, then cross ref vs RefSeq TSS/Exons
# 2 steps: #1 filt size, #2 filt for refseq
# usage: sh filtsizeandrefseq.sh [file] [size]; e.g. sh filtsizeandrefseq.sh Bcell.hmr.bed 50

# Variables:
infile="$1"
size="$2"
infileDir="$3"
outfileDir="$4"

# Directories:
referenceDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles

# File names used within this script
infileName=${infile%%.*}
outName=$infileName.minsize$size.filtforrefseqTSSexons.txt


# Filter by minimum size | Filter by promoters and exons
awk -v size="$size" 'BEGIN{OFS=FS="\t"}{if (($3-$2)>(size-1)) {print $1,$2,$3,($3-$2)}}' $infileDir/$infile | bedtools intersect -v -a - -b $referenceDir/ncbiRefSeqCurated_NM.promotersAndExons.txt > $outfileDir/$outName

```

## Running script loop


```bash
# 2_run_filtsizeandrefseq_acrossCelltypes_hpl.sh
# Simple script to automate passing all CTs through the filtsizeandrefseq script

# Uses: 
# 	- filtsizeandrefseq.sh

# Variables:
SCRIPT_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/scripts/helperScripts
IN_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs
OUT_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles # Currently handled by the filtsizeandrefseq script.

for CELLTYPE in Adrenal Bcell fHeart fSpinal H1ESC Liver Macrophage Neutrophil Tcell HSC
do
	sh ${SCRIPT_DIR}/filtsizeandrefseq_hpl.sh ${CELLTYPE}.hmr.bed 50 ${IN_DIR} ${OUT_DIR}
done
```

# Make anti files

## Script code


```bash
# make_anti.sh
# Usage: sh make_anti.sh [anchor CT name] [other cell type HMR files]
# Usage example: sh make_anti.sh Adrenal Bcell.hmr.bed fHeart.hmr.bed [...]
# This script is designed to take any length of "other" comparison inputs

infilesDir=$1
outfileDir=$2
Anchor_CT=$3
shift 3
Other_Files="$@"

# Cat all the other files together | sort this list | merge to simplify regions with high overlap 
cd $infilesDir
cat $Other_Files | bedtools sort -i - | bedtools merge -i - > $outfileDir/anti_${Anchor_CT}\_hpl.txt

```

## Code to run script on all cell types


```bash
# Uses: 
# 	- filtsizeandrefseq.sh

# Usage: sh make_anti.sh [anchor CT name] [other cell type HMR files]
# Usage example: sh make_anti.sh Adrenal Bcell.hmr.bed fHeart.hmr.bed [...]
SCRIPT_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/scripts/helperScripts
IN_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles
OUT_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/antiFiles

sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} Adrenal Bcell.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Neutrophil.minsize50.filtforrefseqTSSexons.txt Tcell.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt

sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} Bcell Adrenal.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Neutrophil.minsize50.filtforrefseqTSSexons.txt Tcell.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt

sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} fHeart Adrenal.minsize50.filtforrefseqTSSexons.txt Bcell.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Neutrophil.minsize50.filtforrefseqTSSexons.txt Tcell.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt

sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} fSpinal Adrenal.minsize50.filtforrefseqTSSexons.txt Bcell.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Neutrophil.minsize50.filtforrefseqTSSexons.txt Tcell.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt

sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} H1ESC Adrenal.minsize50.filtforrefseqTSSexons.txt Bcell.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Neutrophil.minsize50.filtforrefseqTSSexons.txt Tcell.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt

sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} Liver Adrenal.minsize50.filtforrefseqTSSexons.txt Bcell.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Neutrophil.minsize50.filtforrefseqTSSexons.txt Tcell.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt

sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} Macrophage Adrenal.minsize50.filtforrefseqTSSexons.txt Bcell.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt Neutrophil.minsize50.filtforrefseqTSSexons.txt Tcell.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt

sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} Neutrophil Adrenal.minsize50.filtforrefseqTSSexons.txt Bcell.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Tcell.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt

sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} Tcell Adrenal.minsize50.filtforrefseqTSSexons.txt Bcell.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Neutrophil.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt

sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} HSC Adrenal.minsize50.filtforrefseqTSSexons.txt Bcell.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Neutrophil.minsize50.filtforrefseqTSSexons.txt Tcell.minsize50.filtforrefseqTSSexons.txt

# HP LINEAGE COMBINATIONS
# B/T
sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} BT Adrenal.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Neutrophil.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt

# M/N
sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} MN Adrenal.minsize50.filtforrefseqTSSexons.txt Bcell.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt  Tcell.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt

# M/N/B/T
sh ${SCRIPT_DIR}/make_anti_hpl.sh ${IN_DIR} ${OUT_DIR} MNBT Adrenal.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt




```

# Run annotation script

## Script code


```bash
# This script is designed to 
# Usage: sh annotate_HMRs.sh [CT] [CT BED file] [anti-CT BED file] [Blacklist regions for custom merge - "internal clusters"]  
# Example usage: sh annotate_HMRs_totalClusters.sh Adrenal Adrenal.minsize50.filtforrefseqTSSexons.txt anti_Adrenal.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/referenceFiles/ncbiRefSeqCurated_NM.promotersAndExons.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/filtRefSeqFiles /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/antiFiles


# INPUT: 
# (1) CT Name # for naming conventions
# (2) CT BED file
# (3) Anti-CT file
# (4) Reference file for blacklist
# (5) Output directory
# (6) Input directory # generally filtRefSeq dir
# (7) Anti-CT directory


# OUTPUT (11): Clustered/Unclustered files further delineated by cell-type specificity - up to four different levels of celltype membership binning
# (0) All_cellspecific
# (00) All_shared

# (1) CT_unclustered
# (2) CT_unclustered_cellspecific
# (3) CT_unclustered_shared

# (4) CT_clustered_endToEnd
# (5) CT_clustered_individualHMRs
# (6) CT_clustered_individualHMRs_cellspecific
# (7) CT_clustered_individualHMRs_shared
# (8) internalClusters_containsCS
# (9) internalClusters_withoutCS



######################       ISSUE REGIONS       ############################
# chr10	22623401	22623588 - Says Lineage, but one of those with HMRs spannign TSS/Exon
# Remake "Other" file:
#			cat Rvent.HMR.min50.txt Liver.HMR.min50.txt H1ESC.HMR.min50.txt | bedtools sort -i > Rvent.Liver.H1ESC.min50.txt

################################################################################

# Variables #Expects 5 cell type BED files as input
CT=$1
CTFile=$2 # From inDir
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
echo "Blacklist found: ${TSSExonRef}"
echo ""
echo ""
echo ""




################################################################################
# Find ALL HMRs
echo "Finding all cell specific and shared HMRs"

##### ((0)) ALL_cellspecific
##### Exclude HMRs overlapping with blacklist | Exclude HMRs from this celltype that overlap with those from other celltypes
bedtools intersect -v -a $inDir/$CTFile -b $TSSExonRef | bedtools intersect -v -a - -b $antiDir/$OthFile > $outDir/$CT\_all_cellspecific_hpl.txt
echo "Found cell-specific HMRs."

##### ((00)) ALL_shared
##### Exclude HMRs overlapping with blacklist | Include HMRs from this celltype that overlap with those from other celltypes
bedtools intersect -v -a $inDir/$CTFile -b $TSSExonRef | bedtools intersect -u -a - -b $antiDir/$OthFile > $outDir/$CT\_all_shared_hpl.txt
echo "Found shared HMRs."
echo ""
echo ""
echo ""



################################################################################
# Find Unclustered HMRs

##### ((1)) CT_unclustered
#####  Filt for TSS/Exons | Merge together clustered HMRs based on rules | Filter out unclustered
originalHMRDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/startingBEDs/
startingFile=${originalHMRDir}${CT}.hmr.bed

awk 'BEGIN{OFS=FS="\t"}{if (($3-$2)>49) print $1,$2,$3}' ${startingFile} | bedtools merge -c 2 -o count -d 6000 -i - | awk 'BEGIN{FS=OFS="\t"}{if ($4<2) print}' - | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - | bedtools intersect -v -a - -b ${TSSExonRef} > $outDir/$CT\_unclustered_hpl.txt
echo "Found unclustered HMRs."


##### ((2)) CT_unclustered_cellspecific
##### 
# Inverse intersect (1) with comparison file to find (a) ct-specific unclustered HMRs
bedtools intersect -v -a $outDir/$CT\_unclustered_hpl.txt -b $antiDir/$OthFile | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > $outDir/$CT\_unclustered_cellspecific_hpl.txt
echo "Found cell-specific unclustered HMRs."


##### ((3) CT_unclustered_shared
##### 
# Intersect (1) with comparison file to find (b) ct-shared unclustered HMRs
bedtools intersect -u -a $outDir/$CT\_unclustered_hpl.txt -b $antiDir/$OthFile | awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' - > $outDir/$CT\_unclustered_shared_hpl.txt
echo "Found shared unclustered HMRs."
echo ""
echo ""
echo ""

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
bedtools intersect -c -F 1.0 -a $outDir/$CT\_whitelist.txt -b $inDir/$CTFile | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print}' - > $outDir/$CT\_whitelistRegions_contain3ormoreHMRs_hpl.txt
echo "Found whitelist regions that contain 3+ HMRs."

# (b)Find what HMRs are in these to create a double BED file in a parsable list for custom merging: [1-3]: BED coordinates of Whitelist region [4]: #HMR in Whitelist region, [5-7]: BED coordinates of HMRs in Whitelist region
# Diagnostic: bedtools intersect -loj -F 1.0 -a Bcell_whitelistRegions_contain3ormoreHMRs.txt -b Bcell.HMR.min50.txt | awk 'BEGIN{OFS=FS="\t"}{print}' - | bedtools sort -i - | head
# awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' temp.txt | head

bedtools intersect -loj -F 1.0 -a $outDir/$CT\_whitelistRegions_contain3ormoreHMRs_hpl.txt -b $inDir/$CTFile | awk 'BEGIN{OFS=FS="\t"}{print $5,$6,$7,$1,$2,$3,$4}' - | bedtools sort -i - > $outDir/$CT\_whitelistRegions_cluster_individualHMRs_temp_hpl.txt
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
}' $outDir/$CT\_whitelistRegions_cluster_individualHMRs_temp_hpl.txt | awk 'BEGIN{OFS=FS="\t"}{if ($4>2) print $0}' - > $outDir/$CT\_internalClusters_hpl.txt
echo "Found internalClusters containing 3+ HMRs."

#########################
#########################
#########################
# Remove unplaced contigs, causes issues downline 
awk 'BEGIN{OFS=FS="\t"}{if ($1 !~ /\_/)print $1,$2,$3}' $outDir/$CT\_internalClusters_hpl.txt > $outDir/$CT\_internalClusters_hpl_BED.txt
echo $"\n"


##### ((5)) internalClusters_individualHMRs 
#####
bedtools intersect -u -a $inDir/$CTFile -b $outDir/$CT\_internalClusters_hpl_BED.txt > $outDir/$CT\_internalClusters_individualHMRs_hpl.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."

##### ((6)) internalClusters_individualHMRs_cellspecific
##### 
# Inverse intersect (1) with our comparison file to find (a) ct-specific and (b) at least partially shared regions
bedtools intersect -v -a $outDir/$CT\_internalClusters_individualHMRs_hpl.txt -b $antiDir/$OthFile > $outDir/$CT\_internalClusters_individualHMRs_cellspecific_hpl.txt
echo "Found cell-specific clustered HMRs."


##### ((7) CT_internalClusters_individualHMRs_shared
##### 
#	Intersect CT with OtherFile to find shared
bedtools intersect -u -a $outDir/$CT\_internalClusters_individualHMRs_hpl.txt -b $antiDir/$OthFile > $outDir/$CT\_internalClusters_individualHMRs_shared_hpl.txt
echo "Found shared clustered HMRs."


##### ((8)) internalClusters_containsCS
#####
bedtools intersect -u -a $outDir/$CT\_internalClusters_hpl_BED.txt -b $outDir/$CT\_all_cellspecific_hpl.txt > $outDir/$CT\_internalClusters_containsCS_hpl.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."


##### ((9)) internalClusters_withoutCS 
#####
bedtools intersect -v -a $outDir/$CT\_internalClusters_hpl_BED.txt -b $outDir/$CT\_all_cellspecific_hpl.txt > $outDir/$CT\_internalClusters_withoutCS_hpl.txt
echo "Found the HMRs composing internalClusters containing 3+ HMRs."
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""



```

## Code to run script on cell types


```bash
# annotation_all_code.sh
# loop annotate_HMRs over the celltypes

SCRIPT_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/scripts/helperScripts
REF_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles
OUT_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs
IN_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles
ANTI_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/antiFiles


# annotate_HMRs.sh
# INPUT: 
# (1) CT Name # for naming conventions
# (2) CT BED file (looks for this in input directory)
# (3) Anti-CT file
# (4) Reference file for blacklist
# (5) Output directory
# (6) Input directory # generally filtRefSeq dir
# (7) Anti-CT directory

for CELLTYPE in Adrenal Bcell fHeart fSpinal H1ESC Liver Macrophage Neutrophil Tcell
do
	sh ${SCRIPT_DIR}/annotate_HMRs.sh ${CELLTYPE} ${CELLTYPE}.minsize50.filtforrefseqTSSexons.txt \
	anti_${CELLTYPE}\_hpl.txt \
	${REF_DIR}/ncbiRefSeqCurated_NM.promotersUp2000Down1000AndExons.txt \
	${OUT_DIR} \
	${IN_DIR} \
	${ANTI_DIR}
done

```


```bash

```
