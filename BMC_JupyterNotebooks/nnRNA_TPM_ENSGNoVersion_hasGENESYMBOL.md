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


## GM 

### Average reps


```R
# Read in 
GM_ENSG_file_in_1 <- read_tsv("./ENCFF873VWU.tsv", col_names=TRUE, skip=0)
GM_ENSG_file_in_2 <- read_tsv("./ENCFF345SHY.tsv", col_names=TRUE, skip=0) 
```

    [1mRows: [22m[34m59526[39m [1mColumns: [22m[34m17[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m  (2): gene_id, transcript_id(s)
    [32mdbl[39m (15): length, effective_length, expected_count, TPM, FPKM, posterior_mea...
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m59526[39m [1mColumns: [22m[34m17[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m  (2): gene_id, transcript_id(s)
    [32mdbl[39m (15): length, effective_length, expected_count, TPM, FPKM, posterior_mea...
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



```R
# Filter to keep just ENSG rows
GM_ENSG_only_1 <- GM_ENSG_file_in_1 %>%
    filter("ENSG"==substr(gene_id, 1, 4))
GM_ENSG_only_2 <- GM_ENSG_file_in_2 %>%
    filter("ENSG"==substr(gene_id, 1, 4))

# Isolate columns we want 
GM_ENSG_TPM_1 <- GM_ENSG_only_1 %>%
    dplyr::select(gene_id, TPM) %>% # isolate gene_id_clean and TPM columns
    magrittr::set_colnames(c("ENSEMBL", "TPM")) # Rename these for easier merging and readibility 
GM_ENSG_TPM_2 <- GM_ENSG_only_2 %>%
    dplyr::select(gene_id, TPM) %>% # isolate gene_id_clean and TPM columns
    magrittr::set_colnames(c("ENSEMBL", "TPM")) # Rename these for easier merging and readibility 


# Average reps
GM_ENSG_TPM_merge12 <- merge(GM_ENSG_TPM_1, GM_ENSG_TPM_2, by = "ENSEMBL") %>% as_tibble()

GM_ENSG_TPM_avg12 <- GM_ENSG_TPM_merge12 %>% dplyr::mutate(TPM = rowMeans(dplyr::select(., TPM.x:TPM.y))) %>% dplyr::select(ENSEMBL, TPM)
```


```R
write_tsv(GM_ENSG_TPM_avg12, "GM_ENSG_TPM_avg12.txt", col_names = TRUE)
```

### Biomart


```R
# define biomart object
# mart <- useMart(biomart = "ensembl", dataset = "hsapiens_gene_ensembl")
mart <- useMart(biomart="ENSEMBL_MART_ENSEMBL", host="grch37.ensembl.org", path="/biomart/martservice", dataset="hsapiens_gene_ensembl")

ENSEMBL_to_GENESYMBOL <- getBM(attributes=c("ensembl_gene_id_version", "hgnc_symbol", "chromosome_name", "start_position", "end_position","strand"), filters = "ensembl_gene_id_version", values = GM_ENSG_TPM_avg12$ENSEMBL, mart= mart)
```

    Warning message:
    “Ensembl will soon enforce the use of https.
    Ensure the 'host' argument includes "https://"”


### Convert ENSEMBL to GENE SYMBOL


```R
nrow(GM_ENSG_TPM_avg12)
head(GM_ENSG_TPM_avg12, 3)
```


58780



<table class="dataframe">
<caption>A tibble: 3 × 2</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003.14</td><td> 0.090</td></tr>
	<tr><td>ENSG00000000005.5 </td><td> 0.000</td></tr>
	<tr><td>ENSG00000000419.12</td><td>19.935</td></tr>
</tbody>
</table>




```R
GM_ENSG_TPM_avg12_noVersion <- GM_ENSG_TPM_avg12 %>% mutate(ENSG = gsub("\\..*", "", ENSEMBL))
```


```R
ENSEMBLnoVersion_to_GENESYMBOL <- getBM(attributes=c("ensembl_gene_id", "hgnc_symbol", "chromosome_name", "start_position", "end_position","strand"), filters = "ensembl_gene_id", values = GM_ENSG_TPM_avg12_noVersion$ENSG, mart= mart)

nrow(ENSEMBLnoVersion_to_GENESYMBOL)
ENSEMBLnoVersion_to_GENESYMBOL
```


52592



<table class="dataframe">
<caption>A data.frame: 52592 × 6</caption>
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
	<tr><td>ENSG00000273437</td><td>      </td><td>3 </td><td>128882449</td><td>128882783</td><td>-1</td></tr>
	<tr><td>ENSG00000273442</td><td>      </td><td>22</td><td> 17561591</td><td> 17562346</td><td> 1</td></tr>
	<tr><td>ENSG00000273443</td><td>      </td><td>1 </td><td>   997588</td><td>   998668</td><td>-1</td></tr>
	<tr><td>ENSG00000273444</td><td>      </td><td>7 </td><td> 40146887</td><td> 40147053</td><td> 1</td></tr>
	<tr><td>ENSG00000273445</td><td>      </td><td>2 </td><td> 87777014</td><td> 87777553</td><td>-1</td></tr>
	<tr><td>ENSG00000273447</td><td>      </td><td>4 </td><td>110613160</td><td>110613859</td><td> 1</td></tr>
	<tr><td>ENSG00000273448</td><td>      </td><td>7 </td><td> 66798034</td><td> 66799370</td><td> 1</td></tr>
	<tr><td>ENSG00000273449</td><td>      </td><td>4 </td><td>164450923</td><td>164451849</td><td> 1</td></tr>
	<tr><td>ENSG00000273450</td><td>      </td><td>10</td><td> 96074664</td><td> 96075084</td><td>-1</td></tr>
	<tr><td>ENSG00000273451</td><td>      </td><td>20</td><td> 45976881</td><td> 45977886</td><td>-1</td></tr>
	<tr><td>ENSG00000273454</td><td>      </td><td>3 </td><td>122996200</td><td>122996751</td><td> 1</td></tr>
	<tr><td>ENSG00000273455</td><td>      </td><td>3 </td><td>135806317</td><td>135806755</td><td>-1</td></tr>
	<tr><td>ENSG00000273456</td><td>      </td><td>2 </td><td>203239655</td><td>203240327</td><td>-1</td></tr>
	<tr><td>ENSG00000273461</td><td>      </td><td>3 </td><td> 72110212</td><td> 72119084</td><td> 1</td></tr>
	<tr><td>ENSG00000273464</td><td>      </td><td>21</td><td> 31029726</td><td> 31030151</td><td> 1</td></tr>
	<tr><td>ENSG00000273466</td><td>      </td><td>2 </td><td>219497979</td><td>219498737</td><td>-1</td></tr>
	<tr><td>ENSG00000273471</td><td>      </td><td>2 </td><td>111143988</td><td>111191250</td><td>-1</td></tr>
	<tr><td>ENSG00000273472</td><td>      </td><td>4 </td><td>141677682</td><td>141679075</td><td> 1</td></tr>
	<tr><td>ENSG00000273473</td><td>      </td><td>9 </td><td>137033891</td><td>137034462</td><td> 1</td></tr>
	<tr><td>ENSG00000273474</td><td>      </td><td>10</td><td> 13717646</td><td> 13717990</td><td> 1</td></tr>
	<tr><td>ENSG00000273476</td><td>      </td><td>10</td><td>102727445</td><td>102727892</td><td> 1</td></tr>
	<tr><td>ENSG00000273481</td><td>      </td><td>1 </td><td>151300425</td><td>151300905</td><td> 1</td></tr>
	<tr><td>ENSG00000273483</td><td>      </td><td>1 </td><td>113060421</td><td>113061063</td><td>-1</td></tr>
	<tr><td>ENSG00000273484</td><td>OR6R2P</td><td>8 </td><td> 21654972</td><td> 21655271</td><td> 1</td></tr>
	<tr><td>ENSG00000273485</td><td>      </td><td>10</td><td>105209953</td><td>105210609</td><td> 1</td></tr>
	<tr><td>ENSG00000273486</td><td>      </td><td>3 </td><td>136556180</td><td>136557863</td><td>-1</td></tr>
	<tr><td>ENSG00000273487</td><td>      </td><td>1 </td><td> 92654794</td><td> 92656264</td><td> 1</td></tr>
	<tr><td>ENSG00000273489</td><td>      </td><td>7 </td><td>131178723</td><td>131182453</td><td>-1</td></tr>
	<tr><td>ENSG00000273492</td><td>      </td><td>21</td><td> 27543189</td><td> 27589700</td><td> 1</td></tr>
	<tr><td>ENSG00000273493</td><td>      </td><td>3 </td><td> 58315692</td><td> 58315845</td><td> 1</td></tr>
</tbody>
</table>




```R
ENSEMBLnoVersion_to_GENESYMBOL
```


```R
ENSEMBLnoVersion_to_GENESYMBOL_emptyHGNC <- ENSEMBLnoVersion_to_GENESYMBOL %>% filter(hgnc_symbol=="")
ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC <- ENSEMBLnoVersion_to_GENESYMBOL %>% filter(hgnc_symbol!="")

nrow(ENSEMBLnoVersion_to_GENESYMBOL)
nrow(ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC)
nrow(ENSEMBLnoVersion_to_GENESYMBOL_emptyHGNC)

write_tsv(ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC, "ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC.txt")
write_tsv(ENSEMBLnoVersion_to_GENESYMBOL_emptyHGNC, "ENSEMBLnoVersion_to_GENESYMBOL_emptyHGNC.txt")
```


52592



32415



20177



```R
nrow(GM_ENSG_TPM_avg12_noVersion)
```


    Error in nrow(GM_ENSG_TPM_avg12_noVersion): object 'GM_ENSG_TPM_avg12_noVersion' not found
    Traceback:


    1. nrow(GM_ENSG_TPM_avg12_noVersion)



```R
ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC
```


<table class="dataframe">
<caption>A data.frame: 32415 × 6</caption>
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
	<tr><td>ENSG00000272767</td><td>JMJD1C-AS1 </td><td>10          </td><td> 65224989</td><td> 65226323</td><td> 1</td></tr>
	<tr><td>ENSG00000272837</td><td>OR10AE3P   </td><td>12          </td><td> 56039979</td><td> 56040447</td><td>-1</td></tr>
	<tr><td>ENSG00000272882</td><td>OR2BH1P    </td><td>11          </td><td> 29008182</td><td> 29009045</td><td> 1</td></tr>
	<tr><td>ENSG00000272887</td><td>CSPG4P5    </td><td>15          </td><td> 84956505</td><td> 84962703</td><td>-1</td></tr>
	<tr><td>ENSG00000272900</td><td>OR10Q2P    </td><td>11          </td><td> 58059298</td><td> 58060237</td><td>-1</td></tr>
	<tr><td>ENSG00000272937</td><td>OR6U2P     </td><td>12          </td><td> 56005407</td><td> 56006338</td><td> 1</td></tr>
	<tr><td>ENSG00000272963</td><td>OR7A19P    </td><td>12          </td><td> 46986356</td><td> 46987088</td><td> 1</td></tr>
	<tr><td>ENSG00000272968</td><td>RBAK-RBAKDN</td><td>7           </td><td>  5023349</td><td>  5112852</td><td> 1</td></tr>
	<tr><td>ENSG00000273015</td><td>LINC00938  </td><td>12          </td><td> 46119510</td><td> 46121558</td><td>-1</td></tr>
	<tr><td>ENSG00000273032</td><td>DGCR9      </td><td>22          </td><td> 19005347</td><td> 19007761</td><td> 1</td></tr>
	<tr><td>ENSG00000273041</td><td>ATF4P2     </td><td>HG1497_PATCH</td><td>153749394</td><td>153750466</td><td> 1</td></tr>
	<tr><td>ENSG00000273051</td><td>OR51F4P    </td><td>11          </td><td>  4773276</td><td>  4774174</td><td>-1</td></tr>
	<tr><td>ENSG00000273079</td><td>GRIN2B     </td><td>12          </td><td> 13693165</td><td> 14133053</td><td>-1</td></tr>
	<tr><td>ENSG00000273164</td><td>DGCR10     </td><td>22          </td><td> 19010569</td><td> 19011063</td><td> 1</td></tr>
	<tr><td>ENSG00000273228</td><td>OR5BQ1P    </td><td>11          </td><td> 56796883</td><td> 56797197</td><td> 1</td></tr>
	<tr><td>ENSG00000273234</td><td>OR2A13P    </td><td>7           </td><td>143839102</td><td>143840031</td><td> 1</td></tr>
	<tr><td>ENSG00000273252</td><td>OR7E39P    </td><td>7           </td><td>  6875051</td><td>  6875425</td><td>-1</td></tr>
	<tr><td>ENSG00000273255</td><td>OR5BP1P    </td><td>11          </td><td> 56823062</td><td> 56823607</td><td> 1</td></tr>
	<tr><td>ENSG00000273274</td><td>ZBTB8B     </td><td>1           </td><td> 32930670</td><td> 32962287</td><td> 1</td></tr>
	<tr><td>ENSG00000273311</td><td>DGCR11     </td><td>22          </td><td> 19033675</td><td> 19035888</td><td>-1</td></tr>
	<tr><td>ENSG00000273313</td><td>RBAKDN     </td><td>7           </td><td>  5111756</td><td>  5112854</td><td> 1</td></tr>
	<tr><td>ENSG00000273327</td><td>OR6L2P     </td><td>10          </td><td>135243898</td><td>135244822</td><td>-1</td></tr>
	<tr><td>ENSG00000273336</td><td>OR7M1P     </td><td>10          </td><td>135294742</td><td>135295274</td><td> 1</td></tr>
	<tr><td>ENSG00000273340</td><td>MICE       </td><td>6           </td><td> 29709508</td><td> 29716746</td><td>-1</td></tr>
	<tr><td>ENSG00000273344</td><td>PAXIP1-AS1 </td><td>7           </td><td>154795158</td><td>154797413</td><td> 1</td></tr>
	<tr><td>ENSG00000273377</td><td>OR2Q1P     </td><td>7           </td><td>143677998</td><td>143678913</td><td> 1</td></tr>
	<tr><td>ENSG00000273408</td><td>OR5B15P    </td><td>11          </td><td> 58155056</td><td> 58155959</td><td>-1</td></tr>
	<tr><td>ENSG00000273423</td><td>OR13I1P    </td><td>9           </td><td>107392035</td><td>107393298</td><td> 1</td></tr>
	<tr><td>ENSG00000273434</td><td>OR8S21P    </td><td>12          </td><td> 48810933</td><td> 48811120</td><td>-1</td></tr>
	<tr><td>ENSG00000273484</td><td>OR6R2P     </td><td>8           </td><td> 21654972</td><td> 21655271</td><td> 1</td></tr>
</tbody>
</table>



### Relink ENSEMBL_to_GENESYMBOL and ENCODE file


```R
nrow(ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC)
nrow(GM_ENSG_TPM_avg12)
head(ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC, 3)
head(GM_ENSG_TPM_avg12_noVersion, 3)
```


32415



58780



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
<caption>A data.frame: 3 × 7</caption>
<thead>
	<tr><th></th><th scope=col>chromosome</th><th scope=col>start_position</th><th scope=col>end_position</th><th scope=col>TPM</th><th scope=col>strand</th><th scope=col>hgnc_symbol</th><th scope=col>ensembl_gene_id</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>chr1</td><td>11869</td><td>14412</td><td>0.005</td><td> 1</td><td>DDX11L1   </td><td>ENSG00000223972</td></tr>
	<tr><th scope=row>2</th><td>chr1</td><td>14363</td><td>29806</td><td>1.770</td><td>-1</td><td>WASH7P    </td><td>ENSG00000227232</td></tr>
	<tr><th scope=row>3</th><td>chr1</td><td>29554</td><td>31109</td><td>0.000</td><td> 1</td><td>MIR1302-11</td><td>ENSG00000243485</td></tr>
</tbody>
</table>




```R
 merge(ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC, GM_ENSG_TPM_avg12_noVersion, by.x = "ensembl_gene_id", by.y = "ENSG")
```


<table class="dataframe">
<caption>A data.frame: 32451 × 8</caption>
<thead>
	<tr><th scope=col>ensembl_gene_id</th><th scope=col>hgnc_symbol</th><th scope=col>chromosome_name</th><th scope=col>start_position</th><th scope=col>end_position</th><th scope=col>strand</th><th scope=col>ENSEMBL</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003</td><td>TSPAN6  </td><td>X </td><td> 99883667</td><td> 99894988</td><td>-1</td><td>ENSG00000000003.14      </td><td> 0.090</td></tr>
	<tr><td>ENSG00000000005</td><td>TNMD    </td><td>X </td><td> 99839799</td><td> 99854882</td><td> 1</td><td>ENSG00000000005.5       </td><td> 0.000</td></tr>
	<tr><td>ENSG00000000419</td><td>DPM1    </td><td>20</td><td> 49551404</td><td> 49575092</td><td>-1</td><td>ENSG00000000419.12      </td><td>19.935</td></tr>
	<tr><td>ENSG00000000457</td><td>SCYL3   </td><td>1 </td><td>169818772</td><td>169863408</td><td>-1</td><td>ENSG00000000457.13      </td><td> 4.040</td></tr>
	<tr><td>ENSG00000000460</td><td>C1orf112</td><td>1 </td><td>169631245</td><td>169823221</td><td> 1</td><td>ENSG00000000460.16      </td><td> 8.440</td></tr>
	<tr><td>ENSG00000000938</td><td>FGR     </td><td>1 </td><td> 27938575</td><td> 27961788</td><td>-1</td><td>ENSG00000000938.12      </td><td>31.415</td></tr>
	<tr><td>ENSG00000000971</td><td>CFH     </td><td>1 </td><td>196621008</td><td>196716634</td><td> 1</td><td>ENSG00000000971.15      </td><td> 0.140</td></tr>
	<tr><td>ENSG00000001036</td><td>FUCA2   </td><td>6 </td><td>143815948</td><td>143832827</td><td>-1</td><td>ENSG00000001036.13      </td><td>12.780</td></tr>
	<tr><td>ENSG00000001084</td><td>GCLC    </td><td>6 </td><td> 53362139</td><td> 53481768</td><td>-1</td><td>ENSG00000001084.12      </td><td> 7.680</td></tr>
	<tr><td>ENSG00000001167</td><td>NFYA    </td><td>6 </td><td> 41040684</td><td> 41067715</td><td> 1</td><td>ENSG00000001167.14      </td><td>10.145</td></tr>
	<tr><td>ENSG00000001460</td><td>STPG1   </td><td>1 </td><td> 24683489</td><td> 24743424</td><td>-1</td><td>ENSG00000001460.17      </td><td> 0.095</td></tr>
	<tr><td>ENSG00000001461</td><td>NIPAL3  </td><td>1 </td><td> 24742284</td><td> 24799466</td><td> 1</td><td>ENSG00000001461.16      </td><td> 2.285</td></tr>
	<tr><td>ENSG00000001497</td><td>LAS1L   </td><td>X </td><td> 64732462</td><td> 64754655</td><td>-1</td><td>ENSG00000001497.16      </td><td>23.625</td></tr>
	<tr><td>ENSG00000001561</td><td>ENPP4   </td><td>6 </td><td> 46097730</td><td> 46114436</td><td> 1</td><td>ENSG00000001561.6       </td><td> 1.955</td></tr>
	<tr><td>ENSG00000001617</td><td>SEMA3F  </td><td>3 </td><td> 50192478</td><td> 50226508</td><td> 1</td><td>ENSG00000001617.11      </td><td> 0.100</td></tr>
	<tr><td>ENSG00000001626</td><td>CFTR    </td><td>7 </td><td>117105838</td><td>117356025</td><td> 1</td><td>ENSG00000001626.15      </td><td> 0.110</td></tr>
	<tr><td>ENSG00000001629</td><td>ANKIB1  </td><td>7 </td><td> 91875548</td><td> 92030698</td><td> 1</td><td>ENSG00000001629.9       </td><td>13.390</td></tr>
	<tr><td>ENSG00000001630</td><td>CYP51A1 </td><td>7 </td><td> 91741465</td><td> 91772266</td><td>-1</td><td>ENSG00000001630.16      </td><td>30.830</td></tr>
	<tr><td>ENSG00000001631</td><td>KRIT1   </td><td>7 </td><td> 91828283</td><td> 91875480</td><td>-1</td><td>ENSG00000001631.15      </td><td> 8.915</td></tr>
	<tr><td>ENSG00000002016</td><td>RAD52   </td><td>12</td><td>  1021243</td><td>  1099219</td><td>-1</td><td>ENSG00000002016.17      </td><td> 2.525</td></tr>
	<tr><td>ENSG00000002079</td><td>MYH16   </td><td>7 </td><td> 98836417</td><td> 98908753</td><td> 1</td><td>ENSG00000002079.14      </td><td> 0.065</td></tr>
	<tr><td>ENSG00000002330</td><td>BAD     </td><td>11</td><td> 64037302</td><td> 64052176</td><td>-1</td><td>ENSG00000002330.13      </td><td>15.710</td></tr>
	<tr><td>ENSG00000002549</td><td>LAP3    </td><td>4 </td><td> 17578815</td><td> 17609595</td><td> 1</td><td>ENSG00000002549.12      </td><td>51.545</td></tr>
	<tr><td>ENSG00000002586</td><td>CD99    </td><td>X </td><td>  2609220</td><td>  2659350</td><td> 1</td><td>ENSG00000002586.19_PAR_Y</td><td> 0.000</td></tr>
	<tr><td>ENSG00000002586</td><td>CD99    </td><td>X </td><td>  2609220</td><td>  2659350</td><td> 1</td><td>ENSG00000002586.19      </td><td>68.045</td></tr>
	<tr><td>ENSG00000002587</td><td>HS3ST1  </td><td>4 </td><td> 11394774</td><td> 11431389</td><td>-1</td><td>ENSG00000002587.9       </td><td> 0.185</td></tr>
	<tr><td>ENSG00000002726</td><td>AOC1    </td><td>7 </td><td>150521715</td><td>150558592</td><td> 1</td><td>ENSG00000002726.20      </td><td> 0.015</td></tr>
	<tr><td>ENSG00000002745</td><td>WNT16   </td><td>7 </td><td>120965421</td><td>120981158</td><td> 1</td><td>ENSG00000002745.12      </td><td> 0.040</td></tr>
	<tr><td>ENSG00000002746</td><td>HECW1   </td><td>7 </td><td> 43152198</td><td> 43605600</td><td> 1</td><td>ENSG00000002746.14      </td><td> 0.100</td></tr>
	<tr><td>ENSG00000002822</td><td>MAD1L1  </td><td>7 </td><td>  1855429</td><td>  2272878</td><td>-1</td><td>ENSG00000002822.15      </td><td>21.650</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>ENSG00000272767</td><td>JMJD1C-AS1 </td><td>10          </td><td> 65224989</td><td> 65226323</td><td> 1</td><td>ENSG00000272767.1</td><td>0.890</td></tr>
	<tr><td>ENSG00000272837</td><td>OR10AE3P   </td><td>12          </td><td> 56039979</td><td> 56040447</td><td>-1</td><td>ENSG00000272837.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000272882</td><td>OR2BH1P    </td><td>11          </td><td> 29008182</td><td> 29009045</td><td> 1</td><td>ENSG00000272882.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000272887</td><td>CSPG4P5    </td><td>15          </td><td> 84956505</td><td> 84962703</td><td>-1</td><td>ENSG00000272887.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000272900</td><td>OR10Q2P    </td><td>11          </td><td> 58059298</td><td> 58060237</td><td>-1</td><td>ENSG00000272900.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000272937</td><td>OR6U2P     </td><td>12          </td><td> 56005407</td><td> 56006338</td><td> 1</td><td>ENSG00000272937.2</td><td>0.020</td></tr>
	<tr><td>ENSG00000272963</td><td>OR7A19P    </td><td>12          </td><td> 46986356</td><td> 46987088</td><td> 1</td><td>ENSG00000272963.1</td><td>0.175</td></tr>
	<tr><td>ENSG00000272968</td><td>RBAK-RBAKDN</td><td>7           </td><td>  5023349</td><td>  5112852</td><td> 1</td><td>ENSG00000272968.5</td><td>0.000</td></tr>
	<tr><td>ENSG00000273015</td><td>LINC00938  </td><td>12          </td><td> 46119510</td><td> 46121558</td><td>-1</td><td>ENSG00000273015.2</td><td>1.125</td></tr>
	<tr><td>ENSG00000273032</td><td>DGCR9      </td><td>22          </td><td> 19005347</td><td> 19007761</td><td> 1</td><td>ENSG00000273032.2</td><td>0.000</td></tr>
	<tr><td>ENSG00000273041</td><td>ATF4P2     </td><td>HG1497_PATCH</td><td>153749394</td><td>153750466</td><td> 1</td><td>ENSG00000273041.1</td><td>0.025</td></tr>
	<tr><td>ENSG00000273051</td><td>OR51F4P    </td><td>11          </td><td>  4773276</td><td>  4774174</td><td>-1</td><td>ENSG00000273051.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273079</td><td>GRIN2B     </td><td>12          </td><td> 13693165</td><td> 14133053</td><td>-1</td><td>ENSG00000273079.5</td><td>0.005</td></tr>
	<tr><td>ENSG00000273164</td><td>DGCR10     </td><td>22          </td><td> 19010569</td><td> 19011063</td><td> 1</td><td>ENSG00000273164.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273228</td><td>OR5BQ1P    </td><td>11          </td><td> 56796883</td><td> 56797197</td><td> 1</td><td>ENSG00000273228.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273234</td><td>OR2A13P    </td><td>7           </td><td>143839102</td><td>143840031</td><td> 1</td><td>ENSG00000273234.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273252</td><td>OR7E39P    </td><td>7           </td><td>  6875051</td><td>  6875425</td><td>-1</td><td>ENSG00000273252.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273255</td><td>OR5BP1P    </td><td>11          </td><td> 56823062</td><td> 56823607</td><td> 1</td><td>ENSG00000273255.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273274</td><td>ZBTB8B     </td><td>1           </td><td> 32930670</td><td> 32962287</td><td> 1</td><td>ENSG00000273274.1</td><td>0.005</td></tr>
	<tr><td>ENSG00000273311</td><td>DGCR11     </td><td>22          </td><td> 19033675</td><td> 19035888</td><td>-1</td><td>ENSG00000273311.1</td><td>0.785</td></tr>
	<tr><td>ENSG00000273313</td><td>RBAKDN     </td><td>7           </td><td>  5111756</td><td>  5112854</td><td> 1</td><td>ENSG00000273313.1</td><td>0.110</td></tr>
	<tr><td>ENSG00000273327</td><td>OR6L2P     </td><td>10          </td><td>135243898</td><td>135244822</td><td>-1</td><td>ENSG00000273327.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273336</td><td>OR7M1P     </td><td>10          </td><td>135294742</td><td>135295274</td><td> 1</td><td>ENSG00000273336.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273340</td><td>MICE       </td><td>6           </td><td> 29709508</td><td> 29716746</td><td>-1</td><td>ENSG00000273340.1</td><td>0.385</td></tr>
	<tr><td>ENSG00000273344</td><td>PAXIP1-AS1 </td><td>7           </td><td>154795158</td><td>154797413</td><td> 1</td><td>ENSG00000273344.1</td><td>2.685</td></tr>
	<tr><td>ENSG00000273377</td><td>OR2Q1P     </td><td>7           </td><td>143677998</td><td>143678913</td><td> 1</td><td>ENSG00000273377.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273408</td><td>OR5B15P    </td><td>11          </td><td> 58155056</td><td> 58155959</td><td>-1</td><td>ENSG00000273408.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273423</td><td>OR13I1P    </td><td>9           </td><td>107392035</td><td>107393298</td><td> 1</td><td>ENSG00000273423.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273434</td><td>OR8S21P    </td><td>12          </td><td> 48810933</td><td> 48811120</td><td>-1</td><td>ENSG00000273434.1</td><td>0.000</td></tr>
	<tr><td>ENSG00000273484</td><td>OR6R2P     </td><td>8           </td><td> 21654972</td><td> 21655271</td><td> 1</td><td>ENSG00000273484.1</td><td>0.000</td></tr>
</tbody>
</table>




```R
# merge, sort columns, sort BED coordinates
GM_ENSG_TPM_avg12_noVersion_hasHGNC <- merge(ENSEMBLnoVersion_to_GENESYMBOL_hasHGNC, GM_ENSG_TPM_avg12_noVersion, by.x = "ensembl_gene_id", by.y = "ENSG") %>% 
mutate(chromosome = paste0("chr", chromosome_name)) %>% 
dplyr::select(chromosome, start_position, end_position, TPM, strand, hgnc_symbol, ensembl_gene_id) %>% arrange(chromosome, start_position)

GM_ENSG_TPM_avg12_noVersion_hasHGNC
```


<table class="dataframe">
<caption>A data.frame: 32451 × 7</caption>
<thead>
	<tr><th scope=col>chromosome</th><th scope=col>start_position</th><th scope=col>end_position</th><th scope=col>TPM</th><th scope=col>strand</th><th scope=col>hgnc_symbol</th><th scope=col>ensembl_gene_id</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1</td><td> 11869</td><td> 14412</td><td>  0.005</td><td> 1</td><td>DDX11L1   </td><td>ENSG00000223972</td></tr>
	<tr><td>chr1</td><td> 14363</td><td> 29806</td><td>  1.770</td><td>-1</td><td>WASH7P    </td><td>ENSG00000227232</td></tr>
	<tr><td>chr1</td><td> 29554</td><td> 31109</td><td>  0.000</td><td> 1</td><td>MIR1302-11</td><td>ENSG00000243485</td></tr>
	<tr><td>chr1</td><td> 29554</td><td> 31109</td><td>  0.000</td><td> 1</td><td>MIR1302-10</td><td>ENSG00000243485</td></tr>
	<tr><td>chr1</td><td> 29554</td><td> 31109</td><td>  0.000</td><td> 1</td><td>MIR1302-9 </td><td>ENSG00000243485</td></tr>
	<tr><td>chr1</td><td> 29554</td><td> 31109</td><td>  0.000</td><td> 1</td><td>MIR1302-2 </td><td>ENSG00000243485</td></tr>
	<tr><td>chr1</td><td> 34554</td><td> 36081</td><td>  0.000</td><td>-1</td><td>FAM138A   </td><td>ENSG00000237613</td></tr>
	<tr><td>chr1</td><td> 52473</td><td> 54936</td><td>  0.000</td><td> 1</td><td>OR4G4P    </td><td>ENSG00000268020</td></tr>
	<tr><td>chr1</td><td> 62948</td><td> 63887</td><td>  0.000</td><td> 1</td><td>OR4G11P   </td><td>ENSG00000240361</td></tr>
	<tr><td>chr1</td><td> 69091</td><td> 70008</td><td>  0.000</td><td> 1</td><td>OR4F5     </td><td>ENSG00000186092</td></tr>
	<tr><td>chr1</td><td>131025</td><td>134836</td><td>  0.010</td><td> 1</td><td>CICP27    </td><td>ENSG00000233750</td></tr>
	<tr><td>chr1</td><td>157784</td><td>157887</td><td>  0.000</td><td>-1</td><td>RNU6-1100P</td><td>ENSG00000222623</td></tr>
	<tr><td>chr1</td><td>329431</td><td>332236</td><td>  0.000</td><td>-1</td><td>CICP7     </td><td>ENSG00000233653</td></tr>
	<tr><td>chr1</td><td>379105</td><td>379467</td><td>  0.000</td><td>-1</td><td>WBP1LP7   </td><td>ENSG00000269732</td></tr>
	<tr><td>chr1</td><td>564442</td><td>564813</td><td>  0.720</td><td> 1</td><td>MTND1P23  </td><td>ENSG00000225972</td></tr>
	<tr><td>chr1</td><td>565020</td><td>566063</td><td> 94.455</td><td> 1</td><td>MTND2P28  </td><td>ENSG00000225630</td></tr>
	<tr><td>chr1</td><td>568915</td><td>569121</td><td>  0.000</td><td> 1</td><td>MTATP8P1  </td><td>ENSG00000240409</td></tr>
	<tr><td>chr1</td><td>569076</td><td>569756</td><td>107.575</td><td> 1</td><td>MTATP6P1  </td><td>ENSG00000248527</td></tr>
	<tr><td>chr1</td><td>610222</td><td>610645</td><td>  0.000</td><td> 1</td><td>WBP1LP6   </td><td>ENSG00000268663</td></tr>
	<tr><td>chr1</td><td>657472</td><td>660283</td><td>  0.015</td><td> 1</td><td>CICP3     </td><td>ENSG00000229376</td></tr>
	<tr><td>chr1</td><td>693613</td><td>693716</td><td>  0.000</td><td>-1</td><td>RNU6-1199P</td><td>ENSG00000223181</td></tr>
	<tr><td>chr1</td><td>752751</td><td>755214</td><td>  0.000</td><td> 1</td><td>FAM87B    </td><td>ENSG00000177757</td></tr>
	<tr><td>chr1</td><td>761586</td><td>762902</td><td>  1.035</td><td>-1</td><td>LINC00115 </td><td>ENSG00000225880</td></tr>
	<tr><td>chr1</td><td>762988</td><td>794826</td><td>  5.540</td><td> 1</td><td>LINC01128 </td><td>ENSG00000228794</td></tr>
	<tr><td>chr1</td><td>803451</td><td>812283</td><td>  1.010</td><td>-1</td><td>FAM41C    </td><td>ENSG00000230368</td></tr>
	<tr><td>chr1</td><td>808672</td><td>809729</td><td>  0.000</td><td> 1</td><td>TUBB8P11  </td><td>ENSG00000234711</td></tr>
	<tr><td>chr1</td><td>860260</td><td>879955</td><td>  0.025</td><td> 1</td><td>SAMD11    </td><td>ENSG00000187634</td></tr>
	<tr><td>chr1</td><td>879584</td><td>894689</td><td> 47.415</td><td>-1</td><td>NOC2L     </td><td>ENSG00000188976</td></tr>
	<tr><td>chr1</td><td>895967</td><td>901095</td><td> 11.080</td><td> 1</td><td>KLHL17    </td><td>ENSG00000187961</td></tr>
	<tr><td>chr1</td><td>901877</td><td>911245</td><td>  0.130</td><td> 1</td><td>PLEKHN1   </td><td>ENSG00000187583</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>chrY</td><td>27876158</td><td>27881307</td><td>0</td><td>-1</td><td>USP9YP9   </td><td>ENSG00000232614</td></tr>
	<tr><td>chrY</td><td>27894743</td><td>27896353</td><td>0</td><td>-1</td><td>USP9YP19  </td><td>ENSG00000225326</td></tr>
	<tr><td>chrY</td><td>27898535</td><td>27899017</td><td>0</td><td> 1</td><td>XKRYP5    </td><td>ENSG00000223406</td></tr>
	<tr><td>chrY</td><td>27959160</td><td>27960713</td><td>0</td><td> 1</td><td>CDY22P    </td><td>ENSG00000229343</td></tr>
	<tr><td>chrY</td><td>28007090</td><td>28007415</td><td>0</td><td> 1</td><td>TCEB1P17  </td><td>ENSG00000232695</td></tr>
	<tr><td>chrY</td><td>28018078</td><td>28044800</td><td>0</td><td>-1</td><td>OFD1P18Y  </td><td>ENSG00000235511</td></tr>
	<tr><td>chrY</td><td>28050665</td><td>28053397</td><td>0</td><td> 1</td><td>TRAPPC2P4 </td><td>ENSG00000232914</td></tr>
	<tr><td>chrY</td><td>28064470</td><td>28065042</td><td>0</td><td>-1</td><td>RAB9AP3   </td><td>ENSG00000223655</td></tr>
	<tr><td>chrY</td><td>28069535</td><td>28075973</td><td>0</td><td> 1</td><td>USP9YP20  </td><td>ENSG00000230854</td></tr>
	<tr><td>chrY</td><td>28075126</td><td>28075289</td><td>0</td><td> 1</td><td>RNU1-40P  </td><td>ENSG00000252625</td></tr>
	<tr><td>chrY</td><td>28079980</td><td>28082028</td><td>0</td><td>-1</td><td>USP9YP21  </td><td>ENSG00000227635</td></tr>
	<tr><td>chrY</td><td>28089415</td><td>28100299</td><td>0</td><td> 1</td><td>XKRYP6    </td><td>ENSG00000237546</td></tr>
	<tr><td>chrY</td><td>28121660</td><td>28134216</td><td>0</td><td> 1</td><td>PRYP4     </td><td>ENSG00000172283</td></tr>
	<tr><td>chrY</td><td>28137388</td><td>28137719</td><td>0</td><td>-1</td><td>TCEB1P11  </td><td>ENSG00000227867</td></tr>
	<tr><td>chrY</td><td>28140831</td><td>28141844</td><td>0</td><td>-1</td><td>CDY23P    </td><td>ENSG00000231716</td></tr>
	<tr><td>chrY</td><td>28148401</td><td>28155003</td><td>0</td><td> 1</td><td>USP9YP26  </td><td>ENSG00000234744</td></tr>
	<tr><td>chrY</td><td>28157582</td><td>28158384</td><td>0</td><td> 1</td><td>HSFY8P    </td><td>ENSG00000233156</td></tr>
	<tr><td>chrY</td><td>28201926</td><td>28234640</td><td>0</td><td>-1</td><td>OFD1P15Y  </td><td>ENSG00000234888</td></tr>
	<tr><td>chrY</td><td>28269821</td><td>28279455</td><td>0</td><td> 1</td><td>RBMY2DP   </td><td>ENSG00000215507</td></tr>
	<tr><td>chrY</td><td>28344478</td><td>28354295</td><td>0</td><td>-1</td><td>REREP2Y   </td><td>ENSG00000235014</td></tr>
	<tr><td>chrY</td><td>28424070</td><td>28500565</td><td>0</td><td>-1</td><td>PPP1R12BP1</td><td>ENSG00000229238</td></tr>
	<tr><td>chrY</td><td>28507136</td><td>28507239</td><td>0</td><td> 1</td><td>RNU6-1314P</td><td>ENSG00000252948</td></tr>
	<tr><td>chrY</td><td>28546758</td><td>28547377</td><td>0</td><td> 1</td><td>CYCSP48   </td><td>ENSG00000233843</td></tr>
	<tr><td>chrY</td><td>28555962</td><td>28566682</td><td>0</td><td> 1</td><td>ANKRD36P1 </td><td>ENSG00000188399</td></tr>
	<tr><td>chrY</td><td>28654360</td><td>28725837</td><td>0</td><td> 1</td><td>TPTE2P4   </td><td>ENSG00000215506</td></tr>
	<tr><td>chrY</td><td>28695572</td><td>28695890</td><td>0</td><td> 1</td><td>CYCSP49   </td><td>ENSG00000224240</td></tr>
	<tr><td>chrY</td><td>28732789</td><td>28737748</td><td>0</td><td>-1</td><td>SLC25A15P1</td><td>ENSG00000227629</td></tr>
	<tr><td>chrY</td><td>28740998</td><td>28780799</td><td>0</td><td>-1</td><td>PARP4P1   </td><td>ENSG00000237917</td></tr>
	<tr><td>chrY</td><td>28772667</td><td>28773306</td><td>0</td><td>-1</td><td>FAM58CP   </td><td>ENSG00000231514</td></tr>
	<tr><td>chrY</td><td>59001391</td><td>59001635</td><td>0</td><td> 1</td><td>CTBP2P1   </td><td>ENSG00000235857</td></tr>
</tbody>
</table>




```R
write_tsv(GM_ENSG_TPM_avg12_noVersion_hasHGNC, "GM_ENSG_TPM_avg12_noVersion_hasHGNC.txt", col_names = TRUE)
```

#### Adjust BED coordinates for TSS based on strand


```R
GM_ENSG_TPM_avg12_noVersion_hasHGNC_TSSstart <- GM_ENSG_TPM_avg12_noVersion_hasHGNC %>% mutate(TSS_start = case_when(
    (strand == "1") ~ start_position,
    (strand == "-1") ~ end_position
)) %>% arrange(chromosome, start_position)
head(GM_ENSG_TPM_avg12_noVersion_hasHGNC_TSSstart, 3)
```


<table class="dataframe">
<caption>A data.frame: 3 × 8</caption>
<thead>
	<tr><th></th><th scope=col>chromosome</th><th scope=col>start_position</th><th scope=col>end_position</th><th scope=col>TPM</th><th scope=col>strand</th><th scope=col>hgnc_symbol</th><th scope=col>ensembl_gene_id</th><th scope=col>TSS_start</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>chr1</td><td>11869</td><td>14412</td><td>0.005</td><td> 1</td><td>DDX11L1   </td><td>ENSG00000223972</td><td>11869</td></tr>
	<tr><th scope=row>2</th><td>chr1</td><td>14363</td><td>29806</td><td>1.770</td><td>-1</td><td>WASH7P    </td><td>ENSG00000227232</td><td>29806</td></tr>
	<tr><th scope=row>3</th><td>chr1</td><td>29554</td><td>31109</td><td>0.000</td><td> 1</td><td>MIR1302-11</td><td>ENSG00000243485</td><td>29554</td></tr>
</tbody>
</table>




```R
GM_ENSG_TPM_avg12_noVersion_hasHGNC_TSScoords <- GM_ENSG_TPM_avg12_noVersion_hasHGNC_TSSstart %>% dplyr::mutate(TSS_end = (TSS_start + 1)) %>% dplyr::select(chromosome, TSS_start, TSS_end, TPM, strand, hgnc_symbol, ensembl_gene_id) %>% dplyr::arrange(chromosome, TSS_start)

nrow(GM_ENSG_TPM_avg12_noVersion_hasHGNC_TSScoords)
head(GM_ENSG_TPM_avg12_noVersion_hasHGNC_TSScoords, 3)

```


32451



<table class="dataframe">
<caption>A data.frame: 3 × 7</caption>
<thead>
	<tr><th></th><th scope=col>chromosome</th><th scope=col>TSS_start</th><th scope=col>TSS_end</th><th scope=col>TPM</th><th scope=col>strand</th><th scope=col>hgnc_symbol</th><th scope=col>ensembl_gene_id</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>chr1</td><td>11869</td><td>11870</td><td>0.005</td><td>1</td><td>DDX11L1   </td><td>ENSG00000223972</td></tr>
	<tr><th scope=row>2</th><td>chr1</td><td>29554</td><td>29555</td><td>0.000</td><td>1</td><td>MIR1302-11</td><td>ENSG00000243485</td></tr>
	<tr><th scope=row>3</th><td>chr1</td><td>29554</td><td>29555</td><td>0.000</td><td>1</td><td>MIR1302-10</td><td>ENSG00000243485</td></tr>
</tbody>
</table>



#### Filter for TPM


```R
GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0 <- GM_ENSG_TPM_avg12_noVersion_hasHGNC_TSScoords %>% filter(TPM > 0)

write_tsv(GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0, "GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.withHeaders.txt", col_names = TRUE)
write_tsv(GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0, "GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.txt", col_names = FALSE)
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

echo "Done."
```

    Done.



```R
# Bcell 
bedtools sort -i ${REF_DIR}GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.txt | awk 'BEGIN{OFS=FS="\t"}{print }' - > ${REF_DIR}GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.sorted.txt

echo "Done."
```

    Done.



```R
# Initalize HMR files 
CLUSTERED_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_internalClusters_individualHMRs_cellspecific_hpl.txt
UNCLUSTERED_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_unclustered_cellspecific_hpl.txt

awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,"Bcell_ClusteredCS"}' ${CLUSTERED_CS_FILE} | bedtools sort -i - > ${INTER_DIR}Bcell.clustered_cs.tmp_sorted.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,"Bcell_UnclusteredCS"}' ${UNCLUSTERED_CS_FILE} | bedtools sort -i - > ${INTER_DIR}Bcell.unclustered_cs.tmp_sorted.txt

echo "Done."
```

    Done.



```R
# Clusters contain cell specific 
```


```R
## How many clusters are represented by the individual clustered cell specific HMRs
bedtools intersect -u -a /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_internalClusters_hpl.txt -b /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_internalClusters_individualHMRs_cellspecific_hpl.txt > ${INTER_DIR}Bcell_internalClusters_hpl.containsCellSpecificHMR.txt

wc -l ${INTER_DIR}Bcell_internalClusters_hpl.containsCellSpecificHMR.txt

awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,"Bcell_ClusteredCS"}' ${INTER_DIR}Bcell_internalClusters_hpl.containsCellSpecificHMR.txt | bedtools sort -i - > ${INTER_DIR}Bcell_internalClusters_hpl.containsCellSpecificHMR.tmp_sorted.txt
```

    484 /data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Bcell_internalClusters_hpl.containsCellSpecificHMR.txt



```R
# Clusters contain cell specific 
```


```R
bedtools closest -d -k 2 -a ${INTER_DIR}Bcell_internalClusters_hpl.containsCellSpecificHMR.tmp_sorted.txt -b ${REF_DIR}GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.sorted.txt > ${INTER_DIR}Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt

echo "Done."
```

    Done.



```R
# bedtools closest -d -k 2 -a ${INTER_DIR}Bcell.clustered_cs.tmp_sorted.txt -b ${REF_DIR}GM_ENSGGENESYMBOL_minTPM0.sorted.txt > ${INTER_DIR}Bcell_clustered_cellspecific.2NN.GM_ENSGGENESYMBOL_minTPM0.txt

bedtools closest -d -k 2 -a ${INTER_DIR}Bcell.unclustered_cs.tmp_sorted.txt -b ${REF_DIR}GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.sorted.txt > ${INTER_DIR}Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt

echo "Done."
```

    Done.



```R
wc -l ${INTER_DIR}Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt
wc -l ${INTER_DIR}Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt
```

    970 /data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt
    3678 /data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt



```R
wc -l Bcell_clusters_containscellspecific.2NN.GM_ENSGGENESYMBOL_minTPM0.ContinuousBEDFormat.txt
```

    968 Bcell_clusters_containscellspecific.2NN.GM_ENSGGENESYMBOL_minTPM0.ContinuousBEDFormat.txt


# TAD Filter


```R
# Intersect 2NN file with TADs

# First, create an HMR-Gene end-to-end BED file:
#"ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist","HMRGroup"

# Check if HMR is before the TSS, else, TSS before  
awk 'BEGIN{OFS=FS="\t"}{if ($2<$6)
print $1,$2,$7,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
else print $1,$6,$3,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
}' ${INTER_DIR}Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt 

awk 'BEGIN{OFS=FS="\t"}{if ($2<$6)
print $1,$2,$7,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
else print $1,$6,$3,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
}' ${INTER_DIR}Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt

echo "Made continuous BED file."

```

    Made continuous BED file.



```R
bedtools intersect -f 1.0 -a ${INTER_DIR}Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt \
-b ${REF_DIR}GM12878_Lieberman-raw_TADs.txt > ${INTER_DIR}Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt

bedtools intersect -f 1.0 -a ${INTER_DIR}Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt  \
-b ${REF_DIR}GM12878_Lieberman-raw_TADs.txt > ${INTER_DIR}Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt

echo "Done."
```

    Done.



```R
wc -l ${INTER_DIR}Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt
wc -l ${INTER_DIR}Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt
```

    970 /data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt
    760 /data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt


# Remove gene reps 


```R
library(tidyverse)
library(ggplot2)
library(ggpubr)

#Set working directory 
setwd("/data/hodges_lab/Tim/nnRNA_TPM_EHGM/output_files/")

print("Loaded libraries.")
```

    [1] "Loaded libraries."



```R
Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered <- read_tsv("../intermediate_files/Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRTSS","StartHMRTSS","EndHMRTSS","ChrHMR","StartHMR","EndHMR","HMRGroup","ChrTSS","StartTSS","EndTSS","TPM","strand","GENE_SYMBOL","ENSEMBL","HMRTSSDist")) 


Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered <- read_tsv("../intermediate_files/Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRTSS","StartHMRTSS","EndHMRTSS","ChrHMR","StartHMR","EndHMR","HMRGroup","ChrTSS","StartTSS","EndTSS","TPM","strand","GENE_SYMBOL","ENSEMBL","HMRTSSDist"))
```

    [1mRows: [22m[34m760[39m [1mColumns: [22m[34m15[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (6): X1, X4, X7, X8, X13, X14
    [32mdbl[39m (9): X2, X3, X5, X6, X9, X10, X11, X12, X15
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m2492[39m [1mColumns: [22m[34m15[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (6): X1, X4, X7, X8, X13, X14
    [32mdbl[39m (9): X2, X3, X5, X6, X9, X10, X11, X12, X15
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


Remove rep call 


```R
Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM <- Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% dplyr::select(ENSEMBL, TPM, HMRTSSDist) %>% dplyr::distinct(ENSEMBL, TPM, .keep_all = TRUE) %>% mutate(HMRGroup = "Bcell_clustered") %>% arrange(ENSEMBL)

Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM <- Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% dplyr::select(ENSEMBL, TPM, HMRTSSDist) %>% dplyr::distinct(ENSEMBL, TPM, .keep_all = TRUE) %>% mutate(HMRGroup = "Bcell_unclustered") %>% arrange(ENSEMBL)

nrow(Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM)
head(Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM, 3)
nrow(Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM)
head(Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM, 3)
```


670



<table class="dataframe">
<caption>A tibble: 3 × 4</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th><th scope=col>HMRTSSDist</th><th scope=col>HMRGroup</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000002822</td><td>21.650</td><td>304807</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000004848</td><td> 0.005</td><td>  9410</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000006116</td><td> 0.010</td><td>234975</td><td>Bcell_clustered</td></tr>
</tbody>
</table>




2068



<table class="dataframe">
<caption>A tibble: 3 × 4</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th><th scope=col>HMRTSSDist</th><th scope=col>HMRGroup</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000460</td><td> 8.440</td><td>18308</td><td>Bcell_unclustered</td></tr>
	<tr><td>ENSG00000002549</td><td>51.545</td><td>15615</td><td>Bcell_unclustered</td></tr>
	<tr><td>ENSG00000002587</td><td> 0.185</td><td>40332</td><td>Bcell_unclustered</td></tr>
</tbody>
</table>



# STATS


```R
wilcox.test(Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM$TPM, Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM$TPM)
```


    
    	Wilcoxon rank sum test with continuity correction
    
    data:  Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM$TPM and Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM$TPM
    W = 740714, p-value = 0.007028
    alternative hypothesis: true location shift is not equal to 0




```R
Bcell_clustersContainsCS_Unclustered.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin %>% 
  group_by(HMRGroup) %>% 
  summarise(n = n())

Bcell_clustersContainsCS_Unclustered.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin %>% 
  group_by(HMRGroup, distBin) %>% 
  summarise(n = n())

```


<table class="dataframe">
<caption>A tibble: 2 × 2</caption>
<thead>
	<tr><th scope=col>HMRGroup</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Bcell_clustered  </td><td> 670</td></tr>
	<tr><td>Bcell_unclustered</td><td>2068</td></tr>
</tbody>
</table>



    [1m[22m`summarise()` has grouped output by 'HMRGroup'. You can override using the
    `.groups` argument.



<table class="dataframe">
<caption>A grouped_df: 14 × 3</caption>
<thead>
	<tr><th scope=col>HMRGroup</th><th scope=col>distBin</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Bcell_clustered  </td><td>0-10  </td><td>150</td></tr>
	<tr><td>Bcell_clustered  </td><td>10-20 </td><td> 81</td></tr>
	<tr><td>Bcell_clustered  </td><td>20-30 </td><td> 68</td></tr>
	<tr><td>Bcell_clustered  </td><td>30-40 </td><td> 54</td></tr>
	<tr><td>Bcell_clustered  </td><td>40-50 </td><td> 45</td></tr>
	<tr><td>Bcell_clustered  </td><td>50-100</td><td>123</td></tr>
	<tr><td><span style=white-space:pre-wrap>Bcell_clustered  </span></td><td><span style=white-space:pre-wrap>&gt;100  </span></td><td>149</td></tr>
	<tr><td>Bcell_unclustered</td><td>0-10  </td><td>122</td></tr>
	<tr><td>Bcell_unclustered</td><td>10-20 </td><td>209</td></tr>
	<tr><td>Bcell_unclustered</td><td>20-30 </td><td>257</td></tr>
	<tr><td>Bcell_unclustered</td><td>30-40 </td><td>157</td></tr>
	<tr><td>Bcell_unclustered</td><td>40-50 </td><td>159</td></tr>
	<tr><td>Bcell_unclustered</td><td>50-100</td><td>473</td></tr>
	<tr><td>Bcell_unclustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td><td>691</td></tr>
</tbody>
</table>



# Plot


```R
Bcell_clustersContainsCS_Unclustered.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM <- 
rbind(Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM, Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM)
```


```R
Bcell_clustersContainsCS_Unclustered.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin <- Bcell_clustersContainsCS_Unclustered.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM %>% 
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
Bcell_clustersContainsCS_Unclustered.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin$distBin <- factor(Bcell_clustersContainsCS_Unclustered.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin$distBin, levels = c("0-10", "10-20", "20-30", "30-40", "40-50", "50-100", ">100"))

print("Done.")
```

    [1] "Done."



```R
ggplot(Bcell_clustersContainsCS_Unclustered.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin, aes(x=HMRGroup, y=log10(TPM))) +
  geom_boxplot(aes(fill=HMRGroup)) +
  theme_classic() +
  ggtitle("ENSGnoVersion_withGENESYMBOL Bcell - All") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(TPM)") +
  stat_compare_means(aes(group=HMRGroup), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)
```


![png](output_54_0.png)



```R
ggplot(Bcell_clustersContainsCS_Unclustered.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=HMRGroup), width = .5, position=position_dodge(.75)) +
  theme_classic() +
  ggtitle("ENSGnoVersion_withGENESYMBOL B cell - Binned by Distance") +
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
```


![png](output_55_0.png)


# Plot fraction HMRs


```R
Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered
```


<table class="dataframe">
<caption>A spec_tbl_df: 760 × 15</caption>
<thead>
	<tr><th scope=col>ChrHMRTSS</th><th scope=col>StartHMRTSS</th><th scope=col>EndHMRTSS</th><th scope=col>ChrHMR</th><th scope=col>StartHMR</th><th scope=col>EndHMR</th><th scope=col>HMRGroup</th><th scope=col>ChrTSS</th><th scope=col>StartTSS</th><th scope=col>EndTSS</th><th scope=col>TPM</th><th scope=col>strand</th><th scope=col>GENE_SYMBOL</th><th scope=col>ENSEMBL</th><th scope=col>HMRTSSDist</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1</td><td>  993725</td><td> 1009688</td><td>chr1</td><td>  993725</td><td> 1006171</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 1009687</td><td> 1009688</td><td>  0.005</td><td>-1</td><td>RNF223    </td><td>ENSG00000237330</td><td>  3517</td></tr>
	<tr><td>chr1</td><td>  955503</td><td> 1006171</td><td>chr1</td><td>  993725</td><td> 1006171</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>  955503</td><td>  955504</td><td> 15.745</td><td> 1</td><td>AGRN      </td><td>ENSG00000188157</td><td> 38222</td></tr>
	<tr><td>chr1</td><td> 1092645</td><td> 1109265</td><td>chr1</td><td> 1092645</td><td> 1106080</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 1109264</td><td> 1109265</td><td>  0.020</td><td> 1</td><td>TTLL10    </td><td>ENSG00000162571</td><td>  3185</td></tr>
	<tr><td>chr1</td><td> 1092645</td><td> 1142072</td><td>chr1</td><td> 1092645</td><td> 1106080</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 1142071</td><td> 1142072</td><td>  2.365</td><td>-1</td><td>TNFRSF18  </td><td>ENSG00000186891</td><td> 35992</td></tr>
	<tr><td>chr1</td><td> 1771819</td><td> 1822496</td><td>chr1</td><td> 1771819</td><td> 1779732</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 1822495</td><td> 1822496</td><td>126.210</td><td>-1</td><td>GNB1      </td><td>ENSG00000078369</td><td> 42764</td></tr>
	<tr><td>chr1</td><td> 1711896</td><td> 1779732</td><td>chr1</td><td> 1771819</td><td> 1779732</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 1711896</td><td> 1711897</td><td> 32.945</td><td>-1</td><td>NADK      </td><td>ENSG00000008130</td><td> 59923</td></tr>
	<tr><td>chr1</td><td> 1822495</td><td> 1841244</td><td>chr1</td><td> 1827360</td><td> 1841244</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 1822495</td><td> 1822496</td><td>126.210</td><td>-1</td><td>GNB1      </td><td>ENSG00000078369</td><td>  4865</td></tr>
	<tr><td>chr1</td><td> 1827360</td><td> 1846267</td><td>chr1</td><td> 1827360</td><td> 1841244</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 1846266</td><td> 1846267</td><td>  0.045</td><td> 1</td><td>CALML6    </td><td>ENSG00000169885</td><td>  5023</td></tr>
	<tr><td>chr1</td><td> 3513491</td><td> 3528060</td><td>chr1</td><td> 3513491</td><td> 3516570</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 3528059</td><td> 3528060</td><td>  0.140</td><td>-1</td><td>MEGF6     </td><td>ENSG00000162591</td><td> 11490</td></tr>
	<tr><td>chr1</td><td> 3513491</td><td> 3541567</td><td>chr1</td><td> 3513491</td><td> 3516570</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 3541566</td><td> 3541567</td><td>  3.930</td><td> 1</td><td>TPRG1L    </td><td>ENSG00000158109</td><td> 24997</td></tr>
	<tr><td>chr1</td><td> 3569325</td><td> 3595883</td><td>chr1</td><td> 3582641</td><td> 3595883</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 3569325</td><td> 3569326</td><td> 15.720</td><td>-1</td><td>WRAP73    </td><td>ENSG00000116213</td><td> 13316</td></tr>
	<tr><td>chr1</td><td> 3569084</td><td> 3595883</td><td>chr1</td><td> 3582641</td><td> 3595883</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 3569084</td><td> 3569085</td><td> 19.875</td><td> 1</td><td>TP73      </td><td>ENSG00000078900</td><td> 13557</td></tr>
	<tr><td>chr1</td><td> 3634649</td><td> 3663901</td><td>chr1</td><td> 3634649</td><td> 3636909</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 3663900</td><td> 3663901</td><td>  4.680</td><td>-1</td><td>TP73-AS1  </td><td>ENSG00000227372</td><td> 26992</td></tr>
	<tr><td>chr1</td><td> 3634649</td><td> 3689353</td><td>chr1</td><td> 3634649</td><td> 3636909</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 3689352</td><td> 3689353</td><td>  0.130</td><td> 1</td><td>SMIM1     </td><td>ENSG00000235169</td><td> 52444</td></tr>
	<tr><td>chr1</td><td> 6845384</td><td> 7029550</td><td>chr1</td><td> 7022001</td><td> 7029550</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 6845384</td><td> 6845385</td><td> 21.875</td><td> 1</td><td>CAMTA1    </td><td>ENSG00000171735</td><td>176617</td></tr>
	<tr><td>chr1</td><td> 6761984</td><td> 7029550</td><td>chr1</td><td> 7022001</td><td> 7029550</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 6761984</td><td> 6761985</td><td> 19.370</td><td>-1</td><td>DNAJC11   </td><td>ENSG00000007923</td><td>260017</td></tr>
	<tr><td>chr1</td><td> 9352939</td><td> 9489443</td><td>chr1</td><td> 9458264</td><td> 9489443</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 9352939</td><td> 9352940</td><td>  0.350</td><td> 1</td><td>SPSB1     </td><td>ENSG00000171621</td><td>105325</td></tr>
	<tr><td>chr1</td><td> 9458264</td><td> 9599542</td><td>chr1</td><td> 9458264</td><td> 9489443</td><td>Bcell_ClusteredCS</td><td>chr1</td><td> 9599541</td><td> 9599542</td><td>  3.260</td><td> 1</td><td>SLC25A33  </td><td>ENSG00000171612</td><td>110099</td></tr>
	<tr><td>chr1</td><td>14925200</td><td>15069394</td><td>chr1</td><td>15059881</td><td>15069394</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>14925200</td><td>14925201</td><td>  1.670</td><td> 1</td><td>KAZN      </td><td>ENSG00000189337</td><td>134681</td></tr>
	<tr><td>chr1</td><td>16157273</td><td>16174360</td><td>chr1</td><td>16157273</td><td>16164333</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>16174359</td><td>16174360</td><td> 22.265</td><td> 1</td><td>SPEN      </td><td>ENSG00000065526</td><td> 10027</td></tr>
	<tr><td>chr1</td><td>16083102</td><td>16164333</td><td>chr1</td><td>16157273</td><td>16164333</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>16083102</td><td>16083103</td><td>  0.125</td><td> 1</td><td>FBLIM1    </td><td>ENSG00000162458</td><td> 74171</td></tr>
	<tr><td>chr1</td><td>21835858</td><td>21851814</td><td>chr1</td><td>21840391</td><td>21851814</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>21835858</td><td>21835859</td><td>  0.140</td><td> 1</td><td>ALPL      </td><td>ENSG00000162551</td><td>  4533</td></tr>
	<tr><td>chr1</td><td>24194784</td><td>24238716</td><td>chr1</td><td>24225643</td><td>24238716</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>24194784</td><td>24194785</td><td> 16.030</td><td>-1</td><td>FUCA1     </td><td>ENSG00000179163</td><td> 30859</td></tr>
	<tr><td>chr1</td><td>25273916</td><td>25291613</td><td>chr1</td><td>25273916</td><td>25283824</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>25291612</td><td>25291613</td><td> 57.410</td><td>-1</td><td>RUNX3     </td><td>ENSG00000020633</td><td>  7789</td></tr>
	<tr><td>chr1</td><td>25291612</td><td>25361098</td><td>chr1</td><td>25345700</td><td>25361098</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>25291612</td><td>25291613</td><td> 57.410</td><td>-1</td><td>RUNX3     </td><td>ENSG00000020633</td><td> 54088</td></tr>
	<tr><td>chr1</td><td>25345700</td><td>25558994</td><td>chr1</td><td>25345700</td><td>25361098</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>25558993</td><td>25558994</td><td> 11.335</td><td>-1</td><td>SYF2      </td><td>ENSG00000117614</td><td>197896</td></tr>
	<tr><td>chr1</td><td>32785645</td><td>32801981</td><td>chr1</td><td>32785645</td><td>32788472</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>32801980</td><td>32801981</td><td> 70.905</td><td>-1</td><td>MARCKSL1  </td><td>ENSG00000175130</td><td> 13509</td></tr>
	<tr><td>chr1</td><td>32757687</td><td>32788472</td><td>chr1</td><td>32785645</td><td>32788472</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>32757687</td><td>32757688</td><td> 58.740</td><td> 1</td><td>HDAC1     </td><td>ENSG00000116478</td><td> 27958</td></tr>
	<tr><td>chr1</td><td>43409892</td><td>43424531</td><td>chr1</td><td>43409892</td><td>43421697</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>43424530</td><td>43424531</td><td> 23.395</td><td>-1</td><td>SLC2A1    </td><td>ENSG00000117394</td><td>  2834</td></tr>
	<tr><td>chr1</td><td>43409892</td><td>43424721</td><td>chr1</td><td>43409892</td><td>43421697</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>43424720</td><td>43424721</td><td>  0.345</td><td> 1</td><td>SLC2A1-AS1</td><td>ENSG00000227533</td><td>  3024</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>chr9</td><td>134543563</td><td>134615462</td><td>chr9</td><td>134543563</td><td>134554199</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>134615461</td><td>134615462</td><td>43.635</td><td>-1</td><td>RAPGEF1  </td><td>ENSG00000107263</td><td> 61263</td></tr>
	<tr><td>chr9</td><td>134600212</td><td>134600855</td><td>chr9</td><td>134600212</td><td>134610047</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>134600854</td><td>134600855</td><td> 1.425</td><td>-1</td><td>RN7SL328P</td><td>ENSG00000240853</td><td>     0</td></tr>
	<tr><td>chr9</td><td>134600212</td><td>134615462</td><td>chr9</td><td>134600212</td><td>134610047</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>134615461</td><td>134615462</td><td>43.635</td><td>-1</td><td>RAPGEF1  </td><td>ENSG00000107263</td><td>  5415</td></tr>
	<tr><td>chr9</td><td>135670260</td><td>135753415</td><td>chr9</td><td>135670260</td><td>135686084</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>135753414</td><td>135753415</td><td> 0.695</td><td> 1</td><td>C9orf9   </td><td>ENSG00000165698</td><td> 67331</td></tr>
	<tr><td>chr9</td><td>135670260</td><td>135754165</td><td>chr9</td><td>135670260</td><td>135686084</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>135754164</td><td>135754165</td><td> 0.035</td><td>-1</td><td>AK8      </td><td>ENSG00000165695</td><td> 68081</td></tr>
	<tr><td>chr9</td><td>136819872</td><td>136857727</td><td>chr9</td><td>136819872</td><td>136826961</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>136857726</td><td>136857727</td><td>15.320</td><td>-1</td><td>VAV2     </td><td>ENSG00000160293</td><td> 30766</td></tr>
	<tr><td>chr9</td><td>136819872</td><td>136890562</td><td>chr9</td><td>136819872</td><td>136826961</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>136890561</td><td>136890562</td><td> 5.045</td><td> 1</td><td>LINC00094</td><td>ENSG00000235106</td><td> 63601</td></tr>
	<tr><td>chr9</td><td>136833640</td><td>136857727</td><td>chr9</td><td>136833640</td><td>136844990</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>136857726</td><td>136857727</td><td>15.320</td><td>-1</td><td>VAV2     </td><td>ENSG00000160293</td><td> 12737</td></tr>
	<tr><td>chr9</td><td>136833640</td><td>136890562</td><td>chr9</td><td>136833640</td><td>136844990</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>136890561</td><td>136890562</td><td> 5.045</td><td> 1</td><td>LINC00094</td><td>ENSG00000235106</td><td> 45572</td></tr>
	<tr><td>chr9</td><td>137155515</td><td>137208945</td><td>chr9</td><td>137155515</td><td>137168873</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>137208944</td><td>137208945</td><td>13.195</td><td> 1</td><td>RXRA     </td><td>ENSG00000186350</td><td> 40072</td></tr>
	<tr><td>chr9</td><td>137809809</td><td>137829664</td><td>chr9</td><td>137820839</td><td>137829664</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>137809809</td><td>137809810</td><td> 0.015</td><td>-1</td><td>FCN1     </td><td>ENSG00000085265</td><td> 11030</td></tr>
	<tr><td>chr9</td><td>137772654</td><td>137829664</td><td>chr9</td><td>137820839</td><td>137829664</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>137772654</td><td>137772655</td><td> 0.040</td><td> 1</td><td>FCN2     </td><td>ENSG00000160339</td><td> 48185</td></tr>
	<tr><td>chr9</td><td>139123711</td><td>139137688</td><td>chr9</td><td>139123711</td><td>139132236</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>139137687</td><td>139137688</td><td> 6.105</td><td>-1</td><td>QSOX2    </td><td>ENSG00000165661</td><td>  5452</td></tr>
	<tr><td>chr9</td><td>139512623</td><td>139553309</td><td>chr9</td><td>139512623</td><td>139526799</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>139553308</td><td>139553309</td><td> 0.210</td><td> 1</td><td>EGFL7    </td><td>ENSG00000172889</td><td> 26510</td></tr>
	<tr><td>chr9</td><td>140012985</td><td>140032843</td><td>chr9</td><td>140012985</td><td>140031230</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>140032842</td><td>140032843</td><td> 0.085</td><td> 1</td><td>GRIN1    </td><td>ENSG00000176884</td><td>  1613</td></tr>
	<tr><td>chr9</td><td>140009629</td><td>140031230</td><td>chr9</td><td>140012985</td><td>140031230</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>140009629</td><td>140009630</td><td>90.450</td><td>-1</td><td>DPP7     </td><td>ENSG00000176978</td><td>  3356</td></tr>
	<tr><td>chr9</td><td>140277941</td><td>140317715</td><td>chr9</td><td>140277941</td><td>140285199</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>140317714</td><td>140317715</td><td> 2.565</td><td>-1</td><td>EXD3     </td><td>ENSG00000187609</td><td> 32516</td></tr>
	<tr><td>chr9</td><td>140277941</td><td>140317803</td><td>chr9</td><td>140277941</td><td>140285199</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>140317802</td><td>140317803</td><td> 0.010</td><td> 1</td><td>NOXA1    </td><td>ENSG00000188747</td><td> 32604</td></tr>
	<tr><td>chr9</td><td>140301257</td><td>140317715</td><td>chr9</td><td>140301257</td><td>140306631</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>140317714</td><td>140317715</td><td> 2.565</td><td>-1</td><td>EXD3     </td><td>ENSG00000187609</td><td> 11084</td></tr>
	<tr><td>chr9</td><td>140301257</td><td>140317803</td><td>chr9</td><td>140301257</td><td>140306631</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>140317802</td><td>140317803</td><td> 0.010</td><td> 1</td><td>NOXA1    </td><td>ENSG00000188747</td><td> 11172</td></tr>
	<tr><td>chrX</td><td> 25023135</td><td> 25034066</td><td>chrX</td><td> 25023135</td><td> 25024656</td><td>Bcell_ClusteredCS</td><td>chrX</td><td> 25034065</td><td> 25034066</td><td> 0.005</td><td>-1</td><td>ARX      </td><td>ENSG00000004848</td><td>  9410</td></tr>
	<tr><td>chrX</td><td> 24807186</td><td> 25024656</td><td>chrX</td><td> 25023135</td><td> 25024656</td><td>Bcell_ClusteredCS</td><td>chrX</td><td> 24807186</td><td> 24807187</td><td> 1.605</td><td>-1</td><td>EEF1B2P3 </td><td>ENSG00000232472</td><td>215949</td></tr>
	<tr><td>chrX</td><td> 25029312</td><td> 25034066</td><td>chrX</td><td> 25029312</td><td> 25030802</td><td>Bcell_ClusteredCS</td><td>chrX</td><td> 25034065</td><td> 25034066</td><td> 0.005</td><td>-1</td><td>ARX      </td><td>ENSG00000004848</td><td>  3264</td></tr>
	<tr><td>chrX</td><td> 24807186</td><td> 25030802</td><td>chrX</td><td> 25029312</td><td> 25030802</td><td>Bcell_ClusteredCS</td><td>chrX</td><td> 24807186</td><td> 24807187</td><td> 1.605</td><td>-1</td><td>EEF1B2P3 </td><td>ENSG00000232472</td><td>222126</td></tr>
	<tr><td>chrX</td><td> 25034065</td><td> 25041498</td><td>chrX</td><td> 25038780</td><td> 25041498</td><td>Bcell_ClusteredCS</td><td>chrX</td><td> 25034065</td><td> 25034066</td><td> 0.005</td><td>-1</td><td>ARX      </td><td>ENSG00000004848</td><td>  4715</td></tr>
	<tr><td>chrX</td><td> 24807186</td><td> 25041498</td><td>chrX</td><td> 25038780</td><td> 25041498</td><td>Bcell_ClusteredCS</td><td>chrX</td><td> 24807186</td><td> 24807187</td><td> 1.605</td><td>-1</td><td>EEF1B2P3 </td><td>ENSG00000232472</td><td>231594</td></tr>
	<tr><td>chrX</td><td>128906836</td><td>128913956</td><td>chrX</td><td>128906836</td><td>128911774</td><td>Bcell_ClusteredCS</td><td>chrX</td><td>128913955</td><td>128913956</td><td>71.685</td><td> 1</td><td>SASH3    </td><td>ENSG00000122122</td><td>  2182</td></tr>
	<tr><td>chrX</td><td>128872950</td><td>128911774</td><td>chrX</td><td>128906836</td><td>128911774</td><td>Bcell_ClusteredCS</td><td>chrX</td><td>128872950</td><td>128872951</td><td> 0.090</td><td> 1</td><td>XPNPEP2  </td><td>ENSG00000122121</td><td> 33886</td></tr>
	<tr><td>chrX</td><td>152194910</td><td>152224767</td><td>chrX</td><td>152194910</td><td>152201486</td><td>Bcell_ClusteredCS</td><td>chrX</td><td>152224766</td><td>152224767</td><td> 0.010</td><td> 1</td><td>PNMA3    </td><td>ENSG00000183837</td><td> 23281</td></tr>
	<tr><td>chrX</td><td>152162671</td><td>152201486</td><td>chrX</td><td>152194910</td><td>152201486</td><td>Bcell_ClusteredCS</td><td>chrX</td><td>152162671</td><td>152162672</td><td> 0.010</td><td>-1</td><td>PNMA5    </td><td>ENSG00000198883</td><td> 32239</td></tr>
</tbody>
</table>




```R
Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% group_by(ChrHMR, StartHMR, EndHMR) %>% top_n(n = 1, wt = -HMRTSSDist) %>% nrow()
```


412



```R

```


```R
Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM
```


<table class="dataframe">
<caption>A tibble: 670 × 4</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th><th scope=col>HMRTSSDist</th><th scope=col>HMRGroup</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000002822</td><td> 21.650</td><td>304807</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000004848</td><td>  0.005</td><td>  9410</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000006116</td><td>  0.010</td><td>234975</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000006459</td><td>  0.460</td><td> 46006</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000007129</td><td>  5.185</td><td> 14212</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000007237</td><td> 21.120</td><td>145854</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000007312</td><td> 41.215</td><td>  3906</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000007923</td><td> 19.370</td><td>260017</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000008130</td><td> 32.945</td><td> 59923</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000008282</td><td> 25.425</td><td> 47952</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000008311</td><td>  0.170</td><td>162812</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000008441</td><td>  0.975</td><td>  7417</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000008853</td><td>  9.245</td><td>  5851</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000010278</td><td>  3.110</td><td>  3350</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000011105</td><td>  0.100</td><td>148106</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000011332</td><td>  1.500</td><td>179838</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000012124</td><td>106.370</td><td>     0</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000015171</td><td>  5.770</td><td>177443</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000015475</td><td> 49.280</td><td>  2175</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000019995</td><td>  3.185</td><td>115587</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000020633</td><td> 57.410</td><td>  7789</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000028310</td><td> 17.845</td><td> 64096</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000035115</td><td>  6.470</td><td>188712</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000036448</td><td>  0.105</td><td> 14049</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000039523</td><td> 12.500</td><td>     0</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000039600</td><td>  0.045</td><td> 73112</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000041802</td><td> 11.450</td><td> 16817</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000042062</td><td>  0.010</td><td>144097</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000043462</td><td> 15.040</td><td> 28849</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000043591</td><td>  1.605</td><td> 51815</td><td>Bcell_clustered</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>ENSG00000248508</td><td>   1.225</td><td> 54002</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000249129</td><td>   0.220</td><td> 25207</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000249222</td><td>   0.170</td><td> 21422</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000250462</td><td>   2.625</td><td> 76195</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000251013</td><td>   0.355</td><td> 49108</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000251075</td><td>   0.025</td><td> 26428</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000251562</td><td>1692.375</td><td>     0</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000254013</td><td>   0.010</td><td>274944</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000254029</td><td>   0.155</td><td> 17601</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000254206</td><td>   0.925</td><td> 55949</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000254703</td><td>   0.110</td><td> 17025</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000258477</td><td>   0.030</td><td>136259</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000258613</td><td>   0.525</td><td> 37318</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000258986</td><td>   0.010</td><td>210615</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000259078</td><td>   0.055</td><td> 48895</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000260231</td><td>   0.040</td><td> 45780</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000260456</td><td>   4.250</td><td> 38411</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000260828</td><td>   0.105</td><td>     0</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000261713</td><td>   0.020</td><td> 68204</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000263456</td><td>   0.845</td><td>  2361</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000263968</td><td>   1.860</td><td>261598</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000267534</td><td>   7.410</td><td>  4489</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000267679</td><td>   0.050</td><td>  1913</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000268388</td><td>   0.035</td><td>  4490</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000269220</td><td>   2.990</td><td>     0</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000269800</td><td>   0.100</td><td>  8745</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000269891</td><td>   2.165</td><td> 91648</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000270419</td><td>   0.545</td><td>292055</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000270959</td><td>   0.005</td><td>174248</td><td>Bcell_clustered</td></tr>
	<tr><td>ENSG00000273344</td><td>   2.685</td><td>279310</td><td>Bcell_clustered</td></tr>
</tbody>
</table>




```R
Bcell_clustersContainsCS_Unclustered.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM.distBin
```


<table class="dataframe">
<caption>A tibble: 2738 × 5</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th><th scope=col>HMRTSSDist</th><th scope=col>HMRGroup</th><th scope=col>distBin</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;fct&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000002822</td><td> 21.650</td><td>304807</td><td>Bcell_clustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000004848</td><td>  0.005</td><td>  9410</td><td>Bcell_clustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000006116</td><td><span style=white-space:pre-wrap>  0.010</span></td><td>234975</td><td>Bcell_clustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000006459</td><td>  0.460</td><td> 46006</td><td>Bcell_clustered</td><td>40-50 </td></tr>
	<tr><td>ENSG00000007129</td><td>  5.185</td><td> 14212</td><td>Bcell_clustered</td><td>10-20 </td></tr>
	<tr><td>ENSG00000007237</td><td> 21.120</td><td>145854</td><td>Bcell_clustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000007312</td><td> 41.215</td><td>  3906</td><td>Bcell_clustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000007923</td><td> 19.370</td><td>260017</td><td>Bcell_clustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000008130</td><td> 32.945</td><td> 59923</td><td>Bcell_clustered</td><td>50-100</td></tr>
	<tr><td>ENSG00000008282</td><td> 25.425</td><td> 47952</td><td>Bcell_clustered</td><td>40-50 </td></tr>
	<tr><td>ENSG00000008311</td><td><span style=white-space:pre-wrap>  0.170</span></td><td>162812</td><td>Bcell_clustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000008441</td><td>  0.975</td><td>  7417</td><td>Bcell_clustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000008853</td><td>  9.245</td><td>  5851</td><td>Bcell_clustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000010278</td><td>  3.110</td><td>  3350</td><td>Bcell_clustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000011105</td><td><span style=white-space:pre-wrap>  0.100</span></td><td>148106</td><td>Bcell_clustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000011332</td><td><span style=white-space:pre-wrap>  1.500</span></td><td>179838</td><td>Bcell_clustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000012124</td><td>106.370</td><td>     0</td><td>Bcell_clustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000015171</td><td><span style=white-space:pre-wrap>  5.770</span></td><td>177443</td><td>Bcell_clustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000015475</td><td> 49.280</td><td>  2175</td><td>Bcell_clustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000019995</td><td><span style=white-space:pre-wrap>  3.185</span></td><td>115587</td><td>Bcell_clustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000020633</td><td> 57.410</td><td>  7789</td><td>Bcell_clustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000028310</td><td> 17.845</td><td> 64096</td><td>Bcell_clustered</td><td>50-100</td></tr>
	<tr><td>ENSG00000035115</td><td><span style=white-space:pre-wrap>  6.470</span></td><td>188712</td><td>Bcell_clustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000036448</td><td>  0.105</td><td> 14049</td><td>Bcell_clustered</td><td>10-20 </td></tr>
	<tr><td>ENSG00000039523</td><td> 12.500</td><td>     0</td><td>Bcell_clustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000039600</td><td>  0.045</td><td> 73112</td><td>Bcell_clustered</td><td>50-100</td></tr>
	<tr><td>ENSG00000041802</td><td> 11.450</td><td> 16817</td><td>Bcell_clustered</td><td>10-20 </td></tr>
	<tr><td>ENSG00000042062</td><td><span style=white-space:pre-wrap>  0.010</span></td><td>144097</td><td>Bcell_clustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000043462</td><td> 15.040</td><td> 28849</td><td>Bcell_clustered</td><td>20-30 </td></tr>
	<tr><td>ENSG00000043591</td><td>  1.605</td><td> 51815</td><td>Bcell_clustered</td><td>50-100</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>ENSG00000259550</td><td><span style=white-space:pre-wrap>  0.015</span></td><td>381795</td><td>Bcell_unclustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000259863</td><td>  0.940</td><td> 50664</td><td>Bcell_unclustered</td><td>50-100</td></tr>
	<tr><td>ENSG00000260280</td><td>  0.735</td><td> 11608</td><td>Bcell_unclustered</td><td>10-20 </td></tr>
	<tr><td>ENSG00000260459</td><td>  0.250</td><td> 65351</td><td>Bcell_unclustered</td><td>50-100</td></tr>
	<tr><td>ENSG00000261824</td><td><span style=white-space:pre-wrap>  2.810</span></td><td>549135</td><td>Bcell_unclustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000262081</td><td>  0.010</td><td>  8435</td><td>Bcell_unclustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000262619</td><td>  0.010</td><td> 78812</td><td>Bcell_unclustered</td><td>50-100</td></tr>
	<tr><td>ENSG00000263006</td><td>  0.300</td><td> 11424</td><td>Bcell_unclustered</td><td>10-20 </td></tr>
	<tr><td>ENSG00000263327</td><td>  0.745</td><td> 20848</td><td>Bcell_unclustered</td><td>20-30 </td></tr>
	<tr><td>ENSG00000263941</td><td>  0.595</td><td>  2442</td><td>Bcell_unclustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000264462</td><td>509.020</td><td>118312</td><td>Bcell_unclustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000264663</td><td>  0.400</td><td> 41145</td><td>Bcell_unclustered</td><td>40-50 </td></tr>
	<tr><td>ENSG00000264958</td><td>  0.010</td><td> 20939</td><td>Bcell_unclustered</td><td>20-30 </td></tr>
	<tr><td>ENSG00000265123</td><td>  0.580</td><td> 93229</td><td>Bcell_unclustered</td><td>50-100</td></tr>
	<tr><td>ENSG00000265411</td><td>  0.295</td><td> 51173</td><td>Bcell_unclustered</td><td>50-100</td></tr>
	<tr><td>ENSG00000265646</td><td>  0.020</td><td> 87193</td><td>Bcell_unclustered</td><td>50-100</td></tr>
	<tr><td>ENSG00000265735</td><td><span style=white-space:pre-wrap>  0.335</span></td><td>459837</td><td>Bcell_unclustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000265802</td><td><span style=white-space:pre-wrap>  0.615</span></td><td>130419</td><td>Bcell_unclustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000266733</td><td>  0.230</td><td>  5599</td><td>Bcell_unclustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000266863</td><td>  0.120</td><td> 28525</td><td>Bcell_unclustered</td><td>20-30 </td></tr>
	<tr><td>ENSG00000267100</td><td>  3.900</td><td>  9177</td><td>Bcell_unclustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000267178</td><td>  0.420</td><td>  9551</td><td>Bcell_unclustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000267272</td><td><span style=white-space:pre-wrap>  0.075</span></td><td>683168</td><td>Bcell_unclustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000267697</td><td> 15.655</td><td>432050</td><td>Bcell_unclustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
	<tr><td>ENSG00000268006</td><td>  0.090</td><td>  7765</td><td>Bcell_unclustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000268471</td><td>  3.000</td><td> 25617</td><td>Bcell_unclustered</td><td>20-30 </td></tr>
	<tr><td>ENSG00000268785</td><td>  0.345</td><td>  8277</td><td>Bcell_unclustered</td><td>0-10  </td></tr>
	<tr><td>ENSG00000270066</td><td> 17.325</td><td> 54074</td><td>Bcell_unclustered</td><td>50-100</td></tr>
	<tr><td>ENSG00000270959</td><td>  0.005</td><td> 59985</td><td>Bcell_unclustered</td><td>50-100</td></tr>
	<tr><td>ENSG00000272620</td><td><span style=white-space:pre-wrap>  0.825</span></td><td>264592</td><td>Bcell_unclustered</td><td><span style=white-space:pre-wrap>&gt;100  </span></td></tr>
</tbody>
</table>




```R
threshold_list <- c(10000,25000,50000,75000,100000,150000)

numGene_CLcontainsCS <- tibble(
    thresholds = threshold_list,
    HMRGroup = "Bcell_clustersContainsCS"
)

numGene_UNCS <- tibble(
    thresholds = threshold_list,
    HMRGroup = "Bcell_unclustered"
)


get_numGenes_per_threshold <- function(thresh, df){
    df %>% filter(HMRTSSDist < thresh) %>% group_by(nrow()
}
```


```R
# Get numbers by threshold

# CLusters that contain Cell Specific 
CLcontainsCS_counts <- map(threshold_list, get_numGenes_per_threshold, df = Bcell_clusters_containsCS.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM)

numGene_CLcontainsCS$HMRCounts <- unlist(CLcontainsCS_counts)

# UNclustered Cell specific 
UNCS_counts <- map(threshold_list, get_numGenes_per_threshold, df = Bcell_unclustered_cellspecific.2NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.uniqueENSGTSS_TPM)

numGene_UNCS$HMRCounts <- unlist(UNCS_counts)
```


```R
numGene_CLcontainsCS_fraction <- numGene_CLcontainsCS %>% mutate(fraction = (HMRCounts/484) )
numGene_UNCS_fraction <- numGene_UNCS %>% mutate(fraction = (HMRCounts/1844) )

numGene_CLcontainsCS_UNCS_fraction <- rbind(numGene_CLcontainsCS_fraction, numGene_UNCS_fraction)
```


```R
p_numGene <- numGene_CLcontainsCS_UNCS_fraction %>%
ggplot(aes(x = thresholds, y = fraction, color = HMRGroup)) +
geom_point() + 
geom_line() +
theme_minimal() +
scale_color_manual(values=c("#B0DAB6", "#3990C0")) +
theme(aspect.ratio = .7, legend.position = "top") +
scale_x_continuous(breaks=threshold_list) +
ylab("Fraction HMRs with Gene Assignment")
p_numGene
```


![png](output_65_0.png)


## Fraction ratio


```R
numGene_CLcontainsCS_UNCS_fractionRatio <- merge(numGene_CLcontainsCS_fraction, numGene_UNCS_fraction, by = "thresholds") %>% mutate(fractionRatio = (fraction.x/fraction.y))
```


```R
numGene_CLcontainsCS_UNCS_fractionRatio
```


<table class="dataframe">
<caption>A data.frame: 6 × 8</caption>
<thead>
	<tr><th scope=col>thresholds</th><th scope=col>HMRGroup.x</th><th scope=col>HMRCounts.x</th><th scope=col>fraction.x</th><th scope=col>HMRGroup.y</th><th scope=col>HMRCounts.y</th><th scope=col>fraction.y</th><th scope=col>fractionRatio</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 10000</td><td>Bcell_clustersContainsCS</td><td>150</td><td>0.3099174</td><td>Bcell_unclustered</td><td> 122</td><td>0.06616052</td><td>4.684325</td></tr>
	<tr><td> 25000</td><td>Bcell_clustersContainsCS</td><td>268</td><td>0.5537190</td><td>Bcell_unclustered</td><td> 465</td><td>0.25216920</td><td>2.195823</td></tr>
	<tr><td> 50000</td><td>Bcell_clustersContainsCS</td><td>398</td><td>0.8223140</td><td>Bcell_unclustered</td><td> 904</td><td>0.49023861</td><td>1.677375</td></tr>
	<tr><td> 75000</td><td>Bcell_clustersContainsCS</td><td>472</td><td>0.9752066</td><td>Bcell_unclustered</td><td>1177</td><td>0.63828633</td><td>1.527851</td></tr>
	<tr><td>100000</td><td>Bcell_clustersContainsCS</td><td>521</td><td>1.0764463</td><td>Bcell_unclustered</td><td>1377</td><td>0.74674620</td><td>1.441516</td></tr>
	<tr><td>150000</td><td>Bcell_clustersContainsCS</td><td>578</td><td>1.1942149</td><td>Bcell_unclustered</td><td>1625</td><td>0.88123644</td><td>1.355158</td></tr>
</tbody>
</table>




```R
p_numGeneFraction <- numGene_CLcontainsCS_UNCS_fractionRatio %>% 
ggplot(aes(x = thresholds, y = fractionRatio)) +
geom_point() + 
geom_line() +
geom_hline(yintercept = 0, color = "red") + 
coord_cartesian(ylim = c(-5,5)) +
theme_minimal() +
scale_x_continuous(breaks=threshold_list) + 
theme(aspect.ratio = .25) +
ylab("FractionCL/FractionUN")

p_numGeneFraction
```


![png](output_69_0.png)


## Plot together


```R

```


```R
ggpubr::ggarrange(p_numGene, p_numGeneFraction, nrow = 2, align = "v", heights = c(4, 1.539))
```


![png](output_72_0.png)



```R

```

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


    Error in parse(text = x, srcfile = src): <text>:1:10: unexpected '/'
    1: HOME_DIR=/
                 ^
    Traceback:




```R
# Bcell 
bedtools sort -i ${REF_DIR}GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.txt | awk 'BEGIN{OFS=FS="\t"}{print }' - > ${REF_DIR}GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.sorted.txt

echo "Done."
```


```R
# Initalize HMR files 
CLUSTERED_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_internalClusters_individualHMRs_cellspecific_hpl.txt
UNCLUSTERED_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_unclustered_cellspecific_hpl.txt

awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,"Bcell_ClusteredCS"}' ${CLUSTERED_CS_FILE} | bedtools sort -i - > ${INTER_DIR}Bcell.clustered_cs.tmp_sorted.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,"Bcell_UnclusteredCS"}' ${UNCLUSTERED_CS_FILE} | bedtools sort -i - > ${INTER_DIR}Bcell.unclustered_cs.tmp_sorted.txt

echo "Done."

## How many clusters are represented by the individual clustered cell specific HMRs
bedtools intersect -u -a /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_internalClusters_hpl.txt -b /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_internalClusters_individualHMRs_cellspecific_hpl.txt > ${INTER_DIR}Bcell_internalClusters_hpl.containsCellSpecificHMR.txt

wc -l ${INTER_DIR}Bcell_internalClusters_hpl.containsCellSpecificHMR.txt

awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3,"Bcell_ClusteredCS"}' ${INTER_DIR}Bcell_internalClusters_hpl.containsCellSpecificHMR.txt | bedtools sort -i - > ${INTER_DIR}Bcell_internalClusters_hpl.containsCellSpecificHMR.tmp_sorted.txt

echo "Done."
```


```R
bedtools closest -d -k 100 -a ${INTER_DIR}Bcell_internalClusters_hpl.containsCellSpecificHMR.tmp_sorted.txt -b ${REF_DIR}GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.sorted.txt > ${INTER_DIR}Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt

echo "Done."
```

    Done.



```R
bedtools closest -d -k 100 -a ${INTER_DIR}Bcell.unclustered_cs.tmp_sorted.txt -b ${REF_DIR}GM_ENSG_TPM_avg12_noVersion_hasHGNC_minTPM0.sorted.txt > ${INTER_DIR}Bcell_unclustered_cellspecific.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt

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
}' ${INTER_DIR}Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt 

awk 'BEGIN{OFS=FS="\t"}{if ($2<$6)
print $1,$2,$7,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
else print $1,$6,$3,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12;
}' ${INTER_DIR}Bcell_unclustered_cellspecific.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Bcell_unclustered_cellspecific.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt

echo "Made continuous BED file."

```

    Made continuous BED file.



```R
bedtools intersect -f 1.0 -a ${INTER_DIR}Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt \
-b ${REF_DIR}GM12878_Lieberman-raw_TADs.txt > ${INTER_DIR}Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt

bedtools intersect -f 1.0 -a ${INTER_DIR}Bcell_unclustered_cellspecific.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.ContinuousBEDFormat.txt  \
-b ${REF_DIR}GM12878_Lieberman-raw_TADs.txt > ${INTER_DIR}Bcell_unclustered_cellspecific.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt

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
Bcell_clusters_containsCS <- read_tsv("/data/hodges_lab/Tim/nnRNA_TPM_EHGM/intermediate_files/Bcell_internalClusters_hpl.containsCellSpecificHMR.txt", col_names = c("chr","start","end","numHMRs"))

Bcell_unclustered_CS <- 
read_tsv("/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/HMRs/Bcell_unclustered_cellspecific_hpl.txt",  col_names = c("chr","start","end"))
```

    [1mRows: [22m[34m484[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, numHMRs
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m1844[39m [1mColumns: [22m[34m3[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (2): start, end
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



```R
Bcell_clusters_containsCS %>% filter(chr!="chrY") %>% nrow()
```


444



```R
Bcell_unclustered_CS %>% filter(chr!="chrY") %>% nrow()
```


1621



```R
Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered <- read_tsv("../intermediate_files/Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRTSS","StartHMRTSS","EndHMRTSS","ChrHMR","StartHMR","EndHMR","HMRGroup","ChrTSS","StartTSS","EndTSS","TPM","strand","GENE_SYMBOL","ENSEMBL","HMRTSSDist")) 


Bcell_unclustered_cellspecific.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered <- read_tsv("../intermediate_files/Bcell_unclustered_cellspecific.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRTSS","StartHMRTSS","EndHMRTSS","ChrHMR","StartHMR","EndHMR","HMRGroup","ChrTSS","StartTSS","EndTSS","TPM","strand","GENE_SYMBOL","ENSEMBL","HMRTSSDist"))
```

    [1mRows: [22m[34m4210[39m [1mColumns: [22m[34m15[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (6): X1, X4, X7, X8, X13, X14
    [32mdbl[39m (9): X2, X3, X5, X6, X9, X10, X11, X12, X15
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m11105[39m [1mColumns: [22m[34m15[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (6): X1, X4, X7, X8, X13, X14
    [32mdbl[39m (9): X2, X3, X5, X6, X9, X10, X11, X12, X15
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



```R
Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% nrow()
```


4210



```R
Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% group_by(ChrHMR, StartHMR) %>% top_n(n = 1, wt = -HMRTSSDist) %>% nrow()
```


426



```R
Bcell_clusters_containsCS %>% filter(chr!="chrY") %>% nrow()
Bcell_clusters_containsCS_noY <- Bcell_clusters_containsCS %>% filter(chr!="chrY")
Bcell_clusters_containsCS_noY %>% nrow()
```


444



444


### Why are not all HMRs represented here?


```R
Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered_eachHMR <-Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% group_by(ChrHMR, StartHMR) %>% top_n(n = 1, wt = -HMRTSSDist)
```


```R
head(Bcell_clusters_containsCS_noY, 3)
head(Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered_eachHMR, 3)
```


<table class="dataframe">
<caption>A tibble: 3 × 4</caption>
<thead>
	<tr><th scope=col>chr</th><th scope=col>start</th><th scope=col>end</th><th scope=col>numHMRs</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1</td><td> 993725</td><td>1006171</td><td>6</td></tr>
	<tr><td>chr1</td><td>1092645</td><td>1106080</td><td>5</td></tr>
	<tr><td>chr1</td><td>1771819</td><td>1779732</td><td>3</td></tr>
</tbody>
</table>




<table class="dataframe">
<caption>A grouped_df: 3 × 15</caption>
<thead>
	<tr><th scope=col>ChrHMRTSS</th><th scope=col>StartHMRTSS</th><th scope=col>EndHMRTSS</th><th scope=col>ChrHMR</th><th scope=col>StartHMR</th><th scope=col>EndHMR</th><th scope=col>HMRGroup</th><th scope=col>ChrTSS</th><th scope=col>StartTSS</th><th scope=col>EndTSS</th><th scope=col>TPM</th><th scope=col>strand</th><th scope=col>GENE_SYMBOL</th><th scope=col>ENSEMBL</th><th scope=col>HMRTSSDist</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1</td><td> 993725</td><td>1009688</td><td>chr1</td><td> 993725</td><td>1006171</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>1009687</td><td>1009688</td><td>  0.005</td><td>-1</td><td>RNF223</td><td>ENSG00000237330</td><td> 3517</td></tr>
	<tr><td>chr1</td><td>1092645</td><td>1109265</td><td>chr1</td><td>1092645</td><td>1106080</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>1109264</td><td>1109265</td><td>  0.020</td><td> 1</td><td>TTLL10</td><td>ENSG00000162571</td><td> 3185</td></tr>
	<tr><td>chr1</td><td>1771819</td><td>1822496</td><td>chr1</td><td>1771819</td><td>1779732</td><td>Bcell_ClusteredCS</td><td>chr1</td><td>1822495</td><td>1822496</td><td>126.210</td><td>-1</td><td>GNB1  </td><td>ENSG00000078369</td><td>42764</td></tr>
</tbody>
</table>




```R
### I just want to figure out what HMRs aren't represented in this list 
```


```R
Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered_eachHMR_ChrStrEnd <- Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered_eachHMR %>% ungroup %>% mutate(ChrStrEnd = paste0(ChrHMR, StartHMR, EndHMR))
```


```R
# Check for HMRs from 444 file that aren't in the 426
Bcell_clusters_containsCS_noY_ChrStrEnd <- Bcell_clusters_containsCS_noY %>% mutate(ChrStrEnd = paste0(chr, start, end))


head(Bcell_clusters_containsCS_noY_ChrStrEnd, 3)
```


<table class="dataframe">
<caption>A tibble: 3 × 5</caption>
<thead>
	<tr><th scope=col>chr</th><th scope=col>start</th><th scope=col>end</th><th scope=col>numHMRs</th><th scope=col>ChrStrEnd</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1</td><td> 993725</td><td>1006171</td><td>6</td><td>chr19937251006171 </td></tr>
	<tr><td>chr1</td><td>1092645</td><td>1106080</td><td>5</td><td>chr110926451106080</td></tr>
	<tr><td>chr1</td><td>1771819</td><td>1779732</td><td>3</td><td>chr117718191779732</td></tr>
</tbody>
</table>




```R
nrow(Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered_eachHMR_ChrStrEnd)
nrow(Bcell_clusters_containsCS_noY_ChrStrEnd)
```


426



444



```R
Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered_eachHMR
```


<table class="dataframe">
<caption>A grouped_df: 426 × 15</caption>
<thead>
	<tr><th scope=col>ChrHMRTSS</th><th scope=col>StartHMRTSS</th><th scope=col>EndHMRTSS</th><th scope=col>ChrHMR</th><th scope=col>StartHMR</th><th scope=col>EndHMR</th><th scope=col>HMRGroup</th><th scope=col>ChrTSS</th><th scope=col>StartTSS</th><th scope=col>EndTSS</th><th scope=col>TPM</th><th scope=col>strand</th><th scope=col>GENE_SYMBOL</th><th scope=col>ENSEMBL</th><th scope=col>HMRTSSDist</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1 </td><td>   993725</td><td>  1009688</td><td>chr1 </td><td>   993725</td><td>  1006171</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>  1009687</td><td>  1009688</td><td>  0.005</td><td>-1</td><td>RNF223      </td><td>ENSG00000237330</td><td>  3517</td></tr>
	<tr><td>chr1 </td><td>  1092645</td><td>  1109265</td><td>chr1 </td><td>  1092645</td><td>  1106080</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>  1109264</td><td>  1109265</td><td>  0.020</td><td> 1</td><td>TTLL10      </td><td>ENSG00000162571</td><td>  3185</td></tr>
	<tr><td>chr1 </td><td>  1771819</td><td>  1822496</td><td>chr1 </td><td>  1771819</td><td>  1779732</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>  1822495</td><td>  1822496</td><td>126.210</td><td>-1</td><td>GNB1        </td><td>ENSG00000078369</td><td> 42764</td></tr>
	<tr><td>chr1 </td><td>  1822495</td><td>  1841244</td><td>chr1 </td><td>  1827360</td><td>  1841244</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>  1822495</td><td>  1822496</td><td>126.210</td><td>-1</td><td>GNB1        </td><td>ENSG00000078369</td><td>  4865</td></tr>
	<tr><td>chr1 </td><td>  3513491</td><td>  3528060</td><td>chr1 </td><td>  3513491</td><td>  3516570</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>  3528059</td><td>  3528060</td><td>  0.140</td><td>-1</td><td>MEGF6       </td><td>ENSG00000162591</td><td> 11490</td></tr>
	<tr><td>chr1 </td><td>  3569325</td><td>  3595883</td><td>chr1 </td><td>  3582641</td><td>  3595883</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>  3569325</td><td>  3569326</td><td> 15.720</td><td>-1</td><td>WRAP73      </td><td>ENSG00000116213</td><td> 13316</td></tr>
	<tr><td>chr1 </td><td>  3634649</td><td>  3663901</td><td>chr1 </td><td>  3634649</td><td>  3636909</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>  3663900</td><td>  3663901</td><td>  4.680</td><td>-1</td><td>TP73-AS1    </td><td>ENSG00000227372</td><td> 26992</td></tr>
	<tr><td>chr1 </td><td>  6845384</td><td>  7029550</td><td>chr1 </td><td>  7022001</td><td>  7029550</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>  6845384</td><td>  6845385</td><td> 21.875</td><td> 1</td><td>CAMTA1      </td><td>ENSG00000171735</td><td>176617</td></tr>
	<tr><td>chr1 </td><td>  9352939</td><td>  9489443</td><td>chr1 </td><td>  9458264</td><td>  9489443</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>  9352939</td><td>  9352940</td><td>  0.350</td><td> 1</td><td>SPSB1       </td><td>ENSG00000171621</td><td>105325</td></tr>
	<tr><td>chr1 </td><td> 14925200</td><td> 15069394</td><td>chr1 </td><td> 15059881</td><td> 15069394</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td> 14925200</td><td> 14925201</td><td>  1.670</td><td> 1</td><td>KAZN        </td><td>ENSG00000189337</td><td>134681</td></tr>
	<tr><td>chr1 </td><td> 16157273</td><td> 16174360</td><td>chr1 </td><td> 16157273</td><td> 16164333</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td> 16174359</td><td> 16174360</td><td> 22.265</td><td> 1</td><td>SPEN        </td><td>ENSG00000065526</td><td> 10027</td></tr>
	<tr><td>chr1 </td><td> 21835858</td><td> 21851814</td><td>chr1 </td><td> 21840391</td><td> 21851814</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td> 21835858</td><td> 21835859</td><td>  0.140</td><td> 1</td><td>ALPL        </td><td>ENSG00000162551</td><td>  4533</td></tr>
	<tr><td>chr1 </td><td> 24194784</td><td> 24238716</td><td>chr1 </td><td> 24225643</td><td> 24238716</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td> 24194784</td><td> 24194785</td><td> 16.030</td><td>-1</td><td>FUCA1       </td><td>ENSG00000179163</td><td> 30859</td></tr>
	<tr><td>chr1 </td><td> 25273916</td><td> 25291613</td><td>chr1 </td><td> 25273916</td><td> 25283824</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td> 25291612</td><td> 25291613</td><td> 57.410</td><td>-1</td><td>RUNX3       </td><td>ENSG00000020633</td><td>  7789</td></tr>
	<tr><td>chr1 </td><td> 25291612</td><td> 25361098</td><td>chr1 </td><td> 25345700</td><td> 25361098</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td> 25291612</td><td> 25291613</td><td> 57.410</td><td>-1</td><td>RUNX3       </td><td>ENSG00000020633</td><td> 54088</td></tr>
	<tr><td>chr1 </td><td> 32785645</td><td> 32801981</td><td>chr1 </td><td> 32785645</td><td> 32788472</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td> 32801980</td><td> 32801981</td><td> 70.905</td><td>-1</td><td>MARCKSL1    </td><td>ENSG00000175130</td><td> 13509</td></tr>
	<tr><td>chr1 </td><td> 43409892</td><td> 43424531</td><td>chr1 </td><td> 43409892</td><td> 43421697</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td> 43424530</td><td> 43424531</td><td> 23.395</td><td>-1</td><td>SLC2A1      </td><td>ENSG00000117394</td><td>  2834</td></tr>
	<tr><td>chr1 </td><td> 91185246</td><td> 91359170</td><td>chr1 </td><td> 91185246</td><td> 91196783</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td> 91359169</td><td> 91359170</td><td>  0.285</td><td>-1</td><td>PHKA1P1     </td><td>ENSG00000232882</td><td>162387</td></tr>
	<tr><td>chr1 </td><td>150533428</td><td>150533970</td><td>chr1 </td><td>150533428</td><td>150546153</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>150533969</td><td>150533970</td><td>  0.745</td><td>-1</td><td>ADAMTSL4-AS1</td><td>ENSG00000203804</td><td>     0</td></tr>
	<tr><td>chr1 </td><td>155192847</td><td>155197215</td><td>chr1 </td><td>155192847</td><td>155197995</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>155197214</td><td>155197215</td><td>  2.540</td><td>-1</td><td>GBAP1       </td><td>ENSG00000160766</td><td>     0</td></tr>
	<tr><td>chr1 </td><td>205249213</td><td>205290884</td><td>chr1 </td><td>205249213</td><td>205257825</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>205290883</td><td>205290884</td><td>  1.155</td><td>-1</td><td>NUAK2       </td><td>ENSG00000163545</td><td> 33059</td></tr>
	<tr><td>chr1 </td><td>206293769</td><td>206317460</td><td>chr1 </td><td>206293769</td><td>206306539</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>206317459</td><td>206317460</td><td>  0.070</td><td> 1</td><td>CTSE        </td><td>ENSG00000196188</td><td> 10921</td></tr>
	<tr><td>chr1 </td><td>220943946</td><td>220960102</td><td>chr1 </td><td>220943946</td><td>220950369</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>220960101</td><td>220960102</td><td>  0.275</td><td> 1</td><td>MARC1       </td><td>ENSG00000186205</td><td>  9733</td></tr>
	<tr><td>chr1 </td><td>225616627</td><td>225669088</td><td>chr1 </td><td>225662652</td><td>225669088</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>225616627</td><td>225616628</td><td> 46.530</td><td>-1</td><td>LBR         </td><td>ENSG00000143815</td><td> 46025</td></tr>
	<tr><td>chr1 </td><td>226308851</td><td>226374432</td><td>chr1 </td><td>226308851</td><td>226320493</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>226374431</td><td>226374432</td><td>  8.205</td><td>-1</td><td>ACBD3       </td><td>ENSG00000182827</td><td> 53939</td></tr>
	<tr><td>chr1 </td><td>236046940</td><td>236102739</td><td>chr1 </td><td>236094535</td><td>236102739</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>236046940</td><td>236046941</td><td>  3.105</td><td>-1</td><td>LYST        </td><td>ENSG00000143669</td><td> 47595</td></tr>
	<tr><td>chr1 </td><td>243419320</td><td>243671823</td><td>chr1 </td><td>243669272</td><td>243671823</td><td>Bcell_ClusteredCS</td><td>chr1 </td><td>243419320</td><td>243419321</td><td>  6.215</td><td> 1</td><td>SDCCAG8     </td><td>ENSG00000054282</td><td>249952</td></tr>
	<tr><td>chr10</td><td>   180405</td><td>   370123</td><td>chr10</td><td>   357848</td><td>   370123</td><td>Bcell_ClusteredCS</td><td>chr10</td><td>   180405</td><td>   180406</td><td>  5.770</td><td> 1</td><td>ZMYND11     </td><td>ENSG00000015171</td><td>177443</td></tr>
	<tr><td>chr10</td><td>  1462846</td><td>  1568833</td><td>chr10</td><td>  1462846</td><td>  1468640</td><td>Bcell_ClusteredCS</td><td>chr10</td><td>  1568832</td><td>  1568833</td><td>  0.050</td><td> 1</td><td>ADARB2-AS1  </td><td>ENSG00000205696</td><td>100193</td></tr>
	<tr><td>chr10</td><td>  1496863</td><td>  1568833</td><td>chr10</td><td>  1496863</td><td>  1507737</td><td>Bcell_ClusteredCS</td><td>chr10</td><td>  1568832</td><td>  1568833</td><td>  0.050</td><td> 1</td><td>ADARB2-AS1  </td><td>ENSG00000205696</td><td> 61096</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>chr8</td><td>142085703</td><td>142127378</td><td>chr8</td><td>142085703</td><td>142119692</td><td>Bcell_ClusteredCS</td><td>chr8</td><td>142127377</td><td>142127378</td><td>31.535</td><td> 1</td><td>DENND3   </td><td>ENSG00000105339</td><td>   7686</td></tr>
	<tr><td>chr8</td><td>144403627</td><td>144442150</td><td>chr8</td><td>144403627</td><td>144405111</td><td>Bcell_ClusteredCS</td><td>chr8</td><td>144442149</td><td>144442150</td><td> 3.550</td><td>-1</td><td>TOP1MT   </td><td>ENSG00000184428</td><td>  37039</td></tr>
	<tr><td>chr8</td><td>144480155</td><td>144512577</td><td>chr8</td><td>144480155</td><td>144490455</td><td>Bcell_ClusteredCS</td><td>chr8</td><td>144512576</td><td>144512577</td><td> 0.045</td><td>-1</td><td>MAFA     </td><td>ENSG00000182759</td><td>  22122</td></tr>
	<tr><td>chr9</td><td> 33135465</td><td> 33167355</td><td>chr9</td><td> 33135465</td><td> 33142940</td><td>Bcell_ClusteredCS</td><td>chr9</td><td> 33167354</td><td> 33167355</td><td>29.965</td><td>-1</td><td>B4GALT1  </td><td>ENSG00000086062</td><td>  24415</td></tr>
	<tr><td>chr9</td><td> 37369663</td><td> 37422664</td><td>chr9</td><td> 37369663</td><td> 37387382</td><td>Bcell_ClusteredCS</td><td>chr9</td><td> 37422663</td><td> 37422664</td><td>47.325</td><td> 1</td><td>GRHPR    </td><td>ENSG00000137106</td><td>  35282</td></tr>
	<tr><td>chr9</td><td> 79034752</td><td> 79195297</td><td>chr9</td><td> 79186412</td><td> 79195297</td><td>Bcell_ClusteredCS</td><td>chr9</td><td> 79034752</td><td> 79034753</td><td> 4.310</td><td> 1</td><td>GCNT1    </td><td>ENSG00000187210</td><td> 151660</td></tr>
	<tr><td>chr9</td><td> 91392000</td><td> 91606363</td><td>chr9</td><td> 91392000</td><td> 91398891</td><td>Bcell_ClusteredCS</td><td>chr9</td><td> 91606362</td><td> 91606363</td><td> 0.045</td><td> 1</td><td>S1PR3    </td><td>ENSG00000213694</td><td> 207472</td></tr>
	<tr><td>chr9</td><td> 93925075</td><td> 94124196</td><td>chr9</td><td> 93925075</td><td> 93927265</td><td>Bcell_ClusteredCS</td><td>chr9</td><td> 94124195</td><td> 94124196</td><td> 1.855</td><td>-1</td><td>AUH      </td><td>ENSG00000148090</td><td> 196931</td></tr>
	<tr><td>chr9</td><td> 94599481</td><td> 94712445</td><td>chr9</td><td> 94599481</td><td> 94610352</td><td>Bcell_ClusteredCS</td><td>chr9</td><td> 94712444</td><td> 94712445</td><td> 0.015</td><td>-1</td><td>ROR2     </td><td>ENSG00000169071</td><td> 102093</td></tr>
	<tr><td>chr9</td><td> 95896570</td><td> 95906762</td><td>chr9</td><td> 95900405</td><td> 95906762</td><td>Bcell_ClusteredCS</td><td>chr9</td><td> 95896570</td><td> 95896571</td><td> 6.050</td><td>-1</td><td>NINJ1    </td><td>ENSG00000131669</td><td>   3835</td></tr>
	<tr><td>chr9</td><td>124329336</td><td>124415172</td><td>chr9</td><td>124408352</td><td>124415172</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>124329336</td><td>124329337</td><td> 0.110</td><td> 1</td><td>DAB2IP   </td><td>ENSG00000136848</td><td>  79016</td></tr>
	<tr><td>chr9</td><td>133806928</td><td>133814674</td><td>chr9</td><td>133806928</td><td>133809361</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>133814673</td><td>133814674</td><td> 0.200</td><td>-1</td><td>FIBCD1   </td><td>ENSG00000130720</td><td>   5313</td></tr>
	<tr><td>chr9</td><td>134543563</td><td>134600855</td><td>chr9</td><td>134543563</td><td>134554199</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>134600854</td><td>134600855</td><td> 1.425</td><td>-1</td><td>RN7SL328P</td><td>ENSG00000240853</td><td>  46656</td></tr>
	<tr><td>chr9</td><td>134600212</td><td>134600855</td><td>chr9</td><td>134600212</td><td>134610047</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>134600854</td><td>134600855</td><td> 1.425</td><td>-1</td><td>RN7SL328P</td><td>ENSG00000240853</td><td>      0</td></tr>
	<tr><td>chr9</td><td>135670260</td><td>135753415</td><td>chr9</td><td>135670260</td><td>135686084</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>135753414</td><td>135753415</td><td> 0.695</td><td> 1</td><td>C9orf9   </td><td>ENSG00000165698</td><td>  67331</td></tr>
	<tr><td>chr9</td><td>136819872</td><td>136857727</td><td>chr9</td><td>136819872</td><td>136826961</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>136857726</td><td>136857727</td><td>15.320</td><td>-1</td><td>VAV2     </td><td>ENSG00000160293</td><td>  30766</td></tr>
	<tr><td>chr9</td><td>136833640</td><td>136857727</td><td>chr9</td><td>136833640</td><td>136844990</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>136857726</td><td>136857727</td><td>15.320</td><td>-1</td><td>VAV2     </td><td>ENSG00000160293</td><td>  12737</td></tr>
	<tr><td>chr9</td><td>137155515</td><td>137208945</td><td>chr9</td><td>137155515</td><td>137168873</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>137208944</td><td>137208945</td><td>13.195</td><td> 1</td><td>RXRA     </td><td>ENSG00000186350</td><td>  40072</td></tr>
	<tr><td>chr9</td><td>137809809</td><td>137829664</td><td>chr9</td><td>137820839</td><td>137829664</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>137809809</td><td>137809810</td><td> 0.015</td><td>-1</td><td>FCN1     </td><td>ENSG00000085265</td><td>  11030</td></tr>
	<tr><td>chr9</td><td>139123711</td><td>139137688</td><td>chr9</td><td>139123711</td><td>139132236</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>139137687</td><td>139137688</td><td> 6.105</td><td>-1</td><td>QSOX2    </td><td>ENSG00000165661</td><td>   5452</td></tr>
	<tr><td>chr9</td><td>139512623</td><td>139553309</td><td>chr9</td><td>139512623</td><td>139526799</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>139553308</td><td>139553309</td><td> 0.210</td><td> 1</td><td>EGFL7    </td><td>ENSG00000172889</td><td>  26510</td></tr>
	<tr><td>chr9</td><td>140012985</td><td>140032843</td><td>chr9</td><td>140012985</td><td>140031230</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>140032842</td><td>140032843</td><td> 0.085</td><td> 1</td><td>GRIN1    </td><td>ENSG00000176884</td><td>   1613</td></tr>
	<tr><td>chr9</td><td>140277941</td><td>140317715</td><td>chr9</td><td>140277941</td><td>140285199</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>140317714</td><td>140317715</td><td> 2.565</td><td>-1</td><td>EXD3     </td><td>ENSG00000187609</td><td>  32516</td></tr>
	<tr><td>chr9</td><td>140301257</td><td>140317715</td><td>chr9</td><td>140301257</td><td>140306631</td><td>Bcell_ClusteredCS</td><td>chr9</td><td>140317714</td><td>140317715</td><td> 2.565</td><td>-1</td><td>EXD3     </td><td>ENSG00000187609</td><td>  11084</td></tr>
	<tr><td>chrX</td><td> 25023135</td><td> 25034066</td><td>chrX</td><td> 25023135</td><td> 25024656</td><td>Bcell_ClusteredCS</td><td>chrX</td><td> 25034065</td><td> 25034066</td><td> 0.005</td><td>-1</td><td>ARX      </td><td>ENSG00000004848</td><td>   9410</td></tr>
	<tr><td>chrX</td><td> 25029312</td><td> 25034066</td><td>chrX</td><td> 25029312</td><td> 25030802</td><td>Bcell_ClusteredCS</td><td>chrX</td><td> 25034065</td><td> 25034066</td><td> 0.005</td><td>-1</td><td>ARX      </td><td>ENSG00000004848</td><td>   3264</td></tr>
	<tr><td>chrX</td><td> 25034065</td><td> 25041498</td><td>chrX</td><td> 25038780</td><td> 25041498</td><td>Bcell_ClusteredCS</td><td>chrX</td><td> 25034065</td><td> 25034066</td><td> 0.005</td><td>-1</td><td>ARX      </td><td>ENSG00000004848</td><td>   4715</td></tr>
	<tr><td>chrX</td><td> 80457442</td><td> 82760652</td><td>chrX</td><td> 82756151</td><td> 82760652</td><td>Bcell_ClusteredCS</td><td>chrX</td><td> 80457442</td><td> 80457443</td><td>35.375</td><td> 1</td><td>SH3BGRL  </td><td>ENSG00000131171</td><td>2298709</td></tr>
	<tr><td>chrX</td><td>128906836</td><td>128913956</td><td>chrX</td><td>128906836</td><td>128911774</td><td>Bcell_ClusteredCS</td><td>chrX</td><td>128913955</td><td>128913956</td><td>71.685</td><td> 1</td><td>SASH3    </td><td>ENSG00000122122</td><td>   2182</td></tr>
	<tr><td>chrX</td><td>152194910</td><td>152224767</td><td>chrX</td><td>152194910</td><td>152201486</td><td>Bcell_ClusteredCS</td><td>chrX</td><td>152224766</td><td>152224767</td><td> 0.010</td><td> 1</td><td>PNMA3    </td><td>ENSG00000183837</td><td>  23281</td></tr>
</tbody>
</table>




```R
any(Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered_eachHMR$GENE_SYMBOL %in% c("AJAP1"))
```


FALSE



```R
Bcell_clusters_containsCS_noY_ChrStrEnd[!Bcell_clusters_containsCS_noY_ChrStrEnd$ChrStrEnd %in% Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered_eachHMR_ChrStrEnd$ChrStrEnd,]
```


<table class="dataframe">
<caption>A tibble: 20 × 5</caption>
<thead>
	<tr><th scope=col>chr</th><th scope=col>start</th><th scope=col>end</th><th scope=col>numHMRs</th><th scope=col>ChrStrEnd</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1 </td><td>  5563453</td><td>  5574936</td><td> 3</td><td>chr155634535574936     </td></tr>
	<tr><td>chr11</td><td> 47874951</td><td> 47886929</td><td> 4</td><td>chr114787495147886929  </td></tr>
	<tr><td>chr11</td><td>130270630</td><td>130272416</td><td> 3</td><td>chr11130270630130272416</td></tr>
	<tr><td>chr12</td><td>  3151454</td><td>  3159745</td><td> 3</td><td>chr1231514543159745    </td></tr>
	<tr><td>chr14</td><td>105997956</td><td>106004559</td><td> 3</td><td>chr14105997956106004559</td></tr>
	<tr><td>chr14</td><td>106023653</td><td>106058328</td><td>11</td><td>chr14106023653106058328</td></tr>
	<tr><td>chr15</td><td> 42219962</td><td> 42227869</td><td> 3</td><td>chr154221996242227869  </td></tr>
	<tr><td>chr15</td><td> 74665831</td><td> 74679743</td><td> 6</td><td>chr157466583174679743  </td></tr>
	<tr><td>chr15</td><td> 79043350</td><td> 79051465</td><td> 3</td><td>chr157904335079051465  </td></tr>
	<tr><td>chr17</td><td> 38771130</td><td> 38780459</td><td> 3</td><td>chr173877113038780459  </td></tr>
	<tr><td>chr19</td><td> 38411445</td><td> 38423882</td><td> 5</td><td>chr193841144538423882  </td></tr>
	<tr><td>chr2 </td><td> 87807053</td><td> 87821292</td><td> 5</td><td>chr28780705387821292   </td></tr>
	<tr><td>chr2 </td><td>162282968</td><td>162284664</td><td> 4</td><td>chr2162282968162284664 </td></tr>
	<tr><td>chr2 </td><td>241851445</td><td>241856613</td><td> 3</td><td>chr2241851445241856613 </td></tr>
	<tr><td>chr3 </td><td>147114322</td><td>147120317</td><td> 4</td><td>chr3147114322147120317 </td></tr>
	<tr><td>chr3 </td><td>195351767</td><td>195362614</td><td> 4</td><td>chr3195351767195362614 </td></tr>
	<tr><td>chr4 </td><td>184327697</td><td>184332761</td><td> 3</td><td>chr4184327697184332761 </td></tr>
	<tr><td>chr6 </td><td>   217976</td><td>   227667</td><td> 5</td><td>chr6217976227667       </td></tr>
	<tr><td>chr6 </td><td> 41673578</td><td> 41683770</td><td> 3</td><td>chr64167357841683770   </td></tr>
	<tr><td>chr7 </td><td> 25655329</td><td> 25665285</td><td> 3</td><td>chr72565532925665285   </td></tr>
</tbody>
</table>




```R

```


```R

```


```R

```

### Filter down 


```R
Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.1NN <-Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% group_by(ChrHMR, StartHMR) %>% top_n(n = 1, wt = -HMRTSSDist)

Bcell_unclustered_cellspecific.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.1NN <-Bcell_unclustered_cellspecific.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered %>% group_by(ChrHMR, StartHMR) %>% top_n(n = 1, wt = -HMRTSSDist)
```

## Calculate fractions


```R
threshold_list <- c(10000,25000,50000,75000,100000,150000)

numGene_CLcontainsCS_1NN <- tibble(
    thresholds = threshold_list,
    HMRGroup = "Bcell_clustersContainsCS"
)

numGene_UNCS_1NN <- tibble(
    thresholds = threshold_list,
    HMRGroup = "Bcell_unclustered"
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
CLcontainsCS_counts <- map(threshold_list, get_numGenes_per_threshold, df = Bcell_clusters_containsCS.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.1NN)

numGene_CLcontainsCS_1NN$HMRCounts <- unlist(CLcontainsCS_counts)



# UNclustered Cell specific 
UNCS_counts <- map(threshold_list, get_numGenes_per_threshold, df = Bcell_unclustered_cellspecific.100NN.GM_ENSGnoVersionGENESYMBOL_minTPM0.TAD_filtered.1NN)

numGene_UNCS_1NN$HMRCounts <- unlist(UNCS_counts)

print("Done.")
```

    [1] "Done."



```R
# Calc fraction
numGene_CLcontainsCS_1NN_fraction <- numGene_CLcontainsCS_1NN %>% mutate(fraction = (HMRCounts/444) )
numGene_UNCS_1NN_fraction <- numGene_UNCS_1NN %>% mutate(fraction = (HMRCounts/1621) )

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


![png](output_113_0.png)



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


![png](output_116_0.png)



```R
ggpubr::ggarrange(p_numGene_1NN, p_numGeneFraction_1NN, nrow = 2, align = "v", heights = c(4, 1.539))
```


![png](output_117_0.png)


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
	<tr><th scope=row>1</th><td>10000</td><td>Bcell_clustersContainsCS</td><td>140</td><td>0.3153153</td><td>Bcell_unclustered</td><td>122</td><td>0.07526218</td><td>4.189558</td></tr>
	<tr><th scope=row>2</th><td>25000</td><td>Bcell_clustersContainsCS</td><td>221</td><td>0.4977477</td><td>Bcell_unclustered</td><td>403</td><td>0.24861197</td><td>2.002107</td></tr>
	<tr><th scope=row>3</th><td>50000</td><td>Bcell_clustersContainsCS</td><td>292</td><td>0.6576577</td><td>Bcell_unclustered</td><td>737</td><td>0.45465762</td><td>1.446490</td></tr>
</tbody>
</table>




```R
numGene_CLcontainsCS_UNCS_1NN_fractionRatio_pvals <- numGene_CLcontainsCS_UNCS_1NN_fractionRatio %>% rowwise() %>% mutate(
    propTestP = prop.test(x = c(HMRCounts.x, HMRCounts.y), n = c(444, 1621))$p.value,
    propTestStat = prop.test(x = c(HMRCounts.x, HMRCounts.y), n = c(444, 1621))$statistic,
)
numGene_CLcontainsCS_UNCS_1NN_fractionRatio_pvals %>% select(thresholds, HMRGroup.x, )
```


<table class="dataframe">
<caption>A rowwise_df: 6 × 10</caption>
<thead>
	<tr><th scope=col>thresholds</th><th scope=col>HMRGroup.x</th><th scope=col>HMRCounts.x</th><th scope=col>fraction.x</th><th scope=col>HMRGroup.y</th><th scope=col>HMRCounts.y</th><th scope=col>fraction.y</th><th scope=col>fractionRatio</th><th scope=col>propTestP</th><th scope=col>propTestStat</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 10000</td><td>Bcell_clustersContainsCS</td><td>140</td><td>0.3153153</td><td>Bcell_unclustered</td><td> 122</td><td>0.07526218</td><td>4.189558</td><td>7.460310e-41</td><td>179.14201</td></tr>
	<tr><td> 25000</td><td>Bcell_clustersContainsCS</td><td>221</td><td>0.4977477</td><td>Bcell_unclustered</td><td> 403</td><td>0.24861197</td><td>2.002107</td><td>7.467151e-24</td><td>101.41302</td></tr>
	<tr><td> 50000</td><td>Bcell_clustersContainsCS</td><td>292</td><td>0.6576577</td><td>Bcell_unclustered</td><td> 737</td><td>0.45465762</td><td>1.446490</td><td>5.226730e-14</td><td> 56.64260</td></tr>
	<tr><td> 75000</td><td>Bcell_clustersContainsCS</td><td>326</td><td>0.7342342</td><td>Bcell_unclustered</td><td> 907</td><td>0.55953115</td><td>1.312231</td><td>4.250538e-11</td><td> 43.49495</td></tr>
	<tr><td>100000</td><td>Bcell_clustersContainsCS</td><td>353</td><td>0.7950450</td><td>Bcell_unclustered</td><td>1014</td><td>0.62553979</td><td>1.270974</td><td>3.284893e-11</td><td> 43.99932</td></tr>
	<tr><td>150000</td><td>Bcell_clustersContainsCS</td><td>380</td><td>0.8558559</td><td>Bcell_unclustered</td><td>1144</td><td>0.70573720</td><td>1.212712</td><td>2.741773e-10</td><td> 39.85041</td></tr>
</tbody>
</table>




```R
p_numGene_1NN_stats <- p_numGene_1NN +
geom_text(data = numGene_CLcontainsCS_UNCS_1NN_fractionRatio_pvals, aes(x = thresholds+1000, y = .5, label = format(propTestP, digits=3)))
p_numGene_1NN_stats
```


![png](output_121_0.png)



```R
p_numGeneFraction_1NN +
geom_text(data = numGene_CLcontainsCS_UNCS_1NN_fractionRatio_pvals, aes(x = thresholds, y = 4, label = format(propTestP, digits=3)), size = 3)
```


![png](output_122_0.png)



```R
## Plot w/ stats
```


```R
ggpubr::ggarrange(p_numGene_1NN_stats, p_numGeneFraction_1NN, nrow = 2, align = "v", heights = c(4, 1.539))
```


![png](output_124_0.png)

