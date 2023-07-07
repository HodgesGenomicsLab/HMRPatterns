```bash
cd /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles
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
    other
    Tcell.minsize50.filtforrefseqTSSexons.txt
    temp.u.txt
    temp.v.txt


# Create list of the HMRs in all other cell types


```bash
cat fSpinal.minsize50.filtforrefseqTSSexons.txt \
fHeart.minsize50.filtforrefseqTSSexons.txt \
Adrenal.minsize50.filtforrefseqTSSexons.txt \
Liver.minsize50.filtforrefseqTSSexons.txt \
HSC.minsize50.filtforrefseqTSSexons.txt \
Macrophage.minsize50.filtforrefseqTSSexons.txt \
HSC.minsize50.filtforrefseqTSSexons.txt \
Bcell.minsize50.filtforrefseqTSSexons.txt \
Tcell.minsize50.filtforrefseqTSSexons.txt | bedtools sort -i - > Fig1.All_but_H1.sorted.txt

```


```bash
wc -l Fig1.All_but_H1.sorted.txt
```

    375484 Fig1.All_but_H1.sorted.txt



```bash
bedtools merge -i Fig1.All_but_H1.sorted.txt > Fig1.All_but_H1.merged.txt
wc -l Fig1.All_but_H1.merged.txt
```

    119338 Fig1.All_but_H1.merged.txt


# Measure how many CS and SHARED


```bash
## Shared
```


```bash
bedtools intersect -u -a H1ESC.minsize50.filtforrefseqTSSexons.txt -b Fig1.All_but_H1.merged.txt | wc -l 
```

    15557



```bash
## Cell Specific
```


```bash
bedtools intersect -v -a H1ESC.minsize50.filtforrefseqTSSexons.txt -b Fig1.All_but_H1.merged.txt | wc -l 
```

    2678

