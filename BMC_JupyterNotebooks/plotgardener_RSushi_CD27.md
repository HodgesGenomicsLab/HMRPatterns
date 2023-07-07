# R-Sushi


## Get files

### Move over .meth files from MethylationHeatmap 


```R
# Initialize our source dir for .meth files
METH_BW_DIR=/data/hodges_lab/Tim/MethylationHeatmap_paper/bigWigs/

# Define Sushi dirs and make (if needed) 
SUSHI_DIR=/data/hodges_lab/Tim/RSushi/
mkdir -p $SUSHI_DIR
SUSHI_BW_DIR=${SUSHI_DIR}bigWigs/
mkdir -p $SUSHI_BW_DIR

# Go to Sushi output dir
cd $SUSHI_BW_DIR

echo "Gonna start."

# Move over meth files
# H1ESC
for FILECP in Human_H1ESC Human_Fetal-Heart Human_Fetal-Spinal-Cord Human_Liver Human_Adrenal-gland Human_BCell Human_Tcell Human_HSC Human_Macrophage
do
# Copy 
cp ${METH_BW_DIR}${FILECP}.meth.bedGraph ${SUSHI_BW_DIR}
# Report
echo "Done with: "${FILECP}
done



#wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigWigToBedGraph
# chmod +x ./bigWigToBedGraph
```

    Gonna start.
    Done with: Human_H1ESC
    Done with: Human_Fetal-Heart
    Done with: Human_Fetal-Spinal-Cord
    Done with: Human_Liver
    Done with: Human_Adrenal-gland
    Done with: Human_BCell
    Done with: Human_Tcell
    Done with: Human_HSC
    Done with: Human_Macrophage


### Download .hmr files


```R
METH_BW_DIR=/data/hodges_lab/Tim/MethylationHeatmap_paper/bigWigs

SUSHI_DIR=/data/hodges_lab/Tim/RSushi/
mkdir -p $SUSHI_DIR
SUSHI_BW_DIR=${SUSHI_DIR}bigWigs
mkdir -p $SUSHI_BW_DIR


cd $SUSHI_BW_DIR

# Download
# H1ESC
wget http://smithdata.usc.edu/methbase/data/Lister-ESC-2009/Human_H1ESC/tracks_hg19/Human_H1ESC.hmr.bb
# fHeart
wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Fetal-Heart/tracks_hg19/Human_Fetal-Heart.hmr.bb
echo "Downloaded 2."
# fSpinal
wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Fetal-Spinal-Cord/tracks_hg19/Human_Fetal-Spinal-Cord.hmr.bb
# Liver
wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Liver/tracks_hg19/Human_Liver.hmr.bb
# Adrenal
echo "Downloaded 4."
wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Adrenal-gland/tracks_hg19/Human_Adrenal-gland.hmr.bb
# B cell
wget http://smithdata.usc.edu/methbase/data/Hodges-Human-2011/Human_BCell/tracks_hg19/Human_BCell.hmr.bb
# T cell
echo "Downloaded 6."
wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Tcell/tracks_hg19/Human_Tcell.hmr.bb
# HSPC
wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_HSC/tracks_hg19/Human_HSC.hmr.bb
# Macrophage
wget http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Macrophage/tracks_hg19/Human_Macrophage.hmr.bb
echo "Done."



```

    --2023-03-28 16:42:54--  http://smithdata.usc.edu/methbase/data/Lister-ESC-2009/Human_H1ESC/tracks_hg19/Human_H1ESC.hmr.bb
    Resolving smithdata.usc.edu (smithdata.usc.edu)... 68.181.32.56
    Connecting to smithdata.usc.edu (smithdata.usc.edu)|68.181.32.56|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 1971894 (1.9M)
    Saving to: ‘Human_H1ESC.hmr.bb’
    
    100%[======================================>] 1,971,894    526KB/s   in 3.7s   
    
    2023-03-28 16:42:57 (526 KB/s) - ‘Human_H1ESC.hmr.bb’ saved [1971894/1971894]
    
    --2023-03-28 16:42:57--  http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Fetal-Heart/tracks_hg19/Human_Fetal-Heart.hmr.bb
    Resolving smithdata.usc.edu (smithdata.usc.edu)... 68.181.32.56
    Connecting to smithdata.usc.edu (smithdata.usc.edu)|68.181.32.56|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 683765 (668K)
    Saving to: ‘Human_Fetal-Heart.hmr.bb’
    
    100%[======================================>] 683,765      496KB/s   in 1.3s   
    
    2023-03-28 16:42:59 (496 KB/s) - ‘Human_Fetal-Heart.hmr.bb’ saved [683765/683765]
    
    Downloaded 2.
    --2023-03-28 16:42:59--  http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Fetal-Spinal-Cord/tracks_hg19/Human_Fetal-Spinal-Cord.hmr.bb
    Resolving smithdata.usc.edu (smithdata.usc.edu)... 68.181.32.56
    Connecting to smithdata.usc.edu (smithdata.usc.edu)|68.181.32.56|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 678979 (663K)
    Saving to: ‘Human_Fetal-Spinal-Cord.hmr.bb’
    
    100%[======================================>] 678,979      518KB/s   in 1.3s   
    
    2023-03-28 16:43:01 (518 KB/s) - ‘Human_Fetal-Spinal-Cord.hmr.bb’ saved [678979/678979]
    
    --2023-03-28 16:43:01--  http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Liver/tracks_hg19/Human_Liver.hmr.bb
    Resolving smithdata.usc.edu (smithdata.usc.edu)... 68.181.32.56
    Connecting to smithdata.usc.edu (smithdata.usc.edu)|68.181.32.56|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 629100 (614K)
    Saving to: ‘Human_Liver.hmr.bb’
    
    100%[======================================>] 629,100      530KB/s   in 1.2s   
    
    2023-03-28 16:43:02 (530 KB/s) - ‘Human_Liver.hmr.bb’ saved [629100/629100]
    
    Downloaded 4.
    --2023-03-28 16:43:02--  http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Adrenal-gland/tracks_hg19/Human_Adrenal-gland.hmr.bb
    Resolving smithdata.usc.edu (smithdata.usc.edu)... 68.181.32.56
    Connecting to smithdata.usc.edu (smithdata.usc.edu)|68.181.32.56|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 627306 (613K)
    Saving to: ‘Human_Adrenal-gland.hmr.bb’
    
    100%[======================================>] 627,306      534KB/s   in 1.1s   
    
    2023-03-28 16:43:03 (534 KB/s) - ‘Human_Adrenal-gland.hmr.bb’ saved [627306/627306]
    
    --2023-03-28 16:43:04--  http://smithdata.usc.edu/methbase/data/Hodges-Human-2011/Human_BCell/tracks_hg19/Human_BCell.hmr.bb
    Resolving smithdata.usc.edu (smithdata.usc.edu)... 68.181.32.56
    Connecting to smithdata.usc.edu (smithdata.usc.edu)|68.181.32.56|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 2521546 (2.4M)
    Saving to: ‘Human_BCell.hmr.bb’
    
    100%[======================================>] 2,521,546    506KB/s   in 4.9s   
    
    2023-03-28 16:43:09 (506 KB/s) - ‘Human_BCell.hmr.bb’ saved [2521546/2521546]
    
    Downloaded 6.
    --2023-03-28 16:43:09--  http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Tcell/tracks_hg19/Human_Tcell.hmr.bb
    Resolving smithdata.usc.edu (smithdata.usc.edu)... 68.181.32.56
    Connecting to smithdata.usc.edu (smithdata.usc.edu)|68.181.32.56|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 700880 (684K)
    Saving to: ‘Human_Tcell.hmr.bb’
    
    100%[======================================>] 700,880      528KB/s   in 1.3s   
    
    2023-03-28 16:43:10 (528 KB/s) - ‘Human_Tcell.hmr.bb’ saved [700880/700880]
    
    --2023-03-28 16:43:10--  http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_HSC/tracks_hg19/Human_HSC.hmr.bb
    Resolving smithdata.usc.edu (smithdata.usc.edu)... 68.181.32.56
    Connecting to smithdata.usc.edu (smithdata.usc.edu)|68.181.32.56|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 853731 (834K)
    Saving to: ‘Human_HSC.hmr.bb’
    
    100%[======================================>] 853,731      510KB/s   in 1.6s   
    
    2023-03-28 16:43:12 (510 KB/s) - ‘Human_HSC.hmr.bb’ saved [853731/853731]
    
    --2023-03-28 16:43:12--  http://smithdata.usc.edu/methbase/data/Roadmap-Human-2015/Human_Macrophage/tracks_hg19/Human_Macrophage.hmr.bb
    Resolving smithdata.usc.edu (smithdata.usc.edu)... 68.181.32.56
    Connecting to smithdata.usc.edu (smithdata.usc.edu)|68.181.32.56|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 958594 (936K)
    Saving to: ‘Human_Macrophage.hmr.bb’
    
    100%[======================================>] 958,594      508KB/s   in 1.8s   
    
    2023-03-28 16:43:14 (508 KB/s) - ‘Human_Macrophage.hmr.bb’ saved [958594/958594]
    
    Done.
    total 7.3G
    -rw-r--r-- 1 scottt7 hodges_lab 2.5M Jul 15  2013 Human_BCell.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 1.9M Aug 19  2013 Human_H1ESC.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 615K Mar 27  2015 Human_Liver.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 613K Mar 29  2015 Human_Adrenal-gland.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 685K Apr 10  2015 Human_Tcell.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 937K Apr 10  2015 Human_Macrophage.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 668K Apr 11  2015 Human_Fetal-Heart.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 834K Apr 11  2015 Human_HSC.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 664K Apr 14  2015 Human_Fetal-Spinal-Cord.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab  45M Mar 28 16:15 Human_H1ESC.meth.bw
    -rw-r--r-- 1 scottt7 hodges_lab 826M Mar 28 16:35 Human_H1ESC.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 828M Mar 28 16:36 Human_Fetal-Heart.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 812M Mar 28 16:37 Human_Fetal-Spinal-Cord.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 842M Mar 28 16:38 Human_Liver.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 852M Mar 28 16:39 Human_Adrenal-gland.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 797M Mar 28 16:39 Human_BCell.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 797M Mar 28 16:40 Human_Tcell.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 801M Mar 28 16:40 Human_HSC.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 788M Mar 28 16:41 Human_Macrophage.meth.bedGraph


### Convert from bigBed to bedGraph

Get tool


```R
wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigBedToBed 
chmod +x ./bigBedToBed
```

    --2023-03-28 16:46:45--  http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bigBedToBed
    Resolving hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)... 128.114.119.163
    Connecting to hgdownload.soe.ucsc.edu (hgdownload.soe.ucsc.edu)|128.114.119.163|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 9482776 (9.0M)
    Saving to: ‘bigBedToBed’
    
    100%[======================================>] 9,482,776   6.84MB/s   in 1.3s   
    
    2023-03-28 16:46:47 (6.84 MB/s) - ‘bigBedToBed’ saved [9482776/9482776]
    



```R
for file in *.bb
do
    NAME="${file%.*}"
    ./bigBedToBed $file ${NAME}.bed
    echo "Wrote: " ${NAME}".bed"
done
```

    Wrote:  Human_Adrenal-gland.hmr.bed
    Wrote:  Human_BCell.hmr.bed
    Wrote:  Human_Fetal-Heart.hmr.bed
    Wrote:  Human_Fetal-Spinal-Cord.hmr.bed
    Wrote:  Human_H1ESC.hmr.bed
    Wrote:  Human_HSC.hmr.bed
    Wrote:  Human_Liver.hmr.bed
    Wrote:  Human_Macrophage.hmr.bed
    Wrote:  Human_Tcell.hmr.bed



```R
cd $SUSHI_BW_DIR
ls -lhtr
```

    total 7.2G
    -rw-r--r-- 1 scottt7 hodges_lab 2.5M Jul 15  2013 Human_BCell.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 1.9M Aug 19  2013 Human_H1ESC.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 615K Mar 27  2015 Human_Liver.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 613K Mar 29  2015 Human_Adrenal-gland.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 685K Apr 10  2015 Human_Tcell.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 937K Apr 10  2015 Human_Macrophage.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 668K Apr 11  2015 Human_Fetal-Heart.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 834K Apr 11  2015 Human_HSC.hmr.bb
    -rw-r--r-- 1 scottt7 hodges_lab 664K Apr 14  2015 Human_Fetal-Spinal-Cord.hmr.bb
    -rwxr-xr-x 1 scottt7 hodges_lab 9.1M Mar 22 10:21 bigBedToBed
    -rw-r--r-- 1 scottt7 hodges_lab 826M Mar 28 16:35 Human_H1ESC.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 828M Mar 28 16:36 Human_Fetal-Heart.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 812M Mar 28 16:37 Human_Fetal-Spinal-Cord.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 842M Mar 28 16:38 Human_Liver.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 852M Mar 28 16:39 Human_Adrenal-gland.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 797M Mar 28 16:39 Human_BCell.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 797M Mar 28 16:40 Human_Tcell.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 801M Mar 28 16:40 Human_HSC.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 788M Mar 28 16:41 Human_Macrophage.meth.bedGraph
    -rw-r--r-- 1 scottt7 hodges_lab 1.3M Mar 28 16:47 Human_Adrenal-gland.hmr.bed
    -rw-r--r-- 1 scottt7 hodges_lab 2.0M Mar 28 16:47 Human_BCell.hmr.bed
    -rw-r--r-- 1 scottt7 hodges_lab 1.5M Mar 28 16:47 Human_Fetal-Heart.hmr.bed
    -rw-r--r-- 1 scottt7 hodges_lab 1.5M Mar 28 16:47 Human_Fetal-Spinal-Cord.hmr.bed
    -rw-r--r-- 1 scottt7 hodges_lab 1.4M Mar 28 16:47 Human_H1ESC.hmr.bed
    -rw-r--r-- 1 scottt7 hodges_lab 2.5M Mar 28 16:47 Human_HSC.hmr.bed
    -rw-r--r-- 1 scottt7 hodges_lab 1.4M Mar 28 16:47 Human_Liver.hmr.bed
    -rw-r--r-- 1 scottt7 hodges_lab 2.8M Mar 28 16:47 Human_Macrophage.hmr.bed
    -rw-r--r-- 1 scottt7 hodges_lab 1.9M Mar 28 16:47 Human_Tcell.hmr.bed



```R
head *hmr.bed
```

    ==> Human_Adrenal-gland.hmr.bed <==
    chr1	28511	29415
    chr1	91118	91580
    chr1	521379	521660
    chr1	564500	566009
    chr1	566518	566879
    chr1	567166	568325
    chr1	568477	568610
    chr1	568760	569558
    chr1	569692	570301
    chr1	713542	715041
    
    ==> Human_BCell.hmr.bed <==
    chr1	28511	29460	HYPO0	23
    chr1	237055	237877	HYPO1	7
    chr1	521533	521660	HYPO2	6
    chr1	564470	566009	HYPO3	34
    chr1	566458	566879	HYPO4	18
    chr1	567166	570301	HYPO5	88
    chr1	713671	715041	HYPO6	83
    chr1	724219	724516	HYPO7	12
    chr1	762003	763205	HYPO8	92
    chr1	794016	794456	HYPO9	11
    
    ==> Human_Fetal-Heart.hmr.bed <==
    chr1	28511	29512
    chr1	91118	91580
    chr1	521379	521660
    chr1	580157	580989
    chr1	601076	601549
    chr1	713547	714894
    chr1	762003	764108
    chr1	793919	794622
    chr1	801044	801850
    chr1	804991	805627
    
    ==> Human_Fetal-Spinal-Cord.hmr.bed <==
    chr1	20043	20480
    chr1	28511	29553
    chr1	91118	91580
    chr1	521533	521660
    chr1	540516	540920
    chr1	564894	570221
    chr1	713671	714894
    chr1	752453	752987
    chr1	761604	763372
    chr1	794032	794419
    
    ==> Human_H1ESC.hmr.bed <==
    chr1	564470	566570	HYPO0	39	+
    chr1	566713	566879	HYPO1	7	+
    chr1	567112	567402	HYPO2	7	+
    chr1	567500	567696	HYPO3	6	+
    chr1	567881	568325	HYPO4	10	+
    chr1	568459	568587	HYPO5	10	+
    chr1	568760	570301	HYPO6	32	+
    chr1	713671	714779	HYPO7	56	+
    chr1	724205	724285	HYPO8	7	+
    chr1	762112	763166	HYPO9	89	+
    
    ==> Human_HSC.hmr.bed <==
    chr1	28432	29553	HYPO0	0	+
    chr1	91118	91684	HYPO1	0	+
    chr1	237516	237877	HYPO2	0	+
    chr1	435874	436666	HYPO3	0	+
    chr1	521533	521660	HYPO4	0	+
    chr1	540624	541078	HYPO5	0	+
    chr1	566292	566624	HYPO6	0	+
    chr1	567121	567786	HYPO7	0	+
    chr1	713542	714932	HYPO8	0	+
    chr1	751579	752911	HYPO9	0	+
    
    ==> Human_Liver.hmr.bed <==
    chr1	10632	10670
    chr1	28511	30155
    chr1	51441	51734
    chr1	137353	137404
    chr1	521379	521660
    chr1	540749	540897
    chr1	567205	567402
    chr1	567500	567711
    chr1	713542	715250
    chr1	752453	752841
    
    ==> Human_Macrophage.hmr.bed <==
    chr1	29297	29604	HYPO0	0	+
    chr1	91118	91580	HYPO1	0	+
    chr1	96558	96806	HYPO2	0	+
    chr1	235927	237256	HYPO3	0	+
    chr1	241322	243648	HYPO4	0	+
    chr1	250304	250571	HYPO5	0	+
    chr1	540532	541078	HYPO6	0	+
    chr1	713542	714925	HYPO7	0	+
    chr1	751771	752987	HYPO8	0	+
    chr1	762003	763814	HYPO9	0	+
    
    ==> Human_Tcell.hmr.bed <==
    chr1	29297	29604	HYPO0	0	+
    chr1	91118	91580	HYPO1	0	+
    chr1	540604	540991	HYPO2	0	+
    chr1	713547	714894	HYPO3	0	+
    chr1	762112	763327	HYPO4	0	+
    chr1	777447	777888	HYPO5	0	+
    chr1	779994	780162	HYPO6	0	+
    chr1	793394	793650	HYPO7	0	+
    chr1	793919	794331	HYPO8	0	+
    chr1	804991	805500	HYPO9	0	+



```R
head *meth.bedGraph
```

    ==> Human_Adrenal-gland.meth.bedGraph <==
    chr1	10468	10469	0.625
    chr1	10470	10471	0.675325
    chr1	10483	10484	0.848485
    chr1	10488	10489	0.827273
    chr1	10492	10493	0.726496
    chr1	10496	10497	0.878049
    chr1	10524	10525	0.902597
    chr1	10541	10542	0.919708
    chr1	10562	10563	0.932039
    chr1	10570	10571	0.956044
    
    ==> Human_BCell.meth.bedGraph <==
    chr1	10468	10469	0.625
    chr1	10470	10471	0.684211
    chr1	10483	10484	0.888889
    chr1	10488	10489	1
    chr1	10492	10493	0.85
    chr1	10496	10497	0.92
    chr1	10524	10525	0.909091
    chr1	10541	10542	0.947368
    chr1	10562	10563	0.866667
    chr1	10570	10571	1
    
    ==> Human_Fetal-Heart.meth.bedGraph <==
    chr1	10468	10469	0.588235
    chr1	10470	10471	0.736842
    chr1	10483	10484	0.833333
    chr1	10488	10489	0.931034
    chr1	10492	10493	0.666667
    chr1	10496	10497	0.939394
    chr1	10524	10525	0.868421
    chr1	10541	10542	0.902439
    chr1	10562	10563	0.914286
    chr1	10570	10571	0.9
    
    ==> Human_Fetal-Spinal-Cord.meth.bedGraph <==
    chr1	10468	10469	0.733333
    chr1	10470	10471	0.588235
    chr1	10483	10484	0.76
    chr1	10488	10489	0.678571
    chr1	10492	10493	0.586207
    chr1	10496	10497	0.933333
    chr1	10524	10525	0.948718
    chr1	10541	10542	0.826087
    chr1	10562	10563	0.846154
    chr1	10570	10571	0.836066
    
    ==> Human_H1ESC.meth.bedGraph <==
    chr1	10468	10469	0.875
    chr1	10470	10471	0.941177
    chr1	10483	10484	0.909091
    chr1	10488	10489	1
    chr1	10492	10493	0.791667
    chr1	10496	10497	0.923077
    chr1	10524	10525	0.96875
    chr1	10541	10542	0.928571
    chr1	10562	10563	0.95
    chr1	10570	10571	0.941176
    
    ==> Human_HSC.meth.bedGraph <==
    chr1	10468	10469	0.368421
    chr1	10470	10471	0.5
    chr1	10483	10484	0.75
    chr1	10488	10489	0.772727
    chr1	10492	10493	0.565217
    chr1	10496	10497	0.791667
    chr1	10524	10525	1
    chr1	10541	10542	0.944444
    chr1	10562	10563	0.864865
    chr1	10570	10571	0.947368
    
    ==> Human_Liver.meth.bedGraph <==
    chr1	10468	10469	0.7125
    chr1	10470	10471	0.703704
    chr1	10483	10484	0.804348
    chr1	10488	10489	0.752577
    chr1	10492	10493	0.653061
    chr1	10496	10497	0.864078
    chr1	10524	10525	0.904762
    chr1	10541	10542	0.944444
    chr1	10562	10563	0.784615
    chr1	10570	10571	0.894737
    
    ==> Human_Macrophage.meth.bedGraph <==
    chr1	10468	10469	0.675
    chr1	10470	10471	0.615385
    chr1	10483	10484	0.790698
    chr1	10488	10489	0.904762
    chr1	10492	10493	0.765957
    chr1	10496	10497	0.9375
    chr1	10524	10525	0.912281
    chr1	10541	10542	0.952381
    chr1	10562	10563	0.823529
    chr1	10570	10571	0.863014
    
    ==> Human_Tcell.meth.bedGraph <==
    chr1	10468	10469	0.612903
    chr1	10470	10471	0.827586
    chr1	10483	10484	0.90625
    chr1	10488	10489	0.8125
    chr1	10492	10493	0.727273
    chr1	10496	10497	1
    chr1	10524	10525	0.976744
    chr1	10541	10542	0.958333
    chr1	10562	10563	0.92
    chr1	10570	10571	0.909091


### Convert from bigWig to bedGraph - MethFiles


```R
for file in *.bw
do
    NAME="${file%.*}"
    ./bigWigToBedGraph $file ${NAME}.bedGraph
    echo "Wrote: " ${NAME}".bedgraph"
done
```

## R - Load libraries


```R
library(plotgardener)
```

    Warning message:
    “package ‘plotgardener’ was built under R version 4.1.3”
    
    Attaching package: ‘plotgardener’
    
    
    The following object is masked from ‘package:base’:
    
        c
    
    



```R
# source("http://bioconductor.org/biocLite.R")
# biocLite("Sushi")
library(Sushi)
library(tidyverse)
library(readr)

setwd("/data/hodges_lab/Tim/RSushi/bigWigs")

```

    Loading required package: zoo
    
    
    Attaching package: ‘zoo’
    
    
    The following objects are masked from ‘package:base’:
    
        as.Date, as.Date.numeric
    
    
    Loading required package: biomaRt
    
    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.1 ──
    
    [32m✔[39m [34mggplot2[39m 3.3.6     [32m✔[39m [34mpurrr  [39m 0.3.4
    [32m✔[39m [34mtibble [39m 3.1.7     [32m✔[39m [34mdplyr  [39m 1.0.9
    [32m✔[39m [34mtidyr  [39m 1.2.0     [32m✔[39m [34mstringr[39m 1.4.0
    [32m✔[39m [34mreadr  [39m 2.1.2     [32m✔[39m [34mforcats[39m 0.5.1
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    [31m✖[39m [34mdplyr[39m::[32mselect()[39m masks [34mbiomaRt[39m::select()
    



```R
list.files()
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'bigBedToBed'</li><li>'Human_Adrenal-gland.hmr.bb'</li><li>'Human_Adrenal-gland.hmr.bed'</li><li>'Human_Adrenal-gland.meth.bedGraph'</li><li>'Human_BCell.hmr.bb'</li><li>'Human_BCell.hmr.bed'</li><li>'Human_BCell.meth.bedGraph'</li><li>'Human_Fetal-Heart.hmr.bb'</li><li>'Human_Fetal-Heart.hmr.bed'</li><li>'Human_Fetal-Heart.meth.bedGraph'</li><li>'Human_Fetal-Spinal-Cord.hmr.bb'</li><li>'Human_Fetal-Spinal-Cord.hmr.bed'</li><li>'Human_Fetal-Spinal-Cord.meth.bedGraph'</li><li>'Human_H1ESC.hmr.bb'</li><li>'Human_H1ESC.hmr.bed'</li><li>'Human_H1ESC.meth.bedGraph'</li><li>'Human_HSC.hmr.bb'</li><li>'Human_HSC.hmr.bed'</li><li>'Human_HSC.meth.bedGraph'</li><li>'Human_Liver.hmr.bb'</li><li>'Human_Liver.hmr.bed'</li><li>'Human_Liver.meth.bedGraph'</li><li>'Human_Macrophage.hmr.bb'</li><li>'Human_Macrophage.hmr.bed'</li><li>'Human_Macrophage.meth.bedGraph'</li><li>'Human_Tcell.hmr.bb'</li><li>'Human_Tcell.hmr.bed'</li><li>'Human_Tcell.meth.bedGraph'</li></ol>



## Read in meth bedgraph files 


```R
adrenal_meth <- read_tsv("Human_Adrenal-gland.meth.bedGraph", col_names=c("chr","start","end","methfraction"))
bcell_meth <- read_tsv("Human_BCell.meth.bedGraph", col_names=c("chr","stat","end","methfraction"))
fheart_meth <- read_tsv("Human_Fetal-Heart.meth.bedGraph", col_names=c("chr","start","end","methfraction"))
fspinal_meth <- read_tsv("Human_Fetal-Spinal-Cord.meth.bedGraph", col_names=c("chr","start","end","methfraction"))
h1esc_meth <- read_tsv("Human_H1ESC.meth.bedGraph", col_names=c("chr","start","end","methfraction"))
liver_meth  <- read_tsv("Human_Liver.meth.bedGraph", col_names=c("chr","start","end","methfraction"))
macro_meth  <- read_tsv("Human_Macrophage.meth.bedGraph", col_names=c("chr","start","end","methfraction"))
hspc_meth  <- read_tsv("Human_HSC.meth.bedGraph", col_names=c("chr","start","end","methfraction"))
```


    Error in read_tsv("Human_Adrenal-gland.meth.bedGraph", col_names = c("chr", : could not find function "read_tsv"
    Traceback:



## Read in HMR files


```R
# Read in HMR files
adrenal_hmr <- read_tsv("Human_Adrenal-gland.hmr.bed", col_names=c("chr","start","end"))
bcell_hmr <- read_tsv("Human_BCell.hmr.bed", col_names=c("chr","start","end"))
fheart_hmr <- read_tsv("Human_Fetal-Heart.hmr.bed", col_names=c("chr","start","end"))
fspinal_hmr <- read_tsv("Human_Fetal-Spinal-Cord.hmr.bed", col_names=c("chr","start","end"))
h1esc_hmr <- read_tsv("Human_H1ESC.hmr.bed", col_names=c("chr","start","end"))
liver_hmr <- read_tsv("Human_Liver.hmr.bed", col_names=c("chr","start","end"))
macro_hmr <- read_tsv("Human_Macrophage.hmr.bed", col_names=c("chr","start","end"))
hspc_hmr <- read_tsv("Human_HSC.hmr.bed", col_names=c("chr","start","end"))
```

    [1mRows: [22m[34m56655[39m [1mColumns: [22m[34m3[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (2): start, end
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m54998[39m [1mColumns: [22m[34m5[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (2): chr, X4
    [32mdbl[39m (3): start, end, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m64186[39m [1mColumns: [22m[34m3[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (2): start, end
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m65130[39m [1mColumns: [22m[34m3[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (2): start, end
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m36359[39m [1mColumns: [22m[34m6[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (3): chr, X4, X6
    [32mdbl[39m (3): start, end, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m58652[39m [1mColumns: [22m[34m3[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (2): start, end
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m77058[39m [1mColumns: [22m[34m6[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (3): chr, X4, X6
    [32mdbl[39m (3): start, end, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m67223[39m [1mColumns: [22m[34m6[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (3): chr, X4, X6
    [32mdbl[39m (3): start, end, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


## Set coordinates of genomic regions to plot


```R

```


```R
# CD-27 genomic coordinates
chrom27 = "chr12"
chromstart27 = 6530000
chromend27 = 6585000


pageCreate(width = 20, height = 10, default.units = "inches")

######### Plot CD-27 locus
# Set layout matrix
layout(matrix(c(1,2,3,4,5,6,7,8,9,10,11,12),  byrow = TRUE))

# Adrenal 
plotBed(adrenal_hmr,chrom27,chromstart27,chromend27,color="orange")
mtext("Adrenal",side=2,line=1.75,cex=1,font=2)
plotBedgraph(adrenal_meth,chrom27,chromstart27,chromend27,color="blue")
mtext("Methylation_Fraction",side=2,line=1.75,cex=1,font=2)
# Bcell 
plotBed(bcell_hmr,chrom27,chromstart27,chromend27,color="orange")
mtext("Bcell",side=2,line=1.75,cex=1,font=2)
plotBedgraph(bcell_meth,chrom27,chromstart27,chromend27,color="blue")
mtext("Methylation_Fraction",side=2,line=1.75,cex=1,font=2)
# fHeart 
plotBed(fheart_hmr,chrom27,chromstart27,chromend27,color="orange")
mtext("fHeart",side=2,line=1.75,cex=1,font=2)
plotBedgraph(fheart_meth,chrom27,chromstart27,chromend27,color="blue")
mtext("Methylation_Fraction",side=2,line=1.75,cex=1,font=2)
# fSpinal 
plotBed(fspinal_hmr,chrom27,chromstart27,chromend27,color="orange")
mtext("fSpinal",side=2,line=1.75,cex=1,font=2)
plotBedgraph(fspinal_meth,chrom27,chromstart27,chromend27,color="blue")
mtext("Methylation_Fraction",side=2,line=1.75,cex=1,font=2)
# H1ESC 
plotBed(h1esc_hmr,chrom27,chromstart27,chromend27,color="orange")
mtext("H1ESC",side=2,line=1.75,cex=1,font=2)
plotBedgraph(h1esc_meth,chrom27,chromstart27,chromend27,color="blue")
mtext("Methylation_Fraction",side=2,line=1.75,cex=1,font=2)
# Liver 
plotBed(liver_hmr,chrom27,chromstart27,chromend27,color="orange")
mtext("Liver",side=2,line=1.75,cex=1,font=2)
plotBedgraph(liver_meth,chrom27,chromstart27,chromend27,color="blue")
labelgenome(chrom, chromstart27, chromend27, n=10, scale="Kb")
mtext("Methylation_Fraction",side=2,line=1.75,cex=1,font=2)

```


    Error in plotBed(adrenal_hmr, chrom27, chromstart27, chromend27, color = "orange"): could not find function "plotBed"
    Traceback:




![png](output_25_1.png)



```R

```

# PLOT GARDENER

# Install


```R
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("plotgardener")
```

    Bioconductor version '3.14' is out-of-date; the current release version '3.16'
      is available with R version '4.2'; see https://bioconductor.org/install
    
    'getOption("repos")' replaces Bioconductor standard repositories, see
    '?repositories' for details
    
    replacement repositories:
        CRAN: https://cran.r-project.org
    
    
    Bioconductor version 3.14 (BiocManager 1.30.16), R 4.1.2 (2021-11-01)
    
    Installing package(s) 'plotgardener'
    
    Old packages: 'AnnotationDbi', 'ape', 'aplot', 'bbmle', 'bdsmatrix', 'BH',
      'bibtex', 'BiocFileCache', 'BiocManager', 'biomaRt', 'bit', 'blob', 'boot',
      'brew', 'broom', 'bslib', 'cachem', 'callr', 'car', 'caret', 'checkmate',
      'ChIPpeakAnno', 'ChIPseeker', 'class', 'cli', 'cluster', 'clusterProfiler',
      'codetools', 'colorspace', 'commonmark', 'conquer', 'cpp11', 'crayon',
      'crul', 'curl', 'data.table', 'DBI', 'dbplyr', 'dendextend', 'desc',
      'devtools', 'dichromat', 'digest', 'DOSE', 'dplyr', 'DT', 'dtplyr', 'e1071',
      'enrichplot', 'ensembldb', 'eulerr', 'evaluate', 'fansi', 'fastmap',
      'fontawesome', 'forcats', 'foreign', 'formatR', 'fs', 'furrr', 'future',
      'future.apply', 'gargle', 'GenomeInfoDb', 'GenomicFeatures', 'GenSA', 'gert',
      'ggforce', 'ggfun', 'ggplot2', 'ggpubr', 'ggraph', 'ggrepel', 'ggsci',
      'ggsignif', 'ggtree', 'gh', 'gitcreds', 'glmnet', 'globals', 'googledrive',
      'googlesheets4', 'gower', 'gplots', 'graphlayouts', 'gtable', 'gtools',
      'haven', 'heatmaply', 'hexbin', 'highr', 'hms', 'htmltools', 'htmlwidgets',
      'httpuv', 'httr', 'igraph', 'ipred', 'IRkernel', 'isoband', 'jsonlite',
      'knitr', 'later', 'lava', 'lifecycle', 'limma', 'listenv', 'lme4', 'lobstr',
      'locfit', 'lubridate', 'mapproj', 'maps', 'maptools', 'MASS', 'Matrix',
      'MatrixModels', 'matrixStats', 'mgcv', 'minqa', 'modelr', 'nlme', 'nloptr',
      'NMF', 'nnet', 'openssl', 'openxlsx', 'optparse', 'parallelly', 'patchwork',
      'pbdZMQ', 'pbkrtest', 'pcaExplorer', 'pillar', 'pkgbuild', 'pkgload',
      'pkgmaker', 'plotly', 'plyr', 'png', 'polyclip', 'polynom', 'pracma',
      'processx', 'progressr', 'proxy', 'pryr', 'ps', 'purrr', 'qap', 'quantmod',
      'quantreg', 'R.methodsS3', 'R.oo', 'R.utils', 'randomForest', 'Rcpp',
      'RcppArmadillo', 'RcppEigen', 'RcppNumerical', 'RCurl', 'readr', 'readxl',
      'recipes', 'regioneR', 'repr', 'reprex', 'restfulr', 'rgl', 'rlang',
      'rmarkdown', 'roxygen2', 'rpart', 'rprojroot', 'RSQLite', 'rstatix',
      'rstudioapi', 'rvcheck', 'rversions', 'rvest', 'S4Vectors', 'sass', 'scales',
      'scatterpie', 'seriation', 'shadowtext', 'shiny', 'shinyAce', 'shinyBS',
      'sourcetools', 'sp', 'spatial', 'statmod', 'strawr', 'stringi', 'stringr',
      'survival', 'Sushi', 'sys', 'testthat', 'TFMPvalue', 'tibble', 'tidygraph',
      'tidyr', 'tidyselect', 'tidytree', 'tidyverse', 'timeDate', 'tinytex',
      'treeio', 'triebeard', 'TSP', 'tweenr', 'tzdb', 'utf8', 'uuid', 'vctrs',
      'VennDiagram', 'viridisLite', 'vroom', 'waldo', 'webshot', 'whisker', 'xfun',
      'XML', 'xts', 'yaml', 'yulab.utils', 'zip', 'zoo'
    


# -----------------

# ----------------

# ----------------

# ----------------

# Load libraries


```R
library(plotgardener)

library(TxDb.Hsapiens.UCSC.hg19.knownGene)
#library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(rtracklayer)

# source("http://bioconductor.org/biocLite.R")
# biocLite("Sushi")
library(tidyverse)
library(readr)

setwd("/data/hodges_lab/Tim/plotgardener_RSushi/bigWigs")

print("Libraries have been loaded.")
```

    [1] "Libraries have been loaded."


# Load Files


```R
adrenal_meth <- read_tsv("Human_Adrenal-gland.meth.bedGraph", col_names=c("chr","start","end","score"))
bcell_meth <- read_tsv("Human_BCell.meth.bedGraph", col_names=c("chr","stat","end","score"))
print("Loaded 2.")
tcell_meth <- read_tsv("Human_Tcell.meth.bedGraph", col_names=c("chr","stat","end","score"))
fheart_meth <- read_tsv("Human_Fetal-Heart.meth.bedGraph", col_names=c("chr","start","end","score"))
fspinal_meth <- read_tsv("Human_Fetal-Spinal-Cord.meth.bedGraph", col_names=c("chr","start","end","score"))
print("Loaded 5.")
h1esc_meth <- read_tsv("Human_H1ESC.meth.bedGraph", col_names=c("chr","start","end","score"))
liver_meth  <- read_tsv("Human_Liver.meth.bedGraph", col_names=c("chr","start","end","score"))
print("Loaded 7.")
macro_meth  <- read_tsv("Human_Macrophage.meth.bedGraph", col_names=c("chr","start","end","score"))
hspc_meth  <- read_tsv("Human_HSC.meth.bedGraph", col_names=c("chr","start","end","score"))
print("Loaded 9.")
```

    [1mRows: [22m[34m28217448[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, score
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m28299638[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): stat, end, score
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


    [1] "Loaded 2."


    [1mRows: [22m[34m27253453[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): stat, end, score
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m28217448[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, score
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m28217448[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, score
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


    [1] "Loaded 5."


    [1mRows: [22m[34m28299638[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, score
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m28217448[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, score
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


    [1] "Loaded 7."


    [1mRows: [22m[34m27230570[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, score
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m27432516[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, score
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


    [1] "Loaded 9."



```R
# Read in HMR files
adrenal_hmr <- read_tsv("Human_Adrenal-gland.hmr.bed", col_names=c("chr","start","end"))
bcell_hmr <- read_tsv("Human_BCell.hmr.bed", col_names=c("chr","start","end"))
tcell_hmr <- read_tsv("Human_Tcell.hmr.bed", col_names=c("chr","start","end"))
fheart_hmr <- read_tsv("Human_Fetal-Heart.hmr.bed", col_names=c("chr","start","end"))
fspinal_hmr <- read_tsv("Human_Fetal-Spinal-Cord.hmr.bed", col_names=c("chr","start","end"))
h1esc_hmr <- read_tsv("Human_H1ESC.hmr.bed", col_names=c("chr","start","end"))
liver_hmr <- read_tsv("Human_Liver.hmr.bed", col_names=c("chr","start","end"))
macro_hmr <- read_tsv("Human_Macrophage.hmr.bed", col_names=c("chr","start","end"))
hspc_hmr <- read_tsv("Human_HSC.hmr.bed", col_names=c("chr","start","end"))
```

    [1mRows: [22m[34m56655[39m [1mColumns: [22m[34m3[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (2): start, end
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m54998[39m [1mColumns: [22m[34m5[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (2): chr, X4
    [32mdbl[39m (3): start, end, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m51640[39m [1mColumns: [22m[34m6[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (3): chr, X4, X6
    [32mdbl[39m (3): start, end, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m64186[39m [1mColumns: [22m[34m3[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (2): start, end
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m65130[39m [1mColumns: [22m[34m3[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (2): start, end
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m36359[39m [1mColumns: [22m[34m6[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (3): chr, X4, X6
    [32mdbl[39m (3): start, end, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m58652[39m [1mColumns: [22m[34m3[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (2): start, end
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m77058[39m [1mColumns: [22m[34m6[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (3): chr, X4, X6
    [32mdbl[39m (3): start, end, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m67223[39m [1mColumns: [22m[34m6[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (3): chr, X4, X6
    [32mdbl[39m (3): start, end, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


## Load GTEx

### Test GTEx upload


```R
gtex_data <- read_tsv("GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt", col_names=c("chr","start","end"))

gtex_data_sig1e20 <- read_tsv("GTEx_Analysis_v8.metasoft.chr12_region.bed.pRE_sig1e20.txt", col_names=c("chr","start","end"))

gtex_data_sig1e40 <- read_tsv("GTEx_Analysis_v8.metasoft.chr12_region.bed.pRE_sig1e40.txt", col_names=c("chr","start","end"))

# eQTLbarsp <- plotRanges(eQTLbars, params = coords, y = 6.6, height =1, 
#                        fill = "#08CE3E")
```

    [1mRows: [22m[34m792[39m [1mColumns: [22m[34m5[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (4): start, end, X4, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m356[39m [1mColumns: [22m[34m5[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (4): start, end, X4, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m172[39m [1mColumns: [22m[34m5[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (4): start, end, X4, X5
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



```R
gtex_data
```


<table class="dataframe">
<caption>A spec_tbl_df: 253 × 3</caption>
<thead>
	<tr><th scope=col>chr</th><th scope=col>start</th><th scope=col>end</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr12</td><td> 3328690</td><td> 3328691</td></tr>
	<tr><td>chr12</td><td> 3328843</td><td> 3328844</td></tr>
	<tr><td>chr12</td><td> 3328852</td><td> 3328853</td></tr>
	<tr><td>chr12</td><td> 3366831</td><td> 3366832</td></tr>
	<tr><td>chr12</td><td> 9611206</td><td> 9611207</td></tr>
	<tr><td>chr12</td><td> 9615066</td><td> 9615067</td></tr>
	<tr><td>chr12</td><td> 9616828</td><td> 9616829</td></tr>
	<tr><td>chr12</td><td> 9627613</td><td> 9627614</td></tr>
	<tr><td>chr12</td><td> 9644274</td><td> 9644275</td></tr>
	<tr><td>chr12</td><td> 9647461</td><td> 9647462</td></tr>
	<tr><td>chr12</td><td> 9648785</td><td> 9648786</td></tr>
	<tr><td>chr12</td><td> 9649230</td><td> 9649231</td></tr>
	<tr><td>chr12</td><td> 9879455</td><td> 9879456</td></tr>
	<tr><td>chr12</td><td> 9884804</td><td> 9884805</td></tr>
	<tr><td>chr12</td><td> 9891714</td><td> 9891715</td></tr>
	<tr><td>chr12</td><td>10372609</td><td>10372610</td></tr>
	<tr><td>chr12</td><td>10394738</td><td>10394739</td></tr>
	<tr><td>chr12</td><td>10411729</td><td>10411730</td></tr>
	<tr><td>chr12</td><td>10412513</td><td>10412514</td></tr>
	<tr><td>chr12</td><td>10426708</td><td>10426709</td></tr>
	<tr><td>chr12</td><td>10445631</td><td>10445632</td></tr>
	<tr><td>chr12</td><td>11124089</td><td>11124090</td></tr>
	<tr><td>chr12</td><td>11174043</td><td>11174044</td></tr>
	<tr><td>chr12</td><td>27437282</td><td>27437283</td></tr>
	<tr><td>chr12</td><td>27477575</td><td>27477576</td></tr>
	<tr><td>chr12</td><td>27480706</td><td>27480707</td></tr>
	<tr><td>chr12</td><td>27501964</td><td>27501965</td></tr>
	<tr><td>chr12</td><td>27527621</td><td>27527622</td></tr>
	<tr><td>chr12</td><td>27530467</td><td>27530468</td></tr>
	<tr><td>chr12</td><td>27531777</td><td>27531778</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>chr12</td><td>126442073</td><td>126442074</td></tr>
	<tr><td>chr12</td><td>126447631</td><td>126447632</td></tr>
	<tr><td>chr12</td><td>126447833</td><td>126447834</td></tr>
	<tr><td>chr12</td><td>126448077</td><td>126448078</td></tr>
	<tr><td>chr12</td><td>126448217</td><td>126448218</td></tr>
	<tr><td>chr12</td><td>126448524</td><td>126448525</td></tr>
	<tr><td>chr12</td><td>126448555</td><td>126448556</td></tr>
	<tr><td>chr12</td><td>126451176</td><td>126451177</td></tr>
	<tr><td>chr12</td><td>126451917</td><td>126451918</td></tr>
	<tr><td>chr12</td><td>126452065</td><td>126452066</td></tr>
	<tr><td>chr12</td><td>126452140</td><td>126452141</td></tr>
	<tr><td>chr12</td><td>126452165</td><td>126452166</td></tr>
	<tr><td>chr12</td><td>126452609</td><td>126452610</td></tr>
	<tr><td>chr12</td><td>126695321</td><td>126695322</td></tr>
	<tr><td>chr12</td><td>131388420</td><td>131388421</td></tr>
	<tr><td>chr12</td><td>131403890</td><td>131403891</td></tr>
	<tr><td>chr12</td><td>131406402</td><td>131406403</td></tr>
	<tr><td>chr12</td><td>131412298</td><td>131412299</td></tr>
	<tr><td>chr12</td><td>131414575</td><td>131414576</td></tr>
	<tr><td>chr12</td><td>131482430</td><td>131482431</td></tr>
	<tr><td>chr12</td><td>131513826</td><td>131513827</td></tr>
	<tr><td>chr12</td><td>131515463</td><td>131515464</td></tr>
	<tr><td>chr12</td><td>131517220</td><td>131517221</td></tr>
	<tr><td>chr12</td><td>131526791</td><td>131526792</td></tr>
	<tr><td>chr12</td><td>131527720</td><td>131527721</td></tr>
	<tr><td>chr12</td><td>132340299</td><td>132340300</td></tr>
	<tr><td>chr12</td><td>132363834</td><td>132363835</td></tr>
	<tr><td>chr12</td><td>132364406</td><td>132364407</td></tr>
	<tr><td>chr12</td><td>132364511</td><td>132364512</td></tr>
	<tr><td>chr12</td><td>132369860</td><td>132369861</td></tr>
</tbody>
</table>



### Test plot of GTEx


```R
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 1, width = 6, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 6, height = 8, default.units = "inches")


### Plot GTEx eQTLs
gtex_plot <- plotRanges(gtex_data, params = coords, y = 4, height = 1, fill = "#000000")
```

    Warning message:
    “Not enough plotting space for all provided elements. ('+' indicates elements not shown.)”
    ranges[ranges1]
    



![png](output_44_1.png)


#### Sig 1e-20


```R
gtex_data_sig1e20
```


<table class="dataframe">
<caption>A spec_tbl_df: 356 × 5</caption>
<thead>
	<tr><th scope=col>chr</th><th scope=col>start</th><th scope=col>end</th><th scope=col>X4</th><th scope=col>X5</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr12</td><td>6522913</td><td>6522914</td><td>3.61561e-38</td><td>4.22797e-26</td></tr>
	<tr><td>chr12</td><td>6522913</td><td>6522914</td><td>5.11332e-65</td><td>1.44021e-41</td></tr>
	<tr><td>chr12</td><td>6522913</td><td>6522914</td><td>5.31974e-33</td><td>5.31974e-33</td></tr>
	<tr><td>chr12</td><td>6523248</td><td>6523249</td><td>1.46669e-85</td><td>1.60388e-40</td></tr>
	<tr><td>chr12</td><td>6523248</td><td>6523249</td><td>1.38670e-47</td><td>1.28992e-25</td></tr>
	<tr><td>chr12</td><td>6523723</td><td>6523724</td><td>3.21125e-40</td><td>2.46178e-31</td></tr>
	<tr><td>chr12</td><td>6523723</td><td>6523724</td><td>1.71491e-63</td><td>2.00291e-41</td></tr>
	<tr><td>chr12</td><td>6523723</td><td>6523724</td><td>8.26793e-50</td><td>4.88341e-32</td></tr>
	<tr><td>chr12</td><td>6524678</td><td>6524679</td><td>5.64747e-40</td><td>2.22090e-30</td></tr>
	<tr><td>chr12</td><td>6524678</td><td>6524679</td><td>5.61722e-67</td><td>4.59844e-44</td></tr>
	<tr><td>chr12</td><td>6524678</td><td>6524679</td><td>1.51090e-52</td><td>8.29400e-34</td></tr>
	<tr><td>chr12</td><td>6524840</td><td>6524841</td><td>9.07688e-42</td><td>3.39180e-31</td></tr>
	<tr><td>chr12</td><td>6524840</td><td>6524841</td><td>1.35560e-55</td><td>4.28353e-38</td></tr>
	<tr><td>chr12</td><td>6524840</td><td>6524841</td><td>1.04416e-49</td><td>2.94032e-32</td></tr>
	<tr><td>chr12</td><td>6525120</td><td>6525121</td><td>1.01260e-39</td><td>2.67911e-30</td></tr>
	<tr><td>chr12</td><td>6525120</td><td>6525121</td><td>2.16112e-66</td><td>8.79273e-44</td></tr>
	<tr><td>chr12</td><td>6525120</td><td>6525121</td><td>8.52080e-53</td><td>6.22866e-34</td></tr>
	<tr><td>chr12</td><td>6525517</td><td>6525518</td><td>2.16271e-83</td><td>1.76937e-40</td></tr>
	<tr><td>chr12</td><td>6525517</td><td>6525518</td><td>1.91885e-45</td><td>5.65938e-25</td></tr>
	<tr><td>chr12</td><td>6526053</td><td>6526054</td><td>5.82510e-39</td><td>2.16090e-30</td></tr>
	<tr><td>chr12</td><td>6526053</td><td>6526054</td><td>4.57989e-58</td><td>3.73697e-38</td></tr>
	<tr><td>chr12</td><td>6526053</td><td>6526054</td><td>5.64307e-42</td><td>2.64467e-28</td></tr>
	<tr><td>chr12</td><td>6526616</td><td>6526617</td><td>8.32869e-38</td><td>5.18339e-27</td></tr>
	<tr><td>chr12</td><td>6526616</td><td>6526617</td><td>2.07543e-81</td><td>1.74375e-38</td></tr>
	<tr><td>chr12</td><td>6526616</td><td>6526617</td><td>9.09365e-45</td><td>1.17391e-24</td></tr>
	<tr><td>chr12</td><td>6526671</td><td>6526672</td><td>6.75340e-34</td><td>2.84683e-26</td></tr>
	<tr><td>chr12</td><td>6526671</td><td>6526672</td><td>6.46371e-26</td><td>3.56720e-22</td></tr>
	<tr><td>chr12</td><td>6526671</td><td>6526672</td><td>1.48802e-76</td><td>6.63563e-38</td></tr>
	<tr><td>chr12</td><td>6526671</td><td>6526672</td><td>2.17305e-46</td><td>3.75007e-25</td></tr>
	<tr><td>chr12</td><td>6526743</td><td>6526744</td><td>7.59719e-39</td><td>2.95421e-27</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>chr12</td><td>6572560</td><td>6572561</td><td> 0.00000e+00</td><td>3.51489e-122</td></tr>
	<tr><td>chr12</td><td>6572560</td><td>6572561</td><td>4.35272e-217</td><td> 1.04308e-85</td></tr>
	<tr><td>chr12</td><td>6572586</td><td>6572587</td><td> 7.47878e-86</td><td> 4.49304e-32</td></tr>
	<tr><td>chr12</td><td>6572586</td><td>6572587</td><td> 0.00000e+00</td><td> 2.27840e-98</td></tr>
	<tr><td>chr12</td><td>6572586</td><td>6572587</td><td> 0.00000e+00</td><td>1.66288e-148</td></tr>
	<tr><td>chr12</td><td>6572586</td><td>6572587</td><td> 1.07980e-57</td><td> 3.45013e-40</td></tr>
	<tr><td>chr12</td><td>6573060</td><td>6573061</td><td> 2.37061e-74</td><td> 2.45412e-30</td></tr>
	<tr><td>chr12</td><td>6573060</td><td>6573061</td><td> 0.00000e+00</td><td>1.27624e-100</td></tr>
	<tr><td>chr12</td><td>6573060</td><td>6573061</td><td> 0.00000e+00</td><td>1.50287e-145</td></tr>
	<tr><td>chr12</td><td>6573060</td><td>6573061</td><td> 1.93699e-44</td><td> 2.73399e-29</td></tr>
	<tr><td>chr12</td><td>6573145</td><td>6573146</td><td> 2.37061e-74</td><td> 2.45412e-30</td></tr>
	<tr><td>chr12</td><td>6573145</td><td>6573146</td><td> 0.00000e+00</td><td>1.27624e-100</td></tr>
	<tr><td>chr12</td><td>6573145</td><td>6573146</td><td> 0.00000e+00</td><td>1.50287e-145</td></tr>
	<tr><td>chr12</td><td>6573145</td><td>6573146</td><td> 1.93699e-44</td><td> 2.73399e-29</td></tr>
	<tr><td>chr12</td><td>6573715</td><td>6573716</td><td> 2.37061e-74</td><td> 2.45412e-30</td></tr>
	<tr><td>chr12</td><td>6573715</td><td>6573716</td><td> 0.00000e+00</td><td>1.27624e-100</td></tr>
	<tr><td>chr12</td><td>6573715</td><td>6573716</td><td> 0.00000e+00</td><td>1.50287e-145</td></tr>
	<tr><td>chr12</td><td>6573715</td><td>6573716</td><td> 1.93699e-44</td><td> 2.73399e-29</td></tr>
	<tr><td>chr12</td><td>6573748</td><td>6573749</td><td> 2.37061e-74</td><td> 2.45412e-30</td></tr>
	<tr><td>chr12</td><td>6573748</td><td>6573749</td><td> 0.00000e+00</td><td>1.27624e-100</td></tr>
	<tr><td>chr12</td><td>6573748</td><td>6573749</td><td> 0.00000e+00</td><td>1.50287e-145</td></tr>
	<tr><td>chr12</td><td>6573748</td><td>6573749</td><td> 1.93699e-44</td><td> 2.73399e-29</td></tr>
	<tr><td>chr12</td><td>6573855</td><td>6573856</td><td> 2.37061e-74</td><td> 2.45412e-30</td></tr>
	<tr><td>chr12</td><td>6573855</td><td>6573856</td><td> 0.00000e+00</td><td>1.27624e-100</td></tr>
	<tr><td>chr12</td><td>6573855</td><td>6573856</td><td> 0.00000e+00</td><td>1.50287e-145</td></tr>
	<tr><td>chr12</td><td>6573855</td><td>6573856</td><td> 1.93699e-44</td><td> 2.73399e-29</td></tr>
	<tr><td>chr12</td><td>6574300</td><td>6574301</td><td> 7.36104e-85</td><td> 2.24425e-34</td></tr>
	<tr><td>chr12</td><td>6574300</td><td>6574301</td><td> 0.00000e+00</td><td> 3.57104e-94</td></tr>
	<tr><td>chr12</td><td>6574300</td><td>6574301</td><td> 0.00000e+00</td><td>9.62235e-140</td></tr>
	<tr><td>chr12</td><td>6574300</td><td>6574301</td><td> 4.11338e-37</td><td> 1.79462e-25</td></tr>
</tbody>
</table>




```R
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 1, width = 6, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 6, height = 8, default.units = "inches")


### Plot GTEx eQTLs
gtex_plot_1e20 <- plotRanges(gtex_data_sig1e20, params = coords, y = 4, height = 1, fill = "#000000")


```

    Warning message:
    “Not enough plotting space for all provided elements. ('+' indicates elements not shown.)”
    ranges[ranges1]
    



![png](output_47_1.png)


#### Sig 1e-40


```R
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 1, width = 6, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 6, height = 8, default.units = "inches")


### Plot GTEx eQTLs
gtex_plot_1e40 <- plotRanges(gtex_data_sig1e40, params = coords, y = 4, height = 1, fill = "#000000")


```

    Warning message:
    “Not enough plotting space for all provided elements. ('+' indicates elements not shown.)”
    ranges[ranges1]
    



![png](output_49_1.png)



```R

```


```R
# This guy includes genes
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 1, width = 4, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 6, height = 10, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 10,
                        y = 1.75, height = .5) # moved y from 2.0

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"), y = 1.5, height = 1)

### Plot GTEx eQTLs
gtex_plot <- plotRanges(gtex_data, params = coords, y = 4, height = 1, fill = "#000000")
```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    Warning message:
    “Not enough plotting space for all provided elements. ('+' indicates elements not shown.)”
    ranges[ranges1]
    



![png](output_51_1.png)


### Processing

Grab them


```R
cd /data/hodges_lab/Tim/plotgardener_RSushi/bigWigs
```


```R
wget https://storage.googleapis.com/gtex_analysis_v8/multi_tissue_qtl_data/GTEx_Analysis_v8.metasoft.txt.gz
```


```R
gunzip GTEx_Analysis_v8.metasoft.txt.gz
```


```R
head GTEx_Analysis_v8.metasoft.txt # This is 11Gb 
```

Subsample to Chr12


```R
awk 'BEGIN{OFS=FS="\t"}{if ($1~/chr12/) print}' GTEx_Analysis_v8.metasoft.txt > GTEx_Analysis_v8.metasoft.chr12.txt
```

Coming back here
--Even subsampled to Chr12, this is too large

--Want to subsample to around the region: 6522500 6575000


```R
## Separate into column 1 and column 14/15 (q and p value respectively)
awk 'BEGIN{OFS=FS="\t"}{print $1}' GTEx_Analysis_v8.metasoft.chr12.txt > GTEx_Analysis_v8.metasoft.chr12.col1.txt
awk 'BEGIN{OFS=FS="\t"}{print $3,$6}' GTEx_Analysis_v8.metasoft.chr12.txt > GTEx_Analysis_v8.metasoft.chr12.col3_6.txt

## Clean column 1 from chr12_10700_G_A_b38,ENSG00000111181.12 to a BED file
awk 'BEGIN{OFS="\t";FS="_"}{print $1,($2-1),$2}' GTEx_Analysis_v8.metasoft.chr12.col1.txt > GTEx_Analysis_v8.metasoft.chr12.col1_BED.txt

## Paste back together
paste GTEx_Analysis_v8.metasoft.chr12.col1_BED.txt GTEx_Analysis_v8.metasoft.chr12.col3_6.txt > GTEx_Analysis_v8.metasoft.chr12.bed_qp.txt

## LiftOver this bed
./liftOver GTEx_Analysis_v8.metasoft.chr12.bed_qp.txt hg38ToHg19.over.chain.gz GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.txt GTEx_Analysis_v8.metasoft.chr12.bed_qp.noMapHg38ToHg19.txt

## Filter for region
bedtools intersect -u -a GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.txt -b plot_coords.bed > GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt # 792
```

Filter for "significant" eQTLs


```R
# awk 'BEGIN{OFS=FS="\t"}{if ($14<0.05) print}' GTEx_Analysis_v8.metasoft.chr12.txt > GTEx_Analysis_v8.metasoft.chr12.qSig.txt ## This leaves 253 eQTLs

# awk 'BEGIN{OFS=FS="\t"}{if ($14<0.01) print}' GTEx_Analysis_v8.metasoft.chr12.txt > GTEx_Analysis_v8.metasoft.chr12.qSig01.txt 

# awk 'BEGIN{OFS=FS="\t"}{if ($15<0.05) print}' GTEx_Analysis_v8.metasoft.chr12.txt > GTEx_Analysis_v8.metasoft.chr12.pSig.txt

# ### Filtering by p/q-value on eQTLs prefiltered for region!
# awk 'BEGIN{OFS=FS="\t"}{if ($3<0.05) print}' GTEx_Analysis_v8.metasoft.chr12.txt > GTEx_Analysis_v8.metasoft.chr12.pSig.txt


### Filtering by p/q-value on eQTLs prefiltered for region!
# Column 4 is p value for fixed effects
# Colun 5 is p value for random effects
awk 'BEGIN{OFS=FS="\t"}{if ($5<0.05) print}' GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt > GTEx_Analysis_v8.metasoft.chr12_region.bed.pRE_sig05.txt # 726

awk 'BEGIN{OFS=FS="\t"}{if ($5<0.01) print}' GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt | wc -l #706

awk 'BEGIN{OFS=FS="\t"}{if ($5<0.001) print}' GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt | wc -l #657

awk 'BEGIN{OFS=FS="\t"}{if ($5<0.00000001) print}' GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt | wc -l #540

awk 'BEGIN{OFS=FS="\t"}{if ($5<0.0000000001) print}' GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt | wc -l #507

awk 'BEGIN{OFS=FS="\t"}{if ($5<0.000000000000000000001) print}' GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt | wc -l #356 1e-20........
awk 'BEGIN{OFS=FS="\t"}{if ($5<0.000000000000000000001) print}' GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt > GTEx_Analysis_v8.metasoft.chr12_region.bed.pRE_sig1e20.txt

awk 'BEGIN{OFS=FS="\t"}{if ($5<0.0000000000000000000000000000001) print}' GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt | wc -l #238 1e-30........


awk 'BEGIN{OFS=FS="\t"}{if ($5<0.00000000000000000000000000000000000000001) print}' GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt | wc -l #172 1e-40........
awk 'BEGIN{OFS=FS="\t"}{if ($5<0.00000000000000000000000000000000000000001) print}' GTEx_Analysis_v8.metasoft.chr12.bed_qp.hg19.ch12_6522500_6575000.txt > GTEx_Analysis_v8.metasoft.chr12_region.bed.pRE_sig1e40.txt

```

 Reformat as BED for upload and processing by PlotGardener


```R
awk 'BEGIN{OFS=FS="\t"}{print $1}' GTEx_Analysis_v8.metasoft.chr12.txt | awk 'BEGIN{OFS="\t";FS="_"}{print $1,($2-1), $2}' > GTEx_Analysis_v8.metasoft.chr12.bedCoordinates.txt



awk 'BEGIN{OFS=FS="\t"}{print $1}' GTEx_Analysis_v8.metasoft.chr12.qSig.txt | awk 'BEGIN{OFS="\t";FS="_"}{print $1,($2-1), $2}' > GTEx_Analysis_v8.metasoft.chr12.qSig.bedCoordinates.txt

awk 'BEGIN{OFS=FS="\t"}{print $1}' GTEx_Analysis_v8.metasoft.chr12.qSig01.txt | awk 'BEGIN{OFS="\t";FS="_"}{print $1,($2-1), $2, $3}' > GTEx_Analysis_v8.metasoft.chr12.qSig01.bedCoordinates.txt



awk 'BEGIN{OFS=FS="\t"}{print $1}' GTEx_Analysis_v8.metasoft.chr12.pSig.txt | awk 'BEGIN{OFS="\t";FS="_"}{print $1,($2-1), $2}' > GTEx_Analysis_v8.metasoft.chr12.pSig.bedCoordinates.txt
```

Merge to reduce repeats (could be more than one tissue with a particular eQTL)


```R
bedtools merge -i GTEx_Analysis_v8.metasoft.chr12.bedCoordinates.txt > GTEx_Analysis_v8.metasoft.chr12.bedCoordinates.merged.txt

#q
bedtools merge -i GTEx_Analysis_v8.metasoft.chr12.qSig.bedCoordinates.txt > GTEx_Analysis_v8.metasoft.chr12.qSig.bedCoordinates.merged.txt

bedtools merge -i GTEx_Analysis_v8.metasoft.chr12.qSig01.bedCoordinates.txt > GTEx_Analysis_v8.metasoft.chr12.qSig01.bedCoordinates.merged.txt

#p
bedtools merge -i GTEx_Analysis_v8.metasoft.chr12.pSig.bedCoordinates.txt > GTEx_Analysis_v8.metasoft.chr12.pSig.bedCoordinates.merged.txt
```

LiftOver from h38 to hg19


```R
cd /data/hodges_lab/Tim/plotgardener_RSushi/bigWigs

wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/liftOver/hg38ToHg19.over.chain.gz

wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/liftOver
chmod +x ./liftOver
```


```R
./liftOver GTEx_Analysis_v8.metasoft.chr12.bedCoordinates.merged.txt hg38ToHg19.over.chain.gz GTEx_Analysis_v8.metasoft.chr12.bedCoordinates.merged.hg19.txt GTEx_Analysis_v8.metasoft.chr12.bedCoordinates.merged.noMapHg38ToHg19.txt


# q
./liftOver GTEx_Analysis_v8.metasoft.chr12.qSig.bedCoordinates.merged.txt hg38ToHg19.over.chain.gz GTEx_Analysis_v8.metasoft.chr12.qSig.bedCoordinates.merged.hg19.txt GTEx_Analysis_v8.metasoft.chr12.qSig.bedCoordinates.merged.noMapHg38ToHg19.txt

# 120 lines
./liftOver GTEx_Analysis_v8.metasoft.chr12.qSig01.bedCoordinates.merged.txt hg38ToHg19.over.chain.gz GTEx_Analysis_v8.metasoft.chr12.qSig01.bedCoordinates.merged.hg19.txt GTEx_Analysis_v8.metasoft.chr12.qSig01.bedCoordinates.merged.noMapHg38ToHg19.txt



# p
./liftOver GTEx_Analysis_v8.metasoft.chr12.pSig.bedCoordinates.merged.txt hg38ToHg19.over.chain.gz GTEx_Analysis_v8.metasoft.chr12.pSig.bedCoordinates.merged.hg19.txt GTEx_Analysis_v8.metasoft.chr12.pSig.bedCoordinates.merged.noMapHg38ToHg19.txt
```

Subset to region


```R
bedtools intersect -u -a GTEx_Analysis_v8.metasoft.chr12.bedCoordinates.merged.hg19.txt -b plot_coords.bed > GTEx_Analysis_v8.metasoft.chr12.bedCoordinates.merged.hg19.ch12_6522500_6575000.txt 

bedtools intersect -u -a GTEx_Analysis_v8.metasoft.chr12.pSig.bedCoordinates.merged.hg19.txt -b plot_coords.bed > GTEx_Analysis_v8.metasoft.chr12.pSig.bedCoordinates.merged.hg19.ch12_6522500_6575000.txt
```

# Trying again, again - H9 ESC - Bing Ren, Zhang2019
Paper link: https://www.nature.com/articles/s41588-019-0479-7

GEO file page: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM3262957

File name: GSM3262957_D00_HiC_Rep2.hic

## Load H9


```R
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19",x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")
```


```R
h9_data <- readHic(file = "./Zhang2019/GSM3262957_D00_HiC_Rep2.hic", chrom = "chr12", assembly = "hg19", resolution = 10000, res_scale = "BP")
```

    Read in hic file with KR normalization at 10000 BP resolution.
    



```R
strawr::readHicChroms("./Zhang2019/GSM3262957_D00_HiC_Rep2.hic")
```


<table class="dataframe">
<caption>A data.frame: 26 × 2</caption>
<thead>
	<tr><th scope=col>name</th><th scope=col>length</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>All  </td><td>  3098789</td></tr>
	<tr><td>chr1 </td><td>249250621</td></tr>
	<tr><td>chr10</td><td>135534747</td></tr>
	<tr><td>chr11</td><td>135006516</td></tr>
	<tr><td>chr12</td><td>133851895</td></tr>
	<tr><td>chr13</td><td>115169878</td></tr>
	<tr><td>chr14</td><td>107349540</td></tr>
	<tr><td>chr15</td><td>102531392</td></tr>
	<tr><td>chr16</td><td> 90354753</td></tr>
	<tr><td>chr17</td><td> 81195210</td></tr>
	<tr><td>chr18</td><td> 78077248</td></tr>
	<tr><td>chr19</td><td> 59128983</td></tr>
	<tr><td>chr2 </td><td>243199373</td></tr>
	<tr><td>chr20</td><td> 63025520</td></tr>
	<tr><td>chr21</td><td> 48129895</td></tr>
	<tr><td>chr22</td><td> 51304566</td></tr>
	<tr><td>chr3 </td><td>198022430</td></tr>
	<tr><td>chr4 </td><td>191154276</td></tr>
	<tr><td>chr5 </td><td>180915260</td></tr>
	<tr><td>chr6 </td><td>171115067</td></tr>
	<tr><td>chr7 </td><td>159138663</td></tr>
	<tr><td>chr8 </td><td>146364022</td></tr>
	<tr><td>chr9 </td><td>141213431</td></tr>
	<tr><td>chrM </td><td>    16569</td></tr>
	<tr><td>chrX </td><td>155270560</td></tr>
	<tr><td>chrY </td><td> 59373566</td></tr>
</tbody>
</table>



## Load GM12878


```R
gm_data <- readHic(file = "GSE63525_GM12878_insitu_primary.hic", chrom = "12", assembly = "hg19", resolution = 10000, res_scale = "BP")
```

    Read in hic file with KR normalization at 10000 BP resolution.
    


## Plot

### Just H9


```R
# Create a blank canvas page
pageCreate(width = 8, height = 7, default.units = "inches")

# Plot H9 Hi-C triangle
p_h9 <- plotHicTriangle(data = h9_data, params = coords,
                             zrange = c(0, 1000), resolution = "auto",
                             x = 2, y = 3, width = 4, height = 4, just = c("left", "bottom"))


# Annotate Hi-C heatmap legend
annoHeatmapLegend(plot = p_h9, fontsize = 10, 
                     x = 7, y = 1, width = 0.2, height = 1, 
                     just = c("right", "top"), default.units = "inches")
```

    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    
    heatmapLegend[heatmapLegend1]
    



![png](output_82_1.png)


### H9 and GM12878


```R
# Create a blank canvas page
pageCreate(width = 8, height = 7, default.units = "inches")

# Plot GM12878 Hi-C triangle
p_gm <- plotHicTriangle(data = gm_data, params = coords,
                             zrange = c(0, 1000), resolution = "auto",
                             x = 2, y = 3, width = 4, height = 4, just = c("left", "bottom"))


# Plot H9 Hi-C triangle
p_h9 <- plotHicTriangle(data = h9_data, params = coords,
                             zrange = c(0, 1000), resolution = "auto",
                             x = 2, y = 7.5, width = 4, height = 4, flip = TRUE, just = c("left", "bottom"))


# Annotate Hi-C heatmap legend
annoHeatmapLegend(plot = p_gm, fontsize = 10, 
                     x = 7, y = 2, width = 0.2, height = 1, 
                     just = c("right", "top"), default.units = "inches")

annoHeatmapLegend(plot = p_h9, fontsize = 10, 
                     x = 7, y = 3.5, width = 0.2, height = 1, 
                     just = c("right", "top"), default.units = "inches")


```

    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle2]
    
    heatmapLegend[heatmapLegend1]
    
    heatmapLegend[heatmapLegend2]
    



![png](output_84_1.png)


# PLOT PLOT GARDENER,  HERE!!!! WORKS


```R
##########  CHANGED:  
# range added into "pgParams"
# "height" argument removed from pageCreate call 


### Open a PDF() graphical device
pdf("/data/hodges_lab/Tim/plotgardener_RSushi/CD27.Meth_HiC.15.orange.pdf")


### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 1, width = 4, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 6, height = 10, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 10,
                        y = 1.75, height = .5) # moved y from 2.0

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"), y = 1.5, height = 1)


# It's a pain to manually adjust all position values
# Trying to variablize these 
starting_Y_HMR=1.7 # 2.2 works if Meth is at 3. 2.0 is too high; 2.5 and 3.0 both still too low... 
height_HMR=.8
Y_increment_HMR=.35

starting_Y_Meth=2.5 # down from 3.0
height_Meth=.15
Y_increment_Meth=.35


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = starting_Y_HMR, height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = starting_Y_Meth, height = height_Meth,
                    linecolor = "#FAB050")

i=1
plotRanges(fspinal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fspinal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#FAB050")

i=(i+1)
plotRanges(fheart_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fheart_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#FAB050")

i=(i+1)
plotRanges(adrenal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(adrenal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#FAB050")

i=(i+1)
plotRanges(liver_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(liver_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#FAB050")

i=(i+1)
plotRanges(hspc_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(hspc_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#FAB050")

i=(i+1)
plotRanges(macro_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(macro_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#FAB050")

i=(i+1)
plotRanges(tcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(tcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#FAB050")

i=(i+1)
plotRanges(bcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(bcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#FAB050")




########## Hi-C TRIANGLES

# Plot GM12878 Hi-C triangle
p_gm <- plotHicTriangle(data = gm_data, params = coords,
                             zrange = c(0, 1000), resolution = "auto",
                             x = 1, y = 7.5, width = 4, height = 2, just = c("left", "bottom"))


# Plot H9 Hi-C triangle
p_h9 <- plotHicTriangle(data = h9_data, params = coords, zrange = c(0, 1000), resolution = "auto", x = 1, y = 7.5, width = 4, height = 2, flip = TRUE, just = c("left", "bottom"))


# Annotate Hi-C heatmap legend
annoHeatmapLegend(plot = p_gm, fontsize = 10, 
                     x = 7, y = 2, width = 0.2, height = 1, 
                     just = c("right", "top"), default.units = "inches")

annoHeatmapLegend(plot = p_h9, fontsize = 10, x = 7, y = 3.5, width = 0.2, height = 1, just = c("right", "top"), default.units = "inches")



# This will take away the background grey gridlines that make working with the image in Illustrator difficult
# This happens to do this by replotting the same graph but with out guides on a second page in the output PDF file -- the version with guides will still show first in the file 
pageGuideHide()

# Close PDF app
dev.off()

```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    
    ranges[ranges2]
    
    signal[signal2]
    
    ranges[ranges3]
    
    signal[signal3]
    
    ranges[ranges4]
    
    signal[signal4]
    
    ranges[ranges5]
    
    signal[signal5]
    
    ranges[ranges6]
    
    signal[signal6]
    
    ranges[ranges7]
    
    signal[signal7]
    
    ranges[ranges8]
    
    signal[signal8]
    
    ranges[ranges9]
    
    signal[signal9]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle2]
    
    heatmapLegend[heatmapLegend1]
    
    heatmapLegend[heatmapLegend2]
    



<strong>png:</strong> 2



```R

```


```R

```

# Testing - Plot Meth & Hi-C

## This one -- trying to fix the HiC clippign


```R
##########  CHANGED:  
# range added into "pgParams"
# "height" argument removed from pageCreate call 


### Open a PDF() graphical device
pdf("/data/hodges_lab/Tim/plotgardener_RSushi/CD27.Meth_HiC.14.pdf")


### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 1, width = 4, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 6, height = 10, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 10,
                        y = 1.75, height = .5) # moved y from 2.0

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"), y = 1.5, height = 1)


# It's a pain to manually adjust all position values
# Trying to variablize these 
starting_Y_HMR=1.7 # 2.2 works if Meth is at 3. 2.0 is too high; 2.5 and 3.0 both still too low... 
height_HMR=.8
Y_increment_HMR=.35

starting_Y_Meth=2.5 # down from 3.0
height_Meth=.15
Y_increment_Meth=.35


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = starting_Y_HMR, height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = starting_Y_Meth, height = height_Meth,
                    linecolor = "#8CB3DF")

i=1
plotRanges(fspinal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fspinal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(fheart_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fheart_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(adrenal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(adrenal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(liver_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(liver_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(hspc_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(hspc_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(macro_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(macro_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(tcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(tcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(bcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(bcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")




########## Hi-C TRIANGLES

# Plot GM12878 Hi-C triangle
p_gm <- plotHicTriangle(data = gm_data, params = coords,
                             zrange = c(0, 1000), resolution = "auto",
                             x = 1, y = 7.5, width = 4, height = 2, just = c("left", "bottom"))


# Plot H9 Hi-C triangle
p_h9 <- plotHicTriangle(data = h9_data, params = coords, zrange = c(0, 1000), resolution = "auto", x = 1, y = 7.5, width = 4, height = 2, flip = TRUE, just = c("left", "bottom"))


# Annotate Hi-C heatmap legend
annoHeatmapLegend(plot = p_gm, fontsize = 10, 
                     x = 7, y = 2, width = 0.2, height = 1, 
                     just = c("right", "top"), default.units = "inches")

annoHeatmapLegend(plot = p_h9, fontsize = 10, x = 7, y = 3.5, width = 0.2, height = 1, just = c("right", "top"), default.units = "inches")



# This will take away the background grey gridlines that make working with the image in Illustrator difficult
# This happens to do this by replotting the same graph but with out guides on a second page in the output PDF file -- the version with guides will still show first in the file 
pageGuideHide()

# Close PDF app
dev.off()

```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    
    ranges[ranges2]
    
    signal[signal2]
    
    ranges[ranges3]
    
    signal[signal3]
    
    ranges[ranges4]
    
    signal[signal4]
    
    ranges[ranges5]
    
    signal[signal5]
    
    ranges[ranges6]
    
    signal[signal6]
    
    ranges[ranges7]
    
    signal[signal7]
    
    ranges[ranges8]
    
    signal[signal8]
    
    ranges[ranges9]
    
    signal[signal9]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle2]
    
    heatmapLegend[heatmapLegend1]
    
    heatmapLegend[heatmapLegend2]
    



<strong>png:</strong> 2


## This one -- SO CLOSE -- at x = 2.25, HMRs plot properly, but the lowest Hi-C cuts off. But, at x = 2 (as used many times before) it still cuts off, but is able to be released from a clipping mask 


```R
##########  CHANGED:  
# range added into "pgParams"
# "height" argument removed from pageCreate call 

### Open a PDF() graphical device
pdf("/data/hodges_lab/Tim/plotgardener_RSushi/CD27.Meth_HiC.pdf")

### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 1, width = 4, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 6, height = 10, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = .75)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"), y = 1.5, height = 1)


# It's a pain to manually adjust all position values
# Trying to variablize these 
starting_Y_HMR=2.2 # 2.0 is too high; 2.5 and 3.0 both still too low... 
height_HMR=.8
Y_increment_HMR=.35

starting_Y_Meth=3
height_Meth=.15
Y_increment_Meth=.35


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = starting_Y_HMR, height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = starting_Y_Meth, height = height_Meth,
                    linecolor = "#8CB3DF")

i=1
plotRanges(fspinal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fspinal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(fheart_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fheart_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(adrenal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(adrenal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(liver_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(liver_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(hspc_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(hspc_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(macro_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(macro_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(tcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(tcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(bcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(bcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")






# Plot GM12878 Hi-C triangle
p_gm <- plotHicTriangle(data = gm_data, params = coords,
                             zrange = c(0, 1000), resolution = "auto",
                             x = 1, y = 8, width = 4, height = 2, just = c("left", "bottom"))


# Plot H9 Hi-C triangle
p_h9 <- plotHicTriangle(data = h9_data, params = coords, zrange = c(0, 1000), resolution = "auto", x = 1, y = 10.25, width = 4, height = 2, flip = TRUE, just = c("left", "bottom"))


# Annotate Hi-C heatmap legend
annoHeatmapLegend(plot = p_gm, fontsize = 10, 
                     x = 7, y = 2, width = 0.2, height = 1, 
                     just = c("right", "top"), default.units = "inches")

annoHeatmapLegend(plot = p_h9, fontsize = 10, x = 7, y = 3.5, width = 0.2, height = 1, just = c("right", "top"), default.units = "inches")






# This will take away the background grey gridlines that make working with the image in Illustrator difficult
# This happens to do this by replotting the same graph but with out guides on a second page in the output PDF file -- the version with guides will still show first in the file 
pageGuideHide()

### Turn off graphical device to save PDf
dev.off()

```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    
    ranges[ranges2]
    
    signal[signal2]
    
    ranges[ranges3]
    
    signal[signal3]
    
    ranges[ranges4]
    
    signal[signal4]
    
    ranges[ranges5]
    
    signal[signal5]
    
    ranges[ranges6]
    
    signal[signal6]
    
    ranges[ranges7]
    
    signal[signal7]
    
    ranges[ranges8]
    
    signal[signal8]
    
    ranges[ranges9]
    
    signal[signal9]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle2]
    
    heatmapLegend[heatmapLegend1]
    
    heatmapLegend[heatmapLegend2]
    



<strong>png:</strong> 2



```R
### Trying to replicate the one where I could unclip the bottom HiC 
```


```R
##########  CHANGED:  
# range added into "pgParams"
# "height" argument removed from pageCreate call 

### Open a PDF() graphical device
pdf("/data/hodges_lab/Tim/plotgardener_RSushi/CD27.Meth_HiC.pdf")

### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 1, width = 4, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 6, height = 10, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = .75)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"), y = 1.5, height = 1)


# It's a pain to manually adjust all position values
# Trying to variablize these 
starting_Y_HMR=2.2 # 2.0 is too high; 2.5 and 3.0 both still too low... 
height_HMR=.8
Y_increment_HMR=.35

starting_Y_Meth=3
height_Meth=.15
Y_increment_Meth=.35


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = starting_Y_HMR, height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = starting_Y_Meth, height = height_Meth,
                    linecolor = "#8CB3DF")

i=1
plotRanges(fspinal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fspinal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(fheart_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fheart_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(adrenal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(adrenal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(liver_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(liver_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(hspc_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(hspc_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(macro_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(macro_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(tcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(tcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(bcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(bcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")






# Plot GM12878 Hi-C triangle
p_gm <- plotHicTriangle(data = gm_data, params = coords,
                             zrange = c(0, 1000), resolution = "auto",
                             x = 1, y = 8, width = 4, height = 2, just = c("left", "bottom"))


# Plot H9 Hi-C triangle
p_h9 <- plotHicTriangle(data = h9_data, params = coords, zrange = c(0, 1000), resolution = "auto", x = 1, y = 10.25, width = 4, height = 2, flip = TRUE, just = c("left", "bottom"))


# Annotate Hi-C heatmap legend
annoHeatmapLegend(plot = p_gm, fontsize = 10, 
                     x = 7, y = 2, width = 0.2, height = 1, 
                     just = c("right", "top"), default.units = "inches")

annoHeatmapLegend(plot = p_h9, fontsize = 10, x = 7, y = 3.5, width = 0.2, height = 1, just = c("right", "top"), default.units = "inches")






# This will take away the background grey gridlines that make working with the image in Illustrator difficult
# This happens to do this by replotting the same graph but with out guides on a second page in the output PDF file -- the version with guides will still show first in the file 
pageGuideHide()

### Turn off graphical device to save PDf
dev.off()

```

## Works with HiC - still too large


```R
##########  CHANGED:  
# range added into "pgParams"
# "height" argument removed from pageCreate call 



### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 1, width = 4, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 6, height = 15, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = .75)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"), y = 1.5, height = 1)


# It's a pain to manually adjust all position values
# Trying to variablize these 
starting_Y_HMR=2
height_HMR=.8
Y_increment_HMR=.35

starting_Y_Meth=3
height_Meth=.15
Y_increment_Meth=.35


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = starting_Y_HMR, height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = starting_Y_Meth, height = height_Meth,
                    linecolor = "#8CB3DF")

i=1
plotRanges(fspinal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fspinal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(fheart_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fheart_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(adrenal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(adrenal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(liver_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(liver_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(hspc_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(hspc_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(macro_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(macro_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(tcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(tcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(bcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(bcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")






# Plot GM12878 Hi-C triangle
p_gm <- plotHicTriangle(data = gm_data, params = coords,
                             zrange = c(0, 1000), resolution = "auto",
                             x = 1, y = 8, width = 4, height = 2, just = c("left", "bottom"))


# Plot H9 Hi-C triangle
p_h9 <- plotHicTriangle(data = h9_data, params = coords, zrange = c(0, 1000), resolution = "auto", x = 1, y = 10.25, width = 4, height = 2, flip = TRUE, just = c("left", "bottom"))


# Annotate Hi-C heatmap legend
annoHeatmapLegend(plot = p_gm, fontsize = 10, 
                     x = 7, y = 2, width = 0.2, height = 1, 
                     just = c("right", "top"), default.units = "inches")

annoHeatmapLegend(plot = p_h9, fontsize = 10, x = 7, y = 3.5, width = 0.2, height = 1, just = c("right", "top"), default.units = "inches")






# This will take away the background grey gridlines that make working with the image in Illustrator difficult
# This happens to do this by replotting the same graph but with out guides on a second page in the output PDF file -- the version with guides will still show first in the file 
pageGuideHide()



```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    
    ranges[ranges2]
    
    signal[signal2]
    
    ranges[ranges3]
    
    signal[signal3]
    
    ranges[ranges4]
    
    signal[signal4]
    
    ranges[ranges5]
    
    signal[signal5]
    
    ranges[ranges6]
    
    signal[signal6]
    
    ranges[ranges7]
    
    signal[signal7]
    
    ranges[ranges8]
    
    signal[signal8]
    
    ranges[ranges9]
    
    signal[signal9]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle2]
    
    heatmapLegend[heatmapLegend1]
    
    heatmapLegend[heatmapLegend2]
    



![png](output_97_1.png)



![png](output_97_2.png)


## Original - smaller


```R
##########  CHANGED:  
# range added into "pgParams"
# "height" argument removed from pageCreate call 

### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 1, width = 4, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 6, height = 10, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = .75)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"), y = 1.5, height = 1)


# It's a pain to manually adjust all position values
# Trying to variablize these 
starting_Y_HMR=2
height_HMR=.8
Y_increment_HMR=.35

starting_Y_Meth=3
height_Meth=.15
Y_increment_Meth=.35


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = starting_Y_HMR, height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = starting_Y_Meth, height = height_Meth,
                    linecolor = "#8CB3DF")

i=1
plotRanges(fspinal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fspinal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(fheart_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fheart_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(adrenal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(adrenal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(liver_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(liver_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(hspc_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(hspc_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(macro_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(macro_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(tcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(tcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(bcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(bcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")






# Plot GM12878 Hi-C triangle
p_gm <- plotHicTriangle(data = gm_data, params = coords,
                             zrange = c(0, 1000), resolution = "auto",
                             x = 1, y = 8, width = 4, height = 2, just = c("left", "bottom"))


# Plot H9 Hi-C triangle
# p_h9 <- plotHicTriangle(data = h9_data, params = coords, zrange = c(0, 1000), resolution = "auto", x = 1, y = 7.5, width = 4, height = 2, flip = TRUE, just = c("left", "bottom"))


# Annotate Hi-C heatmap legend
annoHeatmapLegend(plot = p_gm, fontsize = 10, 
                     x = 7, y = 2, width = 0.2, height = 1, 
                     just = c("right", "top"), default.units = "inches")

# annoHeatmapLegend(plot = p_h9, fontsize = 10, x = 7, y = 3.5, width = 0.2, height = 1, just = c("right", "top"), default.units = "inches")






# This will take away the background grey gridlines that make working with the image in Illustrator difficult
# This happens to do this by replotting the same graph but with out guides on a second page in the output PDF file -- the version with guides will still show first in the file 
pageGuideHide()

### Turn off graphical device to save PDf
# dev.off()

```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    
    ranges[ranges2]
    
    signal[signal2]
    
    ranges[ranges3]
    
    signal[signal3]
    
    ranges[ranges4]
    
    signal[signal4]
    
    ranges[ranges5]
    
    signal[signal5]
    
    ranges[ranges6]
    
    signal[signal6]
    
    ranges[ranges7]
    
    signal[signal7]
    
    ranges[ranges8]
    
    signal[signal8]
    
    ranges[ranges9]
    
    signal[signal9]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    
    heatmapLegend[heatmapLegend1]
    



![png](output_99_1.png)



![png](output_99_2.png)


## Original - scripted values 

I think that the max height of the Jupyter Notebook output box is about 10 inches, and when you extend this beyond 10, it seems to shift the "top" of the output plot upwards, above the top of the 10 inch box. So, the gene tracks and such are then above the plotted area but exist in the PDF. However, it also makes it very hard to understand where elements are and where to adjust values. I'll try to make this smaller overall so we can fit both Hi-C and Meth on the same plot. 


```R
##########  CHANGED:  
# range added into "pgParams"
# "height" argument removed from pageCreate call 

### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 7, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = 1)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"),
                x = 0, y = 1.5, height = 1)



# It's a pain to manually adjust all position values
# Trying to variablize these 
starting_Y_HMR=2.5
height_HMR=1
Y_increment_HMR=.5

starting_Y_Meth=3.5
height_Meth=.3
Y_increment_Meth=.5


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = starting_Y_HMR, height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = starting_Y_Meth, height = height_Meth,
                    linecolor = "#8CB3DF")

i=1
plotRanges(fspinal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fspinal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(fheart_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(fheart_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(adrenal_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(adrenal_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(liver_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(liver_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(hspc_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(hspc_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(macro_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(macro_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(tcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(tcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

i=(i+1)
plotRanges(bcell_hmr, params = coords, y = (starting_Y_HMR + (Y_increment_HMR*i)), height = height_HMR,
                    linecolor = "#8CB3DF")
plotSignal(bcell_meth, params = coords, y = (starting_Y_Meth + (Y_increment_Meth*i)), height = height_Meth,
                    linecolor = "#8CB3DF")

# This will take away the background grey gridlines that make working with the image in Illustrator difficult
# This happens to do this by replotting the same graph but with out guides on a second page in the output PDF file -- the version with guides will still show first in the file 
pageGuideHide()

### Turn off graphical device to save PDf
# dev.off()

```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    
    ranges[ranges2]
    
    signal[signal2]
    
    ranges[ranges3]
    
    signal[signal3]
    
    ranges[ranges4]
    
    signal[signal4]
    
    ranges[ranges5]
    
    signal[signal5]
    
    ranges[ranges6]
    
    signal[signal6]
    
    ranges[ranges7]
    
    signal[signal7]
    
    ranges[ranges8]
    
    signal[signal8]
    
    ranges[ranges9]
    
    signal[signal9]
    



![png](output_101_1.png)



![png](output_101_2.png)


## Original


```R
######### ORIGINAL USED IN FIG 1 A 


##########  ~~~~~~~~~~~~~~~~~~~     PLOTGARDENER CALL FOR PLOTTING   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##########

### Open a PDF() graphical device
# pdf("/data/hodges_lab/Tim/plotgardener_RSushi/plotgardener_CD27.12_6522500_6575000.width7.originalColors.geneAnno.pdf")

### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 7, height = 10, default.units = "inches")


### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = 1)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"),
                x = 0, y = 1.5, height = 1)


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = 2.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = 3.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(fspinal_hmr, params = coords, y = 3, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(fspinal_meth, params = coords, y = 4, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(fheart_hmr, params = coords, y = 3.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(fheart_meth, params = coords, y = 4.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(adrenal_hmr, params = coords, y = 4, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(adrenal_meth, params = coords, y = 5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(liver_hmr, params = coords, y = 4.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(liver_meth, params = coords, y = 5.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(hspc_hmr, params = coords, y = 5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(hspc_meth, params = coords, y = 6, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(macro_hmr, params = coords, y = 5.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(macro_meth, params = coords, y = 6.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(tcell_hmr, params = coords, y = 6, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(tcell_meth, params = coords, y = 7, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(bcell_hmr, params = coords, y = 6.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(bcell_meth, params = coords, y = 7.5, height = .3,
                    linecolor = "#8CB3DF")

# This will take away the background grey gridlines that make working with the image in Illustrator difficult
# This happens to do this by replotting the same graph but with out guides on a second page in the output PDF file -- the version with guides will still show first in the file 
pageGuideHide()

### Turn off graphical device to save PDf
# dev.off()

```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    
    ranges[ranges2]
    
    signal[signal2]
    
    ranges[ranges3]
    
    signal[signal3]
    
    ranges[ranges4]
    
    signal[signal4]
    
    ranges[ranges5]
    
    signal[signal5]
    
    ranges[ranges6]
    
    signal[signal6]
    
    ranges[ranges7]
    
    signal[signal7]
    
    ranges[ranges8]
    
    signal[signal8]
    
    ranges[ranges9]
    
    signal[signal9]
    



![png](output_103_1.png)



![png](output_103_2.png)


## pgParams range and pageCreate::height


```R
##########  CHANGED:  
# range added into "pgParams"
# "height" argument removed from pageCreate call 

### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches", range = c(0, 25))


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 7, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = 1)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"),
                x = 0, y = 1.5, height = 1)


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = 2.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = 3.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(fspinal_hmr, params = coords, y = 3, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(fspinal_meth, params = coords, y = 4, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(fheart_hmr, params = coords, y = 3.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(fheart_meth, params = coords, y = 4.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(adrenal_hmr, params = coords, y = 4, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(adrenal_meth, params = coords, y = 5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(liver_hmr, params = coords, y = 4.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(liver_meth, params = coords, y = 5.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(hspc_hmr, params = coords, y = 5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(hspc_meth, params = coords, y = 6, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(macro_hmr, params = coords, y = 5.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(macro_meth, params = coords, y = 6.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(tcell_hmr, params = coords, y = 6, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(tcell_meth, params = coords, y = 7, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(bcell_hmr, params = coords, y = 6.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(bcell_meth, params = coords, y = 7.5, height = .3,
                    linecolor = "#8CB3DF")

# This will take away the background grey gridlines that make working with the image in Illustrator difficult
# This happens to do this by replotting the same graph but with out guides on a second page in the output PDF file -- the version with guides will still show first in the file 
pageGuideHide()

### Turn off graphical device to save PDf
# dev.off()

```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    
    ranges[ranges2]
    
    signal[signal2]
    
    ranges[ranges3]
    
    signal[signal3]
    
    ranges[ranges4]
    
    signal[signal4]
    
    ranges[ranges5]
    
    signal[signal5]
    
    ranges[ranges6]
    
    signal[signal6]
    
    ranges[ranges7]
    
    signal[signal7]
    
    ranges[ranges8]
    
    signal[signal8]
    
    ranges[ranges9]
    
    signal[signal9]
    



![png](output_105_1.png)



![png](output_105_2.png)


## pgParams range


```R
####### Trying just one Meth/HMR row to test why methylation isn't showing 

### Added back in the "height" argument in pageCreate

### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 0, width = 7, 
                   just = c("left", "bottom"), default.units = "inches", range = c(0, 25))


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 7, height = 10, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = 1)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"),
                x = 0, y = 1.5, height = 1)


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = 2.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = 3.5, height = .3,
                    linecolor = "#8CB3DF")

```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    



![png](output_107_1.png)


## Original - 1 track 


```R
#### Original for just one mark 


### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 7, height = 10, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = 1)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"),
                x = 0, y = 1.5, height = 1)


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = 2.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = 3.5, height = .3,
                    linecolor = "#8CB3DF")
```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    



![png](output_109_1.png)


## Original - 1 track - pageCreate::height = 12


```R
####### Trying just one Meth/HMR row to test why methylation isn't showing 

### Added back in the "height" argument in pageCreate, but moved it to 12 (looks like the plots moved vertically by 2 units)

### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 0, width = 7, 
                   just = c("left", "bottom"), default.units = "inches") 


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 7, height = 12, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = 1)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"),
                x = 0, y = 1.5, height = 1)


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = 2.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = 3.5, height = .3,
                    linecolor = "#8CB3DF")

```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    



![png](output_111_1.png)


## Original - 1 track - pageCreate::height = 12 || Save



```R
####### Trying just one Meth/HMR row to test why methylation isn't showing 

### Added back in the "height" argument in pageCreate, but moved it to 12 (looks like the plots moved vertically by 2 units)


### Open a PDF() graphical device
pdf("/data/hodges_lab/Tim/plotgardener_RSushi/plotgardener_CD27.1track.testing_height_of_page.1.pdf")

### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19", x = 0, width = 7, 
                   just = c("left", "bottom"), default.units = "inches") 


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 7, height = 12, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = 1)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"),
                x = 0, y = 1.5, height = 1)


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = 2.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = 3.5, height = .3,
                    linecolor = "#8CB3DF")


# This will take away the background grey gridlines that make working with the image in Illustrator difficult
# This happens to do this by replotting the same graph but with out guides on a second page in the output PDF file -- the version with guides will still show first in the file 
pageGuideHide()

dev.off()
```

    genes[genes1]
    
    genomeLabel[genomeLabel1]
    
    ranges[ranges1]
    
    signal[signal1]
    



<strong>png:</strong> 2



```R

```

# ---------------


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


```R

```


```R

```

# --------------

# --------------

# --------------

# --------------

# --------------

# Trying again 


```R
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19",x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")
```

## Load files (another 4D nucleosome H1 ESC file: https://data.4dnucleome.org/files-processed/4DNFI2TK7L2F/)


```R
h1_data <- readHic(file = "4DNFI2TK7L2F.hic", chrom = "12", chromstart = 6413334, chromend = 6465834, assembly = "hg38", res_scale = "BP")
```

    Read in hic file with KR normalization at 5000 BP resolution.
    


## Load files - B cell 


```R
bc_data <- readHic(file = "GSE63525_GM12878_insitu_primary.hic", chrom = "12", assembly = "hg19", resolution = 10000, res_scale = "BP")
```

    Read in hic file with KR normalization at 10000 BP resolution.
    


## Plot H1 and B cell 


```R
#
pageCreate(width = 7, height = 7, default.units = "inches")

plotHicTriangle(data = h1_data, params = coords,
                             zrange = c(0, 200), resolution = 5000,
                             y = 3, height = 5, just = c("left", "bottom"))

plotHicTriangle(data = bc_data, params = coords,
                             zrange = c(0, 200), resolution = 10000,
                            flip = TRUE,
                             y = 8.5 , height = 5, just = c("left", "bottom"))

```

    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 5000 BP resolution detected.
    
    Warning message:
    “No data found in region.”
    hicTriangle[hicTriangle1]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle2]
    



![png](output_142_1.png)



```R

```

# Load in Hi-C data

-From Yue Lab 3D Genome Browser - Rao dataset (sent to SRA)


-This is the "insitu" samples; the page also includes a "dilution" variation, which was their original protocol; additional other variations include skipping the crosslinking "noXlink" and switching their restriction enzyme "DpnIII"

## Early tries

### GM12878


```R
wget https://ftp.ncbi.nlm.nih.gov/geo/series/GSE63nnn/GSE63525/suppl/GSE63525_GM12878_insitu_primary.hic
GSE63525_GM12878_insitu_primary.hic
```


```R
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19",x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")
```


```R
strawr::readHicChroms("GSE63525_GM12878_insitu_primary.hic")
```


<table class="dataframe">
<caption>A data.frame: 26 × 2</caption>
<thead>
	<tr><th scope=col>name</th><th scope=col>length</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>1  </td><td>249250621</td></tr>
	<tr><td>10 </td><td>135534747</td></tr>
	<tr><td>11 </td><td>135006516</td></tr>
	<tr><td>12 </td><td>133851895</td></tr>
	<tr><td>13 </td><td>115169878</td></tr>
	<tr><td>14 </td><td>107349540</td></tr>
	<tr><td>15 </td><td>102531392</td></tr>
	<tr><td>16 </td><td> 90354753</td></tr>
	<tr><td>17 </td><td> 81195210</td></tr>
	<tr><td>18 </td><td> 78077248</td></tr>
	<tr><td>19 </td><td> 59128983</td></tr>
	<tr><td>2  </td><td>243199373</td></tr>
	<tr><td>20 </td><td> 63025520</td></tr>
	<tr><td>21 </td><td> 48129895</td></tr>
	<tr><td>22 </td><td> 51304566</td></tr>
	<tr><td>3  </td><td>198022430</td></tr>
	<tr><td>4  </td><td>191154276</td></tr>
	<tr><td>5  </td><td>180915260</td></tr>
	<tr><td>6  </td><td>171115067</td></tr>
	<tr><td>7  </td><td>159138663</td></tr>
	<tr><td>8  </td><td>146364022</td></tr>
	<tr><td>9  </td><td>141213431</td></tr>
	<tr><td>All</td><td>  3098789</td></tr>
	<tr><td>MT </td><td>    16569</td></tr>
	<tr><td>X  </td><td>155270560</td></tr>
	<tr><td>Y  </td><td> 59373566</td></tr>
</tbody>
</table>




```R
hic_data_chr <- readHic(file = "GSE63525_GM12878_insitu_primary.hic", chrom = "12", assembly = "hg19", resolution = 10000, res_scale = "BP")
```

    Read in hic file with KR normalization at 10000 BP resolution.
    



```R
hic_data_reg <- readHic(file = "GSE63525_GM12878_insitu_primary.hic", chrom = "12", chromstart = 6522500, chromend = 6575000, assembly = "hg19", resolution = 10000, res_scale = "BP")
```

    Read in hic file with KR normalization at 10000 BP resolution.
    



```R
hic_data_reg_1000 <- readHic(file = "GSE63525_GM12878_insitu_primary.hic", chrom = "12", chromstart = 6522500, chromend = 6575000, assembly = "hg19", resolution = 1000, res_scale = "BP")
```

    Read in hic file with KR normalization at 1000 BP resolution.
    


### Load HiC

### HUVEC 


```R
huvec_data_reg <- readHic(file = "GSE63525_HUVEC_combined.hic", chrom = "12", chromstart = 6522500, chromend = 6575000, assembly = "hg19", resolution = 10000, res_scale = "BP")
```

    Read in hic file with KR normalization at 10000 BP resolution.
    



```R
GSE35156_GSM892306_hESC_HindIII_HiC_replicate.nodup.hic.summary.txt
```

### H1 ESC


```R
https://data.4dnucleome.org/publications/dfc530f1-82c0-4ddc-8f95-6f40417f87a0/
```


```R
strawr::readHicChroms("4DNFIFI6NIKJ.hic")
```


<table class="dataframe">
<caption>A data.frame: 25 × 2</caption>
<thead>
	<tr><th scope=col>name</th><th scope=col>length</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>1  </td><td>248956422</td></tr>
	<tr><td>10 </td><td>133797422</td></tr>
	<tr><td>11 </td><td>135086622</td></tr>
	<tr><td>12 </td><td>133275309</td></tr>
	<tr><td>13 </td><td>114364328</td></tr>
	<tr><td>14 </td><td>107043718</td></tr>
	<tr><td>15 </td><td>101991189</td></tr>
	<tr><td>16 </td><td> 90338345</td></tr>
	<tr><td>17 </td><td> 83257441</td></tr>
	<tr><td>18 </td><td> 80373285</td></tr>
	<tr><td>19 </td><td> 58617616</td></tr>
	<tr><td>2  </td><td>242193529</td></tr>
	<tr><td>20 </td><td> 64444167</td></tr>
	<tr><td>21 </td><td> 46709983</td></tr>
	<tr><td>22 </td><td> 50818468</td></tr>
	<tr><td>3  </td><td>198295559</td></tr>
	<tr><td>4  </td><td>190214555</td></tr>
	<tr><td>5  </td><td>181538259</td></tr>
	<tr><td>6  </td><td>170805979</td></tr>
	<tr><td>7  </td><td>159345973</td></tr>
	<tr><td>8  </td><td>145138636</td></tr>
	<tr><td>9  </td><td>138394717</td></tr>
	<tr><td>ALL</td><td>  3088269</td></tr>
	<tr><td>X  </td><td>156040895</td></tr>
	<tr><td>Y  </td><td> 57227415</td></tr>
</tbody>
</table>




```R
dekker_h1esc_data_b <- readHic(file = "4DNFIFI6NIKJ.hic", chrom = "12", resolution = 10000, res_scale = "BP")
```

    Read in hic file with KR normalization at 10000 BP resolution.
    


#### Try plotting Dekker H1ESC from 4DNuc


```R
#
pageCreate(width = 7, height = 7, default.units = "inches")

plotHicTriangle(data = dekker_h1esc_data_b, params = coords,
                             zrange = c(0, 200), resolution = 10000,
                             y = 3, height = 5, just = c("left", "bottom"))


```

    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    



![png](output_163_1.png)



```R

```


```R
dekker_h1esc_data_reg <- readHic(file = "4DNFIFI6NIKJ.hic", chrom = "12", chromstart = 6522500, chromend = 6575000, assembly = "hg19", res_scale = "BP")
```

    Warning message:
    “No data found in region. Suggestions: check that chromosome names match genome assembly; check region; check available resolutions with `strawr::readHicBpResolutions()`.”


## Later tries 


```R
setwd("/data/hodges_lab/Tim/plotgardener_RSushi/bigWigs")
```


```R

```


```R
UCSC LiftOver converted Chr12 6522500 6575000
chr12 6413334 6465834
```

### GM


```R
gm_data <- readHic(file = "4DNFI1UEG1HD.hic", chrom = "12", chromstart = 6413334, chromend = 6465834, assembly = "hg38",resolution = 5000,  res_scale = "BP")
```

    Read in hic file with KR normalization at 5000 BP resolution.
    


### H1 ESC


```R
esc_data <- readHic(file = "4DNFIIMZB6Y9.hic", chrom = "12", chromstart = 6413334, chromend = 6465834, assembly = "hg38", resolution = 5000, res_scale = "BP")
```

    Read in hic file with KR normalization at 5000 BP resolution.
    


## ENCODE

### Motor Neuron


```R
https://www.encodeproject.org/experiments/ENCSR228TUX/
```


```R
wget https://www.encodeproject.org/files/ENCFF860TRU/@@download/ENCFF860TRU.hic
```


    Error in parse(text = x, srcfile = src): <text>:1:6: unexpected symbol
    1: wget https
             ^
    Traceback:



### GM12878


```R
https://www.encodeproject.org/experiments/ENCSR968KAY/
```


```R
wget https://www.encodeproject.org/files/ENCFF256UOW/@@download/ENCFF256UOW.hic
```


```R

```


```R
https://www.encodeproject.org/experiments/ENCSR916MFV/
```


```R
wget https://www.encodeproject.org/files/ENCFF318GOM/@@download/ENCFF318GOM.hic
```

### Load MN and GM


```R
list.files()
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'4DNFI1UEG1HD.hic'</li><li>'4DNFIFI6NIKJ.hic'</li><li>'4DNFIIMZB6Y9.hic'</li><li>'bigBedToBed'</li><li>'ENCFF256UOW.hic'</li><li>'ENCFF860TRU.hic'</li><li>'GM12878_combined_interchromosomal'</li><li>'GSE35156_GSM892306_hESC_HindIII_HiC_replicate.nodup.hic.summary.txt'</li><li>'GSE63525_GM12878_combined_interchromosomal_contact_matrices.tar.gz'</li><li>'GSE63525_GM12878_insitu_primary.hic'</li><li>'GSE63525_HUVEC_combined.hic'</li><li>'Human_Adrenal-gland.hmr.bb'</li><li>'Human_Adrenal-gland.hmr.bed'</li><li>'Human_Adrenal-gland.meth.bedGraph'</li><li>'Human_BCell.hmr.bb'</li><li>'Human_BCell.hmr.bed'</li><li>'Human_BCell.meth.bedGraph'</li><li>'Human_Fetal-Heart.hmr.bb'</li><li>'Human_Fetal-Heart.hmr.bed'</li><li>'Human_Fetal-Heart.meth.bedGraph'</li><li>'Human_Fetal-Spinal-Cord.hmr.bb'</li><li>'Human_Fetal-Spinal-Cord.hmr.bed'</li><li>'Human_Fetal-Spinal-Cord.meth.bedGraph'</li><li>'Human_H1ESC.hmr.bb'</li><li>'Human_H1ESC.hmr.bed'</li><li>'Human_H1ESC.meth.bedGraph'</li><li>'Human_HSC.hmr.bb'</li><li>'Human_HSC.hmr.bed'</li><li>'Human_HSC.meth.bedGraph'</li><li>'Human_Liver.hmr.bb'</li><li>'Human_Liver.hmr.bed'</li><li>'Human_Liver.meth.bedGraph'</li><li>'Human_Macrophage.hmr.bb'</li><li>'Human_Macrophage.hmr.bed'</li><li>'Human_Macrophage.meth.bedGraph'</li><li>'Human_Tcell.hmr.bb'</li><li>'Human_Tcell.hmr.bed'</li><li>'Human_Tcell.meth.bedGraph'</li><li>'index.html'</li><li>'index.html.1'</li><li>'index.html.2'</li><li>'TS5_GM12878_promoter-other_significant_interactions.txt'</li></ol>




```R
mn_data <- readHic(file = "ENCFF860TRU.hic", chrom = "chr12", chromstart = 6413334, chromend = 6465834, assembly = "hg38",  resolution = 5000, res_scale = "BP")
```

    Warning message:
    “No data found in region. Suggestions: check that chromosome names match genome assembly; check region; check available resolutions with `strawr::readHicBpResolutions()`.”



```R
strawr::readHicBpResolutions()
```


    Error in strawr::readHicBpResolutions(): argument "fname" is missing, with no default
    Traceback:


    1. strawr::readHicBpResolutions()



```R
mn_data <- readHic(file = "ENCFF860TRU.hic", chrom = "chr12")

gm_data <- readHic(file = "ENCFF256UOW.hic", chrom = "chr12", chromstart = 6413334, chromend = 6465834, assembly = "hg38",  res_scale = "BP")
```

    Warning message:
    “No data found in region. Suggestions: check that chromosome names match genome assembly; check region; check available resolutions with `strawr::readHicBpResolutions()`.”
    Warning message:
    “No data found in region. Suggestions: check that chromosome names match genome assembly; check region; check available resolutions with `strawr::readHicBpResolutions()`.”


## Plot HiC

### Load in params


```R
## Set genomic and dimension parameters in a `params` object
params_c <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19",x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")

```

### Try H1ESC... 


```R
pageCreate(width = 7, height = 7, default.units = "inches")

plotHicTriangle(data = dekker_h1esc_data_b, params = params_c,
                             zrange = c(0, 200), resolution = 10000,
                             y = 3, height = 5, just = c("left", "bottom"))
```

    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    



![png](output_193_1.png)


### Plot Bcell 1000 and HUVEC 10000 -- looks awful


```R
#
pageCreate(width = 7, height = 7, default.units = "inches")

plotHicTriangle(data = hic_data_reg_1000, params = params_c,
                             zrange = c(0, 200), resolution = 1000,
                             y = 3, height = 5, just = c("left", "bottom"))

plotHicTriangle(data = huvec_data_reg, params = params_c,
                             zrange = c(0, 200), resolution = 10000,
                            flip = TRUE,
                             y = 8.5 , height = 5, just = c("left", "bottom"))

```

    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 1000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle2]
    



![png](output_195_1.png)



```R
pageCreate(width = 9, height = 9, default.units = "inches")

params_c <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19",x = 0, width = 7, 
                   just = c("left", "bottom"), default.units = "inches")

## Plot Hi-C triangle
hic_gm <- plotHicTriangle(data = hic_data_reg_1000, params = params_c,
                             zrange = c(0, 200), resolution = 1000,
                             x = 1, y = 3.5, height = 5, just = c("left", "bottom"))
```

    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 1000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    



![png](output_196_1.png)



```R
##########################
######## Panel C #########
##########################
#
pageCreate(width = 7, height = 8, default.units = "inches")


## Set genomic and dimension parameters in a `params` object
params_c <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19",x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")

## Plot Hi-C triangle
hic_gm <- plotHicTriangle(data = hic_data_reg_1000, params = params_c,
                             zrange = c(0, 200), resolution = 1000,
                             y = 3, height = 5, just = c("left", "bottom"))


hic_gm <- plotHicTriangle(data = huvec_data_reg, params = params_c,
                             zrange = c(0, 200), resolution = 10000,
                             y = 11, height = 5, just = c("left", "bottom"))


## Annotate Hi-C heatmap legend
annoHeatmapLegend(plot = hic_gm, fontsize = 7, 
                     x = 6, y = 0, width = 0.07, height = 0.5, 
                     just = c("right", "top"), default.units = "inches")
```

    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 1000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle2]
    
    heatmapLegend[heatmapLegend1]
    



![png](output_197_1.png)



```R
##########################
######## Panel C #########
##########################
#
pageCreate(width = 7, height = 13, default.units = "inches")


## Set genomic and dimension parameters in a `params` object
params_c <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19",x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")

## Plot Hi-C triangle
hic_gm <- plotHicTriangle(data = hic_data_reg_1000, params = params_c,
                             zrange = c(0, 200), resolution = 1000,
                             y = 7, height = 5, just = c("left", "bottom"))


huv_gm <- plotHicTriangle(data = huvec_data_reg, params = params_c,
                             zrange = c(0, 200), resolution = 10000,
                             y = 10, height = 5, just = c("left", "bottom"))


## Annotate Hi-C heatmap legend
annoHeatmapLegend(plot = hic_gm, fontsize = 7, 
                     x = 6, y = 0, width = 0.07, height = 0.5, 
                     just = c("right", "top"), default.units = "inches")
```

    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 1000 BP resolution detected.
    
    hicTriangle[hicTriangle1]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 10000 BP resolution detected.
    
    hicTriangle[hicTriangle2]
    
    heatmapLegend[heatmapLegend1]
    



![png](output_198_1.png)


## Plot HiC - 4DNucleosome


```R
## Set genomic and dimension parameters in a `params` object
params_c <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19",x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")

print("Paramters set.")
```

    [1] "Paramters set."



```R
#
pageCreate(width = 7, height = 7, default.units = "inches")

plotHicTriangle(data = gm_data, params = params_c,
                             zrange = c(0, 200), resolution = 5000,
                             y = 3, height = 5, just = c("left", "bottom"))

plotHicTriangle(data = esc_data, params = params_c,
                             zrange = c(0, 200), resolution = 5000,
                            flip = TRUE,
                             y = 8.5 , height = 5, just = c("left", "bottom"))

```

    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 5000 BP resolution detected.
    
    Warning message:
    “No data found in region.”
    hicTriangle[hicTriangle1]
    
    Read in dataframe.  Assuming 'chrom' in column1 and 'altchrom' in column2. 5000 BP resolution detected.
    
    Warning message:
    “No data found in region.”
    hicTriangle[hicTriangle2]
    



![png](output_201_1.png)



```R

```


```R

```

## Plot HiC - ENCODE


```R
## Set genomic and dimension parameters in a `params` object
params_c <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19",x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")

print("Paramters set.")
```


```R
#
pageCreate(width = 7, height = 7, default.units = "inches")

plotHicTriangle(data = gm_data, params = params_c,
                             zrange = c(0, 200), resolution = 5000,
                             y = 3, height = 5, just = c("left", "bottom"))

plotHicTriangle(data = esc_data, params = params_c,
                             zrange = c(0, 200), resolution = 5000,
                            flip = TRUE,
                             y = 8.5 , height = 5, just = c("left", "bottom"))

```


```R

```

# PlotGardener Call


```R

```


```R



##########  ~~~~~~~~~~~~~~~~~~~     PLOTGARDENER CALL FOR PLOTTING   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##########

### Open a PDF() graphical device
pdf("/data/hodges_lab/Tim/plotgardener_RSushi/plotgardener_CD27.12_6522500_6575000.width7.originalColors.geneAnno.pdf")

### Set the "parameters" for the plot, which plotgardener uses for the rest of the elements
### Main parameters: chromosomal position, genome assembly, plot width
coords <- pgParams(chrom = "chr12", chromstart = 6522500, chromend = 6575000, 
                   assembly = "hg19",x = 0, width = 7, 
                   just = c("left", "top"), default.units = "inches")


### This sets the "canvas" for the plot (should match widths with the defined parameters)
pageCreate(width = 7, height = 10, default.units = "inches")

### Plot genes
genes_a <- plotGenes(params = coords, stroke = 1, fontsize = 14,
                        y = 2, height = 1)

### Plot the genome label (coordinates to know where the plot is)
annoGenomeLabel(plot = genes_a, params = coords, scale = "Kb", fontsize = 10, margin = unit(1, "mm"),
                x = 0, y = 1.5, height = 1)


### Plot HMRs and .meth files successively, for each cell type
###  -- each subsequent cell type's "y" coordinate value increases by .5 from the previous cell type in my plot
plotRanges(h1esc_hmr, params = coords, y = 2.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(h1esc_meth, params = coords, y = 3.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(fspinal_hmr, params = coords, y = 3, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(fspinal_meth, params = coords, y = 4, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(fheart_hmr, params = coords, y = 3.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(fheart_meth, params = coords, y = 4.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(adrenal_hmr, params = coords, y = 4, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(adrenal_meth, params = coords, y = 5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(liver_hmr, params = coords, y = 4.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(liver_meth, params = coords, y = 5.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(hspc_hmr, params = coords, y = 5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(hspc_meth, params = coords, y = 6, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(macro_hmr, params = coords, y = 5.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(macro_meth, params = coords, y = 6.5, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(tcell_hmr, params = coords, y = 6, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(tcell_meth, params = coords, y = 7, height = .3,
                    linecolor = "#8CB3DF")

plotRanges(bcell_hmr, params = coords, y = 6.5, height = 1,
                    linecolor = "#8CB3DF")
plotSignal(bcell_meth, params = coords, y = 7.5, height = .3,
                    linecolor = "#8CB3DF")

# This will take away the background grey gridlines that make working with the image in Illustrator difficult
# This happens to do this by replotting the same graph but with out guides on a second page in the output PDF file -- the version with guides will still show first in the file 
pageGuideHide()

### Turn off graphical device to save PDf
dev.off()

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


```R

```
