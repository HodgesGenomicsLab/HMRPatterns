# cd /data/hodges_lab/Tim/finalAnalyses_HMRs/MethylationHeatmap4


```R
library(tidyverse)
library(magrittr)

setwd("/data/hodges_lab/Tim/finalAnalyses_HMRs/MethylationHeatmap4/")

# Load in all files - raw Methylation
methMatrixRawLong <- read_tsv("methMat_clusterIDs.withT.minRead0.noCTCFfilt.txt", col_names=T)

head(methMatrixRawLong)
```

    Parsed with column specification:
    cols(
      `methMat_kmean7_4$kmeans$cluster` = col_double(),
      Chr = col_character(),
      Start = col_double(),
      End = col_double(),
      H1ESC = col_double(),
      fSpinal = col_double(),
      fHeart = col_double(),
      Liver = col_double(),
      Adrenal = col_double(),
      Bcell = col_double(),
      Tcell = col_double()
    )



<table>
<thead><tr><th scope=col>methMat_kmean7_4$kmeans$cluster</th><th scope=col>Chr</th><th scope=col>Start</th><th scope=col>End</th><th scope=col>H1ESC</th><th scope=col>fSpinal</th><th scope=col>fHeart</th><th scope=col>Liver</th><th scope=col>Adrenal</th><th scope=col>Bcell</th><th scope=col>Tcell</th></tr></thead>
<tbody>
	<tr><td>2           </td><td>chr1        </td><td> 20043      </td><td> 20480      </td><td>0.0000000   </td><td>0.3986132222</td><td>0.758924000 </td><td>0.0000000   </td><td>0.0000000   </td><td>0.00000000  </td><td>0.88046167  </td></tr>
	<tr><td>2           </td><td>chr1        </td><td> 28511      </td><td> 30155      </td><td>0.0000000   </td><td>0.0003396742</td><td>0.001242338 </td><td>0.0078125   </td><td>0.0000000   </td><td>0.00781250  </td><td>0.01086957  </td></tr>
	<tr><td>5           </td><td>chr1        </td><td> 51441      </td><td> 51734      </td><td>0.4309163   </td><td>0.8629746111</td><td>0.913014111 </td><td>0.1238756   </td><td>0.6243886   </td><td>0.49074078  </td><td>0.87870372  </td></tr>
	<tr><td>2           </td><td>chr1        </td><td> 91118      </td><td> 91580      </td><td>0.3415751   </td><td>0.1638646222</td><td>0.173603122 </td><td>0.0370370   </td><td>0.1888345   </td><td>0.24074078  </td><td>0.16032089  </td></tr>
	<tr><td>2           </td><td>chr1        </td><td>137353      </td><td>137404      </td><td>0.0000000   </td><td>0.9381945000</td><td>0.000000000 </td><td>0.0000000   </td><td>0.0000000   </td><td>0.00000000  </td><td>0.93915350  </td></tr>
	<tr><td>6           </td><td>chr1        </td><td>237055      </td><td>237877      </td><td>0.2366565   </td><td>0.4916197059</td><td>0.558110418 </td><td>0.3230844   </td><td>0.3331799   </td><td>0.07633047  </td><td>0.55951779  </td></tr>
</tbody>
</table>




```R
# Load in all files - raw Methylation
head(methMatrixRawLong)

```


<table>
<thead><tr><th scope=col>methMat_kmean7_4$kmeans$cluster</th><th scope=col>Chr</th><th scope=col>Start</th><th scope=col>End</th><th scope=col>H1ESC</th><th scope=col>fSpinal</th><th scope=col>fHeart</th><th scope=col>Liver</th><th scope=col>Adrenal</th><th scope=col>Bcell</th><th scope=col>Tcell</th></tr></thead>
<tbody>
	<tr><td>2           </td><td>chr1        </td><td> 20043      </td><td> 20480      </td><td>0.0000000   </td><td>0.3986132222</td><td>0.758924000 </td><td>0.0000000   </td><td>0.0000000   </td><td>0.00000000  </td><td>0.88046167  </td></tr>
	<tr><td>2           </td><td>chr1        </td><td> 28511      </td><td> 30155      </td><td>0.0000000   </td><td>0.0003396742</td><td>0.001242338 </td><td>0.0078125   </td><td>0.0000000   </td><td>0.00781250  </td><td>0.01086957  </td></tr>
	<tr><td>5           </td><td>chr1        </td><td> 51441      </td><td> 51734      </td><td>0.4309163   </td><td>0.8629746111</td><td>0.913014111 </td><td>0.1238756   </td><td>0.6243886   </td><td>0.49074078  </td><td>0.87870372  </td></tr>
	<tr><td>2           </td><td>chr1        </td><td> 91118      </td><td> 91580      </td><td>0.3415751   </td><td>0.1638646222</td><td>0.173603122 </td><td>0.0370370   </td><td>0.1888345   </td><td>0.24074078  </td><td>0.16032089  </td></tr>
	<tr><td>2           </td><td>chr1        </td><td>137353      </td><td>137404      </td><td>0.0000000   </td><td>0.9381945000</td><td>0.000000000 </td><td>0.0000000   </td><td>0.0000000   </td><td>0.00000000  </td><td>0.93915350  </td></tr>
	<tr><td>6           </td><td>chr1        </td><td>237055      </td><td>237877      </td><td>0.2366565   </td><td>0.4916197059</td><td>0.558110418 </td><td>0.3230844   </td><td>0.3331799   </td><td>0.07633047  </td><td>0.55951779  </td></tr>
</tbody>
</table>




```R
# Process dataframe
methMatrixRawLong <- methMatrixRawLong[c("Chr","Start","End","H1ESC","fSpinal","fHeart","Liver","Adrenal","Bcell","Tcell")]

# Reduce coluns
methMatrixRaw <- methMatrixRawLong[, -c(1:3)]

# Convert "." to NA
methMatrixRaw[ methMatrixRaw == "." ] <- NA

# Omit rows with NA
methMatrixNoNA <- na.omit(methMatrixRaw)

# Covert dataframe to datatype: matrix
methMatrixNoNAMat <- data.matrix(methMatrixNoNA)

# Check matrix
head(methMatrixNoNAMat)
```


<table>
<thead><tr><th scope=col>H1ESC</th><th scope=col>fSpinal</th><th scope=col>fHeart</th><th scope=col>Liver</th><th scope=col>Adrenal</th><th scope=col>Bcell</th><th scope=col>Tcell</th></tr></thead>
<tbody>
	<tr><td>0.0000000   </td><td>0.3986132222</td><td>0.758924000 </td><td>0.0000000   </td><td>0.0000000   </td><td>0.00000000  </td><td>0.88046167  </td></tr>
	<tr><td>0.0000000   </td><td>0.0003396742</td><td>0.001242338 </td><td>0.0078125   </td><td>0.0000000   </td><td>0.00781250  </td><td>0.01086957  </td></tr>
	<tr><td>0.4309163   </td><td>0.8629746111</td><td>0.913014111 </td><td>0.1238756   </td><td>0.6243886   </td><td>0.49074078  </td><td>0.87870372  </td></tr>
	<tr><td>0.3415751   </td><td>0.1638646222</td><td>0.173603122 </td><td>0.0370370   </td><td>0.1888345   </td><td>0.24074078  </td><td>0.16032089  </td></tr>
	<tr><td>0.0000000   </td><td>0.9381945000</td><td>0.000000000 </td><td>0.0000000   </td><td>0.0000000   </td><td>0.00000000  </td><td>0.93915350  </td></tr>
	<tr><td>0.2366565   </td><td>0.4916197059</td><td>0.558110418 </td><td>0.3230844   </td><td>0.3331799   </td><td>0.07633047  </td><td>0.55951779  </td></tr>
</tbody>
</table>




```R
library(cluster)

print("Library: Cluster loaded.")
```

    [1] "Library: Cluster loaded."



```R
head(methMatrixNoNAMat)
```


<table>
<thead><tr><th scope=col>H1ESC</th><th scope=col>fSpinal</th><th scope=col>fHeart</th><th scope=col>Liver</th><th scope=col>Adrenal</th><th scope=col>Bcell</th><th scope=col>Tcell</th></tr></thead>
<tbody>
	<tr><td>0.0000000   </td><td>0.3986132222</td><td>0.758924000 </td><td>0.0000000   </td><td>0.0000000   </td><td>0.00000000  </td><td>0.88046167  </td></tr>
	<tr><td>0.0000000   </td><td>0.0003396742</td><td>0.001242338 </td><td>0.0078125   </td><td>0.0000000   </td><td>0.00781250  </td><td>0.01086957  </td></tr>
	<tr><td>0.4309163   </td><td>0.8629746111</td><td>0.913014111 </td><td>0.1238756   </td><td>0.6243886   </td><td>0.49074078  </td><td>0.87870372  </td></tr>
	<tr><td>0.3415751   </td><td>0.1638646222</td><td>0.173603122 </td><td>0.0370370   </td><td>0.1888345   </td><td>0.24074078  </td><td>0.16032089  </td></tr>
	<tr><td>0.0000000   </td><td>0.9381945000</td><td>0.000000000 </td><td>0.0000000   </td><td>0.0000000   </td><td>0.00000000  </td><td>0.93915350  </td></tr>
	<tr><td>0.2366565   </td><td>0.4916197059</td><td>0.558110418 </td><td>0.3230844   </td><td>0.3331799   </td><td>0.07633047  </td><td>0.55951779  </td></tr>
</tbody>
</table>




```R
# # Finding the estimated proper amount of clusters
print("Starting.")

cg_50000 <- sample_n(as.data.frame(methMatrixNoNAMat), 50000) %>% clusGap(FUN=kmeans, K.max=12)
# cg <- clusGap(methMatrixNoNAMat, FUN=kmeans, K.max=12)

print("Done running. Saving objects.")

# save(cg, file="clusGap.Fig1.Rdata")
saveRDS(cg_50000, file="clusGap_50000_1.Fig1.rds")

print("Done.")


```

    [1] "Starting."


    Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “did not converge in 10 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 2500000)”


```R
sample_n(as.data.frame(methMatrixNoNAMat), 50000)
```


<table>
<thead><tr><th scope=col>H1ESC</th><th scope=col>fSpinal</th><th scope=col>fHeart</th><th scope=col>Liver</th><th scope=col>Adrenal</th><th scope=col>Bcell</th><th scope=col>Tcell</th></tr></thead>
<tbody>
	<tr><td>0.89639875</td><td>0.64549888</td><td>0.64656062</td><td>0.68320662</td><td>0.70989325</td><td>0.32138200</td><td>0.17945402</td></tr>
	<tr><td>0.09853042</td><td>0.05263738</td><td>0.07969609</td><td>0.09258043</td><td>0.06990551</td><td>0.07406990</td><td>0.11149812</td></tr>
	<tr><td>0.71856719</td><td>0.59502531</td><td>0.41483100</td><td>0.46270400</td><td>0.41143588</td><td>0.54490556</td><td>0.39943194</td></tr>
	<tr><td>0.88341154</td><td>0.00000000</td><td>0.88351032</td><td>0.91348382</td><td>0.85117329</td><td>0.09821429</td><td>0.89594226</td></tr>
	<tr><td>0.80540464</td><td>0.64474018</td><td>0.49457691</td><td>0.27195973</td><td>0.77070091</td><td>0.74527227</td><td>0.85673655</td></tr>
	<tr><td>0.23209075</td><td>0.14153049</td><td>0.17780202</td><td>0.57395948</td><td>0.45649886</td><td>0.77122781</td><td>0.81748475</td></tr>
	<tr><td>0.87891850</td><td>0.38119040</td><td>0.48731760</td><td>0.53556370</td><td>0.39318700</td><td>0.51501986</td><td>0.71315120</td></tr>
	<tr><td>0.48321567</td><td>0.43217775</td><td>0.48572992</td><td>0.42914258</td><td>0.46446875</td><td>0.59502100</td><td>0.57415225</td></tr>
	<tr><td>0.63273629</td><td>0.34755501</td><td>0.39904943</td><td>0.29732721</td><td>0.24952994</td><td>0.34065943</td><td>0.41907244</td></tr>
	<tr><td>0.89476511</td><td>0.60264044</td><td>0.24945743</td><td>0.77130100</td><td>0.32862722</td><td>0.86387689</td><td>0.88719122</td></tr>
	<tr><td>0.73724755</td><td>0.46005064</td><td>0.59713900</td><td>0.64864800</td><td>0.56719891</td><td>0.37501375</td><td>0.24607935</td></tr>
	<tr><td>0.90077863</td><td>0.87361113</td><td>0.86192687</td><td>0.36305075</td><td>0.86490738</td><td>0.86959438</td><td>0.84301675</td></tr>
	<tr><td>0.58611117</td><td>0.09823668</td><td>0.11334833</td><td>0.09325574</td><td>0.04450808</td><td>0.02083333</td><td>0.05359183</td></tr>
	<tr><td>0.90150786</td><td>0.85489443</td><td>0.92226900</td><td>0.48354829</td><td>0.36648043</td><td>0.89178614</td><td>0.89232700</td></tr>
	<tr><td>0.67464488</td><td>0.56222950</td><td>0.35038513</td><td>0.79360650</td><td>0.52453887</td><td>0.90363350</td><td>0.84295537</td></tr>
	<tr><td>0.86260633</td><td>0.62089383</td><td>0.51348017</td><td>0.55125850</td><td>0.53931800</td><td>0.31758100</td><td>0.21206590</td></tr>
	<tr><td>0.44302625</td><td>0.44394262</td><td>0.35645922</td><td>0.69212938</td><td>0.59767175</td><td>0.35389266</td><td>0.35599378</td></tr>
	<tr><td>0.77905438</td><td>0.68983869</td><td>0.44995927</td><td>0.74025623</td><td>0.40198283</td><td>0.02771721</td><td>0.54908369</td></tr>
	<tr><td>0.88225636</td><td>0.78713991</td><td>0.64269118</td><td>0.31945109</td><td>0.84603109</td><td>0.74221973</td><td>0.63414964</td></tr>
	<tr><td>0.74463945</td><td>0.43955565</td><td>0.42300744</td><td>0.58066294</td><td>0.49482549</td><td>0.19655194</td><td>0.34206597</td></tr>
	<tr><td>0.72357707</td><td>0.13792722</td><td>0.41466236</td><td>0.45803551</td><td>0.35702614</td><td>0.24829247</td><td>0.29507125</td></tr>
	<tr><td>0.86735122</td><td>0.38389800</td><td>0.58740144</td><td>0.89743078</td><td>0.84657556</td><td>0.79555022</td><td>0.86052100</td></tr>
	<tr><td>0.82457033</td><td>0.36004558</td><td>0.69670542</td><td>0.88814850</td><td>0.65430150</td><td>0.92315442</td><td>0.90854883</td></tr>
	<tr><td>0.13564358</td><td>0.12892150</td><td>0.10333333</td><td>0.12949863</td><td>0.13286715</td><td>0.09545450</td><td>0.28404955</td></tr>
	<tr><td>0.73324340</td><td>0.60938150</td><td>0.60471630</td><td>0.66950860</td><td>0.44150771</td><td>0.04222220</td><td>0.08280018</td></tr>
	<tr><td>0.08783780</td><td>0.14969050</td><td>0.06810170</td><td>0.10294250</td><td>0.10616994</td><td>0.11428580</td><td>0.13632076</td></tr>
	<tr><td>0.86804600</td><td>0.26685588</td><td>0.54005200</td><td>0.86189663</td><td>0.77197889</td><td>0.76070100</td><td>0.81506789</td></tr>
	<tr><td>0.95215100</td><td>0.83916000</td><td>0.82609257</td><td>0.82037143</td><td>0.71375629</td><td>0.88342614</td><td>0.11564333</td></tr>
	<tr><td>0.63008130</td><td>0.23158261</td><td>0.41527618</td><td>0.39744427</td><td>0.44136060</td><td>0.21004109</td><td>0.59044030</td></tr>
	<tr><td>0.90419443</td><td>0.23944785</td><td>0.48849527</td><td>0.77262274</td><td>0.66329030</td><td>0.31809819</td><td>0.57305157</td></tr>
	<tr><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td><td>...</td></tr>
	<tr><td>0.90022620</td><td>0.84734810</td><td>0.72005720</td><td>0.37541360</td><td>0.58217250</td><td>0.7037290 </td><td>0.72412080</td></tr>
	<tr><td>0.80374414</td><td>0.47460586</td><td>0.77039571</td><td>0.40593143</td><td>0.46978571</td><td>0.1408984 </td><td>0.13093664</td></tr>
	<tr><td>0.87850971</td><td>0.72139943</td><td>0.84819529</td><td>0.73303186</td><td>0.70679071</td><td>0.2361264 </td><td>0.13441587</td></tr>
	<tr><td>0.71563612</td><td>0.43627450</td><td>0.55515350</td><td>0.25553423</td><td>0.36026378</td><td>0.5250000 </td><td>0.43636375</td></tr>
	<tr><td>0.36176486</td><td>0.62419800</td><td>0.72597271</td><td>0.49253514</td><td>0.48029357</td><td>0.5389990 </td><td>0.66728557</td></tr>
	<tr><td>0.71866445</td><td>0.79472433</td><td>0.84721333</td><td>0.59180233</td><td>0.75357417</td><td>0.1320462 </td><td>0.20279502</td></tr>
	<tr><td>0.87228000</td><td>0.22773102</td><td>0.53504184</td><td>0.49780248</td><td>0.65272568</td><td>0.2496757 </td><td>0.42398132</td></tr>
	<tr><td>0.25993095</td><td>0.14899173</td><td>0.15290972</td><td>0.17072271</td><td>0.19387886</td><td>0.2094338 </td><td>0.25046658</td></tr>
	<tr><td>0.87067417</td><td>0.77087811</td><td>0.72792278</td><td>0.26217307</td><td>0.61419084</td><td>0.7651002 </td><td>0.62167607</td></tr>
	<tr><td>0.51301580</td><td>0.15957152</td><td>0.06903914</td><td>0.64054960</td><td>0.48504880</td><td>0.6670636 </td><td>0.82381080</td></tr>
	<tr><td>0.80937630</td><td>0.38288663</td><td>0.57439252</td><td>0.76291130</td><td>0.78099200</td><td>0.4155175 </td><td>0.83359125</td></tr>
	<tr><td>0.84144800</td><td>0.27916650</td><td>0.55337675</td><td>0.63181387</td><td>0.77432100</td><td>0.6354256 </td><td>0.65059526</td></tr>
	<tr><td>0.79280330</td><td>0.47184020</td><td>0.24269156</td><td>0.32875890</td><td>0.30127150</td><td>0.6804298 </td><td>0.74036570</td></tr>
	<tr><td>0.95138908</td><td>0.92247758</td><td>0.91711283</td><td>0.69267308</td><td>0.39028286</td><td>0.1924062 </td><td>0.07794976</td></tr>
	<tr><td>0.10103873</td><td>0.11858130</td><td>0.08953226</td><td>0.04526035</td><td>0.15974816</td><td>0.1035943 </td><td>0.09785836</td></tr>
	<tr><td>0.86499219</td><td>0.59499981</td><td>0.73996131</td><td>0.28170026</td><td>0.78072688</td><td>0.7208849 </td><td>0.59804263</td></tr>
	<tr><td>0.79591460</td><td>0.78454850</td><td>0.72909110</td><td>0.37986090</td><td>0.78418050</td><td>0.7896754 </td><td>0.81092150</td></tr>
	<tr><td>0.20000000</td><td>0.35693200</td><td>0.34520557</td><td>0.41637143</td><td>0.44296386</td><td>0.1904761 </td><td>0.43991129</td></tr>
	<tr><td>0.62377487</td><td>0.28012813</td><td>0.27533663</td><td>0.51720362</td><td>0.62778025</td><td>0.6384889 </td><td>0.64345225</td></tr>
	<tr><td>0.79160589</td><td>0.33618656</td><td>0.60743811</td><td>0.82549689</td><td>0.71511533</td><td>0.8696648 </td><td>0.82597067</td></tr>
	<tr><td>0.58221616</td><td>0.42114711</td><td>0.71623105</td><td>0.52742947</td><td>0.77782911</td><td>0.9113606 </td><td>0.93116711</td></tr>
	<tr><td>0.78423525</td><td>0.41318476</td><td>0.23837417</td><td>0.30361866</td><td>0.37081835</td><td>0.3829351 </td><td>0.39931525</td></tr>
	<tr><td>0.32184700</td><td>0.49619314</td><td>0.16318854</td><td>0.73163857</td><td>0.59300771</td><td>0.4689343 </td><td>0.58617129</td></tr>
	<tr><td>0.55577697</td><td>0.51074571</td><td>0.59179369</td><td>0.39961153</td><td>0.37915300</td><td>0.2584042 </td><td>0.10479564</td></tr>
	<tr><td>0.04141691</td><td>0.02213021</td><td>0.04394619</td><td>0.05505245</td><td>0.05740059</td><td>0.1124638 </td><td>0.13613577</td></tr>
	<tr><td>0.81816091</td><td>0.91764855</td><td>0.94149845</td><td>0.86745573</td><td>0.88530591</td><td>0.5865129 </td><td>0.22850571</td></tr>
	<tr><td>0.75275618</td><td>0.43330295</td><td>0.63540182</td><td>0.63225718</td><td>0.61380836</td><td>0.5569640 </td><td>0.65651218</td></tr>
	<tr><td>0.85987800</td><td>0.46991800</td><td>0.89119950</td><td>0.32205525</td><td>0.44356062</td><td>0.9468578 </td><td>0.95337300</td></tr>
	<tr><td>0.74425292</td><td>0.52248159</td><td>0.60569690</td><td>0.24080577</td><td>0.18291058</td><td>0.5627376 </td><td>0.53369941</td></tr>
	<tr><td>0.86063500</td><td>0.80745733</td><td>0.76313450</td><td>0.78037167</td><td>0.22318567</td><td>0.8108580 </td><td>0.74617850</td></tr>
</tbody>
</table>




```R
# # Elbow method - 
scaled_data = as.matrix(scale(methMatrixNoNA))
k.max <- 12
data <- scaled_data

print("Boutta start.")
wss <- sapply(1:k.max,
              function(k){kmeans(data, k, nstart=50,iter.max = 12 )$tot.withinss})
saveRDS(wss, file="listOfClusGap_1to12_wwss_1.Fig1.rds")


wss
p <- plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE,
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")


```

    [1] "Boutta start."


    Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “did not converge in 12 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “did not converge in 12 iterations”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “Quick-TRANSfer stage steps exceeded maximum (= 5119500)”Warning message:
    “did not converge in 12 iterations”


<ol class=list-inline>
	<li>716722.999999937</li>
	<li>471721.91668127</li>
	<li>368055.001929282</li>
	<li>316489.125910423</li>
	<li>275312.71604656</li>
	<li>254660.493570688</li>
	<li>237769.881246132</li>
	<li>222185.686797101</li>
	<li>209786.533472398</li>
	<li>197813.267824225</li>
	<li>188133.995304822</li>
	<li>180898.336247704</li>
</ol>




![png](output_8_3.png)



```R
png('elbow_method.png')
p
dev.off()

pdf('eblow_method.pdf')
p
dev.off()


```


    NULL



<strong>png:</strong> 2



    NULL



<strong>png:</strong> 2


# I JUST WANT TO PLOT THE WSS ELBOW METHOD PLOT AND SAVE IT


```R
library(cowplot)

wss

wss.df <- data.frame(
    k=1:12,
    tot_withinss = wss
)


elbowp <- ggplot(wss.df, aes(x = k, y = tot_withinss)) +
  geom_line() + geom_point()+
  scale_x_continuous(breaks = 1:12) +
    theme_minimal()

```


<ol class=list-inline>
	<li>716722.999999937</li>
	<li>471721.91668127</li>
	<li>368055.001929282</li>
	<li>316489.125910423</li>
	<li>275312.71604656</li>
	<li>254660.493570688</li>
	<li>237769.881246132</li>
	<li>222185.686797101</li>
	<li>209786.533472398</li>
	<li>197813.267824225</li>
	<li>188133.995304822</li>
	<li>180898.336247704</li>
</ol>




```R
ggsave(
    "elbowplot.ggplot.1.pdf",
  plot = last_plot(),
  device = "pdf",
  scale = 1,
  width = 5,
  height = 5)
```
