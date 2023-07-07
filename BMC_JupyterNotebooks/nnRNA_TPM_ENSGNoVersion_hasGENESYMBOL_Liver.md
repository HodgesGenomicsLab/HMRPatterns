# Add BED to ENSG_TPM


```R
library(tidyverse)
library(ggplot2)
library(clusterProfiler)
library(biomaRt)
print("Loaded.")

setwd("/data/hodges_lab/Tim/nnRNA_TPM_EHGM/reference_files/")
```

    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.1 ──
    
    [32m✔[39m [34mggplot2[39m 3.3.6     [32m✔[39m [34mpurrr  [39m 1.0.1
    [32m✔[39m [34mtibble [39m 3.2.1     [32m✔[39m [34mdplyr  [39m 1.1.1
    [32m✔[39m [34mtidyr  [39m 1.3.0     [32m✔[39m [34mstringr[39m 1.5.0
    [32m✔[39m [34mreadr  [39m 2.1.2     [32m✔[39m [34mforcats[39m 0.5.1
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    
    
    
    clusterProfiler v4.2.0  For help: https://yulab-smu.top/biomedical-knowledge-mining-book/
    
    If you use clusterProfiler in published research, please cite:
    T Wu, E Hu, S Xu, M Chen, P Guo, Z Dai, T Feng, L Zhou, W Tang, L Zhan, X Fu, S Liu, X Bo, and G Yu. clusterProfiler 4.0: A universal enrichment tool for interpreting omics data. The Innovation. 2021, 2(3):100141
    
    
    Attaching package: ‘clusterProfiler’
    
    
    The following object is masked from ‘package:purrr’:
    
        simplify
    
    
    The following object is masked from ‘package:stats’:
    
        filter
    
    


    [1] "Loaded."


## HepG2

### Average reps


```R
# Read in ENCFF974MUO.tsv ENCFF649AHO.tsv
HepG2_ENSG_file_in_1 <- read_tsv("./ENCFF974MUO.tsv", col_names=TRUE, skip=0)
HepG2_ENSG_file_in_2 <- read_tsv("./ENCFF649AHO.tsv", col_names=TRUE, skip=0) 
```

    [1mRows: [22m[34m58540[39m [1mColumns: [22m[34m15[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m  (2): gene_id, transcript_id(s)
    [32mdbl[39m (13): length, effective_length, expected_count, TPM, FPKM, posterior_mea...
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m58540[39m [1mColumns: [22m[34m15[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m  (2): gene_id, transcript_id(s)
    [32mdbl[39m (13): length, effective_length, expected_count, TPM, FPKM, posterior_mea...
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



```R
# Filter to keep just ENSG rows
HepG2_ENSG_only_1 <- HepG2_ENSG_file_in_1 %>%
    filter("ENSG"==substr(gene_id, 1, 4))
HepG2_ENSG_only_2 <- HepG2_ENSG_file_in_2 %>%
    filter("ENSG"==substr(gene_id, 1, 4))

# Isolate columns we want: ENSEMBL TPM
HepG2_ENSG_TPM_1 <- HepG2_ENSG_only_1 %>%
    dplyr::select(gene_id, TPM) %>% # isolate gene_id_clean and TPM columns
    magrittr::set_colnames(c("ENSEMBL", "TPM")) # Rename these for easier merging and readibility 
HepG2_ENSG_TPM_2 <- HepG2_ENSG_only_2 %>%
    dplyr::select(gene_id, TPM) %>% # isolate gene_id_clean and TPM columns
    magrittr::set_colnames(c("ENSEMBL", "TPM")) # Rename these for easier merging and readibility 


# Average reps
HepG2_ENSG_TPM_merge12 <- merge(HepG2_ENSG_TPM_1, HepG2_ENSG_TPM_2, by = "ENSEMBL") %>% as_tibble()

HepG2_ENSG_TPM_avg12 <- HepG2_ENSG_TPM_merge12 %>% dplyr::mutate(TPM = rowMeans(dplyr::select(., TPM.x:TPM.y))) %>% dplyr::select(ENSEMBL, TPM)
```


```R
write_tsv(HepG2_ENSG_TPM_avg12, "HepG2_ENSG_TPM_avg12.txt", col_names = TRUE)
```

### Biomart


```R
# define biomart object
# mart <- useMart(biomart = "ensembl", dataset = "hsapiens_gene_ensembl")
mart <- useMart(biomart="ENSEMBL_MART_ENSEMBL", host="grch37.ensembl.org", path="/biomart/martservice", dataset="hsapiens_gene_ensembl")

ENSEMBL_to_GENESYMBOL <- getBM(attributes=c("ensembl_gene_id_version", "hgnc_symbol", "chromosome_name", "start_position", "end_position","strand"), filters = "ensembl_gene_id_version", values = HepG2_ENSG_TPM_avg12$ENSEMBL, mart= mart)
```

    Warning message:
    “Ensembl will soon enforce the use of https.
    Ensure the 'host' argument includes "https://"”


### Convert ENSEMBL to GENE SYMBOL


```R
nrow(HepG2_ENSG_TPM_avg12)
head(HepG2_ENSG_TPM_avg12, 3)
```


57820



<table class="dataframe">
<caption>A tibble: 3 × 2</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003.10</td><td>40.355</td></tr>
	<tr><td>ENSG00000000005.5 </td><td> 0.000</td></tr>
	<tr><td>ENSG00000000419.8 </td><td>79.980</td></tr>
</tbody>
</table>




```R
HepG2_ENSG_TPM_avg12_noVersion <- HepG2_ENSG_TPM_avg12 %>% mutate(ENSG = gsub("\\..*", "", ENSEMBL))
```


```R
Liver_ENSEMBLnoVersion_to_GENESYMBOL <- getBM(attributes=c("ensembl_gene_id", "hgnc_symbol", "chromosome_name", "start_position", "end_position","strand"), filters = "ensembl_gene_id", values = HepG2_ENSG_TPM_avg12_noVersion$ENSG, mart= mart)

nrow(Liver_ENSEMBLnoVersion_to_GENESYMBOL)
Liver_ENSEMBLnoVersion_to_GENESYMBOL
```


57849



<table class="dataframe">
<caption>A data.frame: 57849 × 6</caption>
<thead>
	<tr><th scope=col>ensembl_gene_id</th><th scope=col>hgnc_symbol</th><th scope=col>chromosome_name</th><th scope=col>start_position</th><th scope=col>end_position</th><th scope=col>strand</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003</td><td>TSPAN6  </td><td>X </td><td> 99883667</td><td> 99894988</td><td>-1</td></tr>
	<tr><td>ENSG00000000005</td><td>TNMD    </td><td>X </td><td> 99839799</td><td> 99854882</td><td> 1</td></tr>
	<tr><td>ENSG00000000419</td><td>DPM1    </td><td>20</td><td> 49551404</td><td> 49575092</td><td>-1</td></tr>
	<tr><td>ENSG00000000457</td><td>SCYL3   </td><td>1 </td><td>169818772</td><td>169863408</td><td>-1</td></tr>
	<tr><td>ENSG00000000460</td><td>C1orf112</td><td>1 </td><td>169631245</td><td>169823221</td><td> 1</td></tr>
	<tr><td>ENSG00000000938</td><td>FGR     </td><td>1 </td><td> 27938575</td><td> 27961788</td><td>-1</td></tr>
	<tr><td>ENSG00000000971</td><td>CFH     </td><td>1 </td><td>196621008</td><td>196716634</td><td> 1</td></tr>
	<tr><td>ENSG00000001036</td><td>FUCA2   </td><td>6 </td><td>143815948</td><td>143832827</td><td>-1</td></tr>
	<tr><td>ENSG00000001084</td><td>GCLC    </td><td>6 </td><td> 53362139</td><td> 53481768</td><td>-1</td></tr>
	<tr><td>ENSG00000001167</td><td>NFYA    </td><td>6 </td><td> 41040684</td><td> 41067715</td><td> 1</td></tr>
	<tr><td>ENSG00000001460</td><td>STPG1   </td><td>1 </td><td> 24683489</td><td> 24743424</td><td>-1</td></tr>
	<tr><td>ENSG00000001461</td><td>NIPAL3  </td><td>1 </td><td> 24742284</td><td> 24799466</td><td> 1</td></tr>
	<tr><td>ENSG00000001497</td><td>LAS1L   </td><td>X </td><td> 64732462</td><td> 64754655</td><td>-1</td></tr>
	<tr><td>ENSG00000001561</td><td>ENPP4   </td><td>6 </td><td> 46097730</td><td> 46114436</td><td> 1</td></tr>
	<tr><td>ENSG00000001617</td><td>SEMA3F  </td><td>3 </td><td> 50192478</td><td> 50226508</td><td> 1</td></tr>
	<tr><td>ENSG00000001626</td><td>CFTR    </td><td>7 </td><td>117105838</td><td>117356025</td><td> 1</td></tr>
	<tr><td>ENSG00000001629</td><td>ANKIB1  </td><td>7 </td><td> 91875548</td><td> 92030698</td><td> 1</td></tr>
	<tr><td>ENSG00000001630</td><td>CYP51A1 </td><td>7 </td><td> 91741465</td><td> 91772266</td><td>-1</td></tr>
	<tr><td>ENSG00000001631</td><td>KRIT1   </td><td>7 </td><td> 91828283</td><td> 91875480</td><td>-1</td></tr>
	<tr><td>ENSG00000002016</td><td>RAD52   </td><td>12</td><td>  1021243</td><td>  1099219</td><td>-1</td></tr>
	<tr><td>ENSG00000002079</td><td>MYH16   </td><td>7 </td><td> 98836417</td><td> 98908753</td><td> 1</td></tr>
	<tr><td>ENSG00000002330</td><td>BAD     </td><td>11</td><td> 64037302</td><td> 64052176</td><td>-1</td></tr>
	<tr><td>ENSG00000002549</td><td>LAP3    </td><td>4 </td><td> 17578815</td><td> 17609595</td><td> 1</td></tr>
	<tr><td>ENSG00000002586</td><td>CD99    </td><td>X </td><td>  2609220</td><td>  2659350</td><td> 1</td></tr>
	<tr><td>ENSG00000002587</td><td>HS3ST1  </td><td>4 </td><td> 11394774</td><td> 11431389</td><td>-1</td></tr>
	<tr><td>ENSG00000002726</td><td>AOC1    </td><td>7 </td><td>150521715</td><td>150558592</td><td> 1</td></tr>
	<tr><td>ENSG00000002745</td><td>WNT16   </td><td>7 </td><td>120965421</td><td>120981158</td><td> 1</td></tr>
	<tr><td>ENSG00000002746</td><td>HECW1   </td><td>7 </td><td> 43152198</td><td> 43605600</td><td> 1</td></tr>
	<tr><td>ENSG00000002822</td><td>MAD1L1  </td><td>7 </td><td>  1855429</td><td>  2272878</td><td>-1</td></tr>
	<tr><td>ENSG00000002834</td><td>LASP1   </td><td>17</td><td> 37026112</td><td> 37078023</td><td> 1</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>ENSG00000273447</td><td>      </td><td>4 </td><td>110613160</td><td>110613859</td><td> 1</td></tr>
	<tr><td>ENSG00000273448</td><td>      </td><td>7 </td><td> 66798034</td><td> 66799370</td><td> 1</td></tr>
	<tr><td>ENSG00000273449</td><td>      </td><td>4 </td><td>164450923</td><td>164451849</td><td> 1</td></tr>
	<tr><td>ENSG00000273450</td><td>      </td><td>10</td><td> 96074664</td><td> 96075084</td><td>-1</td></tr>
	<tr><td>ENSG00000273451</td><td>      </td><td>20</td><td> 45976881</td><td> 45977886</td><td>-1</td></tr>
	<tr><td>ENSG00000273452</td><td>      </td><td>17</td><td> 12626199</td><td> 12661542</td><td> 1</td></tr>
	<tr><td>ENSG00000273454</td><td>      </td><td>3 </td><td>122996200</td><td>122996751</td><td> 1</td></tr>
	<tr><td>ENSG00000273455</td><td>      </td><td>3 </td><td>135806317</td><td>135806755</td><td>-1</td></tr>
	<tr><td>ENSG00000273456</td><td>      </td><td>2 </td><td>203239655</td><td>203240327</td><td>-1</td></tr>
	<tr><td>ENSG00000273461</td><td>      </td><td>3 </td><td> 72110212</td><td> 72119084</td><td> 1</td></tr>
	<tr><td>ENSG00000273463</td><td>      </td><td>9 </td><td> 36002993</td><td> 36003660</td><td>-1</td></tr>
	<tr><td>ENSG00000273464</td><td>      </td><td>21</td><td> 31029726</td><td> 31030151</td><td> 1</td></tr>
	<tr><td>ENSG00000273466</td><td>      </td><td>2 </td><td>219497979</td><td>219498737</td><td>-1</td></tr>
	<tr><td>ENSG00000273471</td><td>      </td><td>2 </td><td>111143988</td><td>111191250</td><td>-1</td></tr>
	<tr><td>ENSG00000273472</td><td>      </td><td>4 </td><td>141677682</td><td>141679075</td><td> 1</td></tr>
	<tr><td>ENSG00000273473</td><td>      </td><td>9 </td><td>137033891</td><td>137034462</td><td> 1</td></tr>
	<tr><td>ENSG00000273474</td><td>      </td><td>10</td><td> 13717646</td><td> 13717990</td><td> 1</td></tr>
	<tr><td>ENSG00000273476</td><td>      </td><td>10</td><td>102727445</td><td>102727892</td><td> 1</td></tr>
	<tr><td>ENSG00000273477</td><td>      </td><td>7 </td><td> 16127152</td><td> 16129275</td><td>-1</td></tr>
	<tr><td>ENSG00000273478</td><td>      </td><td>1 </td><td>201964824</td><td>201965480</td><td>-1</td></tr>
	<tr><td>ENSG00000273481</td><td>      </td><td>1 </td><td>151300425</td><td>151300905</td><td> 1</td></tr>
	<tr><td>ENSG00000273483</td><td>      </td><td>1 </td><td>113060421</td><td>113061063</td><td>-1</td></tr>
	<tr><td>ENSG00000273484</td><td>OR6R2P</td><td>8 </td><td> 21654972</td><td> 21655271</td><td> 1</td></tr>
	<tr><td>ENSG00000273485</td><td>      </td><td>10</td><td>105209953</td><td>105210609</td><td> 1</td></tr>
	<tr><td>ENSG00000273486</td><td>      </td><td>3 </td><td>136556180</td><td>136557863</td><td>-1</td></tr>
	<tr><td>ENSG00000273487</td><td>      </td><td>1 </td><td> 92654794</td><td> 92656264</td><td> 1</td></tr>
	<tr><td>ENSG00000273488</td><td>      </td><td>3 </td><td>100080031</td><td>100080481</td><td> 1</td></tr>
	<tr><td>ENSG00000273489</td><td>      </td><td>7 </td><td>131178723</td><td>131182453</td><td>-1</td></tr>
	<tr><td>ENSG00000273492</td><td>      </td><td>21</td><td> 27543189</td><td> 27589700</td><td> 1</td></tr>
	<tr><td>ENSG00000273493</td><td>      </td><td>3 </td><td> 58315692</td><td> 58315845</td><td> 1</td></tr>
</tbody>
</table>




```R
Liver_ENSEMBLnoVersion_to_GENESYMBOL_emptyHGNC <- Liver_ENSEMBLnoVersion_to_GENESYMBOL %>% filter(hgnc_symbol=="")
Liver_ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC <- Liver_ENSEMBLnoVersion_to_GENESYMBOL %>% filter(hgnc_symbol!="")

nrow(Liver_ENSEMBLnoVersion_to_GENESYMBOL)
nrow(Liver_ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC)
nrow(Liver_ENSEMBLnoVersion_to_GENESYMBOL_emptyHGNC)

write_tsv(Liver_ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC, "Liver_ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC.txt")
write_tsv(Liver_ENSEMBLnoVersion_to_GENESYMBOL_emptyHGNC, "Liver_ENSEMBLnoVersion_to_GENESYMBOL_emptyHGNC.txt")
```


57849



33662



24187



```R
Liver_ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC
```


<table class="dataframe">
<caption>A data.frame: 33662 × 6</caption>
<thead>
	<tr><th scope=col>ensembl_gene_id</th><th scope=col>hgnc_symbol</th><th scope=col>chromosome_name</th><th scope=col>start_position</th><th scope=col>end_position</th><th scope=col>strand</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003</td><td>TSPAN6  </td><td>X </td><td> 99883667</td><td> 99894988</td><td>-1</td></tr>
	<tr><td>ENSG00000000005</td><td>TNMD    </td><td>X </td><td> 99839799</td><td> 99854882</td><td> 1</td></tr>
	<tr><td>ENSG00000000419</td><td>DPM1    </td><td>20</td><td> 49551404</td><td> 49575092</td><td>-1</td></tr>
	<tr><td>ENSG00000000457</td><td>SCYL3   </td><td>1 </td><td>169818772</td><td>169863408</td><td>-1</td></tr>
	<tr><td>ENSG00000000460</td><td>C1orf112</td><td>1 </td><td>169631245</td><td>169823221</td><td> 1</td></tr>
	<tr><td>ENSG00000000938</td><td>FGR     </td><td>1 </td><td> 27938575</td><td> 27961788</td><td>-1</td></tr>
	<tr><td>ENSG00000000971</td><td>CFH     </td><td>1 </td><td>196621008</td><td>196716634</td><td> 1</td></tr>
	<tr><td>ENSG00000001036</td><td>FUCA2   </td><td>6 </td><td>143815948</td><td>143832827</td><td>-1</td></tr>
	<tr><td>ENSG00000001084</td><td>GCLC    </td><td>6 </td><td> 53362139</td><td> 53481768</td><td>-1</td></tr>
	<tr><td>ENSG00000001167</td><td>NFYA    </td><td>6 </td><td> 41040684</td><td> 41067715</td><td> 1</td></tr>
	<tr><td>ENSG00000001460</td><td>STPG1   </td><td>1 </td><td> 24683489</td><td> 24743424</td><td>-1</td></tr>
	<tr><td>ENSG00000001461</td><td>NIPAL3  </td><td>1 </td><td> 24742284</td><td> 24799466</td><td> 1</td></tr>
	<tr><td>ENSG00000001497</td><td>LAS1L   </td><td>X </td><td> 64732462</td><td> 64754655</td><td>-1</td></tr>
	<tr><td>ENSG00000001561</td><td>ENPP4   </td><td>6 </td><td> 46097730</td><td> 46114436</td><td> 1</td></tr>
	<tr><td>ENSG00000001617</td><td>SEMA3F  </td><td>3 </td><td> 50192478</td><td> 50226508</td><td> 1</td></tr>
	<tr><td>ENSG00000001626</td><td>CFTR    </td><td>7 </td><td>117105838</td><td>117356025</td><td> 1</td></tr>
	<tr><td>ENSG00000001629</td><td>ANKIB1  </td><td>7 </td><td> 91875548</td><td> 92030698</td><td> 1</td></tr>
	<tr><td>ENSG00000001630</td><td>CYP51A1 </td><td>7 </td><td> 91741465</td><td> 91772266</td><td>-1</td></tr>
	<tr><td>ENSG00000001631</td><td>KRIT1   </td><td>7 </td><td> 91828283</td><td> 91875480</td><td>-1</td></tr>
	<tr><td>ENSG00000002016</td><td>RAD52   </td><td>12</td><td>  1021243</td><td>  1099219</td><td>-1</td></tr>
	<tr><td>ENSG00000002079</td><td>MYH16   </td><td>7 </td><td> 98836417</td><td> 98908753</td><td> 1</td></tr>
	<tr><td>ENSG00000002330</td><td>BAD     </td><td>11</td><td> 64037302</td><td> 64052176</td><td>-1</td></tr>
	<tr><td>ENSG00000002549</td><td>LAP3    </td><td>4 </td><td> 17578815</td><td> 17609595</td><td> 1</td></tr>
	<tr><td>ENSG00000002586</td><td>CD99    </td><td>X </td><td>  2609220</td><td>  2659350</td><td> 1</td></tr>
	<tr><td>ENSG00000002587</td><td>HS3ST1  </td><td>4 </td><td> 11394774</td><td> 11431389</td><td>-1</td></tr>
	<tr><td>ENSG00000002726</td><td>AOC1    </td><td>7 </td><td>150521715</td><td>150558592</td><td> 1</td></tr>
	<tr><td>ENSG00000002745</td><td>WNT16   </td><td>7 </td><td>120965421</td><td>120981158</td><td> 1</td></tr>
	<tr><td>ENSG00000002746</td><td>HECW1   </td><td>7 </td><td> 43152198</td><td> 43605600</td><td> 1</td></tr>
	<tr><td>ENSG00000002822</td><td>MAD1L1  </td><td>7 </td><td>  1855429</td><td>  2272878</td><td>-1</td></tr>
	<tr><td>ENSG00000002834</td><td>LASP1   </td><td>17</td><td> 37026112</td><td> 37078023</td><td> 1</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>ENSG00000272837</td><td>OR10AE3P   </td><td>12</td><td> 56039979</td><td> 56040447</td><td>-1</td></tr>
	<tr><td>ENSG00000272882</td><td>OR2BH1P    </td><td>11</td><td> 29008182</td><td> 29009045</td><td> 1</td></tr>
	<tr><td>ENSG00000272887</td><td>CSPG4P5    </td><td>15</td><td> 84956505</td><td> 84962703</td><td>-1</td></tr>
	<tr><td>ENSG00000272900</td><td>OR10Q2P    </td><td>11</td><td> 58059298</td><td> 58060237</td><td>-1</td></tr>
	<tr><td>ENSG00000272937</td><td>OR6U2P     </td><td>12</td><td> 56005407</td><td> 56006338</td><td> 1</td></tr>
	<tr><td>ENSG00000272963</td><td>OR7A19P    </td><td>12</td><td> 46986356</td><td> 46987088</td><td> 1</td></tr>
	<tr><td>ENSG00000272968</td><td>RBAK-RBAKDN</td><td>7 </td><td>  5023349</td><td>  5112852</td><td> 1</td></tr>
	<tr><td>ENSG00000273015</td><td>LINC00938  </td><td>12</td><td> 46119510</td><td> 46121558</td><td>-1</td></tr>
	<tr><td>ENSG00000273032</td><td>DGCR9      </td><td>22</td><td> 19005347</td><td> 19007761</td><td> 1</td></tr>
	<tr><td>ENSG00000273048</td><td>MIR4720    </td><td>16</td><td> 81418623</td><td> 81418698</td><td> 1</td></tr>
	<tr><td>ENSG00000273051</td><td>OR51F4P    </td><td>11</td><td>  4773276</td><td>  4774174</td><td>-1</td></tr>
	<tr><td>ENSG00000273079</td><td>GRIN2B     </td><td>12</td><td> 13693165</td><td> 14133053</td><td>-1</td></tr>
	<tr><td>ENSG00000273164</td><td>DGCR10     </td><td>22</td><td> 19010569</td><td> 19011063</td><td> 1</td></tr>
	<tr><td>ENSG00000273228</td><td>OR5BQ1P    </td><td>11</td><td> 56796883</td><td> 56797197</td><td> 1</td></tr>
	<tr><td>ENSG00000273234</td><td>OR2A13P    </td><td>7 </td><td>143839102</td><td>143840031</td><td> 1</td></tr>
	<tr><td>ENSG00000273252</td><td>OR7E39P    </td><td>7 </td><td>  6875051</td><td>  6875425</td><td>-1</td></tr>
	<tr><td>ENSG00000273255</td><td>OR5BP1P    </td><td>11</td><td> 56823062</td><td> 56823607</td><td> 1</td></tr>
	<tr><td>ENSG00000273274</td><td>ZBTB8B     </td><td>1 </td><td> 32930670</td><td> 32962287</td><td> 1</td></tr>
	<tr><td>ENSG00000273311</td><td>DGCR11     </td><td>22</td><td> 19033675</td><td> 19035888</td><td>-1</td></tr>
	<tr><td>ENSG00000273313</td><td>RBAKDN     </td><td>7 </td><td>  5111756</td><td>  5112854</td><td> 1</td></tr>
	<tr><td>ENSG00000273327</td><td>OR6L2P     </td><td>10</td><td>135243898</td><td>135244822</td><td>-1</td></tr>
	<tr><td>ENSG00000273336</td><td>OR7M1P     </td><td>10</td><td>135294742</td><td>135295274</td><td> 1</td></tr>
	<tr><td>ENSG00000273340</td><td>MICE       </td><td>6 </td><td> 29709508</td><td> 29716746</td><td>-1</td></tr>
	<tr><td>ENSG00000273344</td><td>PAXIP1-AS1 </td><td>7 </td><td>154795158</td><td>154797413</td><td> 1</td></tr>
	<tr><td>ENSG00000273377</td><td>OR2Q1P     </td><td>7 </td><td>143677998</td><td>143678913</td><td> 1</td></tr>
	<tr><td>ENSG00000273408</td><td>OR5B15P    </td><td>11</td><td> 58155056</td><td> 58155959</td><td>-1</td></tr>
	<tr><td>ENSG00000273423</td><td>OR13I1P    </td><td>9 </td><td>107392035</td><td>107393298</td><td> 1</td></tr>
	<tr><td>ENSG00000273434</td><td>OR8S21P    </td><td>12</td><td> 48810933</td><td> 48811120</td><td>-1</td></tr>
	<tr><td>ENSG00000273439</td><td>ZNF8       </td><td>19</td><td> 58790318</td><td> 58807254</td><td> 1</td></tr>
	<tr><td>ENSG00000273484</td><td>OR6R2P     </td><td>8 </td><td> 21654972</td><td> 21655271</td><td> 1</td></tr>
</tbody>
</table>



### Relink ENSEMBL_to_GENESYMBOL and ENCODE file


```R
nrow(Liver_ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC)
nrow(HepG2_ENSG_TPM_avg12)
head(Liver_ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC, 3)
head(HepG2_ENSG_TPM_avg12_noVersion, 3)
```


33662



57820



<table class="dataframe">
<caption>A data.frame: 3 × 6</caption>
<thead>
	<tr><th></th><th scope=col>ensembl_gene_id</th><th scope=col>hgnc_symbol</th><th scope=col>chromosome_name</th><th scope=col>start_position</th><th scope=col>end_position</th><th scope=col>strand</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>ENSG00000000003</td><td>TSPAN6</td><td>X </td><td>99883667</td><td>99894988</td><td>-1</td></tr>
	<tr><th scope=row>2</th><td>ENSG00000000005</td><td>TNMD  </td><td>X </td><td>99839799</td><td>99854882</td><td> 1</td></tr>
	<tr><th scope=row>3</th><td>ENSG00000000419</td><td>DPM1  </td><td>20</td><td>49551404</td><td>49575092</td><td>-1</td></tr>
</tbody>
</table>




<table class="dataframe">
<caption>A tibble: 3 × 3</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th><th scope=col>ENSG</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003.10</td><td>40.355</td><td>ENSG00000000003</td></tr>
	<tr><td>ENSG00000000005.5 </td><td> 0.000</td><td>ENSG00000000005</td></tr>
	<tr><td>ENSG00000000419.8 </td><td>79.980</td><td>ENSG00000000419</td></tr>
</tbody>
</table>




```R
merge(Liver_ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC, HepG2_ENSG_TPM_avg12_noVersion, by.x = "ensembl_gene_id", by.y = "ENSG")
```


<table class="dataframe">
<caption>A data.frame: 33662 × 8</caption>
<thead>
	<tr><th scope=col>ensembl_gene_id</th><th scope=col>hgnc_symbol</th><th scope=col>chromosome_name</th><th scope=col>start_position</th><th scope=col>end_position</th><th scope=col>strand</th><th scope=col>ENSEMBL</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003</td><td>TSPAN6  </td><td>X </td><td> 99883667</td><td> 99894988</td><td>-1</td><td>ENSG00000000003.10</td><td> 40.355</td></tr>
	<tr><td>ENSG00000000005</td><td>TNMD    </td><td>X </td><td> 99839799</td><td> 99854882</td><td> 1</td><td>ENSG00000000005.5 </td><td>  0.000</td></tr>
	<tr><td>ENSG00000000419</td><td>DPM1    </td><td>20</td><td> 49551404</td><td> 49575092</td><td>-1</td><td>ENSG00000000419.8 </td><td> 79.980</td></tr>
	<tr><td>ENSG00000000457</td><td>SCYL3   </td><td>1 </td><td>169818772</td><td>169863408</td><td>-1</td><td>ENSG00000000457.9 </td><td>  1.830</td></tr>
	<tr><td>ENSG00000000460</td><td>C1orf112</td><td>1 </td><td>169631245</td><td>169823221</td><td> 1</td><td>ENSG00000000460.12</td><td>  2.630</td></tr>
	<tr><td>ENSG00000000938</td><td>FGR     </td><td>1 </td><td> 27938575</td><td> 27961788</td><td>-1</td><td>ENSG00000000938.8 </td><td>  0.000</td></tr>
	<tr><td>ENSG00000000971</td><td>CFH     </td><td>1 </td><td>196621008</td><td>196716634</td><td> 1</td><td>ENSG00000000971.11</td><td>  0.500</td></tr>
	<tr><td>ENSG00000001036</td><td>FUCA2   </td><td>6 </td><td>143815948</td><td>143832827</td><td>-1</td><td>ENSG00000001036.9 </td><td> 33.440</td></tr>
	<tr><td>ENSG00000001084</td><td>GCLC    </td><td>6 </td><td> 53362139</td><td> 53481768</td><td>-1</td><td>ENSG00000001084.6 </td><td>320.300</td></tr>
	<tr><td>ENSG00000001167</td><td>NFYA    </td><td>6 </td><td> 41040684</td><td> 41067715</td><td> 1</td><td>ENSG00000001167.10</td><td> 14.010</td></tr>
	<tr><td>ENSG00000001460</td><td>STPG1   </td><td>1 </td><td> 24683489</td><td> 24743424</td><td>-1</td><td>ENSG00000001460.13</td><td>  0.935</td></tr>
	<tr><td>ENSG00000001461</td><td>NIPAL3  </td><td>1 </td><td> 24742284</td><td> 24799466</td><td> 1</td><td>ENSG00000001461.12</td><td>  3.875</td></tr>
	<tr><td>ENSG00000001497</td><td>LAS1L   </td><td>X </td><td> 64732462</td><td> 64754655</td><td>-1</td><td>ENSG00000001497.12</td><td> 20.335</td></tr>
	<tr><td>ENSG00000001561</td><td>ENPP4   </td><td>6 </td><td> 46097730</td><td> 46114436</td><td> 1</td><td>ENSG00000001561.6 </td><td>  0.005</td></tr>
	<tr><td>ENSG00000001617</td><td>SEMA3F  </td><td>3 </td><td> 50192478</td><td> 50226508</td><td> 1</td><td>ENSG00000001617.7 </td><td>  8.110</td></tr>
	<tr><td>ENSG00000001626</td><td>CFTR    </td><td>7 </td><td>117105838</td><td>117356025</td><td> 1</td><td>ENSG00000001626.10</td><td>  0.000</td></tr>
	<tr><td>ENSG00000001629</td><td>ANKIB1  </td><td>7 </td><td> 91875548</td><td> 92030698</td><td> 1</td><td>ENSG00000001629.5 </td><td> 19.700</td></tr>
	<tr><td>ENSG00000001630</td><td>CYP51A1 </td><td>7 </td><td> 91741465</td><td> 91772266</td><td>-1</td><td>ENSG00000001630.11</td><td> 61.655</td></tr>
	<tr><td>ENSG00000001631</td><td>KRIT1   </td><td>7 </td><td> 91828283</td><td> 91875480</td><td>-1</td><td>ENSG00000001631.10</td><td> 14.780</td></tr>
	<tr><td>ENSG00000002016</td><td>RAD52   </td><td>12</td><td>  1021243</td><td>  1099219</td><td>-1</td><td>ENSG00000002016.12</td><td> 13.250</td></tr>
	<tr><td>ENSG00000002079</td><td>MYH16   </td><td>7 </td><td> 98836417</td><td> 98908753</td><td> 1</td><td>ENSG00000002079.8 </td><td>  0.475</td></tr>
	<tr><td>ENSG00000002330</td><td>BAD     </td><td>11</td><td> 64037302</td><td> 64052176</td><td>-1</td><td>ENSG00000002330.9 </td><td>  4.780</td></tr>
	<tr><td>ENSG00000002549</td><td>LAP3    </td><td>4 </td><td> 17578815</td><td> 17609595</td><td> 1</td><td>ENSG00000002549.8 </td><td>327.110</td></tr>
	<tr><td>ENSG00000002586</td><td>CD99    </td><td>X </td><td>  2609220</td><td>  2659350</td><td> 1</td><td>ENSG00000002586.13</td><td> 88.750</td></tr>
	<tr><td>ENSG00000002587</td><td>HS3ST1  </td><td>4 </td><td> 11394774</td><td> 11431389</td><td>-1</td><td>ENSG00000002587.5 </td><td>  0.000</td></tr>
	<tr><td>ENSG00000002726</td><td>AOC1    </td><td>7 </td><td>150521715</td><td>150558592</td><td> 1</td><td>ENSG00000002726.15</td><td>  0.000</td></tr>
	<tr><td>ENSG00000002745</td><td>WNT16   </td><td>7 </td><td>120965421</td><td>120981158</td><td> 1</td><td>ENSG00000002745.8 </td><td>  0.000</td></tr>
	<tr><td>ENSG00000002746</td><td>HECW1   </td><td>7 </td><td> 43152198</td><td> 43605600</td><td> 1</td><td>ENSG00000002746.10</td><td>  0.000</td></tr>
	<tr><td>ENSG00000002822</td><td>MAD1L1  </td><td>7 </td><td>  1855429</td><td>  2272878</td><td>-1</td><td>ENSG00000002822.11</td><td> 21.015</td></tr>
	<tr><td>ENSG00000002834</td><td>LASP1   </td><td>17</td><td> 37026112</td><td> 37078023</td><td> 1</td><td>ENSG00000002834.13</td><td>136.945</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>ENSG00000272837</td><td>OR10AE3P   </td><td>12</td><td> 56039979</td><td> 56040447</td><td>-1</td><td>ENSG00000272837.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000272882</td><td>OR2BH1P    </td><td>11</td><td> 29008182</td><td> 29009045</td><td> 1</td><td>ENSG00000272882.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000272887</td><td>CSPG4P5    </td><td>15</td><td> 84956505</td><td> 84962703</td><td>-1</td><td>ENSG00000272887.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000272900</td><td>OR10Q2P    </td><td>11</td><td> 58059298</td><td> 58060237</td><td>-1</td><td>ENSG00000272900.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000272937</td><td>OR6U2P     </td><td>12</td><td> 56005407</td><td> 56006338</td><td> 1</td><td>ENSG00000272937.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000272963</td><td>OR7A19P    </td><td>12</td><td> 46986356</td><td> 46987088</td><td> 1</td><td>ENSG00000272963.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000272968</td><td>RBAK-RBAKDN</td><td>7 </td><td>  5023349</td><td>  5112852</td><td> 1</td><td>ENSG00000272968.1</td><td>0.725</td></tr>
	<tr><td>ENSG00000273015</td><td>LINC00938  </td><td>12</td><td> 46119510</td><td> 46121558</td><td>-1</td><td>ENSG00000273015.1</td><td>6.330</td></tr>
	<tr><td>ENSG00000273032</td><td>DGCR9      </td><td>22</td><td> 19005347</td><td> 19007761</td><td> 1</td><td>ENSG00000273032.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273048</td><td>MIR4720    </td><td>16</td><td> 81418623</td><td> 81418698</td><td> 1</td><td>ENSG00000273048.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273051</td><td>OR51F4P    </td><td>11</td><td>  4773276</td><td>  4774174</td><td>-1</td><td>ENSG00000273051.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273079</td><td>GRIN2B     </td><td>12</td><td> 13693165</td><td> 14133053</td><td>-1</td><td>ENSG00000273079.1</td><td>0.030</td></tr>
	<tr><td>ENSG00000273164</td><td>DGCR10     </td><td>22</td><td> 19010569</td><td> 19011063</td><td> 1</td><td>ENSG00000273164.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273228</td><td>OR5BQ1P    </td><td>11</td><td> 56796883</td><td> 56797197</td><td> 1</td><td>ENSG00000273228.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273234</td><td>OR2A13P    </td><td>7 </td><td>143839102</td><td>143840031</td><td> 1</td><td>ENSG00000273234.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273252</td><td>OR7E39P    </td><td>7 </td><td>  6875051</td><td>  6875425</td><td>-1</td><td>ENSG00000273252.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273255</td><td>OR5BP1P    </td><td>11</td><td> 56823062</td><td> 56823607</td><td> 1</td><td>ENSG00000273255.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273274</td><td>ZBTB8B     </td><td>1 </td><td> 32930670</td><td> 32962287</td><td> 1</td><td>ENSG00000273274.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273311</td><td>DGCR11     </td><td>22</td><td> 19033675</td><td> 19035888</td><td>-1</td><td>ENSG00000273311.1</td><td>0.055</td></tr>
	<tr><td>ENSG00000273313</td><td>RBAKDN     </td><td>7 </td><td>  5111756</td><td>  5112854</td><td> 1</td><td>ENSG00000273313.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273327</td><td>OR6L2P     </td><td>10</td><td>135243898</td><td>135244822</td><td>-1</td><td>ENSG00000273327.1</td><td>0.140</td></tr>
	<tr><td>ENSG00000273336</td><td>OR7M1P     </td><td>10</td><td>135294742</td><td>135295274</td><td> 1</td><td>ENSG00000273336.1</td><td>0.740</td></tr>
	<tr><td>ENSG00000273340</td><td>MICE       </td><td>6 </td><td> 29709508</td><td> 29716746</td><td>-1</td><td>ENSG00000273340.1</td><td>0.295</td></tr>
	<tr><td>ENSG00000273344</td><td>PAXIP1-AS1 </td><td>7 </td><td>154795158</td><td>154797413</td><td> 1</td><td>ENSG00000273344.1</td><td>4.770</td></tr>
	<tr><td>ENSG00000273377</td><td>OR2Q1P     </td><td>7 </td><td>143677998</td><td>143678913</td><td> 1</td><td>ENSG00000273377.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273408</td><td>OR5B15P    </td><td>11</td><td> 58155056</td><td> 58155959</td><td>-1</td><td>ENSG00000273408.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273423</td><td>OR13I1P    </td><td>9 </td><td>107392035</td><td>107393298</td><td> 1</td><td>ENSG00000273423.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273434</td><td>OR8S21P    </td><td>12</td><td> 48810933</td><td> 48811120</td><td>-1</td><td>ENSG00000273434.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273439</td><td>ZNF8       </td><td>19</td><td> 58790318</td><td> 58807254</td><td> 1</td><td>ENSG00000273439.1</td><td>0.375</td></tr>
	<tr><td>ENSG00000273484</td><td>OR6R2P     </td><td>8 </td><td> 21654972</td><td> 21655271</td><td> 1</td><td>ENSG00000273484.1</td><td>0.000</td></tr>
</tbody>
</table>




```R
# merge, sort columns, sort BED coordinates
HepG2_ENSG_TPM_avg12_noVersion_hasHGNC <- merge(Liver_ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC, HepG2_ENSG_TPM_avg12_noVersion, by.x = "ensembl_gene_id", by.y = "ENSG") %>% 
mutate(chromosome = paste0("chr", chromosome_name)) %>% 
dplyr::select(chromosome, start_position, end_position, TPM, strand, hgnc_symbol, ensembl_gene_id) %>% arrange(chromosome, start_position)

HepG2_ENSG_TPM_avg12_noVersion_hasHGNC
```


<table class="dataframe">
<caption>A data.frame: 33662 × 7</caption>
<thead>
	<tr><th scope=col>chromosome</th><th scope=col>start_position</th><th scope=col>end_position</th><th scope=col>TPM</th><th scope=col>strand</th><th scope=col>hgnc_symbol</th><th scope=col>ensembl_gene_id</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1</td><td> 11869</td><td> 14412</td><td> 0.000</td><td> 1</td><td>DDX11L1   </td><td>ENSG00000223972</td></tr>
	<tr><td>chr1</td><td> 14363</td><td> 29806</td><td> 6.370</td><td>-1</td><td>WASH7P    </td><td>ENSG00000227232</td></tr>
	<tr><td>chr1</td><td> 29554</td><td> 31109</td><td> 0.000</td><td> 1</td><td>MIR1302-11</td><td>ENSG00000243485</td></tr>
	<tr><td>chr1</td><td> 29554</td><td> 31109</td><td> 0.000</td><td> 1</td><td>MIR1302-10</td><td>ENSG00000243485</td></tr>
	<tr><td>chr1</td><td> 29554</td><td> 31109</td><td> 0.000</td><td> 1</td><td>MIR1302-9 </td><td>ENSG00000243485</td></tr>
	<tr><td>chr1</td><td> 29554</td><td> 31109</td><td> 0.000</td><td> 1</td><td>MIR1302-2 </td><td>ENSG00000243485</td></tr>
	<tr><td>chr1</td><td> 34554</td><td> 36081</td><td> 0.000</td><td>-1</td><td>FAM138A   </td><td>ENSG00000237613</td></tr>
	<tr><td>chr1</td><td> 52473</td><td> 54936</td><td> 0.000</td><td> 1</td><td>OR4G4P    </td><td>ENSG00000268020</td></tr>
	<tr><td>chr1</td><td> 62948</td><td> 63887</td><td> 0.000</td><td> 1</td><td>OR4G11P   </td><td>ENSG00000240361</td></tr>
	<tr><td>chr1</td><td> 69091</td><td> 70008</td><td> 0.000</td><td> 1</td><td>OR4F5     </td><td>ENSG00000186092</td></tr>
	<tr><td>chr1</td><td>131025</td><td>134836</td><td> 0.300</td><td> 1</td><td>CICP27    </td><td>ENSG00000233750</td></tr>
	<tr><td>chr1</td><td>157784</td><td>157887</td><td> 0.000</td><td>-1</td><td>RNU6-1100P</td><td>ENSG00000222623</td></tr>
	<tr><td>chr1</td><td>329431</td><td>332236</td><td> 0.000</td><td>-1</td><td>CICP7     </td><td>ENSG00000233653</td></tr>
	<tr><td>chr1</td><td>367640</td><td>368634</td><td> 0.010</td><td> 1</td><td>OR4F29    </td><td>ENSG00000235249</td></tr>
	<tr><td>chr1</td><td>379105</td><td>379467</td><td> 0.000</td><td>-1</td><td>WBP1LP7   </td><td>ENSG00000269732</td></tr>
	<tr><td>chr1</td><td>564442</td><td>564813</td><td>12.870</td><td> 1</td><td>MTND1P23  </td><td>ENSG00000225972</td></tr>
	<tr><td>chr1</td><td>565020</td><td>566063</td><td>75.700</td><td> 1</td><td>MTND2P28  </td><td>ENSG00000225630</td></tr>
	<tr><td>chr1</td><td>568915</td><td>569121</td><td> 0.825</td><td> 1</td><td>MTATP8P1  </td><td>ENSG00000240409</td></tr>
	<tr><td>chr1</td><td>569076</td><td>569756</td><td>11.235</td><td> 1</td><td>MTATP6P1  </td><td>ENSG00000248527</td></tr>
	<tr><td>chr1</td><td>610222</td><td>610645</td><td> 0.245</td><td> 1</td><td>WBP1LP6   </td><td>ENSG00000268663</td></tr>
	<tr><td>chr1</td><td>621059</td><td>622053</td><td> 0.010</td><td>-1</td><td>OR4F16    </td><td>ENSG00000185097</td></tr>
	<tr><td>chr1</td><td>657472</td><td>660283</td><td> 0.000</td><td> 1</td><td>CICP3     </td><td>ENSG00000229376</td></tr>
	<tr><td>chr1</td><td>693613</td><td>693716</td><td> 0.000</td><td>-1</td><td>RNU6-1199P</td><td>ENSG00000223181</td></tr>
	<tr><td>chr1</td><td>752751</td><td>755214</td><td> 0.030</td><td> 1</td><td>FAM87B    </td><td>ENSG00000177757</td></tr>
	<tr><td>chr1</td><td>761586</td><td>762902</td><td> 4.780</td><td>-1</td><td>LINC00115 </td><td>ENSG00000225880</td></tr>
	<tr><td>chr1</td><td>762988</td><td>794826</td><td>14.950</td><td> 1</td><td>LINC01128 </td><td>ENSG00000228794</td></tr>
	<tr><td>chr1</td><td>803451</td><td>812283</td><td> 0.305</td><td>-1</td><td>FAM41C    </td><td>ENSG00000230368</td></tr>
	<tr><td>chr1</td><td>808672</td><td>809729</td><td> 0.000</td><td> 1</td><td>TUBB8P11  </td><td>ENSG00000234711</td></tr>
	<tr><td>chr1</td><td>860260</td><td>879955</td><td> 0.025</td><td> 1</td><td>SAMD11    </td><td>ENSG00000187634</td></tr>
	<tr><td>chr1</td><td>879584</td><td>894689</td><td>70.250</td><td>-1</td><td>NOC2L     </td><td>ENSG00000188976</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>chrY</td><td>27876158</td><td>27881307</td><td>0.000</td><td>-1</td><td>USP9YP9   </td><td>ENSG00000232614</td></tr>
	<tr><td>chrY</td><td>27894743</td><td>27896353</td><td>0.000</td><td>-1</td><td>USP9YP19  </td><td>ENSG00000225326</td></tr>
	<tr><td>chrY</td><td>27898535</td><td>27899017</td><td>0.000</td><td> 1</td><td>XKRYP5    </td><td>ENSG00000223406</td></tr>
	<tr><td>chrY</td><td>27959160</td><td>27960713</td><td>0.000</td><td> 1</td><td>CDY22P    </td><td>ENSG00000229343</td></tr>
	<tr><td>chrY</td><td>28007090</td><td>28007415</td><td>0.000</td><td> 1</td><td>TCEB1P17  </td><td>ENSG00000232695</td></tr>
	<tr><td>chrY</td><td>28018078</td><td>28044800</td><td>0.000</td><td>-1</td><td>OFD1P18Y  </td><td>ENSG00000235511</td></tr>
	<tr><td>chrY</td><td>28050665</td><td>28053397</td><td>0.000</td><td> 1</td><td>TRAPPC2P4 </td><td>ENSG00000232914</td></tr>
	<tr><td>chrY</td><td>28064470</td><td>28065042</td><td>0.000</td><td>-1</td><td>RAB9AP3   </td><td>ENSG00000223655</td></tr>
	<tr><td>chrY</td><td>28069535</td><td>28075973</td><td>0.000</td><td> 1</td><td>USP9YP20  </td><td>ENSG00000230854</td></tr>
	<tr><td>chrY</td><td>28075126</td><td>28075289</td><td>0.000</td><td> 1</td><td>RNU1-40P  </td><td>ENSG00000252625</td></tr>
	<tr><td>chrY</td><td>28079980</td><td>28082028</td><td>0.000</td><td>-1</td><td>USP9YP21  </td><td>ENSG00000227635</td></tr>
	<tr><td>chrY</td><td>28089415</td><td>28100299</td><td>0.000</td><td> 1</td><td>XKRYP6    </td><td>ENSG00000237546</td></tr>
	<tr><td>chrY</td><td>28121660</td><td>28134216</td><td>0.000</td><td> 1</td><td>PRYP4     </td><td>ENSG00000172283</td></tr>
	<tr><td>chrY</td><td>28137388</td><td>28137719</td><td>0.000</td><td>-1</td><td>TCEB1P11  </td><td>ENSG00000227867</td></tr>
	<tr><td>chrY</td><td>28140831</td><td>28141844</td><td>0.000</td><td>-1</td><td>CDY23P    </td><td>ENSG00000231716</td></tr>
	<tr><td>chrY</td><td>28148401</td><td>28155003</td><td>0.000</td><td> 1</td><td>USP9YP26  </td><td>ENSG00000234744</td></tr>
	<tr><td>chrY</td><td>28157582</td><td>28158384</td><td>0.000</td><td> 1</td><td>HSFY8P    </td><td>ENSG00000233156</td></tr>
	<tr><td>chrY</td><td>28201926</td><td>28234640</td><td>0.000</td><td>-1</td><td>OFD1P15Y  </td><td>ENSG00000234888</td></tr>
	<tr><td>chrY</td><td>28269821</td><td>28279455</td><td>0.000</td><td> 1</td><td>RBMY2DP   </td><td>ENSG00000215507</td></tr>
	<tr><td>chrY</td><td>28344478</td><td>28354295</td><td>0.000</td><td>-1</td><td>REREP2Y   </td><td>ENSG00000235014</td></tr>
	<tr><td>chrY</td><td>28424070</td><td>28500565</td><td>0.000</td><td>-1</td><td>PPP1R12BP1</td><td>ENSG00000229238</td></tr>
	<tr><td>chrY</td><td>28507136</td><td>28507239</td><td>0.000</td><td> 1</td><td>RNU6-1314P</td><td>ENSG00000252948</td></tr>
	<tr><td>chrY</td><td>28546758</td><td>28547377</td><td>0.000</td><td> 1</td><td>CYCSP48   </td><td>ENSG00000233843</td></tr>
	<tr><td>chrY</td><td>28555962</td><td>28566682</td><td>0.000</td><td> 1</td><td>ANKRD36P1 </td><td>ENSG00000188399</td></tr>
	<tr><td>chrY</td><td>28654360</td><td>28725837</td><td>0.000</td><td> 1</td><td>TPTE2P4   </td><td>ENSG00000215506</td></tr>
	<tr><td>chrY</td><td>28695572</td><td>28695890</td><td>0.000</td><td> 1</td><td>CYCSP49   </td><td>ENSG00000224240</td></tr>
	<tr><td>chrY</td><td>28732789</td><td>28737748</td><td>0.000</td><td>-1</td><td>SLC25A15P1</td><td>ENSG00000227629</td></tr>
	<tr><td>chrY</td><td>28740998</td><td>28780799</td><td>0.055</td><td>-1</td><td>PARP4P1   </td><td>ENSG00000237917</td></tr>
	<tr><td>chrY</td><td>28772667</td><td>28773306</td><td>0.000</td><td>-1</td><td>FAM58CP   </td><td>ENSG00000231514</td></tr>
	<tr><td>chrY</td><td>59001391</td><td>59001635</td><td>0.000</td><td> 1</td><td>CTBP2P1   </td><td>ENSG00000235857</td></tr>
</tbody>
</table>




```R
write_tsv(HepG2_ENSG_TPM_avg12_noVersion_hasHGNC, "HepG2_ENSG_TPM_avg12_noVersion_hasHGNC.txt", col_names = TRUE)
```

#### Adjust BED coordinates for TSS based on strand


```R
HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_TSSstart <- HepG2_ENSG_TPM_avg12_noVersion_hasHGNC %>% mutate(TSS_start = case_when(
    (strand == "1") ~ start_position,
    (strand == "-1") ~ end_position
)) %>% arrange(chromosome, start_position)
head(HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_TSSstart, 3)
```


<table class="dataframe">
<caption>A data.frame: 3 × 8</caption>
<thead>
	<tr><th></th><th scope=col>chromosome</th><th scope=col>start_position</th><th scope=col>end_position</th><th scope=col>TPM</th><th scope=col>strand</th><th scope=col>hgnc_symbol</th><th scope=col>ensembl_gene_id</th><th scope=col>TSS_start</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>chr1</td><td>11869</td><td>14412</td><td>0.00</td><td> 1</td><td>DDX11L1   </td><td>ENSG00000223972</td><td>11869</td></tr>
	<tr><th scope=row>2</th><td>chr1</td><td>14363</td><td>29806</td><td>6.37</td><td>-1</td><td>WASH7P    </td><td>ENSG00000227232</td><td>29806</td></tr>
	<tr><th scope=row>3</th><td>chr1</td><td>29554</td><td>31109</td><td>0.00</td><td> 1</td><td>MIR1302-11</td><td>ENSG00000243485</td><td>29554</td></tr>
</tbody>
</table>




```R
HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_TSScoords <- HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_TSSstart %>% dplyr::mutate(TSS_end = (TSS_start + 1)) %>% dplyr::select(chromosome, TSS_start, TSS_end, TPM, strand, hgnc_symbol, ensembl_gene_id) %>% dplyr::arrange(chromosome, TSS_start)

nrow(HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_TSScoords)
head(HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_TSScoords, 3)

```


33662



<table class="dataframe">
<caption>A data.frame: 3 × 7</caption>
<thead>
	<tr><th></th><th scope=col>chromosome</th><th scope=col>TSS_start</th><th scope=col>TSS_end</th><th scope=col>TPM</th><th scope=col>strand</th><th scope=col>hgnc_symbol</th><th scope=col>ensembl_gene_id</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>chr1</td><td>11869</td><td>11870</td><td>0</td><td>1</td><td>DDX11L1   </td><td>ENSG00000223972</td></tr>
	<tr><th scope=row>2</th><td>chr1</td><td>29554</td><td>29555</td><td>0</td><td>1</td><td>MIR1302-11</td><td>ENSG00000243485</td></tr>
	<tr><th scope=row>3</th><td>chr1</td><td>29554</td><td>29555</td><td>0</td><td>1</td><td>MIR1302-10</td><td>ENSG00000243485</td></tr>
</tbody>
</table>



#### Filter for TPM


```R
HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0 <- HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_TSScoords %>% filter(TPM > 0)

write_tsv(HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0, "HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.withHeaders.txt", col_names = TRUE)
write_tsv(HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0, "HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.txt", col_names = FALSE)
```

# Get 2NN


```R
HOME_DIR=/data/hodges_lab/Tim/nnRNA_TPM_EHGM/
mkdir -p ${HOME_DIR}
REF_DIR=${HOME_DIR}reference_files/

# Directory 
mkdir -p ${HOME_DIR}intermediate_files
cd ${HOME_DIR}intermediate_files

INTER_DIR=${HOME_DIR}intermediate_files/
REF_DIR=${HOME_DIR}reference_files/
OUT_DIR=${HOME_DIR}output_files/

echo "Done liver."
```

    Done liver.



```R
# Bcell 
bedtools sort -i ${REF_DIR}HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.txt | awk 'BEGIN{OFS=FS="\t"}{print }' - > ${REF_DIR}HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.sorted.txt

echo "Done."
```

    Done.



```R
# Initalize HMR files 
Liver_CLUSTERED_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Liver_internalClusters_individualHMRs_cellspecific_hpl.txt
Liver_UNCLUSTERED_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Liver_unclustered_cellspecific_hpl.txt

awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,"Liver_ClusteredCS"}' ${Liver_CLUSTERED_CS_FILE} | bedtools sort -i - > ${INTER_DIR}Liver.clustered_cs.tmp_sorted.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,"Liver_UnclusteredCS"}' ${Liver_UNCLUSTERED_CS_FILE} | bedtools sort -i - > ${INTER_DIR}Liver.unclustered_cs.tmp_sorted.txt

echo "Done."
```

    Done.



```R
# Clusters contain cell specific 
```


```R
## How many clusters are represented by the individual clustered cell specific HMRs
bedtools intersect -u -a /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Liver_internalClusters_hpl.txt -b /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Liver_internalClusters_individualHMRs_cellspecific_hpl.txt > ${INTER_DIR}Liver_internalClusters_hpl.containsCellSpecificHMR.txt

wc -l ${INTER_DIR}Liver_internalClusters_hpl.containsCellSpecificHMR.txt

awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,"Bcell_ClusteredCS"}' ${INTER_DIR}Liver_internalClusters_hpl.containsCellSpecificHMR.txt | bedtools sort -i - > ${INTER_DIR}Liver_internalClusters_hpl.containsCellSpecificHMR.tmp_sorted.txt
```

    798 /data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Liver_internalClusters_hpl.containsCellSpecificHMR.txt



```R
# Clusters contain cell specific 
```


```R
bedtools closest -d -k 2 -a ${INTER_DIR}Liver_internalClusters_hpl.containsCellSpecificHMR.tmp_sorted.txt -b ${REF_DIR}HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.sorted.txt > ${INTER_DIR}Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt

echo "Done."
```

    Done.



```R
# bedtools closest -d -k 2 -a ${INTER_DIR}Bcell.clustered_cs.tmp_sorted.txt -b ${REF_DIR}GM_ENSGGENESYMBOL_minTPM0.sorted.txt > ${INTER_DIR}Bcell_clustered_cellspecific.2NN.GM_ENSGGENESYMBOL_minTPM0.txt

bedtools closest -d -k 2 -a ${INTER_DIR}Liver.unclustered_cs.tmp_sorted.txt -b ${REF_DIR}HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.sorted.txt > ${INTER_DIR}Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt

echo "Done."
```

    Done.



```R
wc -l ${INTER_DIR}Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt
wc -l ${INTER_DIR}Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt
```

    1604 /data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt
    10852 /data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt


# TAD Filter


```R
# Intersect 2NN file with TADs

# First, create an HMR-Gene end-to-end BED file:
#"ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist","HMRGroup"

# Check if HMR is before the TSS, else, TSS before  
awk 'BEGIN{OFS=FS="\t"}{if ($2<$6)
print $1,$2,$7,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
else print $1,$6,$3,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
}' ${INTER_DIR}Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt 

awk 'BEGIN{OFS=FS="\t"}{if ($2<$6)
print $1,$2,$7,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
else print $1,$6,$3,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
}' ${INTER_DIR}Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt

echo "Made continuous BED file."

```

    Made continuous BED file.



```R
bedtools intersect -f 1.0 -a ${INTER_DIR}Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt \
-b ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.txt > ${INTER_DIR}Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt

bedtools intersect -f 1.0 -a ${INTER_DIR}Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt  \
-b ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.txt > ${INTER_DIR}Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt

echo "Done."
```

    Done.



```R
wc -l ${INTER_DIR}Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt
wc -l ${INTER_DIR}Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt
```

    1604 /data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt
    644 /data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt


# Remove gene reps 


```R
library(tidyverse)
library(ggplot2)
library(ggpubr)

#Set working directory 
setwd("/data/hodges_lab/Tim/nnRNA_TPM_EHGM/output_files/")

print("Loaded libraries.")
```

    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.1 ──
    
    [32m✔[39m [34mggplot2[39m 3.3.6     [32m✔[39m [34mpurrr  [39m 1.0.1
    [32m✔[39m [34mtibble [39m 3.2.1     [32m✔[39m [34mdplyr  [39m 1.1.1
    [32m✔[39m [34mtidyr  [39m 1.3.0     [32m✔[39m [34mstringr[39m 1.5.0
    [32m✔[39m [34mreadr  [39m 2.1.2     [32m✔[39m [34mforcats[39m 0.5.1
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    


    [1] "Loaded libraries."



```R
Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered <- read_tsv("../intermediate_files/Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRTSS","StartHMRTSS","EndHMRTSS","ChrHMR","StartHMR","EndHMR","HMRGroup","ChrTSS","StartTSS","EndTSS","TPM","strand","GENE_SYMBOL","ENSEMBL","HMRTSSDist")) 


Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered <- read_tsv("../intermediate_files/Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRTSS","StartHMRTSS","EndHMRTSS","ChrHMR","StartHMR","EndHMR","HMRGroup","ChrTSS","StartTSS","EndTSS","TPM","strand","GENE_SYMBOL","ENSEMBL","HMRTSSDist"))
```

    [1mRows: [22m[34m644[39m [1mColumns: [22m[34m15[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (6): X1, X4, X7, X8, X13, X14
    [32mdbl[39m (9): X2, X3, X5, X6, X9, X10, X11, X12, X15
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m4674[39m [1mColumns: [22m[34m15[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (6): X1, X4, X7, X8, X13, X14
    [32mdbl[39m (9): X2, X3, X5, X6, X9, X10, X11, X12, X15
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


Remove rep call 


```R
Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM <- Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% dplyr::select(ENSEMBL, TPM, HMRTSSDist) %>% dplyr::distinct(ENSEMBL, TPM, .keep_all = TRUE) %>% mutate(HMRGroup = "Liver_clustersContainsCS") %>% arrange(ENSEMBL)

Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM <- Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% dplyr::select(ENSEMBL, TPM, HMRTSSDist) %>% dplyr::distinct(ENSEMBL, TPM, .keep_all = TRUE) %>% mutate(HMRGroup = "Liver_unclustered") %>% arrange(ENSEMBL)

nrow(Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM)
head(Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM, 3)
nrow(Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM)
head(Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM, 3)
```


525



<table class="dataframe">
<caption>A tibble: 3 × 4</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th><th scope=col>HMRTSSDist</th><th scope=col>HMRGroup</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000003436</td><td>1298.520</td><td>14735</td><td>Liver_clustersContainsCS</td></tr>
	<tr><td>ENSG00000003987</td><td>   0.700</td><td>74761</td><td>Liver_clustersContainsCS</td></tr>
	<tr><td>ENSG00000006704</td><td>   6.915</td><td>47505</td><td>Liver_clustersContainsCS</td></tr>
</tbody>
</table>




2864



<table class="dataframe">
<caption>A tibble: 3 × 4</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th><th scope=col>HMRTSSDist</th><th scope=col>HMRGroup</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000971</td><td> 0.500</td><td>507691</td><td>Liver_unclustered</td></tr>
	<tr><td>ENSG00000003147</td><td> 0.065</td><td> 49648</td><td>Liver_unclustered</td></tr>
	<tr><td>ENSG00000003393</td><td>18.905</td><td> 22176</td><td>Liver_unclustered</td></tr>
</tbody>
</table>



# STATS


```R
wilcox.test(Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM$TPM, Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM$TPM)
```


    
    	Wilcoxon rank sum test with continuity correction
    
    data:  Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM$TPM and Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM$TPM
    W = 803966, p-value = 0.01137
    alternative hypothesis: true location shift is not equal to 0




```R
Liver_clustersContainsCS_Unclustered.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin %>% 
  group_by(HMRGroup) %>% 
  summarise(n = n())

Liver_clustersContainsCS_Unclustered.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin %>% 
  group_by(HMRGroup, distBin) %>% 
  summarise(n = n())

```


    Error in group_by(., HMRGroup): object 'Liver_clustersContainsCS_Unclustered.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin' not found
    Traceback:


    1. Liver_clustersContainsCS_Unclustered.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin %>% 
     .     group_by(HMRGroup) %>% summarise(n = n())

    2. summarise(., n = n())

    3. group_by(., HMRGroup)


# Plot


```R
Liver_clustersContainsCS_Unclustered.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM <- 
rbind(Liver_clusters_containsCS.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM, Liver_unclustered_cellspecific.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM)
```


```R
Liver_clustersContainsCS_Unclustered.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin <- Liver_clustersContainsCS_Unclustered.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM %>% 
  mutate(distBin = case_when(
    HMRTSSDist < 10000 ~ "0-10",
    HMRTSSDist >= 10000 & HMRTSSDist < 20000 ~ "10-20",
    HMRTSSDist >= 20000 & HMRTSSDist < 30000 ~ "20-30",
    HMRTSSDist >= 30000 & HMRTSSDist < 40000 ~ "30-40",
    HMRTSSDist >= 40000 & HMRTSSDist < 50000 ~ "40-50",
    HMRTSSDist >= 50000 & HMRTSSDist < 100000 ~ "50-100",
    HMRTSSDist >= 100000 ~ ">100"
  ))

print("Done.")
```

    [1] "Done."



```R
Liver_clustersContainsCS_Unclustered.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin$distBin <- factor(Liver_clustersContainsCS_Unclustered.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin$distBin, levels = c("0-10", "10-20", "20-30", "30-40", "40-50", "50-100", ">100"))

print("Done.")
```

    [1] "Done."



```R
pdf("Liver.2NN.TAD.UniqueGenes.ALL.pdf")

pall <- ggplot(Liver_clustersContainsCS_Unclustered.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin, aes(x=HMRGroup, y=log10(TPM))) +
  geom_boxplot(aes(fill=HMRGroup)) +
  theme_classic() +
  ggtitle("ENSGnoVersion_withGENESYMBOL - Liver - All") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(TPM)") +
  stat_compare_means(aes(group=HMRGroup), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)
pall

dev.off()
pall
```


![png](output_51_0.png)



```R
pdf("Liver.2NN.TAD.UniqueGenes.BINNED.pdf")

pbin <- ggplot(Liver_clustersContainsCS_Unclustered.2NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=HMRGroup), width = .5, position=position_dodge(.75)) +
  theme_classic() +
  ggtitle("ENSGnoVersion_withGENESYMBOL - Liver - Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(TPM)") +
  stat_compare_means(aes(group=HMRGroup), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25,
                    size = 2.5) +
  theme(aspect.ratio = .6)
pbin

dev.off()
pbin
```


![png](output_52_0.png)


# Plot fraction HMRs - 1 NN

## Find 100NN


```R
HOME_DIR=/data/hodges_lab/Tim/nnRNA_TPM_EHGM/
mkdir -p ${HOME_DIR}
REF_DIR=${HOME_DIR}reference_files/

# Directory 
mkdir -p ${HOME_DIR}intermediate_files
cd ${HOME_DIR}intermediate_files

INTER_DIR=${HOME_DIR}intermediate_files/
REF_DIR=${HOME_DIR}reference_files/
OUT_DIR=${HOME_DIR}output_files/

echo "Done."
```

    Done.



```R
bedtools closest -d -k 100 -a ${INTER_DIR}Liver_internalClusters_hpl.containsCellSpecificHMR.tmp_sorted.txt -b ${REF_DIR}HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.sorted.txt > ${INTER_DIR}Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt

echo "Done."
```

    Done.



```R
bedtools closest -d -k 100 -a ${INTER_DIR}Liver.unclustered_cs.tmp_sorted.txt -b ${REF_DIR}HepG2_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.sorted.txt > ${INTER_DIR}Liver_unclustered_cellspecific.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt

echo "Done."
```

    Done.


## TAD Filter


```R
# Intersect 2NN file with TADs

# First, create an HMR-Gene end-to-end BED file:
#"ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist","HMRGroup"

# Check if HMR is before the TSS, else, TSS before  
awk 'BEGIN{OFS=FS="\t"}{if ($2<$6)
print $1,$2,$7,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
else print $1,$6,$3,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
}' ${INTER_DIR}Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt 

awk 'BEGIN{OFS=FS="\t"}{if ($2<$6)
print $1,$2,$7,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
else print $1,$6,$3,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
}' ${INTER_DIR}Liver_unclustered_cellspecific.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Liver_unclustered_cellspecific.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt

echo "Made continuous BED file."

```

    Made continuous BED file.



```R
bedtools intersect -f 1.0 -a ${INTER_DIR}Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt \
-b ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.txt > ${INTER_DIR}Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt

bedtools intersect -f 1.0 -a ${INTER_DIR}Liver_unclustered_cellspecific.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt  \
-b ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.txt > ${INTER_DIR}Liver_unclustered_cellspecific.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt

echo "Done."
```

    Done.


## Filter down to 1NN per HMR


```R
library(tidyverse)
library(ggplot2)
library(ggpubr)

#Set working directory 
setwd("/data/hodges_lab/Tim/nnRNA_TPM_EHGM/output_files/")

print("Loaded libraries.")
```

    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.1 ──
    
    [32m✔[39m [34mggplot2[39m 3.3.6     [32m✔[39m [34mpurrr  [39m 1.0.1
    [32m✔[39m [34mtibble [39m 3.2.1     [32m✔[39m [34mdplyr  [39m 1.1.1
    [32m✔[39m [34mtidyr  [39m 1.3.0     [32m✔[39m [34mstringr[39m 1.5.0
    [32m✔[39m [34mreadr  [39m 2.1.2     [32m✔[39m [34mforcats[39m 0.5.1
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    


    [1] "Loaded libraries."



```R
Liver_clusters_containsCS <- read_tsv("/data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Liver_internalClusters_hpl.containsCellSpecificHMR.txt", col_names = c("chr","start","end","numHMRs"))

Liver_unclustered_CS <- 
read_tsv("/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Liver_unclustered_cellspecific_hpl.txt",  col_names = c("chr","start","end"))
```

    [1mRows: [22m[34m798[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, numHMRs
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m5424[39m [1mColumns: [22m[34m3[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (2): start, end
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



```R
Liver_clusters_containsCS %>% filter(chr!="chrY") %>% nrow()
```


787



```R
Liver_unclustered_CS %>% filter(chr!="chrY") %>% nrow()
```


5347



```R
Liver_clusters_containsCS %>% nrow()
Liver_unclustered_CS %>% nrow()
```


798



5424



```R
Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered <- read_tsv("../intermediate_files/Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRTSS","StartHMRTSS","EndHMRTSS","ChrHMR","StartHMR","EndHMR","HMRGroup","ChrTSS","StartTSS","EndTSS","TPM","strand","GENE_SYMBOL","ENSEMBL","HMRTSSDist")) 


Liver_unclustered_cellspecific.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered <- read_tsv("../intermediate_files/Liver_unclustered_cellspecific.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRTSS","StartHMRTSS","EndHMRTSS","ChrHMR","StartHMR","EndHMR","HMRGroup","ChrTSS","StartTSS","EndTSS","TPM","strand","GENE_SYMBOL","ENSEMBL","HMRTSSDist"))
```

    [1mRows: [22m[34m4236[39m [1mColumns: [22m[34m15[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (6): X1, X4, X7, X8, X13, X14
    [32mdbl[39m (9): X2, X3, X5, X6, X9, X10, X11, X12, X15
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m18349[39m [1mColumns: [22m[34m15[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (6): X1, X4, X7, X8, X13, X14
    [32mdbl[39m (9): X2, X3, X5, X6, X9, X10, X11, X12, X15
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



```R
Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% nrow()
```


4236



```R
Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% group_by(ChrHMR, StartHMR) %>% top_n(n = 1, wt = -HMRTSSDist) %>% nrow()
```


381



```R
Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.1NN <-Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% group_by(ChrHMR, StartHMR) %>% top_n(n = 1, wt = -HMRTSSDist)

Liver_unclustered_cellspecific.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.1NN <-Liver_unclustered_cellspecific.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% group_by(ChrHMR, StartHMR) %>% top_n(n = 1, wt = -HMRTSSDist)
```


```R

```

## Calculate fractions


```R
threshold_list <- c(10000,25000,50000,75000,100000,150000)

numGene_CLcontainsCS_1NN <- tibble(
    thresholds = threshold_list,
    HMRGroup = "Liver_clustersContainsCS"
)

numGene_UNCS_1NN <- tibble(
    thresholds = threshold_list,
    HMRGroup = "Liver_unclustered"
)


get_numGenes_per_threshold <- function(thresh, df){
    df %>% filter(HMRTSSDist < thresh) %>% nrow()
}
                                                    
print("Initialized.")
```

    [1] "Initialized."



```R
# Get numbers by threshold

# CLusters that contain Cell Specific 
CLcontainsCS_counts <- map(threshold_list, get_numGenes_per_threshold, df = Liver_clusters_containsCS.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.1NN)

numGene_CLcontainsCS_1NN$HMRCounts <- unlist(CLcontainsCS_counts)



# UNclustered Cell specific 
UNCS_counts <- map(threshold_list, get_numGenes_per_threshold, df = Liver_unclustered_cellspecific.100NN.HepG2_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.1NN)

numGene_UNCS_1NN$HMRCounts <- unlist(UNCS_counts)

print("Done.")
```

    [1] "Done."



```R
# Calc fraction
numGene_CLcontainsCS_1NN_fraction <- numGene_CLcontainsCS_1NN %>% mutate(fraction = (HMRCounts/798) )
numGene_UNCS_1NN_fraction <- numGene_UNCS_1NN %>% mutate(fraction = (HMRCounts/5424) )

numGene_CLcontainsCS_UNCS_1NN_fraction <- rbind(numGene_CLcontainsCS_1NN_fraction, numGene_UNCS_1NN_fraction)

print("Done.")
```

    [1] "Done."


## Plot


```R
p_numGene_1NN <- numGene_CLcontainsCS_UNCS_1NN_fraction %>%
ggplot(aes(x = thresholds, y = fraction)) +
geom_point(aes(color = HMRGroup)) + 
geom_line(aes(color = HMRGroup)) +
theme_minimal() +
scale_color_manual(values=c("#B0DAB6", "#3990C0")) +
theme(aspect.ratio = .7, legend.position = "top") +
scale_x_continuous(breaks=threshold_list) +
ylab("Fraction HMRs with Gene Assignment")
p_numGene_1NN
```


![png](output_77_0.png)



```R
## Fraction of fractions
```


```R
numGene_CLcontainsCS_UNCS_1NN_fractionRatio <- merge(numGene_CLcontainsCS_1NN_fraction, numGene_UNCS_1NN_fraction, by = "thresholds") %>% mutate(fractionRatio = (fraction.x/fraction.y))
```


```R
p_numGeneFraction_1NN <- numGene_CLcontainsCS_UNCS_1NN_fractionRatio %>% 
ggplot(aes(x = thresholds, y = fractionRatio)) +
geom_point() + 
geom_line() +
geom_hline(yintercept = 1, color = "red") + 
coord_cartesian(ylim = c(1,4.5)) +
theme_minimal() +
scale_x_continuous(breaks=threshold_list) + 
theme(aspect.ratio = .25) +
ylab("FractionCL/FractionUN")

p_numGeneFraction_1NN
```


![png](output_80_0.png)



```R
ggpubr::ggarrange(p_numGene_1NN, p_numGeneFraction_1NN, nrow = 2, align = "v", heights = c(4, 1.539))
```


![png](output_81_0.png)


## Stats for fractions


```R
head(numGene_CLcontainsCS_UNCS_1NN_fractionRatio, 3)
```


<table class="dataframe">
<caption>A data.frame: 3 × 8</caption>
<thead>
	<tr><th></th><th scope=col>thresholds</th><th scope=col>HMRGroup.x</th><th scope=col>HMRCounts.x</th><th scope=col>fraction.x</th><th scope=col>HMRGroup.y</th><th scope=col>HMRCounts.y</th><th scope=col>fraction.y</th><th scope=col>fractionRatio</th></tr>
	<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>10000</td><td>Liver_clustersContainsCS</td><td> 95</td><td>0.1207116</td><td>Liver_unclustered</td><td> 175</td><td>0.03272863</td><td>3.688256</td></tr>
	<tr><th scope=row>2</th><td>25000</td><td>Liver_clustersContainsCS</td><td>158</td><td>0.2007624</td><td>Liver_unclustered</td><td> 564</td><td>0.10547971</td><td>1.903327</td></tr>
	<tr><th scope=row>3</th><td>50000</td><td>Liver_clustersContainsCS</td><td>219</td><td>0.2782719</td><td>Liver_unclustered</td><td>1027</td><td>0.19207032</td><td>1.448802</td></tr>
</tbody>
</table>




```R
numGene_CLcontainsCS_UNCS_1NN_fractionRatio_pvals <- numGene_CLcontainsCS_UNCS_1NN_fractionRatio %>% rowwise() %>% mutate(
    propTestP = prop.test(x = c(HMRCounts.x, HMRCounts.y), n = c(787, 5347))$p.value,
    propTestStat = prop.test(x = c(HMRCounts.x, HMRCounts.y), n = c(787, 5347))$statistic,
)
numGene_CLcontainsCS_UNCS_1NN_fractionRatio_pvals
```


<table class="dataframe">
<caption>A rowwise_df: 6 × 10</caption>
<thead>
	<tr><th scope=col>thresholds</th><th scope=col>HMRGroup.x</th><th scope=col>HMRCounts.x</th><th scope=col>fraction.x</th><th scope=col>HMRGroup.y</th><th scope=col>HMRCounts.y</th><th scope=col>fraction.y</th><th scope=col>fractionRatio</th><th scope=col>propTestP</th><th scope=col>propTestStat</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 10000</td><td>Liver_clustersContainsCS</td><td> 95</td><td>0.1190476</td><td>Liver_unclustered</td><td> 175</td><td>0.03226401</td><td>3.689796</td><td>7.929029e-29</td><td>124.120240</td></tr>
	<tr><td> 25000</td><td>Liver_clustersContainsCS</td><td>158</td><td>0.1979950</td><td>Liver_unclustered</td><td> 564</td><td>0.10398230</td><td>1.904122</td><td>1.529509e-14</td><td> 59.059818</td></tr>
	<tr><td> 50000</td><td>Liver_clustersContainsCS</td><td>219</td><td>0.2744361</td><td>Liver_unclustered</td><td>1027</td><td>0.18934366</td><td>1.449407</td><td>2.630727e-08</td><td> 30.962424</td></tr>
	<tr><td> 75000</td><td>Liver_clustersContainsCS</td><td>248</td><td>0.3107769</td><td>Liver_unclustered</td><td>1340</td><td>0.24705015</td><td>1.257951</td><td>1.367070e-04</td><td> 14.546988</td></tr>
	<tr><td>100000</td><td>Liver_clustersContainsCS</td><td>272</td><td>0.3408521</td><td>Liver_unclustered</td><td>1558</td><td>0.28724189</td><td>1.186638</td><td>2.189586e-03</td><td>  9.383404</td></tr>
	<tr><td>150000</td><td>Liver_clustersContainsCS</td><td>309</td><td>0.3872180</td><td>Liver_unclustered</td><td>1834</td><td>0.33812684</td><td>1.145186</td><td>7.216246e-03</td><td>  7.218339</td></tr>
</tbody>
</table>




```R
p_numGene_1NN_stats <- p_numGene_1NN +
geom_text(data = numGene_CLcontainsCS_UNCS_1NN_fractionRatio_pvals, aes(x = thresholds+1000, y = .5, label = format(propTestP, digits=3)))
p_numGene_1NN_stats
```


![png](output_85_0.png)


## Plot w/ stats


```R
pdf("Liver.TAD.1NN.UniqueGenes.ProportionOfHMRsbyDistance.pdf")

p_numGene_1NN_stats <- numGene_CLcontainsCS_UNCS_1NN_fraction %>%
ggplot(aes(x = thresholds, y = fraction)) +
geom_point(aes(color = HMRGroup), size = 5) + 
geom_line(aes(color = HMRGroup), size = 2) +
theme_bw() +
scale_color_manual(values=c("#B0DAB6", "#3990C0")) +
theme(aspect.ratio = .7, legend.position = "top") +
scale_x_continuous(breaks=threshold_list) +
ylab("Fraction HMRs with Gene Assignment") +
geom_text(data = numGene_CLcontainsCS_UNCS_1NN_fractionRatio_pvals, aes(x = thresholds+1000, y = .5, label = format(propTestP, digits=3)))
p_numGene_1NN_stats

dev.off()
p_numGene_1NN_stats
```


<strong>png:</strong> 2



![png](output_87_1.png)



```R
p_numGene_1NN_stats <- p_numGene_1NN +
geom_text(data = numGene_CLcontainsCS_UNCS_1NN_fractionRatio_pvals, aes(x = thresholds+1000, y = .5, label = format(propTestP, digits=3)))
p_numGene_1NN_stats
```


![png](output_88_0.png)



```R

```


```R
ggpubr::ggarrange(p_numGene_1NN_stats, p_numGeneFraction_1NN, nrow = 2, align = "v", heights = c(4, 1.539))
```


![png](output_90_0.png)

