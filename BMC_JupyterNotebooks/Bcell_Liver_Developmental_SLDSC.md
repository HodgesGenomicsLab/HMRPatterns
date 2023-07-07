# Re-make B cell dev files:


```bash
BDEV_DIR=/data/hodges_lab/Tim/finalAnalyses_HMRs/Bcell_dev/
BDEV_HMRs=/data/hodges_lab/Tim/finalAnalyses_HMRs/Bcell_dev/HMRs/
BDEV_FILT_FILEs=/data/hodges_lab/Tim/finalAnalyses_HMRs/Bcell_dev/HMRs/filtRefSeqFiles/

echo "done."
```

    done.


## Make anti-B cell file


```bash
cd ${BDEV_FILT_FILEs}
ls
```

    Adrenal.minsize50.filtforrefseqTSSexons.txt
    Bcell.minsize50.filtforrefseqTSSexons.txt
    BT.minsize50.filtforrefseqTSSexons.txt
    fHeart.minsize50.filtforrefseqTSSexons.txt
    fSpinal.minsize50.filtforrefseqTSSexons.txt
    H1ESC.minsize50.filtforrefseqTSSexons.txt
    HSC.minsize50.filtforrefseqTSSexons.txt
    Liver.minsize50.filtforrefseqTSSexons.txt
    Macrophage.minsize50.filtforrefseqTSSexons.txt
    MNBT.minsize50.filtforrefseqTSSexons.txt
    Neutrophil.minsize50.filtforrefseqTSSexons.txt
    Tcell.minsize50.filtforrefseqTSSexons.txt



```bash
# Make anti-B cell
cd ${BDEV_FILT_FILEs}

#cat Adrenal.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt | sort -k 1,1 -k2,2n - > ${BDEV_HMRs}anti_Bcell.minsize50.filtforrefseqTSSexons.txt 


cat Adrenal.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Tcell.minsize50.filtforrefseqTSSexons.txt | sort -k 1,1 -k2,2n - > ${BDEV_HMRs}anti_Bcell.minsize50.filtforrefseqTSSexons.txt 

```

## Make anti-B cell file: Macrophage + 6


```bash
## Make anti-B cell file: Macrophage only
# Make anti-B cell
cd ${BDEV_FILT_FILEs}

#cat Adrenal.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt | sort -k 1,1 -k2,2n - > ${BDEV_HMRs}anti_Bcell.minsize50.filtforrefseqTSSexons.txt 


cat Adrenal.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt | sort -k 1,1 -k2,2n - > ${BDEV_HMRs}anti_Bcell.AfHfSH1HsLM.minsize50.filtforrefseqTSSexons.txt 

echo "done."
```

    done.



```bash
cd ${BDEV_HMRs}
ls
```

    anti_Bcell.minsize50.filtforrefseqTSSexons.txt
    Bcell_all_cellspecific_hpl.txt
    Bcell_dev_cellspecific.txt
    Bcell_dev_H1ESCderived.txt
    Bcell_dev_HSPCderived.txt
    Bcell.minsize50.filtforrefseqTSSexons.txt
    filtRefSeqFiles
    H1ESC.minsize50.filtforrefseqTSSexons.txt
    HSC.minsize50.filtforrefseqTSSexons.txt



```bash
wc -l Bcell_all_cellspecific_hpl.txt
```

    4041 Bcell_all_cellspecific_hpl.txt


## Make anti-Liver file, too


```bash
# Make anti-Liver cell
cd ${BDEV_FILT_FILEs}



cat Adrenal.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt Bcell.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt Tcell.minsize50.filtforrefseqTSSexons.txt | sort -k 1,1 -k2,2n - > ${BDEV_HMRs}anti_Liver.minsize50.filtforrefseqTSSexons.txt 
```

## Make anti-Liver file: Macrophage


```bash
## Make anti-Liver file: Macrophage only
# Make anti-Liver
cd ${BDEV_FILT_FILEs}

#cat Adrenal.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt Liver.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt | sort -k 1,1 -k2,2n - > ${BDEV_HMRs}anti_Bcell.minsize50.filtforrefseqTSSexons.txt 


cat Adrenal.minsize50.filtforrefseqTSSexons.txt Bcell.minsize50.filtforrefseqTSSexons.txt fHeart.minsize50.filtforrefseqTSSexons.txt fSpinal.minsize50.filtforrefseqTSSexons.txt H1ESC.minsize50.filtforrefseqTSSexons.txt HSC.minsize50.filtforrefseqTSSexons.txt Macrophage.minsize50.filtforrefseqTSSexons.txt | sort -k 1,1 -k2,2n - > ${BDEV_HMRs}anti_Liver.ABfHfSH1HsM.minsize50.filtforrefseqTSSexons.txt 

echo "done."
```

    done.


## B cell specific 


```bash
wc -l ${BDEV_HMRs}Bcell_dev_cellspecific.txt

#### This measures at 5163 without inclusion of T cell
```

    5163 /data/hodges_lab/Tim/finalAnalyses_HMRs/Bcell_dev/HMRs/Bcell_dev_cellspecific.txt



```bash
bedtools intersect -v -a ${BDEV_HMRs}Bcell.minsize50.filtforrefseqTSSexons.txt -b ${BDEV_HMRs}anti_Bcell.minsize50.filtforrefseqTSSexons.txt > ${BDEV_HMRs}Bcell_dev_cellspecific.txt
```


```bash
wc -l ${BDEV_HMRs}Bcell_dev_cellspecific.txt

#### With T cell, B cell specific list goes down to 4442
```

    4442 /data/hodges_lab/Tim/finalAnalyses_HMRs/Bcell_dev/HMRs/Bcell_dev_cellspecific.txt


## B cell specific: Macrophage only (No T cell)


```bash
${BDEV_HMRs}anti_Bcell.AfHfSH1HsLM.minsize50.filtforrefseqTSSexons.txt 
```


```bash
bedtools intersect -v -a ${BDEV_HMRs}Bcell.minsize50.filtforrefseqTSSexons.txt -b ${BDEV_HMRs}anti_Bcell.AfHfSH1HsLM.minsize50.filtforrefseqTSSexons.txt  > ${BDEV_HMRs}Bcell_dev_cellspecific.AfHfSH1HsLM.txt

echo "done."
```

    done.



```bash
wc -l ${BDEV_HMRs}Bcell_dev_cellspecific.AfHfSH1HsLM.txt

#### With Macrophage + 5, B cell specific list goes down to 5163
```

    5163 /data/hodges_lab/Tim/finalAnalyses_HMRs/Bcell_dev/HMRs/Bcell_dev_cellspecific.AfHfSH1HsLM.txt


## Liver cell specific: Macrophage only (No T cell)


```bash
head ${BDEV_HMRs}anti_Liver.ABfHfSH1HsM.minsize50.filtforrefseqTSSexons.txt 
```

    chr1	20043	20480	437
    chr1	28432	29553	1121
    chr1	28511	29415	904
    chr1	28511	29460	949
    chr1	28511	29512	1001
    chr1	28511	29553	1042
    chr1	29297	29604	307
    chr1	91118	91580	462
    chr1	91118	91580	462
    chr1	91118	91580	462



```bash
bedtools intersect -v -a ${BDEV_FILT_FILEs}Liver.minsize50.filtforrefseqTSSexons.txt -b ${BDEV_HMRs}anti_Liver.ABfHfSH1HsM.minsize50.filtforrefseqTSSexons.txt > /data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/inputFiles/Liver_dev_cellspecific.ABfHfSH1HsM.txt

echo "done."
```

    done.


## Liver specific


```bash
cd ${BDEV_HMRs}
ls
```

    anti_Bcell.minsize50.filtforrefseqTSSexons.txt
    anti_Liver.minsize50.filtforrefseqTSSexons.txt
    Bcell_all_cellspecific_hpl.txt
    Bcell_dev_cellspecific.txt
    Bcell_dev_H1ESCderived.txt
    Bcell_dev_HSPCderived.txt
    Bcell.minsize50.filtforrefseqTSSexons.txt
    filtRefSeqFiles
    H1ESC.minsize50.filtforrefseqTSSexons.txt
    HSC.minsize50.filtforrefseqTSSexons.txt
    Liver_dev_cellspecific.txt



```bash
bedtools intersect -v -a ${BDEV_FILT_FILEs}Liver.minsize50.filtforrefseqTSSexons.txt -b ${BDEV_HMRs}anti_Liver.minsize50.filtforrefseqTSSexons.txt > ${BDEV_HMRs}Liver_dev_cellspecific.txt
```


```bash
wc -l ${BDEV_HMRs}Liver_dev_cellspecific.txt
head ${BDEV_HMRs}Liver_dev_cellspecific.txt
```

    9591 /data/hodges_lab/Tim/finalAnalyses_HMRs/Bcell_dev/HMRs/Liver_dev_cellspecific.txt
    chr1	51441	51734	293
    chr1	137353	137404	51
    chr1	871639	871770	131
    chr1	941488	942198	710
    chr1	1000642	1000965	323
    chr1	1060068	1060600	532
    chr1	1138429	1138603	174
    chr1	1279247	1279768	521
    chr1	1281605	1281838	233
    chr1	1392183	1392406	223


## B cell --> HSPC derived


```bash
bedtools intersect -u -a ${BDEV_HMRs}Bcell.minsize50.filtforrefseqTSSexons.txt -b ${BDEV_HMRs}HSC.minsize50.filtforrefseqTSSexons.txt | bedtools intersect -v -a - -b H1ESC.minsize50.filtforrefseqTSSexons.txt > ${BDEV_HMRs}Bcell_dev_HSPCderived.txt
```


```bash
wc -l ${BDEV_HMRs}Bcell_dev_HSPCderived.txt
```

    15414 /data/hodges_lab/Tim/finalAnalyses_HMRs/Bcell_dev/HMRs/Bcell_dev_HSPCderived.txt


## B cell --> H1 ESC derived


```bash
bedtools intersect -u -a ${BDEV_HMRs}Bcell.minsize50.filtforrefseqTSSexons.txt -b ${BDEV_HMRs}HSC.minsize50.filtforrefseqTSSexons.txt | bedtools intersect -u -a - -b H1ESC.minsize50.filtforrefseqTSSexons.txt > ${BDEV_HMRs}Bcell_dev_H1ESCderived.txt
```


```bash
wc -l ${BDEV_HMRs}Bcell_dev_H1ESCderived.txt
```

    10214 /data/hodges_lab/Tim/finalAnalyses_HMRs/Bcell_dev/HMRs/Bcell_dev_H1ESCderived.txt



```bash

```


```bash

```

# Convert GREAT output to GENE SYMBOL list


```bash
# Local dir
cd /Users/scottt7/Desktop/Bcell_Dev_HMRs/GREAT_defaultGeneAssign

# ls
Bcell_clustered.allGene.txt		Bcell_dev_H1ESCderived.allGene.txt	Bcell_dev_HSPCderived.allGene.txt	Bcell_dev_cellSpecific.allGene.txt
Bcell_dev_H1ESCderived.SYMBOL.txt	Bcell_dev_HSPCderived.SYMBOL.txt	Bcell_dev_cellSpecific.SYMBOL.txt	Bcell_unclustered.allGene.txt

# Convert with awk
awk 'BEGIN{OFS=FS="\t"}{if (NR>1) print $1}' Bcell_clustered.allGene.txt > Bcell_clustered.SYMBOL.txt
awk 'BEGIN{OFS=FS="\t"}{if (NR>1) print $1}' Bcell_unclustered.allGene.txt > Bcell_unclustered.SYMBOL.txt
```

# LDSC

## Copy files over...


```bash
cp ${BDEV_HMRs}Bcell_dev*.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/inputFiles
```


```bash
cp ${BDEV_HMRs}Bcell_dev_cellspecific.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/inputFiles
```


```bash

```


```bash

```


```bash


cp ${BDEV_HMRs}Bcell_dev_cellspecific.AfHfSH1HsLM.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/inputFiles

echo "done."
```

    done.



```bash
# Nov 17, 2022: Redoing clustered/unclustered after EM comments
```


```bash
cp /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters_individualHMRs.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/inputFiles
cp /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_unclustered.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/inputFiles
echo "done."
```

    done.



```bash
cp /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Liver_internalClusters_individualHMRs.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/inputFiles
cp /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Liver_unclustered.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/inputFiles
echo "done."
```

    done.



```bash
# Liver
```


```bash
# Copy over the Liver: Macrophage-only file
cp ${BDEV_HMRs}
```


```bash
cp ${BDEV_HMRs}Liver_dev_cellspecific.txt /data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/inputFiles
```

# LDSC Clustered/Unclustered

## B cell specific: Macrophage + 5


```bash
run_Bcell_cellspecific_AfHfSH1HsLM.slrm
```


```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=32:00:00
#SBATCH --mem=150G
#SBATCH --output=LDSC.Bcell_cs_AfHfSH1HsLM_Nov1722.out

# LDSC Directory 
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/ ##### Check
cd ${LDSCDir}
module restore conda
source activate ldsc 

# Set variables
# Comparison Name
compName="Bcell_cellspecific_AfHfSH1HsLM_Nov1722" ##### Change | Will be used as a file header for intermediate/output files

# Files to include & their flanking500 files
file1=Bcell_dev_cellspecific.AfHfSH1HsLM.txt ##### Change
file1name="${file1%%.*}"

file1colheader="BcellCellSpecAfHfSH1HsLM" ##### Change | Will be used in the annotation column of .annot files | THIS HAS TO BE DIFFERENT FROM compName (IDKY)

# Directory List: User Files
inDir=${LDSCDir}inputFiles/ ##### Check
interDir=${LDSCDir}intermediateFiles_Bcell_cellspecific_AfHfSH1HsLM_Nov1722/ ##### Change
mkdir -p ${interDir}
outDir=${LDSCDir}outputResults_Bcell_cellspecific_AfHfSH1HsLM_Nov1722/ ##### Change
mkdir -p ${outDir}


##########################################################
##  Everything past this should not need to be touched! ##
##########################################################




# Directory List: Dependent Reference Files
LDscoreAnnotDir=${LDSCDir}1000G_Phase3_baselineLD_v2.2_ldscores/
plinkDir=${LDSCDir}1000G_EUR_Phase3_plink/
hapmapSNPDir=${LDSCDir}hapmap3_snps/
sumstatsDir=${LDSCDir}Alkes_sumstats/
sumstatsDir2=${LDSCDir}original_sumstats/
weightsDir=${LDSCDir}weights_hm3_no_hla/
frqDir=${LDSCDir}1000G_Phase3_frq/



# Make annotation file [baseline + 4 custom annotations]
# Make a SNP-annotation column for each annotation, then paste these to the right side of the baseline.[CHR].annot file; rezip at the end 
# Per chromosome
for chr in {1..22}
do
	# Cl
	python make_annot.py --bed-file ${inDir}$file1 --bimfile ${plinkDir}1000G.EUR.QC.${chr}.bim --annot-file ${interDir}$file1name.${chr}.annot.gz 
	gunzip -f ${interDir}$file1name.${chr}.annot.gz
	awk -v header1=$file1colheader 'BEGIN{print header1}{if (NR>1) print}' ${interDir}$file1name.${chr}.annot > ${interDir}temp9.txt
	mv ${interDir}temp9.txt ${interDir}$file1name.${chr}.annot

	# Combine
	# Uses Alkes reference file here 
	paste ${LDscoreAnnotDir}baselineLD.${chr}.annot ${interDir}$file1name.${chr}.annot > ${interDir}$compName.${chr}.annot

	# Remove waste
	rm temp*.txt
done

# # Gzip the above file: The annotation matrix with our columns appended 
gzip -f ${interDir}$compName.*.annot



# L2 - calculate LD Scores
for chrNum in {1..22}
do
	python ldsc.py --l2 --bfile ${plinkDir}1000G.EUR.QC.${chrNum} --ld-wind-cm 1 --annot ${interDir}$compName.${chrNum}.annot.gz --out ${interDir}$compName.${chrNum} --print-snps ${hapmapSNPDir}hm.${chrNum}.snp
done


# Make list of traits on which to run LDSC -h (partitioned heritability)
# Code to do so, if you're in the directory w/ sumstats
# ls | tr "\n" " "
# a="^^^"
# for i in $a; do fileName="${i%%.sumstats}"; echo $fileName; done | tr "\n" " "
for traitName in PASS_AgeFirstBirth PASS_Anorexia PASS_Autism PASS_BMI1 PASS_Coronary_Artery_Disease PASS_Crohns_Disease PASS_DS PASS_Ever_Smoked PASS_HDL PASS_Height1 PASS_LDL PASS_NumberChildrenEverBorn PASS_Rheumatoid_Arthritis PASS_Schizophrenia PASS_Type_2_Diabetes PASS_Ulcerative_Colitis PASS_Years_of_Education2 UKB_460K.blood_EOSINOPHIL_COUNT UKB_460K.blood_PLATELET_COUNT UKB_460K.blood_RBC_DISTRIB_WIDTH UKB_460K.blood_RED_COUNT UKB_460K.blood_WHITE_COUNT UKB_460K.bmd_HEEL_TSCOREz UKB_460K.body_BALDING1 UKB_460K.body_BMIz UKB_460K.body_HEIGHTz UKB_460K.body_WHRadjBMIz UKB_460K.bp_SYSTOLICadjMEDz UKB_460K.cov_EDU_YEARS UKB_460K.cov_SMOKING_STATUS UKB_460K.disease_AID_SURE UKB_460K.disease_ALLERGY_ECZEMA_DIAGNOSED UKB_460K.disease_DERMATOLOGY UKB_460K.disease_HI_CHOL_SELF_REP UKB_460K.disease_HYPOTHYROIDISM_SELF_REP UKB_460K.disease_RESPIRATORY_ENT UKB_460K.disease_T2D UKB_460K.lung_FEV1FVCzSMOKE UKB_460K.lung_FVCzSMOKE UKB_460K.mental_NEUROTICISM UKB_460K.other_MORNINGPERSON UKB_460K.pigment_HAIR UKB_460K.pigment_SKIN UKB_460K.pigment_SUNBURN UKB_460K.pigment_TANNING UKB_460K.repro_MENARCHE_AGE UKB_460K.repro_MENOPAUSE_AGE
do
	python ldsc.py --h2 ${sumstatsDir}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

for traitName in Albumin ALP ALT Angina_byDoctor Apolipoprotein_B AST Cadiomyopathy_andOther CardiacArrythm Cholesterol Coffee_type Congen_Heart_andGreatArteries Diseases_of_liver ECG_load ECG_phaseTime ECG Haematocrit_percentage HeartAttack_byDoctor HighBloodPressure_byDoctor I25_chronicIHD I9_Cardiomyopathy I9_IHD_wideDefinition ICD10_I42_Cardiomyopathy ICD10_I48_atrialFibrillationAndFlutter IGF1 Liver_chirrosis Lymphocyte_count Lymphoid_leukaemia LymphoidLeukemia Myeloid_leukaemia Myocardial_infarction Neutrophil_count PASS_Rheumatoid_Arthritis PASS_Ulcerative_Colitis Primary_lymphoid_neoplasms RheumatoidFactor Triglycerides
do
	python ldsc.py --h2 ${sumstatsDir2}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

```

## B cell Clustered


```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=32:00:00
#SBATCH --mem=150G
#SBATCH --output=LDSC.Bcell_clust_Nov1722.out

# LDSC Directory 
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/ ##### Check
cd ${LDSCDir}
module restore conda
source activate ldsc 

# Set variables
# Comparison Name
compName="Bcell_clustered_Nov1722" ##### Change | Will be used as a file header for intermediate/output files

# Files to include & their flanking500 files
file1=Bcell_internalClusters_individualHMRs.txt ##### Change
file1name="${file1%%.*}"

file1colheader="BcellClustered22" ##### Change | Will be used in the annotation column of .annot files | THIS HAS TO BE DIFFERENT FROM compName (IDKY)

# Directory List: User Files
inDir=${LDSCDir}inputFiles/ ##### Check
interDir=${LDSCDir}intermediateFiles_Bcell_clustered_Nov1722/ ##### Change
mkdir -p ${interDir}
outDir=${LDSCDir}outputResults_Bcell_clustered_Nov1722/ ##### Change
mkdir -p ${outDir}


##########################################################
##  Everything past this should not need to be touched! ##
##########################################################




# Directory List: Dependent Reference Files
LDscoreAnnotDir=${LDSCDir}1000G_Phase3_baselineLD_v2.2_ldscores/
plinkDir=${LDSCDir}1000G_EUR_Phase3_plink/
hapmapSNPDir=${LDSCDir}hapmap3_snps/
sumstatsDir=${LDSCDir}Alkes_sumstats/
sumstatsDir2=${LDSCDir}original_sumstats/
weightsDir=${LDSCDir}weights_hm3_no_hla/
frqDir=${LDSCDir}1000G_Phase3_frq/



# Make annotation file [baseline + 4 custom annotations]
# Make a SNP-annotation column for each annotation, then paste these to the right side of the baseline.[CHR].annot file; rezip at the end 
# Per chromosome
for chr in {1..22}
do
	# Cl
	python make_annot.py --bed-file ${inDir}$file1 --bimfile ${plinkDir}1000G.EUR.QC.${chr}.bim --annot-file ${interDir}$file1name.${chr}.annot.gz 
	gunzip -f ${interDir}$file1name.${chr}.annot.gz
	awk -v header1=$file1colheader 'BEGIN{print header1}{if (NR>1) print}' ${interDir}$file1name.${chr}.annot > ${interDir}temp9.txt
	mv ${interDir}temp9.txt ${interDir}$file1name.${chr}.annot

	# Combine
	# Uses Alkes reference file here 
	paste ${LDscoreAnnotDir}baselineLD.${chr}.annot ${interDir}$file1name.${chr}.annot > ${interDir}$compName.${chr}.annot

	# Remove waste
	rm temp*.txt
done

# # Gzip the above file: The annotation matrix with our columns appended 
gzip -f ${interDir}$compName.*.annot



# L2 - calculate LD Scores
for chrNum in {1..22}
do
	python ldsc.py --l2 --bfile ${plinkDir}1000G.EUR.QC.${chrNum} --ld-wind-cm 1 --annot ${interDir}$compName.${chrNum}.annot.gz --out ${interDir}$compName.${chrNum} --print-snps ${hapmapSNPDir}hm.${chrNum}.snp
done


# Make list of traits on which to run LDSC -h (partitioned heritability)
# Code to do so, if you're in the directory w/ sumstats
# ls | tr "\n" " "
# a="^^^"
# for i in $a; do fileName="${i%%.sumstats}"; echo $fileName; done | tr "\n" " "
for traitName in PASS_AgeFirstBirth PASS_Anorexia PASS_Autism PASS_BMI1 PASS_Coronary_Artery_Disease PASS_Crohns_Disease PASS_DS PASS_Ever_Smoked PASS_HDL PASS_Height1 PASS_LDL PASS_NumberChildrenEverBorn PASS_Rheumatoid_Arthritis PASS_Schizophrenia PASS_Type_2_Diabetes PASS_Ulcerative_Colitis PASS_Years_of_Education2 UKB_460K.blood_EOSINOPHIL_COUNT UKB_460K.blood_PLATELET_COUNT UKB_460K.blood_RBC_DISTRIB_WIDTH UKB_460K.blood_RED_COUNT UKB_460K.blood_WHITE_COUNT UKB_460K.bmd_HEEL_TSCOREz UKB_460K.body_BALDING1 UKB_460K.body_BMIz UKB_460K.body_HEIGHTz UKB_460K.body_WHRadjBMIz UKB_460K.bp_SYSTOLICadjMEDz UKB_460K.cov_EDU_YEARS UKB_460K.cov_SMOKING_STATUS UKB_460K.disease_AID_SURE UKB_460K.disease_ALLERGY_ECZEMA_DIAGNOSED UKB_460K.disease_DERMATOLOGY UKB_460K.disease_HI_CHOL_SELF_REP UKB_460K.disease_HYPOTHYROIDISM_SELF_REP UKB_460K.disease_RESPIRATORY_ENT UKB_460K.disease_T2D UKB_460K.lung_FEV1FVCzSMOKE UKB_460K.lung_FVCzSMOKE UKB_460K.mental_NEUROTICISM UKB_460K.other_MORNINGPERSON UKB_460K.pigment_HAIR UKB_460K.pigment_SKIN UKB_460K.pigment_SUNBURN UKB_460K.pigment_TANNING UKB_460K.repro_MENARCHE_AGE UKB_460K.repro_MENOPAUSE_AGE
do
	python ldsc.py --h2 ${sumstatsDir}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

for traitName in Albumin ALP ALT Angina_byDoctor Apolipoprotein_B AST Cadiomyopathy_andOther CardiacArrythm Cholesterol Coffee_type Congen_Heart_andGreatArteries Diseases_of_liver ECG_load ECG_phaseTime ECG Haematocrit_percentage HeartAttack_byDoctor HighBloodPressure_byDoctor I25_chronicIHD I9_Cardiomyopathy I9_IHD_wideDefinition ICD10_I42_Cardiomyopathy ICD10_I48_atrialFibrillationAndFlutter IGF1 Liver_chirrosis Lymphocyte_count Lymphoid_leukaemia LymphoidLeukemia Myeloid_leukaemia Myocardial_infarction Neutrophil_count PASS_Rheumatoid_Arthritis PASS_Ulcerative_Colitis Primary_lymphoid_neoplasms RheumatoidFactor Triglycerides
do
	python ldsc.py --h2 ${sumstatsDir2}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

```

## B cell Unclustered 


```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=32:00:00
#SBATCH --mem=150G
#SBATCH --output=LDSC.Bcell_unclust_Nov1722.out

# LDSC Directory 
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/ ##### Check
cd ${LDSCDir}
module restore conda
source activate ldsc 

# Set variables
# Comparison Name
compName="Bcell_unclustered_Nov1722" ##### Change | Will be used as a file header for intermediate/output files

# Files to include & their flanking500 files
file1=Bcell_unclustered.txt ##### Change
file1name="${file1%%.*}"

file1colheader="BcellUnclustered22" ##### Change | Will be used in the annotation column of .annot files | THIS HAS TO BE DIFFERENT FROM compName (IDKY)

# Directory List: User Files
inDir=${LDSCDir}inputFiles/ ##### Check
interDir=${LDSCDir}intermediateFiles_Bcell_unclustered_Nov1722/ ##### Change
mkdir -p ${interDir}
outDir=${LDSCDir}outputResults_Bcell_unclustered_Nov1722/ ##### Change
mkdir -p ${outDir}


##########################################################
##  Everything past this should not need to be touched! ##
##########################################################




# Directory List: Dependent Reference Files
LDscoreAnnotDir=${LDSCDir}1000G_Phase3_baselineLD_v2.2_ldscores/
plinkDir=${LDSCDir}1000G_EUR_Phase3_plink/
hapmapSNPDir=${LDSCDir}hapmap3_snps/
sumstatsDir=${LDSCDir}Alkes_sumstats/
sumstatsDir2=${LDSCDir}original_sumstats/
weightsDir=${LDSCDir}weights_hm3_no_hla/
frqDir=${LDSCDir}1000G_Phase3_frq/



# Make annotation file [baseline + 4 custom annotations]
# Make a SNP-annotation column for each annotation, then paste these to the right side of the baseline.[CHR].annot file; rezip at the end 
# Per chromosome
for chr in {1..22}
do
	# Cl
	python make_annot.py --bed-file ${inDir}$file1 --bimfile ${plinkDir}1000G.EUR.QC.${chr}.bim --annot-file ${interDir}$file1name.${chr}.annot.gz 
	gunzip -f ${interDir}$file1name.${chr}.annot.gz
	awk -v header1=$file1colheader 'BEGIN{print header1}{if (NR>1) print}' ${interDir}$file1name.${chr}.annot > ${interDir}temp9.txt
	mv ${interDir}temp9.txt ${interDir}$file1name.${chr}.annot

	# Combine
	# Uses Alkes reference file here 
	paste ${LDscoreAnnotDir}baselineLD.${chr}.annot ${interDir}$file1name.${chr}.annot > ${interDir}$compName.${chr}.annot

	# Remove waste
	rm temp*.txt
done

# # Gzip the above file: The annotation matrix with our columns appended 
gzip -f ${interDir}$compName.*.annot



# L2 - calculate LD Scores
for chrNum in {1..22}
do
	python ldsc.py --l2 --bfile ${plinkDir}1000G.EUR.QC.${chrNum} --ld-wind-cm 1 --annot ${interDir}$compName.${chrNum}.annot.gz --out ${interDir}$compName.${chrNum} --print-snps ${hapmapSNPDir}hm.${chrNum}.snp
done


# Make list of traits on which to run LDSC -h (partitioned heritability)
# Code to do so, if you're in the directory w/ sumstats
# ls | tr "\n" " "
# a="^^^"
# for i in $a; do fileName="${i%%.sumstats}"; echo $fileName; done | tr "\n" " "
for traitName in PASS_AgeFirstBirth PASS_Anorexia PASS_Autism PASS_BMI1 PASS_Coronary_Artery_Disease PASS_Crohns_Disease PASS_DS PASS_Ever_Smoked PASS_HDL PASS_Height1 PASS_LDL PASS_NumberChildrenEverBorn PASS_Rheumatoid_Arthritis PASS_Schizophrenia PASS_Type_2_Diabetes PASS_Ulcerative_Colitis PASS_Years_of_Education2 UKB_460K.blood_EOSINOPHIL_COUNT UKB_460K.blood_PLATELET_COUNT UKB_460K.blood_RBC_DISTRIB_WIDTH UKB_460K.blood_RED_COUNT UKB_460K.blood_WHITE_COUNT UKB_460K.bmd_HEEL_TSCOREz UKB_460K.body_BALDING1 UKB_460K.body_BMIz UKB_460K.body_HEIGHTz UKB_460K.body_WHRadjBMIz UKB_460K.bp_SYSTOLICadjMEDz UKB_460K.cov_EDU_YEARS UKB_460K.cov_SMOKING_STATUS UKB_460K.disease_AID_SURE UKB_460K.disease_ALLERGY_ECZEMA_DIAGNOSED UKB_460K.disease_DERMATOLOGY UKB_460K.disease_HI_CHOL_SELF_REP UKB_460K.disease_HYPOTHYROIDISM_SELF_REP UKB_460K.disease_RESPIRATORY_ENT UKB_460K.disease_T2D UKB_460K.lung_FEV1FVCzSMOKE UKB_460K.lung_FVCzSMOKE UKB_460K.mental_NEUROTICISM UKB_460K.other_MORNINGPERSON UKB_460K.pigment_HAIR UKB_460K.pigment_SKIN UKB_460K.pigment_SUNBURN UKB_460K.pigment_TANNING UKB_460K.repro_MENARCHE_AGE UKB_460K.repro_MENOPAUSE_AGE
do
	python ldsc.py --h2 ${sumstatsDir}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

for traitName in Albumin ALP ALT Angina_byDoctor Apolipoprotein_B AST Cadiomyopathy_andOther CardiacArrythm Cholesterol Coffee_type Congen_Heart_andGreatArteries Diseases_of_liver ECG_load ECG_phaseTime ECG Haematocrit_percentage HeartAttack_byDoctor HighBloodPressure_byDoctor I25_chronicIHD I9_Cardiomyopathy I9_IHD_wideDefinition ICD10_I42_Cardiomyopathy ICD10_I48_atrialFibrillationAndFlutter IGF1 Liver_chirrosis Lymphocyte_count Lymphoid_leukaemia LymphoidLeukemia Myeloid_leukaemia Myocardial_infarction Neutrophil_count PASS_Rheumatoid_Arthritis PASS_Ulcerative_Colitis Primary_lymphoid_neoplasms RheumatoidFactor Triglycerides
do
	python ldsc.py --h2 ${sumstatsDir2}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

```

## Liver Clustered


```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=32:00:00
#SBATCH --mem=150G
#SBATCH --output=LDSC.Liver_clust_Nov1722.out

# LDSC Directory 
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/ ##### Check
cd ${LDSCDir}
module restore conda
source activate ldsc 

# Set variables
# Comparison Name
compName="Liver_clustered_Nov1722" ##### Change | Will be used as a file header for intermediate/output files

# Files to include & their flanking500 files
file1=Liver_internalClusters_individualHMRs.txt ##### Change
file1name="${file1%%.*}"

file1colheader="LiverClustered22" ##### Change | Will be used in the annotation column of .annot files | THIS HAS TO BE DIFFERENT FROM compName (IDKY)

# Directory List: User Files
inDir=${LDSCDir}inputFiles/ ##### Check
interDir=${LDSCDir}intermediateFiles_Liver_clustered_Nov1722/ ##### Change
mkdir -p ${interDir}
outDir=${LDSCDir}outputResults_Liver_clustered_Nov1722/ ##### Change
mkdir -p ${outDir}


##########################################################
##  Everything past this should not need to be touched! ##
##########################################################




# Directory List: Dependent Reference Files
LDscoreAnnotDir=${LDSCDir}1000G_Phase3_baselineLD_v2.2_ldscores/
plinkDir=${LDSCDir}1000G_EUR_Phase3_plink/
hapmapSNPDir=${LDSCDir}hapmap3_snps/
sumstatsDir=${LDSCDir}Alkes_sumstats/
sumstatsDir2=${LDSCDir}original_sumstats/
weightsDir=${LDSCDir}weights_hm3_no_hla/
frqDir=${LDSCDir}1000G_Phase3_frq/



# Make annotation file [baseline + 4 custom annotations]
# Make a SNP-annotation column for each annotation, then paste these to the right side of the baseline.[CHR].annot file; rezip at the end 
# Per chromosome
for chr in {1..22}
do
	# Cl
	python make_annot.py --bed-file ${inDir}$file1 --bimfile ${plinkDir}1000G.EUR.QC.${chr}.bim --annot-file ${interDir}$file1name.${chr}.annot.gz 
	gunzip -f ${interDir}$file1name.${chr}.annot.gz
	awk -v header1=$file1colheader 'BEGIN{print header1}{if (NR>1) print}' ${interDir}$file1name.${chr}.annot > ${interDir}temp9.txt
	mv ${interDir}temp9.txt ${interDir}$file1name.${chr}.annot

	# Combine
	# Uses Alkes reference file here 
	paste ${LDscoreAnnotDir}baselineLD.${chr}.annot ${interDir}$file1name.${chr}.annot > ${interDir}$compName.${chr}.annot

	# Remove waste
	rm temp*.txt
done

# # Gzip the above file: The annotation matrix with our columns appended 
gzip -f ${interDir}$compName.*.annot



# L2 - calculate LD Scores
for chrNum in {1..22}
do
	python ldsc.py --l2 --bfile ${plinkDir}1000G.EUR.QC.${chrNum} --ld-wind-cm 1 --annot ${interDir}$compName.${chrNum}.annot.gz --out ${interDir}$compName.${chrNum} --print-snps ${hapmapSNPDir}hm.${chrNum}.snp
done


# Make list of traits on which to run LDSC -h (partitioned heritability)
# Code to do so, if you're in the directory w/ sumstats
# ls | tr "\n" " "
# a="^^^"
# for i in $a; do fileName="${i%%.sumstats}"; echo $fileName; done | tr "\n" " "
for traitName in PASS_AgeFirstBirth PASS_Anorexia PASS_Autism PASS_BMI1 PASS_Coronary_Artery_Disease PASS_Crohns_Disease PASS_DS PASS_Ever_Smoked PASS_HDL PASS_Height1 PASS_LDL PASS_NumberChildrenEverBorn PASS_Rheumatoid_Arthritis PASS_Schizophrenia PASS_Type_2_Diabetes PASS_Ulcerative_Colitis PASS_Years_of_Education2 UKB_460K.blood_EOSINOPHIL_COUNT UKB_460K.blood_PLATELET_COUNT UKB_460K.blood_RBC_DISTRIB_WIDTH UKB_460K.blood_RED_COUNT UKB_460K.blood_WHITE_COUNT UKB_460K.bmd_HEEL_TSCOREz UKB_460K.body_BALDING1 UKB_460K.body_BMIz UKB_460K.body_HEIGHTz UKB_460K.body_WHRadjBMIz UKB_460K.bp_SYSTOLICadjMEDz UKB_460K.cov_EDU_YEARS UKB_460K.cov_SMOKING_STATUS UKB_460K.disease_AID_SURE UKB_460K.disease_ALLERGY_ECZEMA_DIAGNOSED UKB_460K.disease_DERMATOLOGY UKB_460K.disease_HI_CHOL_SELF_REP UKB_460K.disease_HYPOTHYROIDISM_SELF_REP UKB_460K.disease_RESPIRATORY_ENT UKB_460K.disease_T2D UKB_460K.lung_FEV1FVCzSMOKE UKB_460K.lung_FVCzSMOKE UKB_460K.mental_NEUROTICISM UKB_460K.other_MORNINGPERSON UKB_460K.pigment_HAIR UKB_460K.pigment_SKIN UKB_460K.pigment_SUNBURN UKB_460K.pigment_TANNING UKB_460K.repro_MENARCHE_AGE UKB_460K.repro_MENOPAUSE_AGE
do
	python ldsc.py --h2 ${sumstatsDir}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

for traitName in Albumin ALP ALT Angina_byDoctor Apolipoprotein_B AST Cadiomyopathy_andOther CardiacArrythm Cholesterol Coffee_type Congen_Heart_andGreatArteries Diseases_of_liver ECG_load ECG_phaseTime ECG Haematocrit_percentage HeartAttack_byDoctor HighBloodPressure_byDoctor I25_chronicIHD I9_Cardiomyopathy I9_IHD_wideDefinition ICD10_I42_Cardiomyopathy ICD10_I48_atrialFibrillationAndFlutter IGF1 Liver_chirrosis Lymphocyte_count Lymphoid_leukaemia LymphoidLeukemia Myeloid_leukaemia Myocardial_infarction Neutrophil_count PASS_Rheumatoid_Arthritis PASS_Ulcerative_Colitis Primary_lymphoid_neoplasms RheumatoidFactor Triglycerides
do
	python ldsc.py --h2 ${sumstatsDir2}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

```

## Liver Unclustered


```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=32:00:00
#SBATCH --mem=150G
#SBATCH --output=LDSC.Liver_unclust_Nov1722.out

# LDSC Directory 
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/ ##### Check
cd ${LDSCDir}
module restore conda
source activate ldsc 

# Set variables
# Comparison Name
compName="Liver_unclustered_Nov1722" ##### Change | Will be used as a file header for intermediate/output files

# Files to include & their flanking500 files
file1=Liver_unclustered.txt ##### Change
file1name="${file1%%.*}"

file1colheader="LiverUnclustered22" ##### Change | Will be used in the annotation column of .annot files | THIS HAS TO BE DIFFERENT FROM compName (IDKY)

# Directory List: User Files
inDir=${LDSCDir}inputFiles/ ##### Check
interDir=${LDSCDir}intermediateFiles_Liver_unclustered_Nov1722/ ##### Change
mkdir -p ${interDir}
outDir=${LDSCDir}outputResults_Liver_unclustered_Nov1722/ ##### Change
mkdir -p ${outDir}


##########################################################
##  Everything past this should not need to be touched! ##
##########################################################




# Directory List: Dependent Reference Files
LDscoreAnnotDir=${LDSCDir}1000G_Phase3_baselineLD_v2.2_ldscores/
plinkDir=${LDSCDir}1000G_EUR_Phase3_plink/
hapmapSNPDir=${LDSCDir}hapmap3_snps/
sumstatsDir=${LDSCDir}Alkes_sumstats/
sumstatsDir2=${LDSCDir}original_sumstats/
weightsDir=${LDSCDir}weights_hm3_no_hla/
frqDir=${LDSCDir}1000G_Phase3_frq/



# Make annotation file [baseline + 4 custom annotations]
# Make a SNP-annotation column for each annotation, then paste these to the right side of the baseline.[CHR].annot file; rezip at the end 
# Per chromosome
for chr in {1..22}
do
	# Cl
	python make_annot.py --bed-file ${inDir}$file1 --bimfile ${plinkDir}1000G.EUR.QC.${chr}.bim --annot-file ${interDir}$file1name.${chr}.annot.gz 
	gunzip -f ${interDir}$file1name.${chr}.annot.gz
	awk -v header1=$file1colheader 'BEGIN{print header1}{if (NR>1) print}' ${interDir}$file1name.${chr}.annot > ${interDir}temp9.txt
	mv ${interDir}temp9.txt ${interDir}$file1name.${chr}.annot

	# Combine
	# Uses Alkes reference file here 
	paste ${LDscoreAnnotDir}baselineLD.${chr}.annot ${interDir}$file1name.${chr}.annot > ${interDir}$compName.${chr}.annot

	# Remove waste
	rm temp*.txt
done

# # Gzip the above file: The annotation matrix with our columns appended 
gzip -f ${interDir}$compName.*.annot



# L2 - calculate LD Scores
for chrNum in {1..22}
do
	python ldsc.py --l2 --bfile ${plinkDir}1000G.EUR.QC.${chrNum} --ld-wind-cm 1 --annot ${interDir}$compName.${chrNum}.annot.gz --out ${interDir}$compName.${chrNum} --print-snps ${hapmapSNPDir}hm.${chrNum}.snp
done


# Make list of traits on which to run LDSC -h (partitioned heritability)
# Code to do so, if you're in the directory w/ sumstats
# ls | tr "\n" " "
# a="^^^"
# for i in $a; do fileName="${i%%.sumstats}"; echo $fileName; done | tr "\n" " "
for traitName in PASS_AgeFirstBirth PASS_Anorexia PASS_Autism PASS_BMI1 PASS_Coronary_Artery_Disease PASS_Crohns_Disease PASS_DS PASS_Ever_Smoked PASS_HDL PASS_Height1 PASS_LDL PASS_NumberChildrenEverBorn PASS_Rheumatoid_Arthritis PASS_Schizophrenia PASS_Type_2_Diabetes PASS_Ulcerative_Colitis PASS_Years_of_Education2 UKB_460K.blood_EOSINOPHIL_COUNT UKB_460K.blood_PLATELET_COUNT UKB_460K.blood_RBC_DISTRIB_WIDTH UKB_460K.blood_RED_COUNT UKB_460K.blood_WHITE_COUNT UKB_460K.bmd_HEEL_TSCOREz UKB_460K.body_BALDING1 UKB_460K.body_BMIz UKB_460K.body_HEIGHTz UKB_460K.body_WHRadjBMIz UKB_460K.bp_SYSTOLICadjMEDz UKB_460K.cov_EDU_YEARS UKB_460K.cov_SMOKING_STATUS UKB_460K.disease_AID_SURE UKB_460K.disease_ALLERGY_ECZEMA_DIAGNOSED UKB_460K.disease_DERMATOLOGY UKB_460K.disease_HI_CHOL_SELF_REP UKB_460K.disease_HYPOTHYROIDISM_SELF_REP UKB_460K.disease_RESPIRATORY_ENT UKB_460K.disease_T2D UKB_460K.lung_FEV1FVCzSMOKE UKB_460K.lung_FVCzSMOKE UKB_460K.mental_NEUROTICISM UKB_460K.other_MORNINGPERSON UKB_460K.pigment_HAIR UKB_460K.pigment_SKIN UKB_460K.pigment_SUNBURN UKB_460K.pigment_TANNING UKB_460K.repro_MENARCHE_AGE UKB_460K.repro_MENOPAUSE_AGE
do
	python ldsc.py --h2 ${sumstatsDir}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

for traitName in Albumin ALP ALT Angina_byDoctor Apolipoprotein_B AST Cadiomyopathy_andOther CardiacArrythm Cholesterol Coffee_type Congen_Heart_andGreatArteries Diseases_of_liver ECG_load ECG_phaseTime ECG Haematocrit_percentage HeartAttack_byDoctor HighBloodPressure_byDoctor I25_chronicIHD I9_Cardiomyopathy I9_IHD_wideDefinition ICD10_I42_Cardiomyopathy ICD10_I48_atrialFibrillationAndFlutter IGF1 Liver_chirrosis Lymphocyte_count Lymphoid_leukaemia LymphoidLeukemia Myeloid_leukaemia Myocardial_infarction Neutrophil_count PASS_Rheumatoid_Arthritis PASS_Ulcerative_Colitis Primary_lymphoid_neoplasms RheumatoidFactor Triglycerides
do
	python ldsc.py --h2 ${sumstatsDir2}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

```

## Liver specific: Macrophage only


```bash
run_Liver_cellspecific_AfHfSH1HsLM.slrm
```


```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=32:00:00
#SBATCH --mem=150G
#SBATCH --output=LDSC.Liver_cs_ABfHfSH1HsM_Nov2222.original_sumstats.out

# LDSC Directory 
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/ ##### Check
cd ${LDSCDir}
module restore conda
source activate ldsc 

# Set variables
# Comparison Name
compName="Liver_CS_Monly_Nov1722" ##### Change | Will be used as a file header for intermediate/output files

# Files to include & their flanking500 files
file1=Liver_dev_cellspecific.ABfHfSH1HsM.txt ##### Change
file1name="${file1%%.*}"

file1colheader="Liv_CS_Monly" ##### Change | Will be used in the annotation column of .annot files | THIS HAS TO BE DIFFERENT FROM compName (IDKY)

# Directory List: User Files
inDir=${LDSCDir}inputFiles/ ##### Check
interDir=${LDSCDir}intermediateFiles_Liver_CS_AfHfSH1HsLM_Nov2222/ ##### Change
mkdir -p ${interDir}
outDir=${LDSCDir}outputResults_Liver_CS_AfHfSH1HsLM_Nov2222/ ##### Change
mkdir -p ${outDir}


##########################################################
##  Everything past this should not need to be touched! ##
##########################################################




# Directory List: Dependent Reference Files
LDscoreAnnotDir=${LDSCDir}1000G_Phase3_baselineLD_v2.2_ldscores/
plinkDir=${LDSCDir}1000G_EUR_Phase3_plink/
hapmapSNPDir=${LDSCDir}hapmap3_snps/
sumstatsDir=${LDSCDir}Alkes_sumstats/
sumstatsDir2=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Liv_Dev/original_sumstats/
weightsDir=${LDSCDir}weights_hm3_no_hla/
frqDir=${LDSCDir}1000G_Phase3_frq/


####### JUST RUNNINNG THESE OFF OF ../LDSC_Liv_Dev/original_sumstats

for traitName in Albumin ALP ALT Angina_byDoctor Apolipoprotein_B AST Cadiomyopathy_andOther CardiacArrythm Cholesterol Coffee_type Congen_Heart_andGreatArteries Diseases_of_liver ECG_load ECG_phaseTime ECG Haematocrit_percentage HeartAttack_byDoctor HighBloodPressure_byDoctor I25_chronicIHD I9_Cardiomyopathy I9_IHD_wideDefinition ICD10_I42_Cardiomyopathy ICD10_I48_atrialFibrillationAndFlutter IGF1 Liver_chirrosis Lymphocyte_count Lymphoid_leukaemia LymphoidLeukemia Myeloid_leukaemia Myocardial_infarction Neutrophil_count PASS_Rheumatoid_Arthritis PASS_Ulcerative_Colitis Primary_lymphoid_neoplasms RheumatoidFactor Triglycerides
do
	python ldsc.py --h2 ${sumstatsDir2}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

```


```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=32:00:00
#SBATCH --mem=150G
#SBATCH --output=LDSC.Liver_cs_ABfHfSH1HsM_Nov2222.out

# LDSC Directory 
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/ ##### Check
cd ${LDSCDir}
module restore conda
source activate ldsc 

# Set variables
# Comparison Name
compName="Liver_CS_Monly_Nov1722" ##### Change | Will be used as a file header for intermediate/output files

# Files to include & their flanking500 files
file1=Liver_dev_cellspecific.ABfHfSH1HsM.txt ##### Change
file1name="${file1%%.*}"

file1colheader="Liv_CS_Monly" ##### Change | Will be used in the annotation column of .annot files | THIS HAS TO BE DIFFERENT FROM compName (IDKY)

# Directory List: User Files
inDir=${LDSCDir}inputFiles/ ##### Check
interDir=${LDSCDir}intermediateFiles_Liver_CS_AfHfSH1HsLM_Nov2222/ ##### Change
mkdir -p ${interDir}
outDir=${LDSCDir}outputResults_Liver_CS_AfHfSH1HsLM_Nov2222/ ##### Change
mkdir -p ${outDir}


##########################################################
##  Everything past this should not need to be touched! ##
##########################################################




# Directory List: Dependent Reference Files
LDscoreAnnotDir=${LDSCDir}1000G_Phase3_baselineLD_v2.2_ldscores/
plinkDir=${LDSCDir}1000G_EUR_Phase3_plink/
hapmapSNPDir=${LDSCDir}hapmap3_snps/
sumstatsDir=${LDSCDir}Alkes_sumstats/
sumstatsDir2=${LDSCDir}original_sumstats/
weightsDir=${LDSCDir}weights_hm3_no_hla/
frqDir=${LDSCDir}1000G_Phase3_frq/



for traitName in Albumin ALP ALT Angina_byDoctor Apolipoprotein_B AST Cadiomyopathy_andOther CardiacArrythm Cholesterol Coffee_type Congen_Heart_andGreatArteries Diseases_of_liver ECG_load ECG_phaseTime ECG Haematocrit_percentage HeartAttack_byDoctor HighBloodPressure_byDoctor I25_chronicIHD I9_Cardiomyopathy I9_IHD_wideDefinition ICD10_I42_Cardiomyopathy ICD10_I48_atrialFibrillationAndFlutter IGF1 Liver_chirrosis Lymphocyte_count Lymphoid_leukaemia LymphoidLeukemia Myeloid_leukaemia Myocardial_infarction Neutrophil_count PASS_Rheumatoid_Arthritis PASS_Ulcerative_Colitis Primary_lymphoid_neoplasms RheumatoidFactor Triglycerides
do
	python ldsc.py --h2 ${sumstatsDir2}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

```

## Liver specific


```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=32:00:00
#SBATCH --mem=150G
#SBATCH --output=LDSC.Liver_dev_cs.out

# LDSC Directory 
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/
cd ${LDSCDir}
module restore conda
source activate ldsc

# Set variables
# Comparison Name
compName="Liver_dev_cellspec"

# Files to include & their flanking500 files
file1=Liver_dev_cellspecific.txt
file1name="${file1%%.*}"

file1colheader="LiverDevCS"

# Directory List: User Files
inDir=${LDSCDir}inputFiles/
interDir=${LDSCDir}intermediateFiles_Liv_cs/
mkdir -p ${interDir}
outDir=${LDSCDir}outputResults_Liv_cs/
mkdir -p ${outDir}


# Directory List: Dependent Reference Files
LDscoreAnnotDir=${LDSCDir}1000G_Phase3_baselineLD_v2.2_ldscores/
plinkDir=${LDSCDir}1000G_EUR_Phase3_plink/
hapmapSNPDir=${LDSCDir}hapmap3_snps/
sumstatsDir=${LDSCDir}Alkes_sumstats/
sumstatsDir2=${LDSCDir}original_sumstats/
weightsDir=${LDSCDir}weights_hm3_no_hla/
frqDir=${LDSCDir}1000G_Phase3_frq/



# Make annotation file [baseline + 4 custom annotations]
# Make a SNP-annotation column for each annotation, then paste these to the right side of the baseline.[CHR].annot file; rezip at the end 
# Per chromosome
for chr in {1..22}
do
	# Cl
	python make_annot.py --bed-file ${inDir}$file1 --bimfile ${plinkDir}1000G.EUR.QC.${chr}.bim --annot-file ${interDir}$file1name.${chr}.annot.gz 
	gunzip -f ${interDir}$file1name.${chr}.annot.gz
	awk -v header1=$file1colheader 'BEGIN{print header1}{if (NR>1) print}' ${interDir}$file1name.${chr}.annot > ${interDir}temp9.txt
	mv ${interDir}temp9.txt ${interDir}$file1name.${chr}.annot

	# Combine
	# Uses Alkes reference file here 
	paste ${LDscoreAnnotDir}baselineLD.${chr}.annot ${interDir}$file1name.${chr}.annot > ${interDir}$compName.${chr}.annot

	# Remove waste
	rm temp*.txt
done

# # Gzip the above file: The annotation matrix with our columns appended 
gzip -f ${interDir}$compName.*.annot



# L2 - calculate LD Scores
for chrNum in {1..22}
do
	python ldsc.py --l2 --bfile ${plinkDir}1000G.EUR.QC.${chrNum} --ld-wind-cm 1 --annot ${interDir}$compName.${chrNum}.annot.gz --out ${interDir}$compName.${chrNum} --print-snps ${hapmapSNPDir}hm.${chrNum}.snp
done


# Make list of traits on which to run LDSC -h (partitioned heritability)
# Code to do so, if you're in the directory w/ sumstats
# ls | tr "\n" " "
# a="^^^"
# for i in $a; do fileName="${i%%.sumstats}"; echo $fileName; done | tr "\n" " "
for traitName in PASS_AgeFirstBirth PASS_Anorexia PASS_Autism PASS_BMI1 PASS_Coronary_Artery_Disease PASS_Crohns_Disease PASS_DS PASS_Ever_Smoked PASS_HDL PASS_Height1 PASS_LDL PASS_NumberChildrenEverBorn PASS_Rheumatoid_Arthritis PASS_Schizophrenia PASS_Type_2_Diabetes PASS_Ulcerative_Colitis PASS_Years_of_Education2 UKB_460K.blood_EOSINOPHIL_COUNT UKB_460K.blood_PLATELET_COUNT UKB_460K.blood_RBC_DISTRIB_WIDTH UKB_460K.blood_RED_COUNT UKB_460K.blood_WHITE_COUNT UKB_460K.bmd_HEEL_TSCOREz UKB_460K.body_BALDING1 UKB_460K.body_BMIz UKB_460K.body_HEIGHTz UKB_460K.body_WHRadjBMIz UKB_460K.bp_SYSTOLICadjMEDz UKB_460K.cov_EDU_YEARS UKB_460K.cov_SMOKING_STATUS UKB_460K.disease_AID_SURE UKB_460K.disease_ALLERGY_ECZEMA_DIAGNOSED UKB_460K.disease_DERMATOLOGY UKB_460K.disease_HI_CHOL_SELF_REP UKB_460K.disease_HYPOTHYROIDISM_SELF_REP UKB_460K.disease_RESPIRATORY_ENT UKB_460K.disease_T2D UKB_460K.lung_FEV1FVCzSMOKE UKB_460K.lung_FVCzSMOKE UKB_460K.mental_NEUROTICISM UKB_460K.other_MORNINGPERSON UKB_460K.pigment_HAIR UKB_460K.pigment_SKIN UKB_460K.pigment_SUNBURN UKB_460K.pigment_TANNING UKB_460K.repro_MENARCHE_AGE UKB_460K.repro_MENOPAUSE_AGE
do
	python ldsc.py --h2 ${sumstatsDir}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

for traitName in Albumin ALP ALT Angina_byDoctor Apolipoprotein_B AST Cadiomyopathy_andOther CardiacArrythm Cholesterol Coffee_type Congen_Heart_andGreatArteries Diseases_of_liver ECG_load ECG_phaseTime ECG Haematocrit_percentage HeartAttack_byDoctor HighBloodPressure_byDoctor I25_chronicIHD I9_Cardiomyopathy I9_IHD_wideDefinition ICD10_I42_Cardiomyopathy ICD10_I48_atrialFibrillationAndFlutter IGF1 Liver_chirrosis Lymphocyte_count Lymphoid_leukaemia LymphoidLeukemia Myeloid_leukaemia Myocardial_infarction Neutrophil_count PASS_Rheumatoid_Arthritis PASS_Ulcerative_Colitis Primary_lymphoid_neoplasms RheumatoidFactor Triglycerides
do
	python ldsc.py --h2 ${sumstatsDir2}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

```

## B cell specific 

### Previous version with less stringent cell-specific definition without T cell


```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=32:00:00
#SBATCH --mem=150G
#SBATCH --output=LDSC.Bcell_dev_cs.out

# LDSC Directory 
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/
cd ${LDSCDir}
module restore conda
source activate ldsc

# Set variables
# Comparison Name
compName="Bcell_dev_cellspec"

# Files to include & their flanking500 files
file1=Bcell_dev_cellspecific.txt
file1name="${file1%%.*}"

file1colheader="BcellDevCS"

# Directory List: User Files
inDir=${LDSCDir}inputFiles/
interDir=${LDSCDir}intermediateFiles_dev_cs/
mkdir -p ${interDir}
outDir=${LDSCDir}outputResults_dev_cs/
mkdir -p ${outDir}


# Directory List: Dependent Reference Files
LDscoreAnnotDir=${LDSCDir}1000G_Phase3_baselineLD_v2.2_ldscores/
plinkDir=${LDSCDir}1000G_EUR_Phase3_plink/
hapmapSNPDir=${LDSCDir}hapmap3_snps/
sumstatsDir=${LDSCDir}Alkes_sumstats/
sumstatsDir2=${LDSCDir}original_sumstats/
weightsDir=${LDSCDir}weights_hm3_no_hla/
frqDir=${LDSCDir}1000G_Phase3_frq/



# Make annotation file [baseline + 4 custom annotations]
# Make a SNP-annotation column for each annotation, then paste these to the right side of the baseline.[CHR].annot file; rezip at the end 
# Per chromosome
for chr in {1..22}
do
	# Cl
	python make_annot.py --bed-file ${inDir}$file1 --bimfile ${plinkDir}1000G.EUR.QC.${chr}.bim --annot-file ${interDir}$file1name.${chr}.annot.gz 
	gunzip -f ${interDir}$file1name.${chr}.annot.gz
	awk -v header1=$file1colheader 'BEGIN{print header1}{if (NR>1) print}' ${interDir}$file1name.${chr}.annot > ${interDir}temp9.txt
	mv ${interDir}temp9.txt ${interDir}$file1name.${chr}.annot

	# Combine
	# Uses Alkes reference file here 
	paste ${LDscoreAnnotDir}baselineLD.${chr}.annot ${interDir}$file1name.${chr}.annot > ${interDir}$compName.${chr}.annot

	# Remove waste
	rm temp*.txt
done

# # Gzip the above file: The annotation matrix with our columns appended 
gzip -f ${interDir}$compName.*.annot



# L2 - calculate LD Scores
for chrNum in {1..22}
do
	python ldsc.py --l2 --bfile ${plinkDir}1000G.EUR.QC.${chrNum} --ld-wind-cm 1 --annot ${interDir}$compName.${chrNum}.annot.gz --out ${interDir}$compName.${chrNum} --print-snps ${hapmapSNPDir}hm.${chrNum}.snp
done


# Make list of traits on which to run LDSC -h (partitioned heritability)
# Code to do so, if you're in the directory w/ sumstats
# ls | tr "\n" " "
# a="^^^"
# for i in $a; do fileName="${i%%.sumstats}"; echo $fileName; done | tr "\n" " "
for traitName in PASS_AgeFirstBirth PASS_Anorexia PASS_Autism PASS_BMI1 PASS_Coronary_Artery_Disease PASS_Crohns_Disease PASS_DS PASS_Ever_Smoked PASS_HDL PASS_Height1 PASS_LDL PASS_NumberChildrenEverBorn PASS_Rheumatoid_Arthritis PASS_Schizophrenia PASS_Type_2_Diabetes PASS_Ulcerative_Colitis PASS_Years_of_Education2 UKB_460K.blood_EOSINOPHIL_COUNT UKB_460K.blood_PLATELET_COUNT UKB_460K.blood_RBC_DISTRIB_WIDTH UKB_460K.blood_RED_COUNT UKB_460K.blood_WHITE_COUNT UKB_460K.bmd_HEEL_TSCOREz UKB_460K.body_BALDING1 UKB_460K.body_BMIz UKB_460K.body_HEIGHTz UKB_460K.body_WHRadjBMIz UKB_460K.bp_SYSTOLICadjMEDz UKB_460K.cov_EDU_YEARS UKB_460K.cov_SMOKING_STATUS UKB_460K.disease_AID_SURE UKB_460K.disease_ALLERGY_ECZEMA_DIAGNOSED UKB_460K.disease_DERMATOLOGY UKB_460K.disease_HI_CHOL_SELF_REP UKB_460K.disease_HYPOTHYROIDISM_SELF_REP UKB_460K.disease_RESPIRATORY_ENT UKB_460K.disease_T2D UKB_460K.lung_FEV1FVCzSMOKE UKB_460K.lung_FVCzSMOKE UKB_460K.mental_NEUROTICISM UKB_460K.other_MORNINGPERSON UKB_460K.pigment_HAIR UKB_460K.pigment_SKIN UKB_460K.pigment_SUNBURN UKB_460K.pigment_TANNING UKB_460K.repro_MENARCHE_AGE UKB_460K.repro_MENOPAUSE_AGE
do
	python ldsc.py --h2 ${sumstatsDir}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

for traitName in Albumin ALP ALT Angina_byDoctor Apolipoprotein_B AST Cadiomyopathy_andOther CardiacArrythm Cholesterol Coffee_type Congen_Heart_andGreatArteries Diseases_of_liver ECG_load ECG_phaseTime ECG Haematocrit_percentage HeartAttack_byDoctor HighBloodPressure_byDoctor I25_chronicIHD I9_Cardiomyopathy I9_IHD_wideDefinition ICD10_I42_Cardiomyopathy ICD10_I48_atrialFibrillationAndFlutter IGF1 Liver_chirrosis Lymphocyte_count Lymphoid_leukaemia LymphoidLeukemia Myeloid_leukaemia Myocardial_infarction Neutrophil_count PASS_Rheumatoid_Arthritis PASS_Ulcerative_Colitis Primary_lymphoid_neoplasms RheumatoidFactor Triglycerides
do
	python ldsc.py --h2 ${sumstatsDir2}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

```

## Bcell_dev_HSPCderived



```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=32:00:00
#SBATCH --mem=150G
#SBATCH --output=LDSC.Bcell_dev_HSderived.out 

# LDSC Directory 
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/ # Change
cd ${LDSCDir}
module restore conda
source activate ldsc

# Set variables
# Comparison Name
compName="Bcell_dev_HSderived" # Change

# Files to include & their flanking500 files
file1=Bcell_dev_HSPCderived.txt # Change
file1name="${file1%%.*}"

file1colheader="BcellDevHSDer" # Change

# Directory List: User Files
inDir=${LDSCDir}inputFiles/
interDir=${LDSCDir}intermediateFiles_dev_hs/ # Change
mkdir -p ${interDir}
outDir=${LDSCDir}outputResults_dev_hs/ # Change
mkdir -p ${outDir}


# Directory List: Dependent Reference Files
LDscoreAnnotDir=${LDSCDir}1000G_Phase3_baselineLD_v2.2_ldscores/
plinkDir=${LDSCDir}1000G_EUR_Phase3_plink/
hapmapSNPDir=${LDSCDir}hapmap3_snps/
sumstatsDir=${LDSCDir}Alkes_sumstats/
sumstatsDir2=${LDSCDir}original_sumstats/
weightsDir=${LDSCDir}weights_hm3_no_hla/
frqDir=${LDSCDir}1000G_Phase3_frq/



# Make annotation file [baseline + 4 custom annotations]
# Make a SNP-annotation column for each annotation, then paste these to the right side of the baseline.[CHR].annot file; rezip at the end 
# Per chromosome
for chr in {1..22}
do
	# Cl
	python make_annot.py --bed-file ${inDir}$file1 --bimfile ${plinkDir}1000G.EUR.QC.${chr}.bim --annot-file ${interDir}$file1name.${chr}.annot.gz 
	gunzip -f ${interDir}$file1name.${chr}.annot.gz
	awk -v header1=$file1colheader 'BEGIN{print header1}{if (NR>1) print}' ${interDir}$file1name.${chr}.annot > ${interDir}temp9.txt
	mv ${interDir}temp9.txt ${interDir}$file1name.${chr}.annot

	# Combine
	# Uses Alkes reference file here 
	paste ${LDscoreAnnotDir}baselineLD.${chr}.annot ${interDir}$file1name.${chr}.annot > ${interDir}$compName.${chr}.annot

	# Remove waste
	rm temp*.txt
done

# # Gzip the above file: The annotation matrix with our columns appended 
gzip -f ${interDir}$compName.*.annot



# L2 - calculate LD Scores
for chrNum in {1..22}
do
	python ldsc.py --l2 --bfile ${plinkDir}1000G.EUR.QC.${chrNum} --ld-wind-cm 1 --annot ${interDir}$compName.${chrNum}.annot.gz --out ${interDir}$compName.${chrNum} --print-snps ${hapmapSNPDir}hm.${chrNum}.snp
done


# Make list of traits on which to run LDSC -h (partitioned heritability)
# Code to do so, if you're in the directory w/ sumstats
# ls | tr "\n" " "
# a="^^^"
# for i in $a; do fileName="${i%%.sumstats}"; echo $fileName; done | tr "\n" " "
for traitName in PASS_AgeFirstBirth PASS_Anorexia PASS_Autism PASS_BMI1 PASS_Coronary_Artery_Disease PASS_Crohns_Disease PASS_DS PASS_Ever_Smoked PASS_HDL PASS_Height1 PASS_LDL PASS_NumberChildrenEverBorn PASS_Rheumatoid_Arthritis PASS_Schizophrenia PASS_Type_2_Diabetes PASS_Ulcerative_Colitis PASS_Years_of_Education2 UKB_460K.blood_EOSINOPHIL_COUNT UKB_460K.blood_PLATELET_COUNT UKB_460K.blood_RBC_DISTRIB_WIDTH UKB_460K.blood_RED_COUNT UKB_460K.blood_WHITE_COUNT UKB_460K.bmd_HEEL_TSCOREz UKB_460K.body_BALDING1 UKB_460K.body_BMIz UKB_460K.body_HEIGHTz UKB_460K.body_WHRadjBMIz UKB_460K.bp_SYSTOLICadjMEDz UKB_460K.cov_EDU_YEARS UKB_460K.cov_SMOKING_STATUS UKB_460K.disease_AID_SURE UKB_460K.disease_ALLERGY_ECZEMA_DIAGNOSED UKB_460K.disease_DERMATOLOGY UKB_460K.disease_HI_CHOL_SELF_REP UKB_460K.disease_HYPOTHYROIDISM_SELF_REP UKB_460K.disease_RESPIRATORY_ENT UKB_460K.disease_T2D UKB_460K.lung_FEV1FVCzSMOKE UKB_460K.lung_FVCzSMOKE UKB_460K.mental_NEUROTICISM UKB_460K.other_MORNINGPERSON UKB_460K.pigment_HAIR UKB_460K.pigment_SKIN UKB_460K.pigment_SUNBURN UKB_460K.pigment_TANNING UKB_460K.repro_MENARCHE_AGE UKB_460K.repro_MENOPAUSE_AGE
do
	python ldsc.py --h2 ${sumstatsDir}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

for traitName in Albumin ALP ALT Angina_byDoctor Apolipoprotein_B AST Cadiomyopathy_andOther CardiacArrythm Cholesterol Coffee_type Congen_Heart_andGreatArteries Diseases_of_liver ECG_load ECG_phaseTime ECG Haematocrit_percentage HeartAttack_byDoctor HighBloodPressure_byDoctor I25_chronicIHD I9_Cardiomyopathy I9_IHD_wideDefinition ICD10_I42_Cardiomyopathy ICD10_I48_atrialFibrillationAndFlutter IGF1 Liver_chirrosis Lymphocyte_count Lymphoid_leukaemia LymphoidLeukemia Myeloid_leukaemia Myocardial_infarction Neutrophil_count PASS_Rheumatoid_Arthritis PASS_Ulcerative_Colitis Primary_lymphoid_neoplasms RheumatoidFactor Triglycerides
do
	python ldsc.py --h2 ${sumstatsDir2}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

```

## B cell H1 ESC derived


```bash
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=32:00:00
#SBATCH --mem=150G
#SBATCH --output=LDSC.Bcell_dev_H1derived.out 

# LDSC Directory 
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/ # Change
cd ${LDSCDir}
module restore conda
source activate ldsc

# Set variables
# Comparison Name
compName="Bcell_dev_H1derived" # Change

# Files to include & their flanking500 files
file1=Bcell_dev_H1ESCderived.txt # Change
file1name="${file1%%.*}"

file1colheader="BcellDevH1Der" # Change

# Directory List: User Files
inDir=${LDSCDir}inputFiles/
interDir=${LDSCDir}intermediateFiles_dev_h1/ # Change
mkdir -p ${interDir}
outDir=${LDSCDir}outputResults_dev_h1/ # Change
mkdir -p ${outDir}


# Directory List: Dependent Reference Files
LDscoreAnnotDir=${LDSCDir}1000G_Phase3_baselineLD_v2.2_ldscores/
plinkDir=${LDSCDir}1000G_EUR_Phase3_plink/
hapmapSNPDir=${LDSCDir}hapmap3_snps/
sumstatsDir=${LDSCDir}Alkes_sumstats/
sumstatsDir2=${LDSCDir}original_sumstats/
weightsDir=${LDSCDir}weights_hm3_no_hla/
frqDir=${LDSCDir}1000G_Phase3_frq/



# Make annotation file [baseline + 4 custom annotations]
# Make a SNP-annotation column for each annotation, then paste these to the right side of the baseline.[CHR].annot file; rezip at the end 
# Per chromosome
for chr in {1..22}
do
	# Cl
	python make_annot.py --bed-file ${inDir}$file1 --bimfile ${plinkDir}1000G.EUR.QC.${chr}.bim --annot-file ${interDir}$file1name.${chr}.annot.gz 
	gunzip -f ${interDir}$file1name.${chr}.annot.gz
	awk -v header1=$file1colheader 'BEGIN{print header1}{if (NR>1) print}' ${interDir}$file1name.${chr}.annot > ${interDir}temp9.txt
	mv ${interDir}temp9.txt ${interDir}$file1name.${chr}.annot

	# Combine
	# Uses Alkes reference file here 
	paste ${LDscoreAnnotDir}baselineLD.${chr}.annot ${interDir}$file1name.${chr}.annot > ${interDir}$compName.${chr}.annot

	# Remove waste
	rm temp*.txt
done

# # Gzip the above file: The annotation matrix with our columns appended 
gzip -f ${interDir}$compName.*.annot



# L2 - calculate LD Scores
for chrNum in {1..22}
do
	python ldsc.py --l2 --bfile ${plinkDir}1000G.EUR.QC.${chrNum} --ld-wind-cm 1 --annot ${interDir}$compName.${chrNum}.annot.gz --out ${interDir}$compName.${chrNum} --print-snps ${hapmapSNPDir}hm.${chrNum}.snp
done


# Make list of traits on which to run LDSC -h (partitioned heritability)
# Code to do so, if you're in the directory w/ sumstats
# ls | tr "\n" " "
# a="^^^"
# for i in $a; do fileName="${i%%.sumstats}"; echo $fileName; done | tr "\n" " "
for traitName in PASS_AgeFirstBirth PASS_Anorexia PASS_Autism PASS_BMI1 PASS_Coronary_Artery_Disease PASS_Crohns_Disease PASS_DS PASS_Ever_Smoked PASS_HDL PASS_Height1 PASS_LDL PASS_NumberChildrenEverBorn PASS_Rheumatoid_Arthritis PASS_Schizophrenia PASS_Type_2_Diabetes PASS_Ulcerative_Colitis PASS_Years_of_Education2 UKB_460K.blood_EOSINOPHIL_COUNT UKB_460K.blood_PLATELET_COUNT UKB_460K.blood_RBC_DISTRIB_WIDTH UKB_460K.blood_RED_COUNT UKB_460K.blood_WHITE_COUNT UKB_460K.bmd_HEEL_TSCOREz UKB_460K.body_BALDING1 UKB_460K.body_BMIz UKB_460K.body_HEIGHTz UKB_460K.body_WHRadjBMIz UKB_460K.bp_SYSTOLICadjMEDz UKB_460K.cov_EDU_YEARS UKB_460K.cov_SMOKING_STATUS UKB_460K.disease_AID_SURE UKB_460K.disease_ALLERGY_ECZEMA_DIAGNOSED UKB_460K.disease_DERMATOLOGY UKB_460K.disease_HI_CHOL_SELF_REP UKB_460K.disease_HYPOTHYROIDISM_SELF_REP UKB_460K.disease_RESPIRATORY_ENT UKB_460K.disease_T2D UKB_460K.lung_FEV1FVCzSMOKE UKB_460K.lung_FVCzSMOKE UKB_460K.mental_NEUROTICISM UKB_460K.other_MORNINGPERSON UKB_460K.pigment_HAIR UKB_460K.pigment_SKIN UKB_460K.pigment_SUNBURN UKB_460K.pigment_TANNING UKB_460K.repro_MENARCHE_AGE UKB_460K.repro_MENOPAUSE_AGE
do
	python ldsc.py --h2 ${sumstatsDir}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

for traitName in Albumin ALP ALT Angina_byDoctor Apolipoprotein_B AST Cadiomyopathy_andOther CardiacArrythm Cholesterol Coffee_type Congen_Heart_andGreatArteries Diseases_of_liver ECG_load ECG_phaseTime ECG Haematocrit_percentage HeartAttack_byDoctor HighBloodPressure_byDoctor I25_chronicIHD I9_Cardiomyopathy I9_IHD_wideDefinition ICD10_I42_Cardiomyopathy ICD10_I48_atrialFibrillationAndFlutter IGF1 Liver_chirrosis Lymphocyte_count Lymphoid_leukaemia LymphoidLeukemia Myeloid_leukaemia Myocardial_infarction Neutrophil_count PASS_Rheumatoid_Arthritis PASS_Ulcerative_Colitis Primary_lymphoid_neoplasms RheumatoidFactor Triglycerides
do
	python ldsc.py --h2 ${sumstatsDir2}${traitName}.sumstats --ref-ld-chr ${interDir}$compName. --w-ld-chr ${weightsDir}weights. --overlap-annot --print-coefficients --frqfile-chr ${frqDir}1000G.EUR.QC. --out ${outDir}$compName.${traitName}
done

```


```bash

```

# Summarize LDSC results


```bash

```


```bash

```


```bash
h1_res_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/outputResults_dev_h1/
hs_res_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/outputResults_dev_hs/
cs_res_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/outputResults_dev_cs/

### output Directories:
# OutputDirectory for summarized tables:
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/
```


```bash
# # # Extra code to quickly rank results by enrichment for quick viewing

head B_cellSpecific_M_resultsTable.txt 


awk 'BEGIN{OFS=FS="\t"}{print $2,$7,$9}' B_cellSpecific_M_resultsTable.txt | sort -t$'\t' -k3nr

HMRGroupTrait
awk 'BEGIN{OFS=FS="\t"}{print $2,$7,$9}' B_cellSpecific_M_resultsTable.headers.txt
```


```bash
#HMRGroupCategory	Prop._SNPs	Prop._h2	Prop._h2_std_error	Enrichment	Enrichment_std_error	Enrichment_p	Coefficient	Coefficient_std_error	Coefficient_z-score
```


```bash
## H1
cd $h1_res_dir
HMRgroup="H1derived"

for i in *.results
do 
traitName1="${i%.*}"
traitName="${traitName1##*.}"
awk -v fName="${traitName}" -v HMRgrouN="${HMRgroup}" 'BEGIN{OFS="\t"}{if (NR==99) print HMRgrouN,fName,$0}' ${i} > ${outDir}${HMRgroup}\_temp\_${traitName}.txt
done
cat ${outDir}${HMRgroup}\_temp*.txt > ${outDir}${HMRgroup}\_resultsTable.txt
```


```bash
## HS
cd $hs_res_dir
HMRgroup="HSderived"

echo "Starting"
for i in *.results
do 
traitName1="${i%.*}"
traitName="${traitName1##*.}"
awk -v fName="${traitName}" -v HMRgrouN="${HMRgroup}" 'BEGIN{OFS="\t"}{if (NR==99) print HMRgrouN,fName,$0}' ${i} > ${outDir}${HMRgroup}\_temp\_${traitName}.txt
done
echo "Compiling."
cat ${outDir}${HMRgroup}\_temp*.txt > ${outDir}${HMRgroup}\_resultsTable.txt

```

    bash: !": event not found
    Compiling.
    Cleaning.
    rm: cannot remove ‘*_temp_*’: No such file or directory
    Done.



```bash
## CS
cd $cs_res_dir
HMRgroup="cellSpecific"

echo "Starting"
for i in *.results
do 
    traitName1="${i%.*}"
    traitName="${traitName1##*.}"
    awk -v fName="${traitName}" -v HMRgrouN="${HMRgroup}" 'BEGIN{OFS="\t"}{if (NR==99) print HMRgrouN,fName,$0}' ${i} > ${outDir}${HMRgroup}\_temp\_${traitName}.txt
done
echo "Compiling"
cat ${outDir}${HMRgroup}\_temp*.txt > ${outDir}${HMRgroup}\_resultsTable.txt

```

    Starting
    Compiling


## Verda's Islet CS


```bash
va_dir=/data/hodges_lab/aganve/ldsc/outputResults_Islet_cs_Nov1722/

### output Directories:
# OutputDirectory for summarized tables:
outDir=/data/hodges_lab/Tim/

## Liv - CS
cd $va_dir
HMRgroup="Islet_CS"

echo "Starting"
for i in *.results
do 
    traitName1="${i%.*}"
    traitName="${traitName1##*.}"
    awk -v fName="${traitName}" -v HMRgrouN="${HMRgroup}" 'BEGIN{OFS="\t"}{if (NR==99) print HMRgrouN,fName,$0}' ${i} > ${outDir}${HMRgroup}\_temp\_${traitName}.txt
done
echo "Compiling"
cat ${outDir}${HMRgroup}\_temp*.txt > ${outDir}${HMRgroup}\_resultsTable.txt
```

    Starting
    Compiling


## Liver Cell Specific


```bash
liv_cs_res_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/outputResults_Liv_cs/

### output Directories:
# OutputDirectory for summarized tables:
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/

## Liv - CS
cd $liv_cs_res_dir
HMRgroup="Liv_cellSpecific"

echo "Starting"
for i in *.results
do 
    traitName1="${i%.*}"
    traitName="${traitName1##*.}"
    awk -v fName="${traitName}" -v HMRgrouN="${HMRgroup}" 'BEGIN{OFS="\t"}{if (NR==99) print HMRgrouN,fName,$0}' ${i} > ${outDir}${HMRgroup}\_temp\_${traitName}.txt
done
echo "Compiling"
cat ${outDir}${HMRgroup}\_temp*.txt > ${outDir}${HMRgroup}\_resultsTable.txt
```

    Starting
    Compiling


## Liver Cell specific - Macrophage only


```bash
liv_cs_m_res_dir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/outputResults_Liver_CS_AfHfSH1HsLM_Nov2222/

### output Directories:
# OutputDirectory for summarized tables:
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/summary_tables/

## Liv - CS
cd $liv_cs_m_res_dir
HMRgroup="Liv_cellSpecific_M" 
# ^^^ Doesn't have to match the file names. The code below just goes into the output directory and grabs everything with a file name ending in .results. This is just for the summarized output file name


########## EVERYTHING BELOW SHOULD BE GOOD ########


echo "Starting"
for i in *.results
do 
    traitName1="${i%.*}"
    traitName="${traitName1##*.}"
    awk -v fName="${traitName}" -v HMRgrouN="${HMRgroup}" 'BEGIN{OFS="\t"}{if (NR==99) print HMRgrouN,fName,$0}' ${i} > ${outDir}${HMRgroup}\_temp\_${traitName}.txt
done
echo "Compiling"
cat ${outDir}${HMRgroup}\_temp*.txt > ${outDir}${HMRgroup}\_resultsTable.txt
```

    Starting
    Compiling


## Gather results
My final .results files went into the main /LDSC_Bcell_shared/ directory. Unsure why the script created an intermediate folder but not a terminal output folder


```bash
LDSCDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/outputResults_Liver_CS_AfHfSH1HsLM_Nov2222

B_CS_M_DIR=${LDSCDir}outputResults_Bcell_cellspecific_AfHfSH1HsLM_Nov1722/
B_CL_DIR=${LDSCDir}outputResults_Bcell_clustered_Nov1722/
B_UN_DIR=${LDSCDir}outputResults_Bcell_unclustered_Nov1722/
L_CL_DIR=${LDSCDir}outputResults_Liver_clustered_Nov1722/
L_UN_DIR=${LDSCDir}outputResults_Liver_unclustered_Nov1722/

mkdir -p ${B_CS_M_DIR}
mkdir -p ${B_CL_DIR}
mkdir -p ${B_UN_DIR}
mkdir -p ${L_CL_DIR}
mkdir -p ${L_UN_DIR}
```


```bash
cd ${LDSCDir}

cp Bcell_cellspecific_AfHfSH1HsLM_Nov1722.*.* ${B_CS_M_DIR}
cp Bcell_clustered_Nov1722.*.* ${B_CL_DIR}
cp Bcell_unclustered_Nov1722.*.* ${B_UN_DIR}
cp Liver_clustered_Nov1722.*.* ${L_CL_DIR}
cp Liver_unclustered_Nov1722.*.* ${L_UN_DIR}

echo "done."
```

    done.


## B cell specific - Macrophage only


```bash
### output Directories:
# OutputDirectory for summarized tables:
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/summary_tables/

## B cell - CS - Macrophage only + 5
cd ${B_CS_M_DIR}
HMRgroup="B_cellSpecific_M"


############# EVERYTHING BELOW SHOULD BE GOOD TO GO #################


echo "Starting"
for i in *.results
do 
    traitName1="${i%.*}"
    traitName="${traitName1##*.}"
    awk -v fName="${traitName}" -v HMRgrouN="${HMRgroup}" 'BEGIN{OFS="\t"}{if (NR==99) print HMRgrouN,fName,$0}' ${i} > ${outDir}${HMRgroup}\_temp\_${traitName}.txt
done

echo "Compiling"
cat ${outDir}${HMRgroup}\_temp*.txt > ${outDir}${HMRgroup}\_resultsTable.txt

rm ${outDir}${HMRgroup}\_temp*.txt

echo "Done."
```

    Starting
    Compiling
    Done.


## B cell clustered


```bash
### output Directories:
# OutputDirectory for summarized tables:
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/summary_tables/

## B cell - CL
cd ${B_CL_DIR}
HMRgroup="B_clustered"


############# EVERYTHING BELOW SHOULD BE GOOD TO GO #################


echo "Starting"
for i in *.results
do 
    traitName1="${i%.*}"
    traitName="${traitName1##*.}"
    awk -v fName="${traitName}" -v HMRgrouN="${HMRgroup}" 'BEGIN{OFS="\t"}{if (NR==99) print HMRgrouN,fName,$0}' ${i} > ${outDir}${HMRgroup}\_temp\_${traitName}.txt
done

echo "Compiling"
cat ${outDir}${HMRgroup}\_temp*.txt > ${outDir}${HMRgroup}\_resultsTable.txt

rm ${outDir}${HMRgroup}\_temp*.txt

echo "Done."
```

    Starting
    Compiling
    Done.


## B cell unclustered


```bash
### output Directories:
# OutputDirectory for summarized tables:
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/summary_tables/

## B cell - UN 
cd ${B_UN_DIR}
HMRgroup="B_unclustered"


############# EVERYTHING BELOW SHOULD BE GOOD TO GO #################


echo "Starting"
for i in *.results
do 
    traitName1="${i%.*}"
    traitName="${traitName1##*.}"
    awk -v fName="${traitName}" -v HMRgrouN="${HMRgroup}" 'BEGIN{OFS="\t"}{if (NR==99) print HMRgrouN,fName,$0}' ${i} > ${outDir}${HMRgroup}\_temp\_${traitName}.txt
done

echo "Compiling"
cat ${outDir}${HMRgroup}\_temp*.txt > ${outDir}${HMRgroup}\_resultsTable.txt

rm ${outDir}${HMRgroup}\_temp*.txt

echo "Done."
```

    Starting
    Compiling
    Done.


## Liver clustered


```bash
### output Directories:
# OutputDirectory for summarized tables:
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/summary_tables/

## Liv - CL
cd ${L_CL_DIR}
HMRgroup="L_clustered"


############# EVERYTHING BELOW SHOULD BE GOOD TO GO #################


echo "Starting"
for i in *.results
do 
    traitName1="${i%.*}"
    traitName="${traitName1##*.}"
    awk -v fName="${traitName}" -v HMRgrouN="${HMRgroup}" 'BEGIN{OFS="\t"}{if (NR==99) print HMRgrouN,fName,$0}' ${i} > ${outDir}${HMRgroup}\_temp\_${traitName}.txt
done

echo "Compiling"
cat ${outDir}${HMRgroup}\_temp*.txt > ${outDir}${HMRgroup}\_resultsTable.txt

rm ${outDir}${HMRgroup}\_temp*.txt

echo "Done."
```

    Starting
    Compiling
    Done.


## Liver unclustered


```bash
### output Directories:
# OutputDirectory for summarized tables:
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/summary_tables/

## Liv - UN
cd ${L_UN_DIR}
HMRgroup="L_unclustered"


############# EVERYTHING BELOW SHOULD BE GOOD TO GO #################


echo "Starting"
for i in *.results
do 
    traitName1="${i%.*}"
    traitName="${traitName1##*.}"
    awk -v fName="${traitName}" -v HMRgrouN="${HMRgroup}" 'BEGIN{OFS="\t"}{if (NR==99) print HMRgrouN,fName,$0}' ${i} > ${outDir}${HMRgroup}\_temp\_${traitName}.txt
done

echo "Compiling"
cat ${outDir}${HMRgroup}\_temp*.txt > ${outDir}${HMRgroup}\_resultsTable.txt

rm ${outDir}${HMRgroup}\_temp*.txt

echo "Done."
```

    Starting
    Compiling
    Done.



```bash

```


```bash
outDir=/data/hodges_lab/Tim/finalAnalyses_HMRs/LDSC_Bcell_shared/summary_tables/
cd $outDir
ls
```

    Bcell_clustered_cellspec_resultsTable.txt
    Bcell_clustered_resultsTable.txt
    Bcell_clustUnclust_resultsBigTable.txt
    B_cellSpecific_M_resultsTable.headers.txt
    B_cellSpecific_M_resultsTable.txt
    Bcell_unclustered_cellspec_resultsTable.txt
    Bcell_unclustered_resultsTable.txt
    B_clustered_resultsTable.txt
    B_unclustered_resultsTable.txt
    headers.txt
    L_clustered_resultsTable.txt
    Liv_cellSpecific_M_resultsTable.txt
    Liv_cellSpecific_M_temp_Albumin.txt
    Liv_cellSpecific_M_temp_ALP.txt
    Liv_cellSpecific_M_temp_ALT.txt
    Liv_cellSpecific_M_temp_Angina_byDoctor.txt
    Liv_cellSpecific_M_temp_Apolipoprotein_B.txt
    Liv_cellSpecific_M_temp_AST.txt
    Liv_cellSpecific_M_temp_blood_EOSINOPHIL_COUNT.txt
    Liv_cellSpecific_M_temp_blood_PLATELET_COUNT.txt
    Liv_cellSpecific_M_temp_blood_RBC_DISTRIB_WIDTH.txt
    Liv_cellSpecific_M_temp_blood_RED_COUNT.txt
    Liv_cellSpecific_M_temp_blood_WHITE_COUNT.txt
    Liv_cellSpecific_M_temp_bmd_HEEL_TSCOREz.txt
    Liv_cellSpecific_M_temp_body_BALDING1.txt
    Liv_cellSpecific_M_temp_body_BMIz.txt
    Liv_cellSpecific_M_temp_body_HEIGHTz.txt
    Liv_cellSpecific_M_temp_body_WHRadjBMIz.txt
    Liv_cellSpecific_M_temp_bp_SYSTOLICadjMEDz.txt
    Liv_cellSpecific_M_temp_Cadiomyopathy_andOther.txt
    Liv_cellSpecific_M_temp_CardiacArrythm.txt
    Liv_cellSpecific_M_temp_Cholesterol.txt
    Liv_cellSpecific_M_temp_Coffee_type.txt
    Liv_cellSpecific_M_temp_Congen_Heart_andGreatArteries.txt
    Liv_cellSpecific_M_temp_cov_EDU_YEARS.txt
    Liv_cellSpecific_M_temp_cov_SMOKING_STATUS.txt
    Liv_cellSpecific_M_temp_disease_AID_SURE.txt
    Liv_cellSpecific_M_temp_disease_ALLERGY_ECZEMA_DIAGNOSED.txt
    Liv_cellSpecific_M_temp_disease_DERMATOLOGY.txt
    Liv_cellSpecific_M_temp_disease_HI_CHOL_SELF_REP.txt
    Liv_cellSpecific_M_temp_disease_HYPOTHYROIDISM_SELF_REP.txt
    Liv_cellSpecific_M_temp_disease_RESPIRATORY_ENT.txt
    Liv_cellSpecific_M_temp_Diseases_of_liver.txt
    Liv_cellSpecific_M_temp_disease_T2D.txt
    Liv_cellSpecific_M_temp_ECG_load.txt
    Liv_cellSpecific_M_temp_ECG_phaseTime.txt
    Liv_cellSpecific_M_temp_ECG.txt
    Liv_cellSpecific_M_temp_Haematocrit_percentage.txt
    Liv_cellSpecific_M_temp_HeartAttack_byDoctor.txt
    Liv_cellSpecific_M_temp_HighBloodPressure_byDoctor.txt
    Liv_cellSpecific_M_temp_I25_chronicIHD.txt
    Liv_cellSpecific_M_temp_I9_Cardiomyopathy.txt
    Liv_cellSpecific_M_temp_I9_IHD_wideDefinition.txt
    Liv_cellSpecific_M_temp_ICD10_I42_Cardiomyopathy.txt
    Liv_cellSpecific_M_temp_ICD10_I48_atrialFibrillationAndFlutter.txt
    Liv_cellSpecific_M_temp_IGF1.txt
    Liv_cellSpecific_M_temp_Liver_chirrosis.txt
    Liv_cellSpecific_M_temp_lung_FEV1FVCzSMOKE.txt
    Liv_cellSpecific_M_temp_lung_FVCzSMOKE.txt
    Liv_cellSpecific_M_temp_Lymphocyte_count.txt
    Liv_cellSpecific_M_temp_LymphoidLeukemia.txt
    Liv_cellSpecific_M_temp_mental_NEUROTICISM.txt
    Liv_cellSpecific_M_temp_Myocardial_infarction.txt
    Liv_cellSpecific_M_temp_Neutrophil_count.txt
    Liv_cellSpecific_M_temp_other_MORNINGPERSON.txt
    Liv_cellSpecific_M_temp_PASS_AgeFirstBirth.txt
    Liv_cellSpecific_M_temp_PASS_Anorexia.txt
    Liv_cellSpecific_M_temp_PASS_Autism.txt
    Liv_cellSpecific_M_temp_PASS_BMI1.txt
    Liv_cellSpecific_M_temp_PASS_Coronary_Artery_Disease.txt
    Liv_cellSpecific_M_temp_PASS_Crohns_Disease.txt
    Liv_cellSpecific_M_temp_PASS_DS.txt
    Liv_cellSpecific_M_temp_PASS_Ever_Smoked.txt
    Liv_cellSpecific_M_temp_PASS_HDL.txt
    Liv_cellSpecific_M_temp_PASS_Height1.txt
    Liv_cellSpecific_M_temp_PASS_LDL.txt
    Liv_cellSpecific_M_temp_PASS_NumberChildrenEverBorn.txt
    Liv_cellSpecific_M_temp_PASS_Rheumatoid_Arthritis.txt
    Liv_cellSpecific_M_temp_PASS_Schizophrenia.txt
    Liv_cellSpecific_M_temp_PASS_Type_2_Diabetes.txt
    Liv_cellSpecific_M_temp_PASS_Ulcerative_Colitis.txt
    Liv_cellSpecific_M_temp_PASS_Years_of_Education2.txt
    Liv_cellSpecific_M_temp_pigment_HAIR.txt
    Liv_cellSpecific_M_temp_pigment_SKIN.txt
    Liv_cellSpecific_M_temp_pigment_SUNBURN.txt
    Liv_cellSpecific_M_temp_pigment_TANNING.txt
    Liv_cellSpecific_M_temp_Primary_lymphoid_neoplasms.txt
    Liv_cellSpecific_M_temp_repro_MENARCHE_AGE.txt
    Liv_cellSpecific_M_temp_repro_MENOPAUSE_AGE.txt
    Liv_cellSpecific_M_temp_RheumatoidFactor.txt
    Liv_cellSpecific_M_temp_Triglycerides.txt
    L_unclustered_resultsTable.txt



```bash
wc -l Bcell_clustered_cellspec_resultsTable.txt
wc -l Bcell_clustered_resultsTable.txt
wc -l L_clustered_resultsTable.txt
```

    79 Bcell_clustered_cellspec_resultsTable.txt
    79 Bcell_clustered_resultsTable.txt
    79 L_clustered_resultsTable.txt

