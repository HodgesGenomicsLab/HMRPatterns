```R
library(tidyverse)
library(ggplot2)
library(ggpubr)
library(data.table)



print("Loaded libraries.")
```

    
    Attaching package: ‘data.table’
    
    
    The following objects are masked from ‘package:dplyr’:
    
        between, first, last
    
    
    The following object is masked from ‘package:purrr’:
    
        transpose
    
    


    [1] "Loaded libraries."



```R
#Set working directory 
setwd("/data/hodges_lab/Tim/BMC_HMR_Length/")
```


```R
setwd("/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles/")
list.files()
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'Adrenal.minsize50.filtforrefseqTSSexons.txt'</li><li>'Bcell.minsize50.filtforrefseqTSSexons.txt'</li><li>'BT.minsize50.filtforrefseqTSSexons.txt'</li><li>'fHeart.minsize50.filtforrefseqTSSexons.txt'</li><li>'Fig1.All_but_H1.merged.txt'</li><li>'Fig1.All_but_H1.sorted.txt'</li><li>'fSpinal.minsize50.filtforrefseqTSSexons.txt'</li><li>'H1ESC.minsize50.filtforrefseqTSSexons.txt'</li><li>'HSC.minsize50.filtforrefseqTSSexons.txt'</li><li>'Liver.minsize50.filtforrefseqTSSexons.txt'</li><li>'Macrophage.minsize50.filtforrefseqTSSexons.txt'</li><li>'MNBT.minsize50.filtforrefseqTSSexons.txt'</li><li>'Neutrophil.minsize50.filtforrefseqTSSexons.txt'</li><li>'other'</li><li>'Tcell.minsize50.filtforrefseqTSSexons.txt'</li><li>'temp.u.txt'</li><li>'temp.v.txt'</li></ol>



# Load in files


```R
list_of_filenames_all <- list.files(pattern = "*minsize50.filtforrefseqTSSexons.txt")
list_of_filenames <- list_of_filenames_all[!list_of_files_all %in% c("MNBT.minsize50.filtforrefseqTSSexons.txt", "BT.minsize50.filtforrefseqTSSexons.txt","Neutrophil.minsize50.filtforrefseqTSSexons.txt")]
list_of_filenames
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'Adrenal.minsize50.filtforrefseqTSSexons.txt'</li><li>'Bcell.minsize50.filtforrefseqTSSexons.txt'</li><li>'fHeart.minsize50.filtforrefseqTSSexons.txt'</li><li>'fSpinal.minsize50.filtforrefseqTSSexons.txt'</li><li>'H1ESC.minsize50.filtforrefseqTSSexons.txt'</li><li>'HSC.minsize50.filtforrefseqTSSexons.txt'</li><li>'Liver.minsize50.filtforrefseqTSSexons.txt'</li><li>'Macrophage.minsize50.filtforrefseqTSSexons.txt'</li><li>'Tcell.minsize50.filtforrefseqTSSexons.txt'</li></ol>




```R
list_of_tsv <- lapply(list_of_filenames, read_tsv, col_names = c("chr", "start", "end", "length"))
```

    [1mRows: [22m[34m36610[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, length
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m34070[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, length
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m43473[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, length
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m44390[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, length
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m18235[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, length
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m46056[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, length
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m38132[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, length
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m54331[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, length
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m32366[39m [1mColumns: [22m[34m4[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (1): chr
    [32mdbl[39m (3): start, end, length
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


## Rename


```R
list_of_celltypeNames <- map(list_of_filenames, ~ gsub("\\..*", "", .))
```


```R
names(list_of_tsv) <- list_of_celltypeNames
```


```R
list_of_tsv_length <- map(list_of_tsv, ~ nrow(.))
list_of_tsv_length
```


<dl>
	<dt>$Adrenal</dt>
		<dd>36610</dd>
	<dt>$Bcell</dt>
		<dd>34070</dd>
	<dt>$fHeart</dt>
		<dd>43473</dd>
	<dt>$fSpinal</dt>
		<dd>44390</dd>
	<dt>$H1ESC</dt>
		<dd>18235</dd>
	<dt>$HSC</dt>
		<dd>46056</dd>
	<dt>$Liver</dt>
		<dd>38132</dd>
	<dt>$Macrophage</dt>
		<dd>54331</dd>
	<dt>$Tcell</dt>
		<dd>32366</dd>
</dl>



## Combine


```R
df_of_tsv <- rbindlist(list_of_tsv, idcol = "Celltype")
df_of_tsv
```


<table class="dataframe">
<caption>A data.table: 347663 × 5</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>chr</th><th scope=col>start</th><th scope=col>end</th><th scope=col>length</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Adrenal</td><td>chr1</td><td>  28511</td><td>  29415</td><td> 904</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td>  91118</td><td>  91580</td><td> 462</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 521379</td><td> 521660</td><td> 281</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 564500</td><td> 566009</td><td>1509</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 566518</td><td> 566879</td><td> 361</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 567166</td><td> 568325</td><td>1159</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 568477</td><td> 568610</td><td> 133</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 568760</td><td> 569558</td><td> 798</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 569692</td><td> 570301</td><td> 609</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 713542</td><td> 715041</td><td>1499</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 751579</td><td> 754108</td><td>2529</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 761369</td><td> 764108</td><td>2739</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 793447</td><td> 793832</td><td> 385</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 793893</td><td> 794419</td><td> 526</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 804991</td><td> 805606</td><td> 615</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 839737</td><td> 841761</td><td>2024</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 845246</td><td> 846919</td><td>1673</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 848282</td><td> 848467</td><td> 185</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 851761</td><td> 853056</td><td>1295</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 855608</td><td> 856914</td><td>1306</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 867144</td><td> 867635</td><td> 491</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 931186</td><td> 932201</td><td>1015</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 940366</td><td> 941015</td><td> 649</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 941216</td><td> 941284</td><td>  68</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 993521</td><td> 996098</td><td>2577</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 996150</td><td> 996228</td><td>  78</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 997402</td><td> 998226</td><td> 824</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td> 999061</td><td>1000247</td><td>1186</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td>1003631</td><td>1005100</td><td>1469</td></tr>
	<tr><td>Adrenal</td><td>chr1</td><td>1012756</td><td>1012886</td><td> 130</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>17767130</td><td>17769066</td><td>1936</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>18175813</td><td>18178486</td><td>2673</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>19156213</td><td>19156965</td><td> 752</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>19691234</td><td>19691502</td><td> 268</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>20831726</td><td>20831874</td><td> 148</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>21154764</td><td>21154966</td><td> 202</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>21172507</td><td>21173836</td><td>1329</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>21237676</td><td>21240002</td><td>2326</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>21394141</td><td>21394554</td><td> 413</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>21594773</td><td>21595192</td><td> 419</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>21660440</td><td>21660839</td><td> 399</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>21664592</td><td>21664777</td><td> 185</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>21711913</td><td>21712209</td><td> 296</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>21728468</td><td>21730472</td><td>2004</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>21978663</td><td>21979172</td><td> 509</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>22155458</td><td>22155700</td><td> 242</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>22359425</td><td>22364782</td><td>5357</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>22366149</td><td>22368179</td><td>2030</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>22489385</td><td>22491489</td><td>2104</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>23401818</td><td>23402869</td><td>1051</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>23410469</td><td>23410865</td><td> 396</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>23411140</td><td>23411774</td><td> 634</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>23742326</td><td>23742694</td><td> 368</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>23899188</td><td>23899487</td><td> 299</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>28737513</td><td>28738849</td><td>1336</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>28740717</td><td>28742154</td><td>1437</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>28749666</td><td>28750852</td><td>1186</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>28762147</td><td>28763786</td><td>1639</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>58978184</td><td>58979630</td><td>1446</td></tr>
	<tr><td>Tcell</td><td>chrY</td><td>59028187</td><td>59028989</td><td> 802</td></tr>
</tbody>
</table>



# Calculate medians


```R
df_of_tsv_medianLength <- df_of_tsv %>% group_by(Celltype) %>% summarize(medianLength = median(length))
df_of_tsv_medianLength %>% arrange(medianLength)
```


<table class="dataframe">
<caption>A tibble: 9 × 2</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>medianLength</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>H1ESC     </td><td>439</td></tr>
	<tr><td>Macrophage</td><td>451</td></tr>
	<tr><td>Tcell     </td><td>468</td></tr>
	<tr><td>HSC       </td><td>486</td></tr>
	<tr><td>Bcell     </td><td>494</td></tr>
	<tr><td>fHeart    </td><td>535</td></tr>
	<tr><td>Adrenal   </td><td>569</td></tr>
	<tr><td>fSpinal   </td><td>657</td></tr>
	<tr><td>Liver     </td><td>685</td></tr>
</tbody>
</table>




```R
mean(df_of_tsv$length)
median(df_of_tsv$length)
```


738.940019501644



531


# Plot


```R
setwd("/data/hodges_lab/Tim/BMC_HMR_Length/")
```


```R
getwd()
```


'/gpfs52/data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/filtRefSeqFiles'



```R
pdf("HMR_lengths.2000bp_xlim.pdf")

p_2000 <- df_of_tsv %>%
ggplot(aes(x = length)) +
geom_density(aes(color = Celltype)) +
coord_cartesian(xlim = c(0, 2000)) +
theme_classic() +
theme(aspect.ratio = 0.5)
p_2000

dev.off()
p_2000
```


<strong>png:</strong> 2



![png](output_18_1.png)



```R
pdf("HMR_lengths.5000bp_xlim.pdf")

p_5000 <- df_of_tsv %>%
ggplot(aes(x = length, color = Celltype)) +
geom_density() +
coord_cartesian(xlim = c(0, 5000)) +
theme_classic() +
theme(aspect.ratio = 0.5)
p_5000

dev.off()
p_5000
```


<strong>png:</strong> 2



![png](output_19_1.png)



```R
df_of_tsv %>%
ggplot(aes(x = length, color = Celltype)) +
geom_density() +
coord_cartesian(xlim = c(0, 10000)) +
theme_classic() +
theme(aspect.ratio = 0.5)
```


![png](output_20_0.png)



```R

```


```R

```
