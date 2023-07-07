# Make a  directory home for this 


```R
mkdir -p /data/hodges_lab/Tim/nnRNA_TPM/
cd /data/hodges_lab/Tim/nnRNA_TPM/
```

## Grab the promoter file from /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/


```R
mkdir -p /data/hodges_lab/Tim/nnRNA_TPM/reference_files/
cd /data/hodges_lab/Tim/nnRNA_TPM/reference_files/

cp /data/hodges_lab/Tim/finalAnalyses_HMRs/hp_lineage/referenceFiles/ncbiRefSeqCurated_NM.promoters.Upstream2000Downstream1000.txt /data/hodges_lab/Tim/nnRNA_TPM/reference_files/
```

## Grab the ENCODE GM12878 RNA-seq output file: 


```R
cd /data/hodges_lab/Tim/nnRNA_TPM/reference_files/
```


```R
# Accesssed June 22, 2023
wget https://www.encodeproject.org/files/ENCFF955JLS/@@download/ENCFF955JLS.tsv

wget https://www.encodeproject.org/files/ENCFF056WHT/@@download/ENCFF056WHT.tsv

head -n 3 ENCFF955JLS.tsv
head -n 3 ENCFF056WHT.tsv
```

    --2023-06-27 16:01:30--  https://www.encodeproject.org/files/ENCFF955JLS/@@download/ENCFF955JLS.tsv
    Resolving www.encodeproject.org (www.encodeproject.org)... 34.211.244.144
    Connecting to www.encodeproject.org (www.encodeproject.org)|34.211.244.144|:443... connected.
    HTTP request sent, awaiting response... 307 Temporary Redirect
    Location: https://encode-public.s3.amazonaws.com/2016/08/29/bc59868f-b19c-4793-b621-fb011db8dc73/ENCFF955JLS.tsv?response-content-disposition=attachment%3B%20filename%3DENCFF955JLS.tsv&AWSAccessKeyId=ASIATGZNGCNX7GP3Y2IA&Signature=N42OWpGkXNTbTfGU4w3%2FRgaYfIA%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCKIg%2FPwycYRoZQAL1CmMiRQGDuBizaZaxsiwlb5%2FvGAQIgBIzPh6I4VR%2F6wPHM0a10KUDoke0VXRV3HMVVGtc4DIoqsgUIZRAAGgwyMjA3NDg3MTQ4NjMiDMzM9r3h1NSZtH0MVSqPBX%2FR0vE2isUOZyHMe517mdozdebOAmtyr6RinLkkcj0uDchenJa71zKmYCSUmuSuzhJpwHjDp2c1elH2iYx5qj4kk%2B48sEBTS%2B6Wh54IyDF01NZoFW5xDHjAb1DFhBT14%2BzMeWSTG6NT2CcdFVZZxnQBnd5QtHy5EEMSZ4A4o7YvHNJQg7cv3qi06%2FXzXryyLM%2BePVslRNgPghDV9N9tvc1oiGRMIbrqxfV7sophwPyWlJ4%2B7ARl1rHKxZuWg40K0i0Zhpfsk2c3cmzZZMhN2r6AAdxVMHKzGdr2taaj7ENB%2F73xBm%2Fs3%2F6XqtW5SRDnRDn6LNaYDnWKtjPUxPHCJlmrIZh%2BF6MkOegzgLuCqXIyTT0cG%2F6ZEA8G%2BnnsRvKQPKPMQgHPHn6PtWNvHv4HQn4r4sfchwjA0cPktCD5iJnWnbyaAkMwyKXamhUD623Eq4ZjEdPnkX0IxUhoT4dThLXQeEsLPRk7gsytuzYCUTMLAEBiigmjrMYuQ37Oj6HxOtCw6bLF1pQSDNxNDjEz8pmF%2F3NuR3c5%2B%2F8m8JPnZElNkL%2FgJN4mpRuPokipzFd1BV6tIuGIFEnRAnvHPjxQzGHEtTEYO7HqTM3bS7WuIwQuULbhH70GZledq4oyQrmC2aiH6T3PpaQbGlG3eGZsIODzzABYQRhwXGm8o1mtmSvfE6bjKgq82tGEhZOC94iI%2FNGqswM7viFTQ3uO%2FPKrEBVRbk7IUTtiplgDJsD5OG43TlnwqoPJd6PwJQ2ERNKP8CncyRTOzp6oGi1ciFYsdSE5LxYt5r9v5aZT0vnWDvBI0YMWrXex0dmt1a5did%2Ft07pfmgYYBELAt5dFfrc8sdLYRAMUU6tIHvUg7WZuVFQwoYbtpAY6sQE7Kse0Ew1hfd1y%2FPoNpYU29KkXUeMZK%2FF38y1JzgKOisZpcAvVmPnPjJ%2B%2FhYxQfjzGEV0R%2Btiu4d4zvhWC%2BHPf82HUO%2BuUNuAwqOtDV4rjYrVDoXXrGubMfMxQms8zsUg04XOEtvNfJzI6Zoo%2BT1AWtzv7tC8CHCK5HCr6pOwVFRSdlYMBm0WZ70rx07XERRW10iLHTDLhi7GxK068X%2F3uCBWyBUosmY%2BsM0PBFecmMlg%3D&Expires=1688029290 [following]
    --2023-06-27 16:01:30--  https://encode-public.s3.amazonaws.com/2016/08/29/bc59868f-b19c-4793-b621-fb011db8dc73/ENCFF955JLS.tsv?response-content-disposition=attachment%3B%20filename%3DENCFF955JLS.tsv&AWSAccessKeyId=ASIATGZNGCNX7GP3Y2IA&Signature=N42OWpGkXNTbTfGU4w3%2FRgaYfIA%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCKIg%2FPwycYRoZQAL1CmMiRQGDuBizaZaxsiwlb5%2FvGAQIgBIzPh6I4VR%2F6wPHM0a10KUDoke0VXRV3HMVVGtc4DIoqsgUIZRAAGgwyMjA3NDg3MTQ4NjMiDMzM9r3h1NSZtH0MVSqPBX%2FR0vE2isUOZyHMe517mdozdebOAmtyr6RinLkkcj0uDchenJa71zKmYCSUmuSuzhJpwHjDp2c1elH2iYx5qj4kk%2B48sEBTS%2B6Wh54IyDF01NZoFW5xDHjAb1DFhBT14%2BzMeWSTG6NT2CcdFVZZxnQBnd5QtHy5EEMSZ4A4o7YvHNJQg7cv3qi06%2FXzXryyLM%2BePVslRNgPghDV9N9tvc1oiGRMIbrqxfV7sophwPyWlJ4%2B7ARl1rHKxZuWg40K0i0Zhpfsk2c3cmzZZMhN2r6AAdxVMHKzGdr2taaj7ENB%2F73xBm%2Fs3%2F6XqtW5SRDnRDn6LNaYDnWKtjPUxPHCJlmrIZh%2BF6MkOegzgLuCqXIyTT0cG%2F6ZEA8G%2BnnsRvKQPKPMQgHPHn6PtWNvHv4HQn4r4sfchwjA0cPktCD5iJnWnbyaAkMwyKXamhUD623Eq4ZjEdPnkX0IxUhoT4dThLXQeEsLPRk7gsytuzYCUTMLAEBiigmjrMYuQ37Oj6HxOtCw6bLF1pQSDNxNDjEz8pmF%2F3NuR3c5%2B%2F8m8JPnZElNkL%2FgJN4mpRuPokipzFd1BV6tIuGIFEnRAnvHPjxQzGHEtTEYO7HqTM3bS7WuIwQuULbhH70GZledq4oyQrmC2aiH6T3PpaQbGlG3eGZsIODzzABYQRhwXGm8o1mtmSvfE6bjKgq82tGEhZOC94iI%2FNGqswM7viFTQ3uO%2FPKrEBVRbk7IUTtiplgDJsD5OG43TlnwqoPJd6PwJQ2ERNKP8CncyRTOzp6oGi1ciFYsdSE5LxYt5r9v5aZT0vnWDvBI0YMWrXex0dmt1a5did%2Ft07pfmgYYBELAt5dFfrc8sdLYRAMUU6tIHvUg7WZuVFQwoYbtpAY6sQE7Kse0Ew1hfd1y%2FPoNpYU29KkXUeMZK%2FF38y1JzgKOisZpcAvVmPnPjJ%2B%2FhYxQfjzGEV0R%2Btiu4d4zvhWC%2BHPf82HUO%2BuUNuAwqOtDV4rjYrVDoXXrGubMfMxQms8zsUg04XOEtvNfJzI6Zoo%2BT1AWtzv7tC8CHCK5HCr6pOwVFRSdlYMBm0WZ70rx07XERRW10iLHTDLhi7GxK068X%2F3uCBWyBUosmY%2BsM0PBFecmMlg%3D&Expires=1688029290
    Resolving encode-public.s3.amazonaws.com (encode-public.s3.amazonaws.com)... 52.218.232.170, 52.218.234.147, 52.92.197.1, ...
    Connecting to encode-public.s3.amazonaws.com (encode-public.s3.amazonaws.com)|52.218.232.170|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 9661656 (9.2M) [text/tab-separated-values]
    Saving to: ‘ENCFF955JLS.tsv.1’
    
    100%[======================================>] 9,661,656   5.19MB/s   in 1.8s   
    
    2023-06-27 16:01:33 (5.19 MB/s) - ‘ENCFF955JLS.tsv.1’ saved [9661656/9661656]
    
    --2023-06-27 16:01:33--  https://www.encodeproject.org/files/ENCFF056WHT/@@download/ENCFF056WHT.tsv
    Resolving www.encodeproject.org (www.encodeproject.org)... 34.211.244.144
    Connecting to www.encodeproject.org (www.encodeproject.org)|34.211.244.144|:443... connected.
    HTTP request sent, awaiting response... 307 Temporary Redirect
    Location: https://encode-public.s3.amazonaws.com/2016/08/29/2e81bacb-bd56-4f77-909b-5216fef94722/ENCFF056WHT.tsv?response-content-disposition=attachment%3B%20filename%3DENCFF056WHT.tsv&AWSAccessKeyId=ASIATGZNGCNX7GP3Y2IA&Signature=uQr1U1r%2F9E0p2mSiF4zWL7cZZUY%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCKIg%2FPwycYRoZQAL1CmMiRQGDuBizaZaxsiwlb5%2FvGAQIgBIzPh6I4VR%2F6wPHM0a10KUDoke0VXRV3HMVVGtc4DIoqsgUIZRAAGgwyMjA3NDg3MTQ4NjMiDMzM9r3h1NSZtH0MVSqPBX%2FR0vE2isUOZyHMe517mdozdebOAmtyr6RinLkkcj0uDchenJa71zKmYCSUmuSuzhJpwHjDp2c1elH2iYx5qj4kk%2B48sEBTS%2B6Wh54IyDF01NZoFW5xDHjAb1DFhBT14%2BzMeWSTG6NT2CcdFVZZxnQBnd5QtHy5EEMSZ4A4o7YvHNJQg7cv3qi06%2FXzXryyLM%2BePVslRNgPghDV9N9tvc1oiGRMIbrqxfV7sophwPyWlJ4%2B7ARl1rHKxZuWg40K0i0Zhpfsk2c3cmzZZMhN2r6AAdxVMHKzGdr2taaj7ENB%2F73xBm%2Fs3%2F6XqtW5SRDnRDn6LNaYDnWKtjPUxPHCJlmrIZh%2BF6MkOegzgLuCqXIyTT0cG%2F6ZEA8G%2BnnsRvKQPKPMQgHPHn6PtWNvHv4HQn4r4sfchwjA0cPktCD5iJnWnbyaAkMwyKXamhUD623Eq4ZjEdPnkX0IxUhoT4dThLXQeEsLPRk7gsytuzYCUTMLAEBiigmjrMYuQ37Oj6HxOtCw6bLF1pQSDNxNDjEz8pmF%2F3NuR3c5%2B%2F8m8JPnZElNkL%2FgJN4mpRuPokipzFd1BV6tIuGIFEnRAnvHPjxQzGHEtTEYO7HqTM3bS7WuIwQuULbhH70GZledq4oyQrmC2aiH6T3PpaQbGlG3eGZsIODzzABYQRhwXGm8o1mtmSvfE6bjKgq82tGEhZOC94iI%2FNGqswM7viFTQ3uO%2FPKrEBVRbk7IUTtiplgDJsD5OG43TlnwqoPJd6PwJQ2ERNKP8CncyRTOzp6oGi1ciFYsdSE5LxYt5r9v5aZT0vnWDvBI0YMWrXex0dmt1a5did%2Ft07pfmgYYBELAt5dFfrc8sdLYRAMUU6tIHvUg7WZuVFQwoYbtpAY6sQE7Kse0Ew1hfd1y%2FPoNpYU29KkXUeMZK%2FF38y1JzgKOisZpcAvVmPnPjJ%2B%2FhYxQfjzGEV0R%2Btiu4d4zvhWC%2BHPf82HUO%2BuUNuAwqOtDV4rjYrVDoXXrGubMfMxQms8zsUg04XOEtvNfJzI6Zoo%2BT1AWtzv7tC8CHCK5HCr6pOwVFRSdlYMBm0WZ70rx07XERRW10iLHTDLhi7GxK068X%2F3uCBWyBUosmY%2BsM0PBFecmMlg%3D&Expires=1688029293 [following]
    --2023-06-27 16:01:33--  https://encode-public.s3.amazonaws.com/2016/08/29/2e81bacb-bd56-4f77-909b-5216fef94722/ENCFF056WHT.tsv?response-content-disposition=attachment%3B%20filename%3DENCFF056WHT.tsv&AWSAccessKeyId=ASIATGZNGCNX7GP3Y2IA&Signature=uQr1U1r%2F9E0p2mSiF4zWL7cZZUY%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCKIg%2FPwycYRoZQAL1CmMiRQGDuBizaZaxsiwlb5%2FvGAQIgBIzPh6I4VR%2F6wPHM0a10KUDoke0VXRV3HMVVGtc4DIoqsgUIZRAAGgwyMjA3NDg3MTQ4NjMiDMzM9r3h1NSZtH0MVSqPBX%2FR0vE2isUOZyHMe517mdozdebOAmtyr6RinLkkcj0uDchenJa71zKmYCSUmuSuzhJpwHjDp2c1elH2iYx5qj4kk%2B48sEBTS%2B6Wh54IyDF01NZoFW5xDHjAb1DFhBT14%2BzMeWSTG6NT2CcdFVZZxnQBnd5QtHy5EEMSZ4A4o7YvHNJQg7cv3qi06%2FXzXryyLM%2BePVslRNgPghDV9N9tvc1oiGRMIbrqxfV7sophwPyWlJ4%2B7ARl1rHKxZuWg40K0i0Zhpfsk2c3cmzZZMhN2r6AAdxVMHKzGdr2taaj7ENB%2F73xBm%2Fs3%2F6XqtW5SRDnRDn6LNaYDnWKtjPUxPHCJlmrIZh%2BF6MkOegzgLuCqXIyTT0cG%2F6ZEA8G%2BnnsRvKQPKPMQgHPHn6PtWNvHv4HQn4r4sfchwjA0cPktCD5iJnWnbyaAkMwyKXamhUD623Eq4ZjEdPnkX0IxUhoT4dThLXQeEsLPRk7gsytuzYCUTMLAEBiigmjrMYuQ37Oj6HxOtCw6bLF1pQSDNxNDjEz8pmF%2F3NuR3c5%2B%2F8m8JPnZElNkL%2FgJN4mpRuPokipzFd1BV6tIuGIFEnRAnvHPjxQzGHEtTEYO7HqTM3bS7WuIwQuULbhH70GZledq4oyQrmC2aiH6T3PpaQbGlG3eGZsIODzzABYQRhwXGm8o1mtmSvfE6bjKgq82tGEhZOC94iI%2FNGqswM7viFTQ3uO%2FPKrEBVRbk7IUTtiplgDJsD5OG43TlnwqoPJd6PwJQ2ERNKP8CncyRTOzp6oGi1ciFYsdSE5LxYt5r9v5aZT0vnWDvBI0YMWrXex0dmt1a5did%2Ft07pfmgYYBELAt5dFfrc8sdLYRAMUU6tIHvUg7WZuVFQwoYbtpAY6sQE7Kse0Ew1hfd1y%2FPoNpYU29KkXUeMZK%2FF38y1JzgKOisZpcAvVmPnPjJ%2B%2FhYxQfjzGEV0R%2Btiu4d4zvhWC%2BHPf82HUO%2BuUNuAwqOtDV4rjYrVDoXXrGubMfMxQms8zsUg04XOEtvNfJzI6Zoo%2BT1AWtzv7tC8CHCK5HCr6pOwVFRSdlYMBm0WZ70rx07XERRW10iLHTDLhi7GxK068X%2F3uCBWyBUosmY%2BsM0PBFecmMlg%3D&Expires=1688029293
    Resolving encode-public.s3.amazonaws.com (encode-public.s3.amazonaws.com)... 52.92.213.129, 52.218.183.25, 52.218.228.51, ...
    Connecting to encode-public.s3.amazonaws.com (encode-public.s3.amazonaws.com)|52.92.213.129|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 9663117 (9.2M) [text/tab-separated-values]
    Saving to: ‘ENCFF056WHT.tsv’
    
    100%[======================================>] 9,663,117    274KB/s   in 7.2s   
    
    2023-06-27 16:01:41 (1.28 MB/s) - ‘ENCFF056WHT.tsv’ saved [9663117/9663117]
    
    gene_id	transcript_id(s)	length	effective_length	expected_count	TPM	FPKM	posterior_mean_count	posterior_standard_deviation_of_count	pme_TPM	pme_FPKM	TPM_ci_lower_bound	TPM_ci_upper_bound	FPKM_ci_lower_bound	FPKM_ci_upper_bound
    21175	21175	86.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21176	21176	74.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    gene_id	transcript_id(s)	length	effective_length	expected_count	TPM	FPKM	posterior_mean_count	posterior_standard_deviation_of_count	pme_TPM	pme_FPKM	TPM_ci_lower_bound	TPM_ci_upper_bound	FPKM_ci_lower_bound	FPKM_ci_upper_bound
    21175	21175	86.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21176	21176	74.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0


## Grab the GM12878 TAD file

It's taken from http://3dgenome.fsm.northwestern.edu/publications.html: "TADs in hg19"


```R
cd /data/hodges_lab/Tim/nnRNA_TPM/reference_files/

### (2a) Prepare TAD File
# Strategy: Convert from TAD BED to a BED file representing TAD boundaries
# awk 'BEGIN{OFS=FS="\t"}{printf "%s\t%d\t%d\n%s\t%d\t%d\n", $1,$2,($2+1),$1,$3,($3+1)}' ${TADDir}GM12878_Lieberman-raw_TADs.txt > ${TADDir}GM12878_Lieberman-raw_TADs.tadBoundaryBED.txt

cp /data/hodges_lab/Tim/finalAnalyses_HMRs/NN_Expression_Contact/TADs/GM12878_Lieberman-raw_TADs.tadBoundaryBED.txt /data/hodges_lab/Tim/nnRNA_TPM/reference_files/
```

## Grab the ENCODE HepG2 RNA-seq dataset


```R
wget https://www.encodeproject.org/files/ENCFF818SGG/@@download/ENCFF818SGG.tsv
head ENCFF818SGG.tsv
```

    --2023-06-23 01:05:14--  https://www.encodeproject.org/files/ENCFF818SGG/@@download/ENCFF818SGG.tsv
    Resolving www.encodeproject.org (www.encodeproject.org)... 34.211.244.144
    Connecting to www.encodeproject.org (www.encodeproject.org)|34.211.244.144|:443... connected.
    HTTP request sent, awaiting response... 307 Temporary Redirect
    Location: https://encode-public.s3.amazonaws.com/2021/04/07/8cc44d31-b8ea-4f76-b161-83deeec943eb/ENCFF818SGG.tsv?response-content-disposition=attachment%3B%20filename%3DENCFF818SGG.tsv&AWSAccessKeyId=ASIATGZNGCNXRNKYKDXK&Signature=34WW4%2Fp%2F9jRvv35OA%2BEazBDd5X8%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD6hqwd7H7VD1uvVdcFhZsC9Z2xBU1ZlaEM4mD%2F2HnevQIhAIYee4iVfhmyrkhXeSCvjFQhMYEp1Krg%2FqEavDPpOUhnKrsFCOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMjIwNzQ4NzE0ODYzIgyynrJD3vKwoUD%2BAncqjwUzLudBbSPbZG9%2Bhdgz2Z313uKXYF0i9cFzKQVQo%2FvML2YHw09LJMlzECJNW8jhOtK2IJMsacUHm0HgYZJrpRLbmlXpsNREYLSMpOk2d48l3uGp2cB0XC5GOqQqdKusrqeL10Yr7YvgYDWOCMRDYkscCqFK3krYM0UdXVEKnSJHFopKIkJcJQQx0iMTEpKwvTbpyaqtZYx9cNkpijvXb8Uk8pq5brAeGxm7SMubKQoqx9gkJ7cYlqz9Wa5O4mcOFMq%2Bx8Z0%2BsdlK9gWK8LYEjDRkBmGbLabDTYFbzMpzUWzHx2knzFg7o%2FwZzko1l28TyhekBZVWyMnuBhDkGp2UKzkTDyd0PhuGtR2xVKxtACbO3x22wil7HxrIoWKN0u41yDRPbZkReuQe4PFaiGNRWfdBgxZqb9mMhAgdioVkQIKAeS3YkiP6JgHGHmgY7FYh4fn8QPKzPDMXY%2BoIYQEpcxAiJxfbeNs8y0vWHzjCimB9HnLy2Ss8cJUgSRi9Y7a0vi1Ynw9jol897UXxzq2XyvuJwv7hDRA%2Fop%2FZT5eTmh7e5s7cfCmNsQS46ebks7IZ%2FCI2P3de4kopB9m0ATYl2J9UnoOvRkhdzLfDz%2Fm%2FthiQBHBzx4tESY8hGyNRUoqm7NBkfhGSUQi9Sno5F8eE8XaygAfkZnhPMg3vobvHxOwrkmCbJQE9jS6QdYR7GDzqOtKvwnr8ej711DUZcw7RYxGudk1DwvVO2S1HU9%2FKEsoqYCpejow7uqmXSXN5p0aoft6j3Py5Ql1iWu%2B9sV6IzVaVPE%2FZeRkTPGaSko3Wv%2Fe4B2WbUOiWgTO5GeR7nXZmzCop2eD1dhSN3%2FCjM%2FUYhnU5d%2FeMQPu1%2B%2B4Bq7cbMsdMJrZ1KQGOrABL2oPPisftbp1j0zeex61Mun6uNdgl0u8FAAg2hpuSAH22Q%2FhKQcSWbXdpWMttKs7F8uOHL5Hslo2PUB4VQ38Y%2FMX8L1Q5qLoZPUqwFcty4cUO%2Bz060jdB1031Uzuf1zNyzNNWaerc2ESeA3pWe4LoNYGqKiO2RO%2FyydPCO7j6y7ekK%2BMp54IS6uJjta1WnhkSSpaaeRK%2BkmlHNCXoJal6uIvXe%2BYPMd36OAIjItNn6Q%3D&Expires=1687629914 [following]
    --2023-06-23 01:05:14--  https://encode-public.s3.amazonaws.com/2021/04/07/8cc44d31-b8ea-4f76-b161-83deeec943eb/ENCFF818SGG.tsv?response-content-disposition=attachment%3B%20filename%3DENCFF818SGG.tsv&AWSAccessKeyId=ASIATGZNGCNXRNKYKDXK&Signature=34WW4%2Fp%2F9jRvv35OA%2BEazBDd5X8%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEI7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJIMEYCIQD6hqwd7H7VD1uvVdcFhZsC9Z2xBU1ZlaEM4mD%2F2HnevQIhAIYee4iVfhmyrkhXeSCvjFQhMYEp1Krg%2FqEavDPpOUhnKrsFCOf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMjIwNzQ4NzE0ODYzIgyynrJD3vKwoUD%2BAncqjwUzLudBbSPbZG9%2Bhdgz2Z313uKXYF0i9cFzKQVQo%2FvML2YHw09LJMlzECJNW8jhOtK2IJMsacUHm0HgYZJrpRLbmlXpsNREYLSMpOk2d48l3uGp2cB0XC5GOqQqdKusrqeL10Yr7YvgYDWOCMRDYkscCqFK3krYM0UdXVEKnSJHFopKIkJcJQQx0iMTEpKwvTbpyaqtZYx9cNkpijvXb8Uk8pq5brAeGxm7SMubKQoqx9gkJ7cYlqz9Wa5O4mcOFMq%2Bx8Z0%2BsdlK9gWK8LYEjDRkBmGbLabDTYFbzMpzUWzHx2knzFg7o%2FwZzko1l28TyhekBZVWyMnuBhDkGp2UKzkTDyd0PhuGtR2xVKxtACbO3x22wil7HxrIoWKN0u41yDRPbZkReuQe4PFaiGNRWfdBgxZqb9mMhAgdioVkQIKAeS3YkiP6JgHGHmgY7FYh4fn8QPKzPDMXY%2BoIYQEpcxAiJxfbeNs8y0vWHzjCimB9HnLy2Ss8cJUgSRi9Y7a0vi1Ynw9jol897UXxzq2XyvuJwv7hDRA%2Fop%2FZT5eTmh7e5s7cfCmNsQS46ebks7IZ%2FCI2P3de4kopB9m0ATYl2J9UnoOvRkhdzLfDz%2Fm%2FthiQBHBzx4tESY8hGyNRUoqm7NBkfhGSUQi9Sno5F8eE8XaygAfkZnhPMg3vobvHxOwrkmCbJQE9jS6QdYR7GDzqOtKvwnr8ej711DUZcw7RYxGudk1DwvVO2S1HU9%2FKEsoqYCpejow7uqmXSXN5p0aoft6j3Py5Ql1iWu%2B9sV6IzVaVPE%2FZeRkTPGaSko3Wv%2Fe4B2WbUOiWgTO5GeR7nXZmzCop2eD1dhSN3%2FCjM%2FUYhnU5d%2FeMQPu1%2B%2B4Bq7cbMsdMJrZ1KQGOrABL2oPPisftbp1j0zeex61Mun6uNdgl0u8FAAg2hpuSAH22Q%2FhKQcSWbXdpWMttKs7F8uOHL5Hslo2PUB4VQ38Y%2FMX8L1Q5qLoZPUqwFcty4cUO%2Bz060jdB1031Uzuf1zNyzNNWaerc2ESeA3pWe4LoNYGqKiO2RO%2FyydPCO7j6y7ekK%2BMp54IS6uJjta1WnhkSSpaaeRK%2BkmlHNCXoJal6uIvXe%2BYPMd36OAIjItNn6Q%3D&Expires=1687629914
    Resolving encode-public.s3.amazonaws.com (encode-public.s3.amazonaws.com)... 52.92.131.185, 52.92.165.193, 52.218.213.43, ...
    Connecting to encode-public.s3.amazonaws.com (encode-public.s3.amazonaws.com)|52.92.131.185|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 11111597 (11M) [binary/octet-stream]
    Saving to: ‘ENCFF818SGG.tsv’
    
    100%[======================================>] 11,111,597  15.7MB/s   in 0.7s   
    
    2023-06-23 01:05:16 (15.7 MB/s) - ‘ENCFF818SGG.tsv’ saved [11111597/11111597]
    
    gene_id	transcript_id(s)	length	effective_length	expected_count	TPM	FPKM	posterior_mean_count	posterior_standard_deviation_of_count	pme_TPM	pme_FPKM	TPM_ci_lower_bound	TPM_ci_upper_bound	TPM_coefficient_of_quartile_variation	FPKM_ci_lower_bound	FPKM_ci_upper_bound	FPKM_coefficient_of_quartile_variation
    10904	10904	93.00	18.00	0.00	0.00	0.00	0.00	0.00	3.05	2.75	0.000148841	9.17705	0.657265	0.00013415	8.26339	0.657329
    12954	12954	94.00	19.00	0.00	0.00	0.00	0.00	0.00	2.89	2.60	5.5359e-05	8.68862	0.653515	4.98074e-05	7.81845	0.653555
    12956	12956	72.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0	0	0
    12958	12958	82.00	7.00	0.00	0.00	0.00	0.00	0.00	7.85	7.06	3.37769e-05	23.5134	0.657775	3.03808e-05	21.1796	0.657611
    12960	12960	73.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0	0	0
    12962	12962	72.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0	0	0
    12964	12964	74.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0	0	0
    12965	12965	82.00	7.00	0.00	0.00	0.00	0.00	0.00	7.85	7.06	1.83886e-05	23.3469	0.656036	0.00036491	21.0407	0.655842
    12967	12967	73.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0	0	0


https://www.encodeproject.org/experiments/ENCSR329MHM/

Richard Myers - 
ENCFF649AHO and ENCFF974MUO


```R
cd /data/hodges_lab/Tim/nnRNA_TPM/reference_files/

wget https://www.encodeproject.org/files/ENCFF974MUO/@@download/ENCFF974MUO.tsv
wget https://www.encodeproject.org/files/ENCFF649AHO/@@download/ENCFF649AHO.tsv

head ENCFF974MUO.tsv
head ENCFF649AHO.tsv
```

    --2023-06-27 16:01:56--  https://www.encodeproject.org/files/ENCFF974MUO/@@download/ENCFF974MUO.tsv
    Resolving www.encodeproject.org (www.encodeproject.org)... 34.211.244.144
    Connecting to www.encodeproject.org (www.encodeproject.org)|34.211.244.144|:443... connected.
    HTTP request sent, awaiting response... 307 Temporary Redirect
    Location: https://encode-public.s3.amazonaws.com/2016/10/14/dca2bbf7-78c1-44a5-b816-6897ffa22cbc/ENCFF974MUO.tsv?response-content-disposition=attachment%3B%20filename%3DENCFF974MUO.tsv&AWSAccessKeyId=ASIATGZNGCNX7GP3Y2IA&Signature=nR0ocUiUBfohWG9OxXELjNU%2Bw8Y%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCKIg%2FPwycYRoZQAL1CmMiRQGDuBizaZaxsiwlb5%2FvGAQIgBIzPh6I4VR%2F6wPHM0a10KUDoke0VXRV3HMVVGtc4DIoqsgUIZRAAGgwyMjA3NDg3MTQ4NjMiDMzM9r3h1NSZtH0MVSqPBX%2FR0vE2isUOZyHMe517mdozdebOAmtyr6RinLkkcj0uDchenJa71zKmYCSUmuSuzhJpwHjDp2c1elH2iYx5qj4kk%2B48sEBTS%2B6Wh54IyDF01NZoFW5xDHjAb1DFhBT14%2BzMeWSTG6NT2CcdFVZZxnQBnd5QtHy5EEMSZ4A4o7YvHNJQg7cv3qi06%2FXzXryyLM%2BePVslRNgPghDV9N9tvc1oiGRMIbrqxfV7sophwPyWlJ4%2B7ARl1rHKxZuWg40K0i0Zhpfsk2c3cmzZZMhN2r6AAdxVMHKzGdr2taaj7ENB%2F73xBm%2Fs3%2F6XqtW5SRDnRDn6LNaYDnWKtjPUxPHCJlmrIZh%2BF6MkOegzgLuCqXIyTT0cG%2F6ZEA8G%2BnnsRvKQPKPMQgHPHn6PtWNvHv4HQn4r4sfchwjA0cPktCD5iJnWnbyaAkMwyKXamhUD623Eq4ZjEdPnkX0IxUhoT4dThLXQeEsLPRk7gsytuzYCUTMLAEBiigmjrMYuQ37Oj6HxOtCw6bLF1pQSDNxNDjEz8pmF%2F3NuR3c5%2B%2F8m8JPnZElNkL%2FgJN4mpRuPokipzFd1BV6tIuGIFEnRAnvHPjxQzGHEtTEYO7HqTM3bS7WuIwQuULbhH70GZledq4oyQrmC2aiH6T3PpaQbGlG3eGZsIODzzABYQRhwXGm8o1mtmSvfE6bjKgq82tGEhZOC94iI%2FNGqswM7viFTQ3uO%2FPKrEBVRbk7IUTtiplgDJsD5OG43TlnwqoPJd6PwJQ2ERNKP8CncyRTOzp6oGi1ciFYsdSE5LxYt5r9v5aZT0vnWDvBI0YMWrXex0dmt1a5did%2Ft07pfmgYYBELAt5dFfrc8sdLYRAMUU6tIHvUg7WZuVFQwoYbtpAY6sQE7Kse0Ew1hfd1y%2FPoNpYU29KkXUeMZK%2FF38y1JzgKOisZpcAvVmPnPjJ%2B%2FhYxQfjzGEV0R%2Btiu4d4zvhWC%2BHPf82HUO%2BuUNuAwqOtDV4rjYrVDoXXrGubMfMxQms8zsUg04XOEtvNfJzI6Zoo%2BT1AWtzv7tC8CHCK5HCr6pOwVFRSdlYMBm0WZ70rx07XERRW10iLHTDLhi7GxK068X%2F3uCBWyBUosmY%2BsM0PBFecmMlg%3D&Expires=1688029316 [following]
    --2023-06-27 16:01:56--  https://encode-public.s3.amazonaws.com/2016/10/14/dca2bbf7-78c1-44a5-b816-6897ffa22cbc/ENCFF974MUO.tsv?response-content-disposition=attachment%3B%20filename%3DENCFF974MUO.tsv&AWSAccessKeyId=ASIATGZNGCNX7GP3Y2IA&Signature=nR0ocUiUBfohWG9OxXELjNU%2Bw8Y%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCKIg%2FPwycYRoZQAL1CmMiRQGDuBizaZaxsiwlb5%2FvGAQIgBIzPh6I4VR%2F6wPHM0a10KUDoke0VXRV3HMVVGtc4DIoqsgUIZRAAGgwyMjA3NDg3MTQ4NjMiDMzM9r3h1NSZtH0MVSqPBX%2FR0vE2isUOZyHMe517mdozdebOAmtyr6RinLkkcj0uDchenJa71zKmYCSUmuSuzhJpwHjDp2c1elH2iYx5qj4kk%2B48sEBTS%2B6Wh54IyDF01NZoFW5xDHjAb1DFhBT14%2BzMeWSTG6NT2CcdFVZZxnQBnd5QtHy5EEMSZ4A4o7YvHNJQg7cv3qi06%2FXzXryyLM%2BePVslRNgPghDV9N9tvc1oiGRMIbrqxfV7sophwPyWlJ4%2B7ARl1rHKxZuWg40K0i0Zhpfsk2c3cmzZZMhN2r6AAdxVMHKzGdr2taaj7ENB%2F73xBm%2Fs3%2F6XqtW5SRDnRDn6LNaYDnWKtjPUxPHCJlmrIZh%2BF6MkOegzgLuCqXIyTT0cG%2F6ZEA8G%2BnnsRvKQPKPMQgHPHn6PtWNvHv4HQn4r4sfchwjA0cPktCD5iJnWnbyaAkMwyKXamhUD623Eq4ZjEdPnkX0IxUhoT4dThLXQeEsLPRk7gsytuzYCUTMLAEBiigmjrMYuQ37Oj6HxOtCw6bLF1pQSDNxNDjEz8pmF%2F3NuR3c5%2B%2F8m8JPnZElNkL%2FgJN4mpRuPokipzFd1BV6tIuGIFEnRAnvHPjxQzGHEtTEYO7HqTM3bS7WuIwQuULbhH70GZledq4oyQrmC2aiH6T3PpaQbGlG3eGZsIODzzABYQRhwXGm8o1mtmSvfE6bjKgq82tGEhZOC94iI%2FNGqswM7viFTQ3uO%2FPKrEBVRbk7IUTtiplgDJsD5OG43TlnwqoPJd6PwJQ2ERNKP8CncyRTOzp6oGi1ciFYsdSE5LxYt5r9v5aZT0vnWDvBI0YMWrXex0dmt1a5did%2Ft07pfmgYYBELAt5dFfrc8sdLYRAMUU6tIHvUg7WZuVFQwoYbtpAY6sQE7Kse0Ew1hfd1y%2FPoNpYU29KkXUeMZK%2FF38y1JzgKOisZpcAvVmPnPjJ%2B%2FhYxQfjzGEV0R%2Btiu4d4zvhWC%2BHPf82HUO%2BuUNuAwqOtDV4rjYrVDoXXrGubMfMxQms8zsUg04XOEtvNfJzI6Zoo%2BT1AWtzv7tC8CHCK5HCr6pOwVFRSdlYMBm0WZ70rx07XERRW10iLHTDLhi7GxK068X%2F3uCBWyBUosmY%2BsM0PBFecmMlg%3D&Expires=1688029316
    Resolving encode-public.s3.amazonaws.com (encode-public.s3.amazonaws.com)... 52.218.245.170, 52.92.165.9, 52.92.128.233, ...
    Connecting to encode-public.s3.amazonaws.com (encode-public.s3.amazonaws.com)|52.218.245.170|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 9740072 (9.3M) [text/tab-separated-values]
    Saving to: ‘ENCFF974MUO.tsv’
    
    100%[======================================>] 9,740,072    309KB/s   in 23s    
    
    2023-06-27 16:02:19 (421 KB/s) - ‘ENCFF974MUO.tsv’ saved [9740072/9740072]
    
    --2023-06-27 16:02:19--  https://www.encodeproject.org/files/ENCFF649AHO/@@download/ENCFF649AHO.tsv
    Resolving www.encodeproject.org (www.encodeproject.org)... 34.211.244.144
    Connecting to www.encodeproject.org (www.encodeproject.org)|34.211.244.144|:443... connected.
    HTTP request sent, awaiting response... 307 Temporary Redirect
    Location: https://encode-public.s3.amazonaws.com/2016/10/14/7298564d-03ef-4eca-80e0-0950675448d5/ENCFF649AHO.tsv?response-content-disposition=attachment%3B%20filename%3DENCFF649AHO.tsv&AWSAccessKeyId=ASIATGZNGCNX7GP3Y2IA&Signature=hms1luVlEYACNH4OIqrF8Txi2po%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCKIg%2FPwycYRoZQAL1CmMiRQGDuBizaZaxsiwlb5%2FvGAQIgBIzPh6I4VR%2F6wPHM0a10KUDoke0VXRV3HMVVGtc4DIoqsgUIZRAAGgwyMjA3NDg3MTQ4NjMiDMzM9r3h1NSZtH0MVSqPBX%2FR0vE2isUOZyHMe517mdozdebOAmtyr6RinLkkcj0uDchenJa71zKmYCSUmuSuzhJpwHjDp2c1elH2iYx5qj4kk%2B48sEBTS%2B6Wh54IyDF01NZoFW5xDHjAb1DFhBT14%2BzMeWSTG6NT2CcdFVZZxnQBnd5QtHy5EEMSZ4A4o7YvHNJQg7cv3qi06%2FXzXryyLM%2BePVslRNgPghDV9N9tvc1oiGRMIbrqxfV7sophwPyWlJ4%2B7ARl1rHKxZuWg40K0i0Zhpfsk2c3cmzZZMhN2r6AAdxVMHKzGdr2taaj7ENB%2F73xBm%2Fs3%2F6XqtW5SRDnRDn6LNaYDnWKtjPUxPHCJlmrIZh%2BF6MkOegzgLuCqXIyTT0cG%2F6ZEA8G%2BnnsRvKQPKPMQgHPHn6PtWNvHv4HQn4r4sfchwjA0cPktCD5iJnWnbyaAkMwyKXamhUD623Eq4ZjEdPnkX0IxUhoT4dThLXQeEsLPRk7gsytuzYCUTMLAEBiigmjrMYuQ37Oj6HxOtCw6bLF1pQSDNxNDjEz8pmF%2F3NuR3c5%2B%2F8m8JPnZElNkL%2FgJN4mpRuPokipzFd1BV6tIuGIFEnRAnvHPjxQzGHEtTEYO7HqTM3bS7WuIwQuULbhH70GZledq4oyQrmC2aiH6T3PpaQbGlG3eGZsIODzzABYQRhwXGm8o1mtmSvfE6bjKgq82tGEhZOC94iI%2FNGqswM7viFTQ3uO%2FPKrEBVRbk7IUTtiplgDJsD5OG43TlnwqoPJd6PwJQ2ERNKP8CncyRTOzp6oGi1ciFYsdSE5LxYt5r9v5aZT0vnWDvBI0YMWrXex0dmt1a5did%2Ft07pfmgYYBELAt5dFfrc8sdLYRAMUU6tIHvUg7WZuVFQwoYbtpAY6sQE7Kse0Ew1hfd1y%2FPoNpYU29KkXUeMZK%2FF38y1JzgKOisZpcAvVmPnPjJ%2B%2FhYxQfjzGEV0R%2Btiu4d4zvhWC%2BHPf82HUO%2BuUNuAwqOtDV4rjYrVDoXXrGubMfMxQms8zsUg04XOEtvNfJzI6Zoo%2BT1AWtzv7tC8CHCK5HCr6pOwVFRSdlYMBm0WZ70rx07XERRW10iLHTDLhi7GxK068X%2F3uCBWyBUosmY%2BsM0PBFecmMlg%3D&Expires=1688029340 [following]
    --2023-06-27 16:02:20--  https://encode-public.s3.amazonaws.com/2016/10/14/7298564d-03ef-4eca-80e0-0950675448d5/ENCFF649AHO.tsv?response-content-disposition=attachment%3B%20filename%3DENCFF649AHO.tsv&AWSAccessKeyId=ASIATGZNGCNX7GP3Y2IA&Signature=hms1luVlEYACNH4OIqrF8Txi2po%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLXdlc3QtMiJHMEUCIQCKIg%2FPwycYRoZQAL1CmMiRQGDuBizaZaxsiwlb5%2FvGAQIgBIzPh6I4VR%2F6wPHM0a10KUDoke0VXRV3HMVVGtc4DIoqsgUIZRAAGgwyMjA3NDg3MTQ4NjMiDMzM9r3h1NSZtH0MVSqPBX%2FR0vE2isUOZyHMe517mdozdebOAmtyr6RinLkkcj0uDchenJa71zKmYCSUmuSuzhJpwHjDp2c1elH2iYx5qj4kk%2B48sEBTS%2B6Wh54IyDF01NZoFW5xDHjAb1DFhBT14%2BzMeWSTG6NT2CcdFVZZxnQBnd5QtHy5EEMSZ4A4o7YvHNJQg7cv3qi06%2FXzXryyLM%2BePVslRNgPghDV9N9tvc1oiGRMIbrqxfV7sophwPyWlJ4%2B7ARl1rHKxZuWg40K0i0Zhpfsk2c3cmzZZMhN2r6AAdxVMHKzGdr2taaj7ENB%2F73xBm%2Fs3%2F6XqtW5SRDnRDn6LNaYDnWKtjPUxPHCJlmrIZh%2BF6MkOegzgLuCqXIyTT0cG%2F6ZEA8G%2BnnsRvKQPKPMQgHPHn6PtWNvHv4HQn4r4sfchwjA0cPktCD5iJnWnbyaAkMwyKXamhUD623Eq4ZjEdPnkX0IxUhoT4dThLXQeEsLPRk7gsytuzYCUTMLAEBiigmjrMYuQ37Oj6HxOtCw6bLF1pQSDNxNDjEz8pmF%2F3NuR3c5%2B%2F8m8JPnZElNkL%2FgJN4mpRuPokipzFd1BV6tIuGIFEnRAnvHPjxQzGHEtTEYO7HqTM3bS7WuIwQuULbhH70GZledq4oyQrmC2aiH6T3PpaQbGlG3eGZsIODzzABYQRhwXGm8o1mtmSvfE6bjKgq82tGEhZOC94iI%2FNGqswM7viFTQ3uO%2FPKrEBVRbk7IUTtiplgDJsD5OG43TlnwqoPJd6PwJQ2ERNKP8CncyRTOzp6oGi1ciFYsdSE5LxYt5r9v5aZT0vnWDvBI0YMWrXex0dmt1a5did%2Ft07pfmgYYBELAt5dFfrc8sdLYRAMUU6tIHvUg7WZuVFQwoYbtpAY6sQE7Kse0Ew1hfd1y%2FPoNpYU29KkXUeMZK%2FF38y1JzgKOisZpcAvVmPnPjJ%2B%2FhYxQfjzGEV0R%2Btiu4d4zvhWC%2BHPf82HUO%2BuUNuAwqOtDV4rjYrVDoXXrGubMfMxQms8zsUg04XOEtvNfJzI6Zoo%2BT1AWtzv7tC8CHCK5HCr6pOwVFRSdlYMBm0WZ70rx07XERRW10iLHTDLhi7GxK068X%2F3uCBWyBUosmY%2BsM0PBFecmMlg%3D&Expires=1688029340
    Resolving encode-public.s3.amazonaws.com (encode-public.s3.amazonaws.com)... 52.92.210.81, 52.92.225.137, 52.92.209.161, ...
    Connecting to encode-public.s3.amazonaws.com (encode-public.s3.amazonaws.com)|52.92.210.81|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 9728478 (9.3M) [text/tab-separated-values]
    Saving to: ‘ENCFF649AHO.tsv’
    
    100%[======================================>] 9,728,478    408KB/s   in 23s    
    
    2023-06-27 16:02:44 (410 KB/s) - ‘ENCFF649AHO.tsv’ saved [9728478/9728478]
    
    gene_id	transcript_id(s)	length	effective_length	expected_count	TPM	FPKM	posterior_mean_count	posterior_standard_deviation_of_count	pme_TPM	pme_FPKM	TPM_ci_lower_bound	TPM_ci_upper_bound	FPKM_ci_lower_bound	FPKM_ci_upper_bound
    21175	21175	86.00	11.00	0.00	0.00	0.00	0.00	0.00	4.94	4.44	4.93931e-05	14.8079	4.43921e-05	13.301
    21176	21176	74.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21177	21177	72.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21178	21178	71.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21179	21179	74.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21180	21180	73.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21181	21181	73.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21182	21182	73.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21183	21183	86.00	11.00	0.00	0.00	0.00	0.00	0.00	4.94	4.44	0.000779243	14.7477	0.000700329	13.2479
    gene_id	transcript_id(s)	length	effective_length	expected_count	TPM	FPKM	posterior_mean_count	posterior_standard_deviation_of_count	pme_TPM	pme_FPKM	TPM_ci_lower_bound	TPM_ci_upper_bound	FPKM_ci_lower_bound	FPKM_ci_upper_bound
    21175	21175	86.00	11.00	0.00	0.00	0.00	0.00	0.00	6.84	6.09	0.000148214	20.5896	0.000132255	18.3242
    21176	21176	74.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21177	21177	72.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21178	21178	71.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21179	21179	74.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21180	21180	73.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21181	21181	73.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21182	21182	73.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0	0	0	0
    21183	21183	86.00	11.00	0.00	0.00	0.00	0.00	0.00	6.84	6.09	1.32322e-05	20.7249	1.17766e-05	18.4451


## Grab the Liver TAD file


```R
/data/hodges_lab/Tim/nnRNA_TPM/reference_files/Liver_STL011_Leung2015-raw_TADs.txt
```

# R: Make ENSG-TPM BED file with Expression Filter (TPM > 0)

## Load libraries and files


```R
library(tidyverse)
library(ggplot2)
library(clusterProfiler)

print("Loaded.")
```

    [1] "Loaded."



```R

```

    
    
    clusterProfiler v4.2.0  For help: https://yulab-smu.top/biomedical-knowledge-mining-book/
    
    If you use clusterProfiler in published research, please cite:
    T Wu, E Hu, S Xu, M Chen, P Guo, Z Dai, T Feng, L Zhou, W Tang, L Zhan, X Fu, S Liu, X Bo, and G Yu. clusterProfiler 4.0: A universal enrichment tool for interpreting omics data. The Innovation. 2021, 2(3):100141
    
    
    Attaching package: ‘clusterProfiler’
    
    
    The following object is masked from ‘package:purrr’:
    
        simplify
    
    
    The following object is masked from ‘package:stats’:
    
        filter
    
    


Load RefSeq NM Gene Promoter list and ENCODE RNA-seq file


```R
setwd("/data/hodges_lab/Tim/nnRNA_TPM/reference_files/")
list.files()
```


<style>
.list-inline {list-style: none; margin:0; padding: 0}
.list-inline>li {display: inline-block}
.list-inline>li:not(:last-child)::after {content: "\00b7"; padding: 0 .5ex}
</style>
<ol class=list-inline><li>'ENCFF056WHT.tsv'</li><li>'ENCFF649AHO.tsv'</li><li>'ENCFF818SGG.tsv'</li><li>'ENCFF955JLS.tsv'</li><li>'ENCFF955JLS.tsv.1'</li><li>'ENCFF974MUO.tsv'</li><li>'GM12878_Lieberman-raw_TADs.tadBoundaryBED.txt'</li><li>'Liver_STL011_Leung2015-raw_TADs.tadBoundaryBED.txt'</li><li>'Liver_STL011_Leung2015-raw_TADs.txt'</li><li>'ncbiRefSeqCurated_NM.promoters.Upstream2000Downstream1000.txt'</li><li>'Promoter_list_ENSG_TPM_ExprFiltered0.Liver.txt'</li><li>'Promoter_list_ENSG_TPM_ExprFiltered0.Liver.withHeaders.txt'</li><li>'Promoter_list_ENSG_TPM_ExprFiltered0.txt'</li><li>'Promoter_list_ENSG_TPM_ExprFiltered0.withHeaders.txt'</li><li>'Promoter_list_ENSG_TPM_Liver.bed'</li><li>'Promoter_list_ENSG_TPM_subsetTable.txt'</li><li>'Promoter_list_ENSG_TPM.bed'</li></ol>




```R
Promoter_list <- read_tsv("./ncbiRefSeqCurated_NM.promoters.Upstream2000Downstream1000.txt", col_names=F) %>%
  magrittr::set_colnames(c("Chr","Start","End","RefSeq","Strand")) %>%
  mutate(REFSEQ=gsub("\\..*","",RefSeq))

Promoter_list
```

    [1mRows: [22m[34m56099[39m [1mColumns: [22m[34m5[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (3): X1, X4, X5
    [32mdbl[39m (2): X2, X3
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



<table class="dataframe">
<caption>A tibble: 56099 × 6</caption>
<thead>
	<tr><th scope=col>Chr</th><th scope=col>Start</th><th scope=col>End</th><th scope=col>RefSeq</th><th scope=col>Strand</th><th scope=col>REFSEQ</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1</td><td>  67090</td><td>  70090</td><td>NM_001005484.1</td><td>+</td><td>NM_001005484</td></tr>
	<tr><td>chr1</td><td> 365658</td><td> 368658</td><td>NM_001005221.2</td><td>+</td><td>NM_001005221</td></tr>
	<tr><td>chr1</td><td> 621034</td><td> 624034</td><td>NM_001005277.1</td><td>-</td><td>NM_001005277</td></tr>
	<tr><td>chr1</td><td> 859110</td><td> 862110</td><td>NM_152486.3   </td><td>+</td><td>NM_152486   </td></tr>
	<tr><td>chr1</td><td> 893636</td><td> 896636</td><td>NM_015658.4   </td><td>-</td><td>NM_015658   </td></tr>
	<tr><td>chr1</td><td> 893963</td><td> 896963</td><td>NM_198317.3   </td><td>+</td><td>NM_198317   </td></tr>
	<tr><td>chr1</td><td> 899861</td><td> 902861</td><td>NM_032129.3   </td><td>+</td><td>NM_032129   </td></tr>
	<tr><td>chr1</td><td> 899861</td><td> 902861</td><td>NM_001367552.1</td><td>+</td><td>NM_001367552</td></tr>
	<tr><td>chr1</td><td> 899861</td><td> 902861</td><td>NM_001160184.2</td><td>+</td><td>NM_001160184</td></tr>
	<tr><td>chr1</td><td> 915553</td><td> 918553</td><td>NM_001369898.1</td><td>-</td><td>NM_001369898</td></tr>
	<tr><td>chr1</td><td> 916473</td><td> 919473</td><td>NM_001291367.2</td><td>-</td><td>NM_001291367</td></tr>
	<tr><td>chr1</td><td> 916473</td><td> 919473</td><td>NM_001369897.1</td><td>-</td><td>NM_001369897</td></tr>
	<tr><td>chr1</td><td> 916473</td><td> 919473</td><td>NM_001291366.2</td><td>-</td><td>NM_001291366</td></tr>
	<tr><td>chr1</td><td> 934477</td><td> 937477</td><td>NM_001142467.2</td><td>-</td><td>NM_001142467</td></tr>
	<tr><td>chr1</td><td> 934477</td><td> 937477</td><td>NM_021170.4   </td><td>-</td><td>NM_021170   </td></tr>
	<tr><td>chr1</td><td> 946876</td><td> 949876</td><td>NM_005101.4   </td><td>+</td><td>NM_005101   </td></tr>
	<tr><td>chr1</td><td> 953499</td><td> 956499</td><td>NM_198576.4   </td><td>+</td><td>NM_198576   </td></tr>
	<tr><td>chr1</td><td> 953499</td><td> 956499</td><td>NM_001305275.2</td><td>+</td><td>NM_001305275</td></tr>
	<tr><td>chr1</td><td> 967372</td><td> 970372</td><td>NM_001364727.2</td><td>+</td><td>NM_001364727</td></tr>
	<tr><td>chr1</td><td>1008686</td><td>1011686</td><td>NM_001205252.2</td><td>-</td><td>NM_001205252</td></tr>
	<tr><td>chr1</td><td>1050469</td><td>1053469</td><td>NM_017891.5   </td><td>-</td><td>NM_017891   </td></tr>
	<tr><td>chr1</td><td>1050469</td><td>1053469</td><td>NM_001330306.2</td><td>-</td><td>NM_001330306</td></tr>
	<tr><td>chr1</td><td>1050469</td><td>1053469</td><td>NM_001363525.2</td><td>-</td><td>NM_001363525</td></tr>
	<tr><td>chr1</td><td>1107259</td><td>1110259</td><td>NM_001130045.2</td><td>+</td><td>NM_001130045</td></tr>
	<tr><td>chr1</td><td>1107259</td><td>1110259</td><td>NM_001371649.1</td><td>+</td><td>NM_001371649</td></tr>
	<tr><td>chr1</td><td>1113060</td><td>1116060</td><td>NM_153254.3   </td><td>+</td><td>NM_153254   </td></tr>
	<tr><td>chr1</td><td>1140972</td><td>1143972</td><td>NM_148901.2   </td><td>-</td><td>NM_148901   </td></tr>
	<tr><td>chr1</td><td>1140972</td><td>1143972</td><td>NM_148902.2   </td><td>-</td><td>NM_148902   </td></tr>
	<tr><td>chr1</td><td>1140972</td><td>1143972</td><td>NM_004195.3   </td><td>-</td><td>NM_004195   </td></tr>
	<tr><td>chr1</td><td>1148533</td><td>1151533</td><td>NM_003327.4   </td><td>-</td><td>NM_003327   </td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>chrY</td><td>23694764</td><td>23697764</td><td>NM_005058.4   </td><td>+</td><td>NM_005058   </td></tr>
	<tr><td>chrY</td><td>24039673</td><td>24042673</td><td>NM_001320950.1</td><td>-</td><td>NM_001320950</td></tr>
	<tr><td>chrY</td><td>24039673</td><td>24042673</td><td>NM_001320949.1</td><td>-</td><td>NM_001320949</td></tr>
	<tr><td>chrY</td><td>24039673</td><td>24042673</td><td>NM_001006120.3</td><td>-</td><td>NM_001006120</td></tr>
	<tr><td>chrY</td><td>24063174</td><td>24066174</td><td>NM_001006118.2</td><td>-</td><td>NM_001006118</td></tr>
	<tr><td>chrY</td><td>24241154</td><td>24244154</td><td>NM_001002758.1</td><td>-</td><td>NM_001002758</td></tr>
	<tr><td>chrY</td><td>24328089</td><td>24331089</td><td>NM_152585.2   </td><td>-</td><td>NM_152585   </td></tr>
	<tr><td>chrY</td><td>24328089</td><td>24331089</td><td>NM_001303410.1</td><td>-</td><td>NM_001303410</td></tr>
	<tr><td>chrY</td><td>24547556</td><td>24550556</td><td>NM_001006117.3</td><td>+</td><td>NM_001006117</td></tr>
	<tr><td>chrY</td><td>24634543</td><td>24637543</td><td>NM_004676.2   </td><td>+</td><td>NM_004676   </td></tr>
	<tr><td>chrY</td><td>25128409</td><td>25131409</td><td>NM_004678.3   </td><td>+</td><td>NM_004678   </td></tr>
	<tr><td>chrY</td><td>25344239</td><td>25347239</td><td>NM_004081.5   </td><td>-</td><td>NM_004081   </td></tr>
	<tr><td>chrY</td><td>25363603</td><td>25366603</td><td>NM_001005786.2</td><td>+</td><td>NM_001005786</td></tr>
	<tr><td>chrY</td><td>25363603</td><td>25366603</td><td>NM_001005785.2</td><td>+</td><td>NM_001005785</td></tr>
	<tr><td>chrY</td><td>25363603</td><td>25366603</td><td>NM_020363.3   </td><td>+</td><td>NM_020363   </td></tr>
	<tr><td>chrY</td><td>26193161</td><td>26196161</td><td>NM_001003894.1</td><td>-</td><td>NM_001003894</td></tr>
	<tr><td>chrY</td><td>26193161</td><td>26196161</td><td>NM_001003895.1</td><td>-</td><td>NM_001003895</td></tr>
	<tr><td>chrY</td><td>26762150</td><td>26765150</td><td>NM_001002760.1</td><td>+</td><td>NM_001002760</td></tr>
	<tr><td>chrY</td><td>26958639</td><td>26961639</td><td>NM_020364.3   </td><td>-</td><td>NM_020364   </td></tr>
	<tr><td>chrY</td><td>26977966</td><td>26980966</td><td>NM_001005375.2</td><td>+</td><td>NM_001005375</td></tr>
	<tr><td>chrY</td><td>26977966</td><td>26980966</td><td>NM_020420.3   </td><td>+</td><td>NM_020420   </td></tr>
	<tr><td>chrY</td><td>27197251</td><td>27200251</td><td>NM_001002761.1</td><td>-</td><td>NM_001002761</td></tr>
	<tr><td>chrY</td><td>27766263</td><td>27769263</td><td>NM_004680.2   </td><td>+</td><td>NM_004680   </td></tr>
	<tr><td>chrY</td><td>27766263</td><td>27769263</td><td>NM_170723.1   </td><td>+</td><td>NM_170723   </td></tr>
	<tr><td>chrY</td><td>59098402</td><td>59101402</td><td>NM_005840.2   </td><td>+</td><td>NM_005840   </td></tr>
	<tr><td>chrY</td><td>59212013</td><td>59215013</td><td>NM_001145149.3</td><td>+</td><td>NM_001145149</td></tr>
	<tr><td>chrY</td><td>59212013</td><td>59215013</td><td>NM_001185183.2</td><td>+</td><td>NM_001185183</td></tr>
	<tr><td>chrY</td><td>59212013</td><td>59215013</td><td>NM_005638.6   </td><td>+</td><td>NM_005638   </td></tr>
	<tr><td>chrY</td><td>59328366</td><td>59331366</td><td>NM_002186.3   </td><td>+</td><td>NM_002186   </td></tr>
	<tr><td>chrY</td><td>59328366</td><td>59331366</td><td>NM_176786.2   </td><td>+</td><td>NM_176786   </td></tr>
</tbody>
</table>




```R
# Previous file for example: /RNASeqFiles/Bcell_Liver_ENSG_DESeq2CollapseReplicates.countsNorm.txt
# ENSG values don't have the "."
```

### Read in GM12878


```R
# Read in 
GM_ENSG_file_in_1 <- read_tsv("./ENCFF955JLS.tsv", col_names=TRUE, skip=0)
GM_ENSG_file_in_2 <- read_tsv("./ENCFF056WHT.tsv", col_names=TRUE, skip=0) 

# Quick check
GM_ENSG_file_in_1
GM_ENSG_file_in_2
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



<table class="dataframe">
<caption>A spec_tbl_df: 58540 × 15</caption>
<thead>
	<tr><th scope=col>gene_id</th><th scope=col>transcript_id(s)</th><th scope=col>length</th><th scope=col>effective_length</th><th scope=col>expected_count</th><th scope=col>TPM</th><th scope=col>FPKM</th><th scope=col>posterior_mean_count</th><th scope=col>posterior_standard_deviation_of_count</th><th scope=col>pme_TPM</th><th scope=col>pme_FPKM</th><th scope=col>TPM_ci_lower_bound</th><th scope=col>TPM_ci_upper_bound</th><th scope=col>FPKM_ci_lower_bound</th><th scope=col>FPKM_ci_upper_bound</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>21175</td><td>21175</td><td> 86</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21176</td><td>21176</td><td> 74</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21177</td><td>21177</td><td> 72</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21178</td><td>21178</td><td> 71</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21179</td><td>21179</td><td> 74</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21180</td><td>21180</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21181</td><td>21181</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21182</td><td>21182</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21183</td><td>21183</td><td> 86</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21184</td><td>21184</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21185</td><td>21185</td><td> 93</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21186</td><td>21186</td><td> 71</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21187</td><td>21187</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21188</td><td>21188</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21189</td><td>21189</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23530</td><td>23530</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23531</td><td>23531</td><td> 82</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23532</td><td>23532</td><td> 68</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23533</td><td>23533</td><td> 74</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23534</td><td>23534</td><td> 75</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23535</td><td>23535</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23536</td><td>23536</td><td>176</td><td>77</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.4</td><td>0.33</td><td>4.41636e-06</td><td>1.20017</td><td>3.64144e-06</td><td>0.988985</td></tr>
	<tr><td>23537</td><td>23537</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23538</td><td>23538</td><td> 82</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23539</td><td>23539</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23540</td><td>23540</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23541</td><td>23541</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23542</td><td>23542</td><td> 82</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23543</td><td>23543</td><td> 72</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23544</td><td>23544</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.0</td><td>0.00</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>gSpikein_ERCC-00117</td><td>tSpikein_ERCC-00117</td><td>1136</td><td>1037</td><td>     0</td><td>   0.00</td><td>   0.00</td><td>     0</td><td>0</td><td>   0.03</td><td>   0.02</td><td>1.23389e-06</td><td>8.92099e-02</td><td>1.01788e-06</td><td>7.35224e-02</td></tr>
	<tr><td>gSpikein_ERCC-00120</td><td>tSpikein_ERCC-00120</td><td> 536</td><td> 437</td><td>     2</td><td>   0.15</td><td>   0.12</td><td>     2</td><td>0</td><td>   0.21</td><td>   0.17</td><td>2.18427e-02</td><td>4.51357e-01</td><td>1.79834e-02</td><td>3.71868e-01</td></tr>
	<tr><td>gSpikein_ERCC-00123</td><td>tSpikein_ERCC-00123</td><td>1022</td><td> 923</td><td>     7</td><td>   0.24</td><td>   0.19</td><td>     7</td><td>0</td><td>   0.27</td><td>   0.22</td><td>9.92415e-02</td><td>4.52210e-01</td><td>8.19739e-02</td><td>3.72876e-01</td></tr>
	<tr><td>gSpikein_ERCC-00126</td><td>tSpikein_ERCC-00126</td><td>1118</td><td>1019</td><td>    89</td><td>   2.79</td><td>   2.22</td><td>    89</td><td>0</td><td>   2.72</td><td>   2.24</td><td>2.17526e+00</td><td>3.28327e+00</td><td>1.79170e+00</td><td>2.70527e+00</td></tr>
	<tr><td>gSpikein_ERCC-00128</td><td>tSpikein_ERCC-00128</td><td>1133</td><td>1034</td><td>     0</td><td>   0.00</td><td>   0.00</td><td>     0</td><td>0</td><td>   0.03</td><td>   0.02</td><td>9.78239e-07</td><td>8.99396e-02</td><td>8.06518e-07</td><td>7.41056e-02</td></tr>
	<tr><td>gSpikein_ERCC-00130</td><td>tSpikein_ERCC-00130</td><td>1059</td><td> 960</td><td>196144</td><td>6519.52</td><td>5200.95</td><td>196144</td><td>0</td><td>6282.70</td><td>5175.72</td><td>6.25444e+03</td><td>6.31125e+03</td><td>5.15589e+03</td><td>5.20130e+03</td></tr>
	<tr><td>gSpikein_ERCC-00131</td><td>tSpikein_ERCC-00131</td><td> 771</td><td> 672</td><td>  1232</td><td>  58.50</td><td>  46.67</td><td>  1232</td><td>0</td><td>  56.42</td><td>  46.48</td><td>5.32184e+01</td><td>5.94801e+01</td><td>4.39189e+01</td><td>4.90820e+01</td></tr>
	<tr><td>gSpikein_ERCC-00134</td><td>tSpikein_ERCC-00134</td><td> 274</td><td> 175</td><td>     7</td><td>   1.28</td><td>   1.02</td><td>     7</td><td>0</td><td>   1.41</td><td>   1.16</td><td>5.22125e-01</td><td>2.39717e+00</td><td>4.30723e-01</td><td>1.97595e+00</td></tr>
	<tr><td>gSpikein_ERCC-00136</td><td>tSpikein_ERCC-00136</td><td>1033</td><td> 934</td><td> 19129</td><td> 653.52</td><td> 521.34</td><td> 19129</td><td>0</td><td> 629.81</td><td> 518.84</td><td>6.20905e+02</td><td>6.38809e+02</td><td>5.11890e+02</td><td>5.26589e+02</td></tr>
	<tr><td>gSpikein_ERCC-00137</td><td>tSpikein_ERCC-00137</td><td> 537</td><td> 438</td><td>     0</td><td>   0.00</td><td>   0.00</td><td>     0</td><td>0</td><td>   0.07</td><td>   0.06</td><td>1.20942e-06</td><td>2.08736e-01</td><td>9.97316e-07</td><td>1.71983e-01</td></tr>
	<tr><td>gSpikein_ERCC-00138</td><td>tSpikein_ERCC-00138</td><td>1024</td><td> 925</td><td>     1</td><td>   0.03</td><td>   0.03</td><td>     1</td><td>0</td><td>   0.07</td><td>   0.05</td><td>1.82049e-03</td><td>1.58369e-01</td><td>1.43483e-03</td><td>1.30464e-01</td></tr>
	<tr><td>gSpikein_ERCC-00142</td><td>tSpikein_ERCC-00142</td><td> 493</td><td> 394</td><td>     1</td><td>   0.08</td><td>   0.06</td><td>     1</td><td>0</td><td>   0.16</td><td>   0.13</td><td>2.69751e-03</td><td>3.73780e-01</td><td>2.17920e-03</td><td>3.07984e-01</td></tr>
	<tr><td>gSpikein_ERCC-00143</td><td>tSpikein_ERCC-00143</td><td> 784</td><td> 685</td><td>    23</td><td>   1.07</td><td>   0.85</td><td>    23</td><td>0</td><td>   1.08</td><td>   0.89</td><td>6.72692e-01</td><td>1.51533e+00</td><td>5.53461e-01</td><td>1.24783e+00</td></tr>
	<tr><td>gSpikein_ERCC-00144</td><td>tSpikein_ERCC-00144</td><td> 538</td><td> 439</td><td>   262</td><td>  19.04</td><td>  15.19</td><td>   262</td><td>0</td><td>  18.42</td><td>  15.18</td><td>1.62193e+01</td><td>2.06878e+01</td><td>1.33798e+01</td><td>1.70641e+01</td></tr>
	<tr><td>gSpikein_ERCC-00145</td><td>tSpikein_ERCC-00145</td><td>1042</td><td> 943</td><td>  4631</td><td> 156.70</td><td> 125.01</td><td>  4631</td><td>0</td><td> 151.04</td><td> 124.43</td><td>1.46670e+02</td><td>1.55352e+02</td><td>1.20955e+02</td><td>1.28097e+02</td></tr>
	<tr><td>gSpikein_ERCC-00147</td><td>tSpikein_ERCC-00147</td><td>1023</td><td> 924</td><td>     7</td><td>   0.24</td><td>   0.19</td><td>     7</td><td>0</td><td>   0.27</td><td>   0.22</td><td>9.80379e-02</td><td>4.53547e-01</td><td>7.80508e-02</td><td>3.71084e-01</td></tr>
	<tr><td>gSpikein_ERCC-00148</td><td>tSpikein_ERCC-00148</td><td> 494</td><td> 395</td><td>    72</td><td>   5.82</td><td>   4.64</td><td>    72</td><td>0</td><td>   5.68</td><td>   4.68</td><td>4.39615e+00</td><td>6.99699e+00</td><td>3.62205e+00</td><td>5.76536e+00</td></tr>
	<tr><td>gSpikein_ERCC-00150</td><td>tSpikein_ERCC-00150</td><td> 743</td><td> 644</td><td>    38</td><td>   1.88</td><td>   1.50</td><td>    38</td><td>0</td><td>   1.86</td><td>   1.53</td><td>1.31880e+00</td><td>2.47660e+00</td><td>1.08719e+00</td><td>2.04148e+00</td></tr>
	<tr><td>gSpikein_ERCC-00154</td><td>tSpikein_ERCC-00154</td><td> 537</td><td> 438</td><td>    43</td><td>   3.13</td><td>   2.50</td><td>    43</td><td>0</td><td>   3.09</td><td>   2.54</td><td>2.20148e+00</td><td>4.01083e+00</td><td>1.81578e+00</td><td>3.30670e+00</td></tr>
	<tr><td>gSpikein_ERCC-00156</td><td>tSpikein_ERCC-00156</td><td> 494</td><td> 395</td><td>     0</td><td>   0.00</td><td>   0.00</td><td>     0</td><td>0</td><td>   0.08</td><td>   0.06</td><td>8.16756e-06</td><td>2.34386e-01</td><td>6.72730e-06</td><td>1.93226e-01</td></tr>
	<tr><td>gSpikein_ERCC-00157</td><td>tSpikein_ERCC-00157</td><td>1019</td><td> 920</td><td>   131</td><td>   4.54</td><td>   3.62</td><td>   131</td><td>0</td><td>   4.41</td><td>   3.63</td><td>3.67914e+00</td><td>5.17281e+00</td><td>3.02636e+00</td><td>4.25682e+00</td></tr>
	<tr><td>gSpikein_ERCC-00158</td><td>tSpikein_ERCC-00158</td><td>1027</td><td> 928</td><td>     9</td><td>   0.31</td><td>   0.25</td><td>     9</td><td>0</td><td>   0.33</td><td>   0.27</td><td>1.39129e-01</td><td>5.35160e-01</td><td>1.14803e-01</td><td>4.41174e-01</td></tr>
	<tr><td>gSpikein_ERCC-00160</td><td>tSpikein_ERCC-00160</td><td> 743</td><td> 644</td><td>   129</td><td>   6.39</td><td>   5.10</td><td>   129</td><td>0</td><td>   6.21</td><td>   5.11</td><td>5.13658e+00</td><td>7.27426e+00</td><td>4.23751e+00</td><td>5.99909e+00</td></tr>
	<tr><td>gSpikein_ERCC-00162</td><td>tSpikein_ERCC-00162</td><td> 523</td><td> 424</td><td>   569</td><td>  42.82</td><td>  34.16</td><td>   569</td><td>0</td><td>  41.34</td><td>  34.05</td><td>3.79323e+01</td><td>4.47295e+01</td><td>3.12950e+01</td><td>3.68981e+01</td></tr>
	<tr><td>gSpikein_ERCC-00163</td><td>tSpikein_ERCC-00163</td><td> 543</td><td> 444</td><td>   163</td><td>  11.71</td><td>   9.35</td><td>   163</td><td>0</td><td>  11.36</td><td>   9.36</td><td>9.67550e+00</td><td>1.31448e+01</td><td>7.98194e+00</td><td>1.08406e+01</td></tr>
	<tr><td>gSpikein_ERCC-00164</td><td>tSpikein_ERCC-00164</td><td>1022</td><td> 923</td><td>     7</td><td>   0.24</td><td>   0.19</td><td>     7</td><td>0</td><td>   0.27</td><td>   0.22</td><td>1.00384e-01</td><td>4.54942e-01</td><td>8.24952e-02</td><td>3.74814e-01</td></tr>
	<tr><td>gSpikein_ERCC-00165</td><td>tSpikein_ERCC-00165</td><td> 872</td><td> 773</td><td>   439</td><td>  18.12</td><td>  14.46</td><td>   439</td><td>0</td><td>  17.50</td><td>  14.42</td><td>1.58488e+01</td><td>1.91248e+01</td><td>1.30835e+01</td><td>1.57837e+01</td></tr>
	<tr><td>gSpikein_ERCC-00168</td><td>tSpikein_ERCC-00168</td><td>1024</td><td> 925</td><td>     1</td><td>   0.03</td><td>   0.03</td><td>     1</td><td>0</td><td>   0.07</td><td>   0.05</td><td>1.10130e-03</td><td>1.56939e-01</td><td>1.54017e-03</td><td>1.29998e-01</td></tr>
	<tr><td>gSpikein_ERCC-00170</td><td>tSpikein_ERCC-00170</td><td>1023</td><td> 924</td><td>   268</td><td>   9.25</td><td>   7.38</td><td>   268</td><td>0</td><td>   8.95</td><td>   7.37</td><td>7.90351e+00</td><td>1.00279e+01</td><td>6.51400e+00</td><td>8.26644e+00</td></tr>
	<tr><td>gSpikein_ERCC-00171</td><td>tSpikein_ERCC-00171</td><td> 505</td><td> 406</td><td>     1</td><td>   0.08</td><td>   0.06</td><td>     1</td><td>0</td><td>   0.15</td><td>   0.12</td><td>4.15434e-03</td><td>3.61769e-01</td><td>3.52910e-03</td><td>2.98276e-01</td></tr>
</tbody>
</table>




<table class="dataframe">
<caption>A spec_tbl_df: 58540 × 15</caption>
<thead>
	<tr><th scope=col>gene_id</th><th scope=col>transcript_id(s)</th><th scope=col>length</th><th scope=col>effective_length</th><th scope=col>expected_count</th><th scope=col>TPM</th><th scope=col>FPKM</th><th scope=col>posterior_mean_count</th><th scope=col>posterior_standard_deviation_of_count</th><th scope=col>pme_TPM</th><th scope=col>pme_FPKM</th><th scope=col>TPM_ci_lower_bound</th><th scope=col>TPM_ci_upper_bound</th><th scope=col>FPKM_ci_lower_bound</th><th scope=col>FPKM_ci_upper_bound</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>21175</td><td>21175</td><td> 86</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21176</td><td>21176</td><td> 74</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21177</td><td>21177</td><td> 72</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21178</td><td>21178</td><td> 71</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21179</td><td>21179</td><td> 74</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21180</td><td>21180</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21181</td><td>21181</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21182</td><td>21182</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21183</td><td>21183</td><td> 86</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21184</td><td>21184</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21185</td><td>21185</td><td> 93</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21186</td><td>21186</td><td> 71</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21187</td><td>21187</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21188</td><td>21188</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>21189</td><td>21189</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23530</td><td>23530</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23531</td><td>23531</td><td> 82</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23532</td><td>23532</td><td> 68</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23533</td><td>23533</td><td> 74</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23534</td><td>23534</td><td> 75</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23535</td><td>23535</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23536</td><td>23536</td><td>176</td><td>77</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.37</td><td>0.3</td><td>3.93752e-06</td><td>1.10775</td><td>3.18939e-06</td><td>0.897558</td></tr>
	<tr><td>23537</td><td>23537</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23538</td><td>23538</td><td> 82</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23539</td><td>23539</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23540</td><td>23540</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23541</td><td>23541</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23542</td><td>23542</td><td> 82</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23543</td><td>23543</td><td> 72</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>23544</td><td>23544</td><td> 73</td><td> 0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.00</td><td>0.0</td><td>0.00000e+00</td><td>0.00000</td><td>0.00000e+00</td><td>0.000000</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>gSpikein_ERCC-00117</td><td>tSpikein_ERCC-00117</td><td>1136</td><td>1037</td><td>     0</td><td>   0.00</td><td>   0.00</td><td>     0</td><td>0</td><td>   0.03</td><td>   0.02</td><td>5.81152e-07</td><td>8.23356e-02</td><td>4.71211e-07</td><td>6.66926e-02</td></tr>
	<tr><td>gSpikein_ERCC-00120</td><td>tSpikein_ERCC-00120</td><td> 536</td><td> 437</td><td>     8</td><td>   0.54</td><td>   0.42</td><td>     8</td><td>0</td><td>   0.59</td><td>   0.47</td><td>2.37457e-01</td><td>9.78137e-01</td><td>1.89875e-01</td><td>7.89876e-01</td></tr>
	<tr><td>gSpikein_ERCC-00123</td><td>tSpikein_ERCC-00123</td><td>1022</td><td> 923</td><td>     0</td><td>   0.00</td><td>   0.00</td><td>     0</td><td>0</td><td>   0.03</td><td>   0.02</td><td>1.26871e-06</td><td>9.21208e-02</td><td>1.02733e-06</td><td>7.46552e-02</td></tr>
	<tr><td>gSpikein_ERCC-00126</td><td>tSpikein_ERCC-00126</td><td>1118</td><td>1019</td><td>   131</td><td>   3.78</td><td>   2.97</td><td>   131</td><td>0</td><td>   3.68</td><td>   2.98</td><td>3.05857e+00</td><td>4.30977e+00</td><td>2.47549e+00</td><td>3.48893e+00</td></tr>
	<tr><td>gSpikein_ERCC-00128</td><td>tSpikein_ERCC-00128</td><td>1133</td><td>1034</td><td>     0</td><td>   0.00</td><td>   0.00</td><td>     0</td><td>0</td><td>   0.03</td><td>   0.02</td><td>1.27155e-06</td><td>8.22290e-02</td><td>1.02992e-06</td><td>6.66011e-02</td></tr>
	<tr><td>gSpikein_ERCC-00130</td><td>tSpikein_ERCC-00130</td><td>1059</td><td> 960</td><td>262691</td><td>8050.04</td><td>6325.27</td><td>262691</td><td>0</td><td>7779.08</td><td>6297.40</td><td>7.74862e+03</td><td>7.80966e+03</td><td>6.27752e+03</td><td>6.32546e+03</td></tr>
	<tr><td>gSpikein_ERCC-00131</td><td>tSpikein_ERCC-00131</td><td> 771</td><td> 672</td><td>  1651</td><td>  72.28</td><td>  56.79</td><td>  1651</td><td>0</td><td>  69.89</td><td>  56.58</td><td>6.65645e+01</td><td>7.32693e+01</td><td>5.39702e+01</td><td>5.94052e+01</td></tr>
	<tr><td>gSpikein_ERCC-00134</td><td>tSpikein_ERCC-00134</td><td> 274</td><td> 175</td><td>     8</td><td>   1.34</td><td>   1.06</td><td>     8</td><td>0</td><td>   1.46</td><td>   1.18</td><td>5.76189e-01</td><td>2.42165e+00</td><td>4.66879e-01</td><td>1.96201e+00</td></tr>
	<tr><td>gSpikein_ERCC-00136</td><td>tSpikein_ERCC-00136</td><td>1033</td><td> 934</td><td> 26340</td><td> 829.65</td><td> 651.89</td><td> 26340</td><td>0</td><td> 801.75</td><td> 649.04</td><td>7.92263e+02</td><td>8.11487e+02</td><td>6.41680e+02</td><td>6.57180e+02</td></tr>
	<tr><td>gSpikein_ERCC-00137</td><td>tSpikein_ERCC-00137</td><td> 537</td><td> 438</td><td>     2</td><td>   0.13</td><td>   0.11</td><td>     2</td><td>0</td><td>   0.19</td><td>   0.16</td><td>1.75845e-02</td><td>4.16225e-01</td><td>1.42900e-02</td><td>3.37106e-01</td></tr>
	<tr><td>gSpikein_ERCC-00138</td><td>tSpikein_ERCC-00138</td><td>1024</td><td> 925</td><td>     0</td><td>   0.00</td><td>   0.00</td><td>     0</td><td>0</td><td>   0.03</td><td>   0.02</td><td>9.80090e-07</td><td>9.19812e-02</td><td>7.93581e-07</td><td>7.45303e-02</td></tr>
	<tr><td>gSpikein_ERCC-00142</td><td>tSpikein_ERCC-00142</td><td> 493</td><td> 394</td><td>     2</td><td>   0.15</td><td>   0.12</td><td>     2</td><td>0</td><td>   0.22</td><td>   0.18</td><td>2.13943e-02</td><td>4.55130e-01</td><td>1.68895e-02</td><td>3.68188e-01</td></tr>
	<tr><td>gSpikein_ERCC-00143</td><td>tSpikein_ERCC-00143</td><td> 784</td><td> 685</td><td>    38</td><td>   1.63</td><td>   1.28</td><td>    38</td><td>0</td><td>   1.62</td><td>   1.31</td><td>1.11703e+00</td><td>2.12568e+00</td><td>9.04558e-01</td><td>1.72175e+00</td></tr>
	<tr><td>gSpikein_ERCC-00144</td><td>tSpikein_ERCC-00144</td><td> 538</td><td> 439</td><td>   303</td><td>  20.30</td><td>  15.95</td><td>   303</td><td>0</td><td>  19.69</td><td>  15.94</td><td>1.75239e+01</td><td>2.19439e+01</td><td>1.42011e+01</td><td>1.77811e+01</td></tr>
	<tr><td>gSpikein_ERCC-00145</td><td>tSpikein_ERCC-00145</td><td>1042</td><td> 943</td><td>  6681</td><td> 208.43</td><td> 163.77</td><td>  6681</td><td>0</td><td> 201.44</td><td> 163.07</td><td>1.96681e+02</td><td>2.06262e+02</td><td>1.59316e+02</td><td>1.67076e+02</td></tr>
	<tr><td>gSpikein_ERCC-00147</td><td>tSpikein_ERCC-00147</td><td>1023</td><td> 924</td><td>    10</td><td>   0.32</td><td>   0.25</td><td>    10</td><td>0</td><td>   0.34</td><td>   0.27</td><td>1.56725e-01</td><td>5.45783e-01</td><td>1.26952e-01</td><td>4.42107e-01</td></tr>
	<tr><td>gSpikein_ERCC-00148</td><td>tSpikein_ERCC-00148</td><td> 494</td><td> 395</td><td>    59</td><td>   4.39</td><td>   3.45</td><td>    59</td><td>0</td><td>   4.32</td><td>   3.50</td><td>3.21087e+00</td><td>5.40319e+00</td><td>2.60276e+00</td><td>4.37862e+00</td></tr>
	<tr><td>gSpikein_ERCC-00150</td><td>tSpikein_ERCC-00150</td><td> 743</td><td> 644</td><td>    33</td><td>   1.51</td><td>   1.18</td><td>    33</td><td>0</td><td>   1.50</td><td>   1.22</td><td>1.00963e+00</td><td>2.01005e+00</td><td>8.22283e-01</td><td>1.63277e+00</td></tr>
	<tr><td>gSpikein_ERCC-00154</td><td>tSpikein_ERCC-00154</td><td> 537</td><td> 438</td><td>    40</td><td>   2.69</td><td>   2.11</td><td>    40</td><td>0</td><td>   2.66</td><td>   2.15</td><td>1.88905e+00</td><td>3.48947e+00</td><td>1.52976e+00</td><td>2.82670e+00</td></tr>
	<tr><td>gSpikein_ERCC-00156</td><td>tSpikein_ERCC-00156</td><td> 494</td><td> 395</td><td>     1</td><td>   0.07</td><td>   0.06</td><td>     1</td><td>0</td><td>   0.14</td><td>   0.12</td><td>2.94920e-03</td><td>3.41582e-01</td><td>2.21148e-03</td><td>2.76396e-01</td></tr>
	<tr><td>gSpikein_ERCC-00157</td><td>tSpikein_ERCC-00157</td><td>1019</td><td> 920</td><td>   192</td><td>   6.14</td><td>   4.82</td><td>   192</td><td>0</td><td>   5.96</td><td>   4.83</td><td>5.13169e+00</td><td>6.81556e+00</td><td>4.15606e+00</td><td>5.51986e+00</td></tr>
	<tr><td>gSpikein_ERCC-00158</td><td>tSpikein_ERCC-00158</td><td>1027</td><td> 928</td><td>    11</td><td>   0.35</td><td>   0.27</td><td>    11</td><td>0</td><td>   0.37</td><td>   0.30</td><td>1.73235e-01</td><td>5.78058e-01</td><td>1.40334e-01</td><td>4.68225e-01</td></tr>
	<tr><td>gSpikein_ERCC-00160</td><td>tSpikein_ERCC-00160</td><td> 743</td><td> 644</td><td>   263</td><td>  12.01</td><td>   9.44</td><td>   263</td><td>0</td><td>  11.65</td><td>   9.43</td><td>1.02772e+01</td><td>1.30642e+01</td><td>8.32505e+00</td><td>1.05830e+01</td></tr>
	<tr><td>gSpikein_ERCC-00162</td><td>tSpikein_ERCC-00162</td><td> 523</td><td> 424</td><td>   797</td><td>  55.30</td><td>  43.45</td><td>   797</td><td>0</td><td>  53.50</td><td>  43.31</td><td>4.98239e+01</td><td>5.72045e+01</td><td>4.03510e+01</td><td>4.63320e+01</td></tr>
	<tr><td>gSpikein_ERCC-00163</td><td>tSpikein_ERCC-00163</td><td> 543</td><td> 444</td><td>   193</td><td>  12.79</td><td>  10.05</td><td>   193</td><td>0</td><td>  12.42</td><td>  10.06</td><td>1.07311e+01</td><td>1.42416e+01</td><td>8.69255e+00</td><td>1.15354e+01</td></tr>
	<tr><td>gSpikein_ERCC-00164</td><td>tSpikein_ERCC-00164</td><td>1022</td><td> 923</td><td>    20</td><td>   0.64</td><td>   0.50</td><td>    20</td><td>0</td><td>   0.65</td><td>   0.52</td><td>3.81692e-01</td><td>9.22656e-01</td><td>3.09965e-01</td><td>7.47995e-01</td></tr>
	<tr><td>gSpikein_ERCC-00165</td><td>tSpikein_ERCC-00165</td><td> 872</td><td> 773</td><td>   732</td><td>  27.86</td><td>  21.89</td><td>   732</td><td>0</td><td>  26.96</td><td>  21.82</td><td>2.49922e+01</td><td>2.89031e+01</td><td>2.02077e+01</td><td>2.33765e+01</td></tr>
	<tr><td>gSpikein_ERCC-00168</td><td>tSpikein_ERCC-00168</td><td>1024</td><td> 925</td><td>     3</td><td>   0.10</td><td>   0.07</td><td>     3</td><td>0</td><td>   0.12</td><td>   0.10</td><td>2.25654e-02</td><td>2.43332e-01</td><td>1.82705e-02</td><td>1.97059e-01</td></tr>
	<tr><td>gSpikein_ERCC-00170</td><td>tSpikein_ERCC-00170</td><td>1023</td><td> 924</td><td>   375</td><td>  11.94</td><td>   9.38</td><td>   375</td><td>0</td><td>  11.57</td><td>   9.36</td><td>1.03957e+01</td><td>1.27274e+01</td><td>8.45014e+00</td><td>1.03370e+01</td></tr>
	<tr><td>gSpikein_ERCC-00171</td><td>tSpikein_ERCC-00171</td><td> 505</td><td> 406</td><td>     1</td><td>   0.07</td><td>   0.06</td><td>     1</td><td>0</td><td>   0.14</td><td>   0.11</td><td>2.35069e-03</td><td>3.34731e-01</td><td>1.90497e-03</td><td>2.71154e-01</td></tr>
</tbody>
</table>



#### Isolate rows with ENSG* Gene ID and cut columns down to just gene_ID and TPM


```R
# Can we isolate just ENSG rows?
GM_ENSG_only_1 <- GM_ENSG_file_in_1 %>%
    filter("ENSG"==substr(gene_id, 1, 4))
GM_ENSG_only_2 <- GM_ENSG_file_in_2 %>%
    filter("ENSG"==substr(gene_id, 1, 4))

head(GM_ENSG_only_1, 3)
```


<table class="dataframe">
<caption>A tibble: 3 × 15</caption>
<thead>
	<tr><th scope=col>gene_id</th><th scope=col>transcript_id(s)</th><th scope=col>length</th><th scope=col>effective_length</th><th scope=col>expected_count</th><th scope=col>TPM</th><th scope=col>FPKM</th><th scope=col>posterior_mean_count</th><th scope=col>posterior_standard_deviation_of_count</th><th scope=col>pme_TPM</th><th scope=col>pme_FPKM</th><th scope=col>TPM_ci_lower_bound</th><th scope=col>TPM_ci_upper_bound</th><th scope=col>FPKM_ci_lower_bound</th><th scope=col>FPKM_ci_upper_bound</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003.10</td><td>ENST00000373020.4,ENST00000494424.1,ENST00000496771.1                                                                        </td><td>2206.00</td><td>2107.00</td><td>  13</td><td>  0.2</td><td>  0.16</td><td>  13</td><td>0</td><td>  0.28</td><td>  0.23</td><td>1.41005e-01</td><td>  0.434116</td><td>1.16612e-01</td><td>  0.358201</td></tr>
	<tr><td>ENSG00000000005.5 </td><td>ENST00000373031.4,ENST00000485971.1                                                                                          </td><td> 940.50</td><td> 841.50</td><td>   0</td><td>  0.0</td><td>  0.00</td><td>   0</td><td>0</td><td>  0.09</td><td>  0.08</td><td>1.46984e-03</td><td>  0.238596</td><td>1.29678e-03</td><td>  0.196684</td></tr>
	<tr><td>ENSG00000000419.8 </td><td>ENST00000371582.4,ENST00000371583.5,ENST00000371584.4,ENST00000371588.5,ENST00000413082.1,ENST00000466152.1,ENST00000494752.1</td><td>1077.42</td><td> 978.42</td><td>4394</td><td>143.3</td><td>114.32</td><td>4394</td><td>0</td><td>138.69</td><td>114.25</td><td>1.34640e+02</td><td>142.895000</td><td>1.10908e+02</td><td>117.705000</td></tr>
</tbody>
</table>




```R
# Clean up ENSG ID to remove information past ".", as needed for conversion with bitr in next steps
GM_ENSG_TPM_1 <- GM_ENSG_only_1 %>%
    mutate(gene_id_cleaned = gsub("\\..*", "", gene_id)) %>% # Make a col with the gene_ids minus the "."
    dplyr::select(gene_id_cleaned, TPM) %>% # isolate gene_id_clean and TPM columns
    magrittr::set_colnames(c("ENSEMBL", "TPM")) # Rename these for easier merging and readibility 
GM_ENSG_TPM_2 <- GM_ENSG_only_2 %>%
    mutate(gene_id_cleaned = gsub("\\..*", "", gene_id)) %>% # Make a col with the gene_ids minus the "."
    dplyr::select(gene_id_cleaned, TPM) %>% # isolate gene_id_clean and TPM columns
    magrittr::set_colnames(c("ENSEMBL", "TPM")) # Rename these for easier merging and readibility 


head(GM_ENSG_TPM_1, 3)
head(GM_ENSG_TPM_2, 3)
```


<table class="dataframe">
<caption>A tibble: 3 × 2</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003</td><td>  0.2</td></tr>
	<tr><td>ENSG00000000005</td><td>  0.0</td></tr>
	<tr><td>ENSG00000000419</td><td>143.3</td></tr>
</tbody>
</table>




<table class="dataframe">
<caption>A tibble: 3 × 2</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003</td><td>  0.08</td></tr>
	<tr><td>ENSG00000000005</td><td>  0.00</td></tr>
	<tr><td>ENSG00000000419</td><td>126.66</td></tr>
</tbody>
</table>



#### Combine TPMs of Reps via average


```R
head(merge(GM_ENSG_TPM_1, GM_ENSG_TPM_2, by = "ENSEMBL"), 3)
```


<table class="dataframe">
<caption>A data.frame: 3 × 3</caption>
<thead>
	<tr><th></th><th scope=col>ENSEMBL</th><th scope=col>TPM.x</th><th scope=col>TPM.y</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>ENSG00000000003</td><td>  0.2</td><td>  0.08</td></tr>
	<tr><th scope=row>2</th><td>ENSG00000000005</td><td>  0.0</td><td>  0.00</td></tr>
	<tr><th scope=row>3</th><td>ENSG00000000419</td><td>143.3</td><td>126.66</td></tr>
</tbody>
</table>




```R
GM_ENSG_TPM_merge12 <- merge(GM_ENSG_TPM_1, GM_ENSG_TPM_2, by = "ENSEMBL") 
GM_ENSG_TPM_12 <- GM_ENSG_TPM_merge12 %>% dplyr::mutate(TPM = rowMeans(select(., TPM.x:TPM.y))) %>% select(ENSEMBL, TPM)

GM_ENSG_TPM_12
```


<table class="dataframe">
<caption>A data.frame: 57820 × 2</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003</td><td>  0.140</td></tr>
	<tr><td>ENSG00000000005</td><td>  0.000</td></tr>
	<tr><td>ENSG00000000419</td><td>134.980</td></tr>
	<tr><td>ENSG00000000457</td><td>  7.455</td></tr>
	<tr><td>ENSG00000000460</td><td> 31.760</td></tr>
	<tr><td>ENSG00000000938</td><td> 52.690</td></tr>
	<tr><td>ENSG00000000971</td><td>  0.010</td></tr>
	<tr><td>ENSG00000001036</td><td> 28.115</td></tr>
	<tr><td>ENSG00000001084</td><td>  7.070</td></tr>
	<tr><td>ENSG00000001167</td><td> 14.850</td></tr>
	<tr><td>ENSG00000001460</td><td>  1.460</td></tr>
	<tr><td>ENSG00000001461</td><td>  8.860</td></tr>
	<tr><td>ENSG00000001497</td><td> 78.160</td></tr>
	<tr><td>ENSG00000001561</td><td>  4.140</td></tr>
	<tr><td>ENSG00000001617</td><td>  0.000</td></tr>
	<tr><td>ENSG00000001626</td><td>  0.200</td></tr>
	<tr><td>ENSG00000001629</td><td>  6.905</td></tr>
	<tr><td>ENSG00000001630</td><td> 47.755</td></tr>
	<tr><td>ENSG00000001631</td><td> 19.770</td></tr>
	<tr><td>ENSG00000002016</td><td>  6.615</td></tr>
	<tr><td>ENSG00000002079</td><td>  0.055</td></tr>
	<tr><td>ENSG00000002330</td><td> 50.785</td></tr>
	<tr><td>ENSG00000002549</td><td>200.790</td></tr>
	<tr><td>ENSG00000002586</td><td>136.095</td></tr>
	<tr><td>ENSG00000002587</td><td>  0.500</td></tr>
	<tr><td>ENSG00000002726</td><td>  0.000</td></tr>
	<tr><td>ENSG00000002745</td><td>  0.000</td></tr>
	<tr><td>ENSG00000002746</td><td>  0.045</td></tr>
	<tr><td>ENSG00000002822</td><td> 59.930</td></tr>
	<tr><td>ENSG00000002834</td><td> 59.075</td></tr>
	<tr><td>⋮</td><td>⋮</td></tr>
	<tr><td>ENSGR0000198223</td><td>0</td></tr>
	<tr><td>ENSGR0000205755</td><td>0</td></tr>
	<tr><td>ENSGR0000214717</td><td>0</td></tr>
	<tr><td>ENSGR0000223274</td><td>0</td></tr>
	<tr><td>ENSGR0000223484</td><td>0</td></tr>
	<tr><td>ENSGR0000223511</td><td>0</td></tr>
	<tr><td>ENSGR0000223571</td><td>0</td></tr>
	<tr><td>ENSGR0000223773</td><td>0</td></tr>
	<tr><td>ENSGR0000225661</td><td>0</td></tr>
	<tr><td>ENSGR0000226179</td><td>0</td></tr>
	<tr><td>ENSGR0000227159</td><td>0</td></tr>
	<tr><td>ENSGR0000228410</td><td>0</td></tr>
	<tr><td>ENSGR0000228572</td><td>0</td></tr>
	<tr><td>ENSGR0000229232</td><td>0</td></tr>
	<tr><td>ENSGR0000230542</td><td>0</td></tr>
	<tr><td>ENSGR0000234622</td><td>0</td></tr>
	<tr><td>ENSGR0000234958</td><td>0</td></tr>
	<tr><td>ENSGR0000236017</td><td>0</td></tr>
	<tr><td>ENSGR0000236871</td><td>0</td></tr>
	<tr><td>ENSGR0000237040</td><td>0</td></tr>
	<tr><td>ENSGR0000237531</td><td>0</td></tr>
	<tr><td>ENSGR0000237801</td><td>0</td></tr>
	<tr><td>ENSGR0000263835</td><td>0</td></tr>
	<tr><td>ENSGR0000263980</td><td>0</td></tr>
	<tr><td>ENSGR0000264510</td><td>0</td></tr>
	<tr><td>ENSGR0000264819</td><td>0</td></tr>
	<tr><td>ENSGR0000265350</td><td>0</td></tr>
	<tr><td>ENSGR0000265658</td><td>0</td></tr>
	<tr><td>ENSGR0000266731</td><td>0</td></tr>
	<tr><td>ENSGR0000270726</td><td>0</td></tr>
</tbody>
</table>



### Read in Liver


```R
wget https://www.encodeproject.org/files/ENCFF974MUO/@@download/ENCFF974MUO.tsv
wget https://www.encodeproject.org/files/ENCFF649AHO/@@download/ENCFF649AHO.tsv
```


```R
# Read in 
Hep_ENSG_file_in_1 <- read_tsv("./ENCFF974MUO.tsv", col_names=TRUE, skip=0)
Hep_ENSG_file_in_2 <- read_tsv("./ENCFF649AHO.tsv", col_names=TRUE, skip=0) 

# Filter "ENSG*" gene IDs 
Hep_ENSG_only_1 <- Hep_ENSG_file_in_1 %>%
    filter("ENSG"==substr(gene_id, 1, 4))
Hep_ENSG_only_2 <- Hep_ENSG_file_in_2 %>%
    filter("ENSG"==substr(gene_id, 1, 4))

head(Hep_ENSG_only_1, 3)
head(Hep_ENSG_only_2, 3)
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



<table class="dataframe">
<caption>A tibble: 3 × 15</caption>
<thead>
	<tr><th scope=col>gene_id</th><th scope=col>transcript_id(s)</th><th scope=col>length</th><th scope=col>effective_length</th><th scope=col>expected_count</th><th scope=col>TPM</th><th scope=col>FPKM</th><th scope=col>posterior_mean_count</th><th scope=col>posterior_standard_deviation_of_count</th><th scope=col>pme_TPM</th><th scope=col>pme_FPKM</th><th scope=col>TPM_ci_lower_bound</th><th scope=col>TPM_ci_upper_bound</th><th scope=col>FPKM_ci_lower_bound</th><th scope=col>FPKM_ci_upper_bound</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003.10</td><td>ENST00000373020.4,ENST00000494424.1,ENST00000496771.1                                                                        </td><td>2056.54</td><td>1981.54</td><td>1588</td><td>45.63</td><td>39.50</td><td>1588</td><td>0</td><td>44.46</td><td>39.92</td><td>41.57290000</td><td>47.555200</td><td>37.33450000</td><td>42.711400</td></tr>
	<tr><td>ENSG00000000005.5 </td><td>ENST00000373031.4,ENST00000485971.1                                                                                          </td><td> 940.50</td><td> 865.50</td><td>   0</td><td> 0.00</td><td> 0.00</td><td>   0</td><td>0</td><td> 0.16</td><td> 0.14</td><td> 0.00210934</td><td> 0.402542</td><td> 0.00183585</td><td> 0.361508</td></tr>
	<tr><td>ENSG00000000419.8 </td><td>ENST00000371582.4,ENST00000371583.5,ENST00000371584.4,ENST00000371588.5,ENST00000413082.1,ENST00000466152.1,ENST00000494752.1</td><td>1060.51</td><td> 985.51</td><td>1524</td><td>88.05</td><td>76.22</td><td>1524</td><td>0</td><td>85.78</td><td>77.01</td><td>80.97560000</td><td>90.705000</td><td>72.77080000</td><td>81.496700</td></tr>
</tbody>
</table>




<table class="dataframe">
<caption>A tibble: 3 × 15</caption>
<thead>
	<tr><th scope=col>gene_id</th><th scope=col>transcript_id(s)</th><th scope=col>length</th><th scope=col>effective_length</th><th scope=col>expected_count</th><th scope=col>TPM</th><th scope=col>FPKM</th><th scope=col>posterior_mean_count</th><th scope=col>posterior_standard_deviation_of_count</th><th scope=col>pme_TPM</th><th scope=col>pme_FPKM</th><th scope=col>TPM_ci_lower_bound</th><th scope=col>TPM_ci_upper_bound</th><th scope=col>FPKM_ci_lower_bound</th><th scope=col>FPKM_ci_upper_bound</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003.10</td><td>ENST00000373020.4,ENST00000494424.1,ENST00000496771.1                                                                        </td><td>1970.60</td><td>1895.60</td><td>829</td><td>35.08</td><td>29.67</td><td>829</td><td>0</td><td>33.23</td><td>29.57</td><td>30.03790000</td><td>36.671800</td><td>26.62800000</td><td>32.526800</td></tr>
	<tr><td>ENSG00000000005.5 </td><td>ENST00000373031.4,ENST00000485971.1                                                                                          </td><td> 940.50</td><td> 865.50</td><td>  0</td><td> 0.00</td><td> 0.00</td><td>  0</td><td>0</td><td> 0.22</td><td> 0.20</td><td> 0.00298938</td><td> 0.564187</td><td> 0.00259142</td><td> 0.502069</td></tr>
	<tr><td>ENSG00000000419.8 </td><td>ENST00000371582.4,ENST00000371583.5,ENST00000371584.4,ENST00000371588.5,ENST00000413082.1,ENST00000466152.1,ENST00000494752.1</td><td>1005.34</td><td> 930.34</td><td>834</td><td>71.91</td><td>60.81</td><td>834</td><td>0</td><td>68.16</td><td>60.65</td><td>62.93900000</td><td>73.505300</td><td>56.04570000</td><td>65.450600</td></tr>
</tbody>
</table>




```R
# Clean up ENSG ID and isolate just ENSG and TPM 
Hep_ENSG_TPM_1 <- Hep_ENSG_only_1 %>%
    mutate(gene_id_cleaned = gsub("\\..*", "", gene_id)) %>% # Make a col with the gene_ids minus the "."
    dplyr::select(gene_id_cleaned, TPM) %>% # isolate gene_id_clean and TPM columns
    magrittr::set_colnames(c("ENSEMBL", "TPM")) # Rename these for easier merging and readibility 
Hep_ENSG_TPM_2 <- Hep_ENSG_only_2 %>%
    mutate(gene_id_cleaned = gsub("\\..*", "", gene_id)) %>% # Make a col with the gene_ids minus the "."
    dplyr::select(gene_id_cleaned, TPM) %>% # isolate gene_id_clean and TPM columns
    magrittr::set_colnames(c("ENSEMBL", "TPM")) # Rename these for easier merging and readibility 

head(Hep_ENSG_TPM_1, 3)
head(Hep_ENSG_TPM_2, 3)
```


<table class="dataframe">
<caption>A tibble: 3 × 2</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003</td><td>45.63</td></tr>
	<tr><td>ENSG00000000005</td><td> 0.00</td></tr>
	<tr><td>ENSG00000000419</td><td>88.05</td></tr>
</tbody>
</table>




<table class="dataframe">
<caption>A tibble: 3 × 2</caption>
<thead>
	<tr><th scope=col>ENSEMBL</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>ENSG00000000003</td><td>35.08</td></tr>
	<tr><td>ENSG00000000005</td><td> 0.00</td></tr>
	<tr><td>ENSG00000000419</td><td>71.91</td></tr>
</tbody>
</table>




```R
Hep_ENSG_TPM_merge12 <- merge(Hep_ENSG_TPM_1, Hep_ENSG_TPM_2, by = "ENSEMBL") 
head(Hep_ENSG_TPM_merge12, 3)

Hep_ENSG_TPM_merge12 %>% dplyr::mutate(TPM = rowMeans(select(., TPM.x:TPM.y))) %>% select(TPM)

```


<table class="dataframe">
<caption>A data.frame: 3 × 3</caption>
<thead>
	<tr><th></th><th scope=col>ENSEMBL</th><th scope=col>TPM.x</th><th scope=col>TPM.y</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>ENSG00000000003</td><td>45.63</td><td>35.08</td></tr>
	<tr><th scope=row>2</th><td>ENSG00000000005</td><td> 0.00</td><td> 0.00</td></tr>
	<tr><th scope=row>3</th><td>ENSG00000000419</td><td>88.05</td><td>71.91</td></tr>
</tbody>
</table>




<table class="dataframe">
<caption>A data.frame: 57820 × 1</caption>
<thead>
	<tr><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td> 40.355</td></tr>
	<tr><td>  0.000</td></tr>
	<tr><td> 79.980</td></tr>
	<tr><td>  1.830</td></tr>
	<tr><td>  2.630</td></tr>
	<tr><td>  0.000</td></tr>
	<tr><td>  0.500</td></tr>
	<tr><td> 33.440</td></tr>
	<tr><td>320.300</td></tr>
	<tr><td> 14.010</td></tr>
	<tr><td>  0.935</td></tr>
	<tr><td>  3.875</td></tr>
	<tr><td> 20.335</td></tr>
	<tr><td>  0.005</td></tr>
	<tr><td>  8.110</td></tr>
	<tr><td>  0.000</td></tr>
	<tr><td> 19.700</td></tr>
	<tr><td> 61.655</td></tr>
	<tr><td> 14.780</td></tr>
	<tr><td> 13.250</td></tr>
	<tr><td>  0.475</td></tr>
	<tr><td>  4.780</td></tr>
	<tr><td>327.110</td></tr>
	<tr><td> 88.750</td></tr>
	<tr><td>  0.000</td></tr>
	<tr><td>  0.000</td></tr>
	<tr><td>  0.000</td></tr>
	<tr><td>  0.000</td></tr>
	<tr><td> 21.015</td></tr>
	<tr><td>136.945</td></tr>
	<tr><td>⋮</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
	<tr><td>0</td></tr>
</tbody>
</table>




```R
# Combine Rep 1 and Rep 2 by averaging
Hep_ENSG_TPM_merge12 <- merge(Hep_ENSG_TPM_1, Hep_ENSG_TPM_2, by = "ENSEMBL") 
Hep_ENSG_TPM_12 <- Hep_ENSG_TPM_merge12 %>% dplyr::mutate(TPM = rowMeans(select(., TPM.x:TPM.y))) %>% select(ENSEMBL, TPM)

head(Hep_ENSG_TPM_12, 3)
```


<table class="dataframe">
<caption>A data.frame: 3 × 2</caption>
<thead>
	<tr><th></th><th scope=col>ENSEMBL</th><th scope=col>TPM</th></tr>
	<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>ENSG00000000003</td><td>40.355</td></tr>
	<tr><th scope=row>2</th><td>ENSG00000000005</td><td> 0.000</td></tr>
	<tr><th scope=row>3</th><td>ENSG00000000419</td><td>79.980</td></tr>
</tbody>
</table>



---------------------LIVER SOLO -------------------------


```R
ENSG_file_in_Liver <- read_tsv("./ENCFF818SGG.tsv", col_names=TRUE, skip=0) 

ENSG_only_Liver <- ENSG_file_in_Liver %>%
    filter("ENSG"==substr(gene_id, 1, 4))

ENSG_TPM_Liver <- ENSG_only_Liver %>%
    mutate(gene_id_cleaned = gsub("\\..*", "", gene_id)) %>% # Make a col with the gene_ids minus the "."
    dplyr::select(gene_id_cleaned, TPM) %>% # isolate gene_id_clean and TPM columns
    magrittr::set_colnames(c("ENSEMBL", "TPM")) # Rename these for easier merging and readibility 

head(ENSG_TPM_Liver, 3)
```

## Convert gene names to a common dictionary (RefSeq to ENSEMBL and ENSEMBL to RefSeq)


```R
###### MAKE [BED] [ENSG] [TPM]
###### We want information from both files: BED from RefSeq formatted promoter file, and the counts from ENSG formattted DESeq output
# Problem: One file is in RefSeq and the other ENSG
# Convert ENSG_DESeqNormCount to include RefSeq identifiers
# geneID_refTable_fromENSG <- bitr(ENSG_file$ENSEMBL, fromType = "ENSEMBL",
#                         toType = c("REFSEQ"),
#                         OrgDb = "org.Hs.eg.db") # Fails - convert the other way - match w/ ENSEMBL
```


```R
# Convert from RefSeq to ENSEMBL (Good concordance in matching)
geneID_refTable_fromRefSeq <- bitr(lapply(Promoter_list$RefSeq, function(x) sub("\\..*","",x)), fromType = "REFSEQ",
                        toType = c("ENSEMBL"),
                        OrgDb = "org.Hs.eg.db") #  “0.17% of input gene IDs are fail to map...”

```

    Loading required package: org.Hs.eg.db
    
    Loading required package: AnnotationDbi
    
    Loading required package: stats4
    
    Loading required package: BiocGenerics
    
    
    Attaching package: ‘BiocGenerics’
    
    
    The following objects are masked from ‘package:dplyr’:
    
        combine, intersect, setdiff, union
    
    
    The following objects are masked from ‘package:stats’:
    
        IQR, mad, sd, var, xtabs
    
    
    The following objects are masked from ‘package:base’:
    
        anyDuplicated, append, as.data.frame, basename, cbind, colnames,
        dirname, do.call, duplicated, eval, evalq, Filter, Find, get, grep,
        grepl, intersect, is.unsorted, lapply, Map, mapply, match, mget,
        order, paste, pmax, pmax.int, pmin, pmin.int, Position, rank,
        rbind, Reduce, rownames, sapply, setdiff, sort, table, tapply,
        union, unique, unsplit, which.max, which.min
    
    
    Loading required package: Biobase
    
    Welcome to Bioconductor
    
        Vignettes contain introductory material; view with
        'browseVignettes()'. To cite Bioconductor, see
        'citation("Biobase")', and for packages 'citation("pkgname")'.
    
    
    Loading required package: IRanges
    
    Loading required package: S4Vectors
    
    
    Attaching package: ‘S4Vectors’
    
    
    The following object is masked from ‘package:clusterProfiler’:
    
        rename
    
    
    The following objects are masked from ‘package:dplyr’:
    
        first, rename
    
    
    The following object is masked from ‘package:tidyr’:
    
        expand
    
    
    The following objects are masked from ‘package:base’:
    
        expand.grid, I, unname
    
    
    
    Attaching package: ‘IRanges’
    
    
    The following object is masked from ‘package:clusterProfiler’:
    
        slice
    
    
    The following objects are masked from ‘package:dplyr’:
    
        collapse, desc, slice
    
    
    The following object is masked from ‘package:purrr’:
    
        reduce
    
    
    
    Attaching package: ‘AnnotationDbi’
    
    
    The following object is masked from ‘package:clusterProfiler’:
    
        select
    
    
    The following object is masked from ‘package:dplyr’:
    
        select
    
    
    
    
    'select()' returned 1:many mapping between keys and columns
    
    Warning message in bitr(lapply(Promoter_list$RefSeq, function(x) sub("\\..*", "", :
    “0.17% of input gene IDs are fail to map...”


## Combine by ENSEMBL name

### Add on the ENSG matches to the Promoter file (matched by RefSeq)


```R
Promoter_list_ENSG <- merge(Promoter_list, geneID_refTable_fromRefSeq, by="REFSEQ") # Add ENSG to RefSeq-based gene BED table
Promoter_list_ENSG
```


<table class="dataframe">
<caption>A data.frame: 75420 × 7</caption>
<thead>
	<tr><th scope=col>REFSEQ</th><th scope=col>Chr</th><th scope=col>Start</th><th scope=col>End</th><th scope=col>RefSeq</th><th scope=col>Strand</th><th scope=col>ENSEMBL</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>
</thead>
<tbody>
	<tr><td>NM_000014</td><td>chr12</td><td>  9267825</td><td>  9270825</td><td>NM_000014.5</td><td>-</td><td>ENSG00000175899</td></tr>
	<tr><td>NM_000015</td><td>chr8 </td><td> 18246791</td><td> 18249791</td><td>NM_000015.3</td><td>+</td><td>ENSG00000156006</td></tr>
	<tr><td>NM_000016</td><td>chr1 </td><td> 76188031</td><td> 76191031</td><td>NM_000016.5</td><td>+</td><td>ENSG00000117054</td></tr>
	<tr><td>NM_000017</td><td>chr12</td><td>121161628</td><td>121164628</td><td>NM_000017.4</td><td>+</td><td>ENSG00000122971</td></tr>
	<tr><td>NM_000018</td><td>chr17</td><td>  7121256</td><td>  7124256</td><td>NM_000018.4</td><td>+</td><td>ENSG00000072778</td></tr>
	<tr><td>NM_000019</td><td>chr11</td><td>107990293</td><td>107993293</td><td>NM_000019.4</td><td>+</td><td>ENSG00000075239</td></tr>
	<tr><td>NM_000020</td><td>chr12</td><td> 52299287</td><td> 52302287</td><td>NM_000020.3</td><td>+</td><td>ENSG00000139567</td></tr>
	<tr><td>NM_000021</td><td>chr14</td><td> 73601214</td><td> 73604214</td><td>NM_000021.4</td><td>+</td><td>ENSG00000080815</td></tr>
	<tr><td>NM_000022</td><td>chr20</td><td> 43279340</td><td> 43282340</td><td>NM_000022.4</td><td>-</td><td>ENSG00000196839</td></tr>
	<tr><td>NM_000023</td><td>chr17</td><td> 48241365</td><td> 48244365</td><td>NM_000023.4</td><td>+</td><td>ENSG00000108823</td></tr>
	<tr><td>NM_000024</td><td>chr5 </td><td>148204155</td><td>148207155</td><td>NM_000024.5</td><td>+</td><td>ENSG00000169252</td></tr>
	<tr><td>NM_000025</td><td>chr8 </td><td> 37823117</td><td> 37826117</td><td>NM_000025.3</td><td>-</td><td>ENSG00000188778</td></tr>
	<tr><td>NM_000026</td><td>chr22</td><td> 40740503</td><td> 40743503</td><td>NM_000026.4</td><td>+</td><td>ENSG00000239900</td></tr>
	<tr><td>NM_000027</td><td>chr4 </td><td>178362591</td><td>178365591</td><td>NM_000027.4</td><td>-</td><td>ENSG00000038002</td></tr>
	<tr><td>NM_000028</td><td>chr1 </td><td>100314044</td><td>100317044</td><td>NM_000028.2</td><td>+</td><td>ENSG00000162688</td></tr>
	<tr><td>NM_000029</td><td>chr1 </td><td>230848868</td><td>230851868</td><td>NM_000029.4</td><td>-</td><td>ENSG00000135744</td></tr>
	<tr><td>NM_000030</td><td>chr2 </td><td>241806240</td><td>241809240</td><td>NM_000030.3</td><td>+</td><td>ENSG00000172482</td></tr>
	<tr><td>NM_000031</td><td>chr9 </td><td>116162564</td><td>116165564</td><td>NM_000031.6</td><td>-</td><td>ENSG00000148218</td></tr>
	<tr><td>NM_000032</td><td>chrX </td><td> 55056410</td><td> 55059410</td><td>NM_000032.5</td><td>-</td><td>ENSG00000158578</td></tr>
	<tr><td>NM_000033</td><td>chrX </td><td>152988310</td><td>152991310</td><td>NM_000033.4</td><td>+</td><td>ENSG00000101986</td></tr>
	<tr><td>NM_000035</td><td>chr9 </td><td>104197056</td><td>104200056</td><td>NM_000035.4</td><td>-</td><td>ENSG00000136872</td></tr>
	<tr><td>NM_000036</td><td>chr1 </td><td>115237239</td><td>115240239</td><td>NM_000036.2</td><td>-</td><td>ENSG00000116748</td></tr>
	<tr><td>NM_000037</td><td>chr8 </td><td> 41654140</td><td> 41657140</td><td>NM_000037.4</td><td>-</td><td>ENSG00000029534</td></tr>
	<tr><td>NM_000038</td><td>chr5 </td><td>112071581</td><td>112074581</td><td>NM_000038.6</td><td>+</td><td>ENSG00000134982</td></tr>
	<tr><td>NM_000039</td><td>chr11</td><td>116707666</td><td>116710666</td><td>NM_000039.2</td><td>-</td><td>ENSG00000118137</td></tr>
	<tr><td>NM_000040</td><td>chr11</td><td>116698622</td><td>116701622</td><td>NM_000040.3</td><td>+</td><td>ENSG00000110245</td></tr>
	<tr><td>NM_000041</td><td>chr19</td><td> 45407052</td><td> 45410052</td><td>NM_000041.4</td><td>+</td><td>ENSG00000130203</td></tr>
	<tr><td>NM_000042</td><td>chr17</td><td> 64224533</td><td> 64227533</td><td>NM_000042.3</td><td>-</td><td>ENSG00000091583</td></tr>
	<tr><td>NM_000043</td><td>chr10</td><td> 90748554</td><td> 90751554</td><td>NM_000043.6</td><td>+</td><td>ENSG00000026103</td></tr>
	<tr><td>NM_000044</td><td>chrX </td><td> 66761862</td><td> 66764862</td><td>NM_000044.6</td><td>+</td><td>ENSG00000169083</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>NM_213622</td><td>chr2 </td><td> 74054087</td><td> 74057087</td><td>NM_213622.4</td><td>+</td><td>ENSG00000124356</td></tr>
	<tr><td>NM_213631</td><td>chr20</td><td> 35806951</td><td> 35809951</td><td>NM_213631.3</td><td>-</td><td>ENSG00000101353</td></tr>
	<tr><td>NM_213632</td><td>chr20</td><td> 35806951</td><td> 35809951</td><td>NM_213632.3</td><td>-</td><td>ENSG00000101353</td></tr>
	<tr><td>NM_213633</td><td>chr19</td><td> 43708790</td><td> 43711790</td><td>NM_213633.3</td><td>-</td><td>ENSG00000243137</td></tr>
	<tr><td>NM_213636</td><td>chr5 </td><td>176923606</td><td>176926606</td><td>NM_213636.2</td><td>-</td><td>ENSG00000196923</td></tr>
	<tr><td>NM_213645</td><td>chr14</td><td>100841664</td><td>100844664</td><td>NM_213645.2</td><td>-</td><td>ENSG00000140105</td></tr>
	<tr><td>NM_213646</td><td>chr14</td><td>100840684</td><td>100843684</td><td>NM_213646.2</td><td>-</td><td>ENSG00000140105</td></tr>
	<tr><td>NM_213647</td><td>chr5 </td><td>176511915</td><td>176514915</td><td>NM_213647.3</td><td>+</td><td>ENSG00000160867</td></tr>
	<tr><td>NM_213648</td><td>chr5 </td><td>133449303</td><td>133452303</td><td>NM_213648.5</td><td>+</td><td>ENSG00000081059</td></tr>
	<tr><td>NM_213649</td><td>chr10</td><td>120924226</td><td>120927226</td><td>NM_213649.2</td><td>-</td><td>ENSG00000183605</td></tr>
	<tr><td>NM_213651</td><td>chr1 </td><td>108734457</td><td>108737457</td><td>NM_213651.3</td><td>-</td><td>ENSG00000085491</td></tr>
	<tr><td>NM_213651</td><td>chr1 </td><td>108734457</td><td>108737457</td><td>NM_213651.3</td><td>-</td><td>ENSG00000284468</td></tr>
	<tr><td>NM_213652</td><td>chr1 </td><td>145411277</td><td>145414277</td><td>NM_213652.4</td><td>+</td><td>ENSG00000168509</td></tr>
	<tr><td>NM_213653</td><td>chr1 </td><td>145411190</td><td>145414190</td><td>NM_213653.3</td><td>+</td><td>ENSG00000168509</td></tr>
	<tr><td>NM_213654</td><td>chr3 </td><td>137904089</td><td>137907089</td><td>NM_213654.3</td><td>+</td><td>ENSG00000114098</td></tr>
	<tr><td>NM_213655</td><td>chr12</td><td>   860088</td><td>   863088</td><td>NM_213655.4</td><td>+</td><td>ENSG00000060237</td></tr>
	<tr><td>NM_213656</td><td>chr17</td><td> 39122200</td><td> 39125200</td><td>NM_213656.4</td><td>-</td><td>ENSG00000196859</td></tr>
	<tr><td>NM_213656</td><td>chr17</td><td> 39122200</td><td> 39125200</td><td>NM_213656.4</td><td>-</td><td>ENSG00000262164</td></tr>
	<tr><td>NM_213657</td><td>chr12</td><td> 10606215</td><td> 10609215</td><td>NM_213657.2</td><td>-</td><td>ENSG00000134545</td></tr>
	<tr><td>NM_213658</td><td>chr12</td><td> 10606215</td><td> 10609215</td><td>NM_213658.2</td><td>-</td><td>ENSG00000134545</td></tr>
	<tr><td>NM_213662</td><td>chr17</td><td> 40539460</td><td> 40542460</td><td>NM_213662.2</td><td>-</td><td>ENSG00000168610</td></tr>
	<tr><td>NM_213674</td><td>chr9 </td><td> 35689053</td><td> 35692053</td><td>NM_213674.1</td><td>-</td><td>ENSG00000198467</td></tr>
	<tr><td>NM_213720</td><td>chr22</td><td> 24109159</td><td> 24112159</td><td>NM_213720.3</td><td>-</td><td>ENSG00000250479</td></tr>
	<tr><td>NM_213720</td><td>chr22</td><td> 24109159</td><td> 24112159</td><td>NM_213720.3</td><td>-</td><td>ENSG00000273607</td></tr>
	<tr><td>NM_213725</td><td>chr15</td><td> 69743156</td><td> 69746156</td><td>NM_213725.2</td><td>+</td><td>ENSG00000137818</td></tr>
	<tr><td>NM_213726</td><td>chr17</td><td>  4899905</td><td>  4902905</td><td>NM_213726.2</td><td>-</td><td>ENSG00000196388</td></tr>
	<tr><td>NM_214462</td><td>chr6 </td><td>168719457</td><td>168722457</td><td>NM_214462.5</td><td>-</td><td>ENSG00000164488</td></tr>
	<tr><td>NM_214710</td><td>chr19</td><td>   694452</td><td>   697452</td><td>NM_214710.5</td><td>-</td><td>ENSG00000185198</td></tr>
	<tr><td>NM_214711</td><td>chr4 </td><td> 71017953</td><td> 71020953</td><td>NM_214711.4</td><td>+</td><td>ENSG00000187533</td></tr>
	<tr><td>NM_214711</td><td>chr4 </td><td> 71017953</td><td> 71020953</td><td>NM_214711.4</td><td>+</td><td>ENSG00000282868</td></tr>
</tbody>
</table>



### Add on TPM


```R
Promoter_list_ENSG_TPM <- merge(Promoter_list_ENSG, ENSG_TPM, by = "ENSEMBL") %>%
    dplyr::select(Chr, Start, End, RefSeq, REFSEQ, ENSEMBL, Strand, TPM)
Promoter_list_ENSG_TPM
```


    Error in h(simpleError(msg, call)): error in evaluating the argument 'y' in selecting a method for function 'merge': object 'ENSG_TPM' not found
    Traceback:


    1. merge(Promoter_list_ENSG, ENSG_TPM, by = "ENSEMBL") %>% dplyr::select(Chr, 
     .     Start, End, RefSeq, REFSEQ, ENSEMBL, Strand, TPM)

    2. dplyr::select(., Chr, Start, End, RefSeq, REFSEQ, ENSEMBL, Strand, 
     .     TPM)

    3. merge(Promoter_list_ENSG, ENSG_TPM, by = "ENSEMBL")

    4. .handleSimpleError(function (cond) 
     . .Internal(C_tryCatchHelper(addr, 1L, cond)), "object 'ENSG_TPM' not found", 
     .     base::quote(merge(Promoter_list_ENSG, ENSG_TPM, by = "ENSEMBL")))

    5. h(simpleError(msg, call))



```R
getwd()
write_tsv(Promoter_list_ENSG_TPM, "Promoter_list_ENSG_TPM.bed", col_names = F)

```


'/gpfs52/data/hodges_lab/Tim/nnRNA_TPM/reference_files'


#### B cell 


```R
# Add on 
Promoter_list_ENSG_TPM_GM_12 <- merge(Promoter_list_ENSG, GM_ENSG_TPM_12, by = "ENSEMBL") %>%
    dplyr::select(Chr, Start, End, RefSeq, REFSEQ, ENSEMBL, Strand, TPM)
Promoter_list_ENSG_TPM_GM_12
write_tsv(Promoter_list_ENSG_TPM_GM_12, "Promoter_list_ENSG_TPM.GM12878.combined.bed", col_names = F)

print("Ran.")
```


<table class="dataframe">
<caption>A data.frame: 55591 × 8</caption>
<thead>
	<tr><th scope=col>Chr</th><th scope=col>Start</th><th scope=col>End</th><th scope=col>RefSeq</th><th scope=col>REFSEQ</th><th scope=col>ENSEMBL</th><th scope=col>Strand</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chrX </td><td> 99890803</td><td> 99893803</td><td>NM_001278740.2</td><td>NM_001278740</td><td>ENSG00000000003</td><td>-</td><td>  0.140</td></tr>
	<tr><td>chrX </td><td> 99890803</td><td> 99893803</td><td>NM_003270.4   </td><td>NM_003270   </td><td>ENSG00000000003</td><td>-</td><td>  0.140</td></tr>
	<tr><td>chrX </td><td> 99891101</td><td> 99894101</td><td>NM_001278742.1</td><td>NM_001278742</td><td>ENSG00000000003</td><td>-</td><td>  0.140</td></tr>
	<tr><td>chrX </td><td> 99891101</td><td> 99894101</td><td>NM_001278741.1</td><td>NM_001278741</td><td>ENSG00000000003</td><td>-</td><td>  0.140</td></tr>
	<tr><td>chrX </td><td> 99891101</td><td> 99894101</td><td>NM_001278743.1</td><td>NM_001278743</td><td>ENSG00000000003</td><td>-</td><td>  0.140</td></tr>
	<tr><td>chrX </td><td> 99837932</td><td> 99840932</td><td>NM_022144.3   </td><td>NM_022144   </td><td>ENSG00000000005</td><td>+</td><td>  0.000</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_001317036.1</td><td>NM_001317036</td><td>ENSG00000000419</td><td>-</td><td>134.980</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_003859.2   </td><td>NM_003859   </td><td>ENSG00000000419</td><td>-</td><td>134.980</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_001317034.1</td><td>NM_001317034</td><td>ENSG00000000419</td><td>-</td><td>134.980</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_001317035.1</td><td>NM_001317035</td><td>ENSG00000000419</td><td>-</td><td>134.980</td></tr>
	<tr><td>chr1 </td><td>169862100</td><td>169865100</td><td>NM_181093.3   </td><td>NM_181093   </td><td>ENSG00000000457</td><td>-</td><td>  7.455</td></tr>
	<tr><td>chr1 </td><td>169862037</td><td>169865037</td><td>NM_020423.7   </td><td>NM_020423   </td><td>ENSG00000000457</td><td>-</td><td>  7.455</td></tr>
	<tr><td>chr1 </td><td>169762139</td><td>169765139</td><td>NM_001320048.1</td><td>NM_001320048</td><td>ENSG00000000460</td><td>+</td><td> 31.760</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366771.1</td><td>NM_001366771</td><td>ENSG00000000460</td><td>+</td><td> 31.760</td></tr>
	<tr><td>chr1 </td><td>169762139</td><td>169765139</td><td>NM_001363739.1</td><td>NM_001363739</td><td>ENSG00000000460</td><td>+</td><td> 31.760</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001320050.2</td><td>NM_001320050</td><td>ENSG00000000460</td><td>+</td><td> 31.760</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001320047.2</td><td>NM_001320047</td><td>ENSG00000000460</td><td>+</td><td> 31.760</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366768.1</td><td>NM_001366768</td><td>ENSG00000000460</td><td>+</td><td> 31.760</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366769.1</td><td>NM_001366769</td><td>ENSG00000000460</td><td>+</td><td> 31.760</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366770.1</td><td>NM_001366770</td><td>ENSG00000000460</td><td>+</td><td> 31.760</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366773.1</td><td>NM_001366773</td><td>ENSG00000000460</td><td>+</td><td> 31.760</td></tr>
	<tr><td>chr1 </td><td>169761870</td><td>169764870</td><td>NM_001320051.1</td><td>NM_001320051</td><td>ENSG00000000460</td><td>+</td><td> 31.760</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366772.1</td><td>NM_001366772</td><td>ENSG00000000460</td><td>+</td><td> 31.760</td></tr>
	<tr><td>chr1 </td><td> 27952108</td><td> 27955108</td><td>NM_001042729.2</td><td>NM_001042729</td><td>ENSG00000000938</td><td>-</td><td> 52.690</td></tr>
	<tr><td>chr1 </td><td> 27960696</td><td> 27963696</td><td>NM_005248.3   </td><td>NM_005248   </td><td>ENSG00000000938</td><td>-</td><td> 52.690</td></tr>
	<tr><td>chr1 </td><td> 27951751</td><td> 27954751</td><td>NM_001042747.1</td><td>NM_001042747</td><td>ENSG00000000938</td><td>-</td><td> 52.690</td></tr>
	<tr><td>chr1 </td><td>196619172</td><td>196622172</td><td>NM_000186.4   </td><td>NM_000186   </td><td>ENSG00000000971</td><td>+</td><td>  0.010</td></tr>
	<tr><td>chr1 </td><td>196619007</td><td>196622007</td><td>NM_001014975.2</td><td>NM_001014975</td><td>ENSG00000000971</td><td>+</td><td>  0.010</td></tr>
	<tr><td>chr6 </td><td>143831857</td><td>143834857</td><td>NM_032020.5   </td><td>NM_032020   </td><td>ENSG00000001036</td><td>-</td><td> 28.115</td></tr>
	<tr><td>chr6 </td><td> 53408899</td><td> 53411899</td><td>NM_001197115.2</td><td>NM_001197115</td><td>ENSG00000001084</td><td>-</td><td>  7.070</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>chr10</td><td> 88728092</td><td> 88731092</td><td>NM_133447.2   </td><td>NM_133447   </td><td>ENSG00000271880</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr6 </td><td>158587381</td><td>158590381</td><td>NM_207118.3   </td><td>NM_207118   </td><td>ENSG00000272047</td><td>+</td><td> 5.900</td></tr>
	<tr><td>chr6 </td><td> 34359446</td><td> 34362446</td><td>NM_006703.4   </td><td>NM_006703   </td><td>ENSG00000272325</td><td>-</td><td>18.845</td></tr>
	<tr><td>chr19</td><td> 36206920</td><td> 36209920</td><td>NM_014727.2   </td><td>NM_014727   </td><td>ENSG00000272333</td><td>+</td><td> 0.300</td></tr>
	<tr><td>chr4 </td><td> 77170852</td><td> 77173852</td><td>NM_001242939.1</td><td>NM_001242939</td><td>ENSG00000272414</td><td>+</td><td> 0.055</td></tr>
	<tr><td>chr6 </td><td> 88115689</td><td> 88118689</td><td>NM_001031743.3</td><td>NM_001031743</td><td>ENSG00000272514</td><td>+</td><td> 0.220</td></tr>
	<tr><td>chr3 </td><td> 52868035</td><td> 52871035</td><td>NM_205853.4   </td><td>NM_205853   </td><td>ENSG00000272573</td><td>-</td><td> 0.000</td></tr>
	<tr><td>chr17</td><td>    30441</td><td>    33441</td><td>NM_003585.5   </td><td>NM_003585   </td><td>ENSG00000272636</td><td>-</td><td> 0.000</td></tr>
	<tr><td>chr7 </td><td>128504383</td><td>128507383</td><td>NM_001195150.3</td><td>NM_001195150</td><td>ENSG00000272899</td><td>+</td><td> 0.220</td></tr>
	<tr><td>chr10</td><td> 75570356</td><td> 75573356</td><td>NM_001330107.2</td><td>NM_001330107</td><td>ENSG00000272916</td><td>-</td><td> 0.810</td></tr>
	<tr><td>chr10</td><td> 75570356</td><td> 75573356</td><td>NM_003635.4   </td><td>NM_003635   </td><td>ENSG00000272916</td><td>-</td><td> 0.810</td></tr>
	<tr><td>chr7 </td><td>  5083490</td><td>  5086490</td><td>NM_001204513.3</td><td>NM_001204513</td><td>ENSG00000272968</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr11</td><td> 56178072</td><td> 56181072</td><td>NM_001348230.1</td><td>NM_001348230</td><td>ENSG00000272987</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr17</td><td> 18429160</td><td> 18432160</td><td>NM_024974.2   </td><td>NM_024974   </td><td>ENSG00000273018</td><td>-</td><td> 0.070</td></tr>
	<tr><td>chr2 </td><td> 99756075</td><td> 99759075</td><td>NM_001317992.1</td><td>NM_001317992</td><td>ENSG00000273045</td><td>+</td><td> 1.945</td></tr>
	<tr><td>chr2 </td><td> 99756075</td><td> 99759075</td><td>NM_144706.3   </td><td>NM_144706   </td><td>ENSG00000273045</td><td>+</td><td> 1.945</td></tr>
	<tr><td>chr12</td><td> 54424831</td><td> 54427831</td><td>NM_018953.3   </td><td>NM_018953   </td><td>ENSG00000273046</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr12</td><td> 14132290</td><td> 14135290</td><td>NM_000834.4   </td><td>NM_000834   </td><td>ENSG00000273079</td><td>-</td><td> 0.000</td></tr>
	<tr><td>chr11</td><td>  5088601</td><td>  5091601</td><td>NM_001348221.1</td><td>NM_001348221</td><td>ENSG00000273085</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr13</td><td> 24732858</td><td> 24735858</td><td>NM_153023.4   </td><td>NM_153023   </td><td>ENSG00000273167</td><td>+</td><td> 0.020</td></tr>
	<tr><td>chr13</td><td> 24842887</td><td> 24845887</td><td>NM_001286795.2</td><td>NM_001286795</td><td>ENSG00000273167</td><td>+</td><td> 0.020</td></tr>
	<tr><td>chr13</td><td> 24732858</td><td> 24735858</td><td>NM_001166271.3</td><td>NM_001166271</td><td>ENSG00000273167</td><td>+</td><td> 0.020</td></tr>
	<tr><td>chr13</td><td> 24842824</td><td> 24845824</td><td>NM_001286794.1</td><td>NM_001286794</td><td>ENSG00000273167</td><td>+</td><td> 0.020</td></tr>
	<tr><td>chr13</td><td> 24842887</td><td> 24845887</td><td>NM_001286793.2</td><td>NM_001286793</td><td>ENSG00000273167</td><td>+</td><td> 0.020</td></tr>
	<tr><td>chr13</td><td> 24551940</td><td> 24554940</td><td>NM_001286792.2</td><td>NM_001286792</td><td>ENSG00000273167</td><td>+</td><td> 0.020</td></tr>
	<tr><td>chr15</td><td> 25198039</td><td> 25201039</td><td>NM_005678.4   </td><td>NM_005678   </td><td>ENSG00000273173</td><td>+</td><td>57.485</td></tr>
	<tr><td>chr15</td><td> 25198133</td><td> 25201133</td><td>NM_022804.3   </td><td>NM_022804   </td><td>ENSG00000273173</td><td>+</td><td>57.485</td></tr>
	<tr><td>chr1 </td><td>149399553</td><td>149402553</td><td>NM_001355409.3</td><td>NM_001355409</td><td>ENSG00000273213</td><td>-</td><td> 0.000</td></tr>
	<tr><td>chr4 </td><td>   569084</td><td>   572084</td><td>NM_001362796.2</td><td>NM_001362796</td><td>ENSG00000273238</td><td>-</td><td> 0.000</td></tr>
	<tr><td>chr1 </td><td> 32928672</td><td> 32931672</td><td>NM_001145720.2</td><td>NM_001145720</td><td>ENSG00000273274</td><td>+</td><td> 0.000</td></tr>
</tbody>
</table>



    [1] "Ran."


#### Liver 


```R
# Add on 
Promoter_list_ENSG_TPM_Hep_12 <- merge(Promoter_list_ENSG, Hep_ENSG_TPM_12, by = "ENSEMBL") %>%
    dplyr::select(Chr, Start, End, RefSeq, REFSEQ, ENSEMBL, Strand, TPM)
Promoter_list_ENSG_TPM_Hep_12
write_tsv(Promoter_list_ENSG_TPM_Hep_12, "Promoter_list_ENSG_TPM.HepG2.combined.bed", col_names = F)

print("Ran.")
```


<table class="dataframe">
<caption>A data.frame: 55591 × 8</caption>
<thead>
	<tr><th scope=col>Chr</th><th scope=col>Start</th><th scope=col>End</th><th scope=col>RefSeq</th><th scope=col>REFSEQ</th><th scope=col>ENSEMBL</th><th scope=col>Strand</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chrX </td><td> 99890803</td><td> 99893803</td><td>NM_001278740.2</td><td>NM_001278740</td><td>ENSG00000000003</td><td>-</td><td> 40.355</td></tr>
	<tr><td>chrX </td><td> 99890803</td><td> 99893803</td><td>NM_003270.4   </td><td>NM_003270   </td><td>ENSG00000000003</td><td>-</td><td> 40.355</td></tr>
	<tr><td>chrX </td><td> 99891101</td><td> 99894101</td><td>NM_001278742.1</td><td>NM_001278742</td><td>ENSG00000000003</td><td>-</td><td> 40.355</td></tr>
	<tr><td>chrX </td><td> 99891101</td><td> 99894101</td><td>NM_001278741.1</td><td>NM_001278741</td><td>ENSG00000000003</td><td>-</td><td> 40.355</td></tr>
	<tr><td>chrX </td><td> 99891101</td><td> 99894101</td><td>NM_001278743.1</td><td>NM_001278743</td><td>ENSG00000000003</td><td>-</td><td> 40.355</td></tr>
	<tr><td>chrX </td><td> 99837932</td><td> 99840932</td><td>NM_022144.3   </td><td>NM_022144   </td><td>ENSG00000000005</td><td>+</td><td>  0.000</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_001317036.1</td><td>NM_001317036</td><td>ENSG00000000419</td><td>-</td><td> 79.980</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_003859.2   </td><td>NM_003859   </td><td>ENSG00000000419</td><td>-</td><td> 79.980</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_001317034.1</td><td>NM_001317034</td><td>ENSG00000000419</td><td>-</td><td> 79.980</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_001317035.1</td><td>NM_001317035</td><td>ENSG00000000419</td><td>-</td><td> 79.980</td></tr>
	<tr><td>chr1 </td><td>169862100</td><td>169865100</td><td>NM_181093.3   </td><td>NM_181093   </td><td>ENSG00000000457</td><td>-</td><td>  1.830</td></tr>
	<tr><td>chr1 </td><td>169862037</td><td>169865037</td><td>NM_020423.7   </td><td>NM_020423   </td><td>ENSG00000000457</td><td>-</td><td>  1.830</td></tr>
	<tr><td>chr1 </td><td>169762139</td><td>169765139</td><td>NM_001320048.1</td><td>NM_001320048</td><td>ENSG00000000460</td><td>+</td><td>  2.630</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366771.1</td><td>NM_001366771</td><td>ENSG00000000460</td><td>+</td><td>  2.630</td></tr>
	<tr><td>chr1 </td><td>169762139</td><td>169765139</td><td>NM_001363739.1</td><td>NM_001363739</td><td>ENSG00000000460</td><td>+</td><td>  2.630</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001320050.2</td><td>NM_001320050</td><td>ENSG00000000460</td><td>+</td><td>  2.630</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001320047.2</td><td>NM_001320047</td><td>ENSG00000000460</td><td>+</td><td>  2.630</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366768.1</td><td>NM_001366768</td><td>ENSG00000000460</td><td>+</td><td>  2.630</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366769.1</td><td>NM_001366769</td><td>ENSG00000000460</td><td>+</td><td>  2.630</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366770.1</td><td>NM_001366770</td><td>ENSG00000000460</td><td>+</td><td>  2.630</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366773.1</td><td>NM_001366773</td><td>ENSG00000000460</td><td>+</td><td>  2.630</td></tr>
	<tr><td>chr1 </td><td>169761870</td><td>169764870</td><td>NM_001320051.1</td><td>NM_001320051</td><td>ENSG00000000460</td><td>+</td><td>  2.630</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366772.1</td><td>NM_001366772</td><td>ENSG00000000460</td><td>+</td><td>  2.630</td></tr>
	<tr><td>chr1 </td><td> 27952108</td><td> 27955108</td><td>NM_001042729.2</td><td>NM_001042729</td><td>ENSG00000000938</td><td>-</td><td>  0.000</td></tr>
	<tr><td>chr1 </td><td> 27960696</td><td> 27963696</td><td>NM_005248.3   </td><td>NM_005248   </td><td>ENSG00000000938</td><td>-</td><td>  0.000</td></tr>
	<tr><td>chr1 </td><td> 27951751</td><td> 27954751</td><td>NM_001042747.1</td><td>NM_001042747</td><td>ENSG00000000938</td><td>-</td><td>  0.000</td></tr>
	<tr><td>chr1 </td><td>196619172</td><td>196622172</td><td>NM_000186.4   </td><td>NM_000186   </td><td>ENSG00000000971</td><td>+</td><td>  0.500</td></tr>
	<tr><td>chr1 </td><td>196619007</td><td>196622007</td><td>NM_001014975.2</td><td>NM_001014975</td><td>ENSG00000000971</td><td>+</td><td>  0.500</td></tr>
	<tr><td>chr6 </td><td>143831857</td><td>143834857</td><td>NM_032020.5   </td><td>NM_032020   </td><td>ENSG00000001036</td><td>-</td><td> 33.440</td></tr>
	<tr><td>chr6 </td><td> 53408899</td><td> 53411899</td><td>NM_001197115.2</td><td>NM_001197115</td><td>ENSG00000001084</td><td>-</td><td>320.300</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>chr10</td><td> 88728092</td><td> 88731092</td><td>NM_133447.2   </td><td>NM_133447   </td><td>ENSG00000271880</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr6 </td><td>158587381</td><td>158590381</td><td>NM_207118.3   </td><td>NM_207118   </td><td>ENSG00000272047</td><td>+</td><td> 0.670</td></tr>
	<tr><td>chr6 </td><td> 34359446</td><td> 34362446</td><td>NM_006703.4   </td><td>NM_006703   </td><td>ENSG00000272325</td><td>-</td><td> 2.050</td></tr>
	<tr><td>chr19</td><td> 36206920</td><td> 36209920</td><td>NM_014727.2   </td><td>NM_014727   </td><td>ENSG00000272333</td><td>+</td><td> 3.760</td></tr>
	<tr><td>chr4 </td><td> 77170852</td><td> 77173852</td><td>NM_001242939.1</td><td>NM_001242939</td><td>ENSG00000272414</td><td>+</td><td> 9.420</td></tr>
	<tr><td>chr6 </td><td> 88115689</td><td> 88118689</td><td>NM_001031743.3</td><td>NM_001031743</td><td>ENSG00000272514</td><td>+</td><td> 0.140</td></tr>
	<tr><td>chr3 </td><td> 52868035</td><td> 52871035</td><td>NM_205853.4   </td><td>NM_205853   </td><td>ENSG00000272573</td><td>-</td><td> 0.045</td></tr>
	<tr><td>chr17</td><td>    30441</td><td>    33441</td><td>NM_003585.5   </td><td>NM_003585   </td><td>ENSG00000272636</td><td>-</td><td> 0.300</td></tr>
	<tr><td>chr7 </td><td>128504383</td><td>128507383</td><td>NM_001195150.3</td><td>NM_001195150</td><td>ENSG00000272899</td><td>+</td><td> 0.110</td></tr>
	<tr><td>chr10</td><td> 75570356</td><td> 75573356</td><td>NM_001330107.2</td><td>NM_001330107</td><td>ENSG00000272916</td><td>-</td><td> 0.380</td></tr>
	<tr><td>chr10</td><td> 75570356</td><td> 75573356</td><td>NM_003635.4   </td><td>NM_003635   </td><td>ENSG00000272916</td><td>-</td><td> 0.380</td></tr>
	<tr><td>chr7 </td><td>  5083490</td><td>  5086490</td><td>NM_001204513.3</td><td>NM_001204513</td><td>ENSG00000272968</td><td>+</td><td> 0.725</td></tr>
	<tr><td>chr11</td><td> 56178072</td><td> 56181072</td><td>NM_001348230.1</td><td>NM_001348230</td><td>ENSG00000272987</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr17</td><td> 18429160</td><td> 18432160</td><td>NM_024974.2   </td><td>NM_024974   </td><td>ENSG00000273018</td><td>-</td><td> 0.100</td></tr>
	<tr><td>chr2 </td><td> 99756075</td><td> 99759075</td><td>NM_001317992.1</td><td>NM_001317992</td><td>ENSG00000273045</td><td>+</td><td>10.625</td></tr>
	<tr><td>chr2 </td><td> 99756075</td><td> 99759075</td><td>NM_144706.3   </td><td>NM_144706   </td><td>ENSG00000273045</td><td>+</td><td>10.625</td></tr>
	<tr><td>chr12</td><td> 54424831</td><td> 54427831</td><td>NM_018953.3   </td><td>NM_018953   </td><td>ENSG00000273046</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr12</td><td> 14132290</td><td> 14135290</td><td>NM_000834.4   </td><td>NM_000834   </td><td>ENSG00000273079</td><td>-</td><td> 0.030</td></tr>
	<tr><td>chr11</td><td>  5088601</td><td>  5091601</td><td>NM_001348221.1</td><td>NM_001348221</td><td>ENSG00000273085</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr13</td><td> 24732858</td><td> 24735858</td><td>NM_153023.4   </td><td>NM_153023   </td><td>ENSG00000273167</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr13</td><td> 24842887</td><td> 24845887</td><td>NM_001286795.2</td><td>NM_001286795</td><td>ENSG00000273167</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr13</td><td> 24732858</td><td> 24735858</td><td>NM_001166271.3</td><td>NM_001166271</td><td>ENSG00000273167</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr13</td><td> 24842824</td><td> 24845824</td><td>NM_001286794.1</td><td>NM_001286794</td><td>ENSG00000273167</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr13</td><td> 24842887</td><td> 24845887</td><td>NM_001286793.2</td><td>NM_001286793</td><td>ENSG00000273167</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr13</td><td> 24551940</td><td> 24554940</td><td>NM_001286792.2</td><td>NM_001286792</td><td>ENSG00000273167</td><td>+</td><td> 0.000</td></tr>
	<tr><td>chr15</td><td> 25198039</td><td> 25201039</td><td>NM_005678.4   </td><td>NM_005678   </td><td>ENSG00000273173</td><td>+</td><td>23.055</td></tr>
	<tr><td>chr15</td><td> 25198133</td><td> 25201133</td><td>NM_022804.3   </td><td>NM_022804   </td><td>ENSG00000273173</td><td>+</td><td>23.055</td></tr>
	<tr><td>chr1 </td><td>149399553</td><td>149402553</td><td>NM_001355409.3</td><td>NM_001355409</td><td>ENSG00000273213</td><td>-</td><td> 0.000</td></tr>
	<tr><td>chr4 </td><td>   569084</td><td>   572084</td><td>NM_001362796.2</td><td>NM_001362796</td><td>ENSG00000273238</td><td>-</td><td> 0.000</td></tr>
	<tr><td>chr1 </td><td> 32928672</td><td> 32931672</td><td>NM_001145720.2</td><td>NM_001145720</td><td>ENSG00000273274</td><td>+</td><td> 0.000</td></tr>
</tbody>
</table>



    [1] "Ran."


--------------------LIVER ONLY-------------------


```R
Promoter_list_ENSG_TPM_Liver <- merge(Promoter_list_ENSG, ENSG_TPM_Liver, by = "ENSEMBL") %>%
    dplyr::select(Chr, Start, End, RefSeq, REFSEQ, ENSEMBL, Strand, TPM)
Promoter_list_ENSG_TPM_Liver

write_tsv(Promoter_list_ENSG_TPM_Liver, "Promoter_list_ENSG_TPM_Liver.bed", col_names = F)

```


<table class="dataframe">
<caption>A data.frame: 56378 × 8</caption>
<thead>
	<tr><th scope=col>Chr</th><th scope=col>Start</th><th scope=col>End</th><th scope=col>RefSeq</th><th scope=col>REFSEQ</th><th scope=col>ENSEMBL</th><th scope=col>Strand</th><th scope=col>TPM</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chrX </td><td> 99891101</td><td> 99894101</td><td>NM_001278742.1</td><td>NM_001278742</td><td>ENSG00000000003</td><td>-</td><td> 56.06</td></tr>
	<tr><td>chrX </td><td> 99891101</td><td> 99894101</td><td>NM_001278743.1</td><td>NM_001278743</td><td>ENSG00000000003</td><td>-</td><td> 56.06</td></tr>
	<tr><td>chrX </td><td> 99890803</td><td> 99893803</td><td>NM_001278740.2</td><td>NM_001278740</td><td>ENSG00000000003</td><td>-</td><td> 56.06</td></tr>
	<tr><td>chrX </td><td> 99891101</td><td> 99894101</td><td>NM_001278741.1</td><td>NM_001278741</td><td>ENSG00000000003</td><td>-</td><td> 56.06</td></tr>
	<tr><td>chrX </td><td> 99890803</td><td> 99893803</td><td>NM_003270.4   </td><td>NM_003270   </td><td>ENSG00000000003</td><td>-</td><td> 56.06</td></tr>
	<tr><td>chrX </td><td> 99837932</td><td> 99840932</td><td>NM_022144.3   </td><td>NM_022144   </td><td>ENSG00000000005</td><td>+</td><td>  0.00</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_001317034.1</td><td>NM_001317034</td><td>ENSG00000000419</td><td>-</td><td> 86.45</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_001317036.1</td><td>NM_001317036</td><td>ENSG00000000419</td><td>-</td><td> 86.45</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_003859.2   </td><td>NM_003859   </td><td>ENSG00000000419</td><td>-</td><td> 86.45</td></tr>
	<tr><td>chr20</td><td> 49574101</td><td> 49577101</td><td>NM_001317035.1</td><td>NM_001317035</td><td>ENSG00000000419</td><td>-</td><td> 86.45</td></tr>
	<tr><td>chr1 </td><td>169862100</td><td>169865100</td><td>NM_181093.3   </td><td>NM_181093   </td><td>ENSG00000000457</td><td>-</td><td>  1.64</td></tr>
	<tr><td>chr1 </td><td>169862037</td><td>169865037</td><td>NM_020423.7   </td><td>NM_020423   </td><td>ENSG00000000457</td><td>-</td><td>  1.64</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366769.1</td><td>NM_001366769</td><td>ENSG00000000460</td><td>+</td><td>  2.57</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366770.1</td><td>NM_001366770</td><td>ENSG00000000460</td><td>+</td><td>  2.57</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366773.1</td><td>NM_001366773</td><td>ENSG00000000460</td><td>+</td><td>  2.57</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001320050.2</td><td>NM_001320050</td><td>ENSG00000000460</td><td>+</td><td>  2.57</td></tr>
	<tr><td>chr1 </td><td>169762139</td><td>169765139</td><td>NM_001320048.1</td><td>NM_001320048</td><td>ENSG00000000460</td><td>+</td><td>  2.57</td></tr>
	<tr><td>chr1 </td><td>169762139</td><td>169765139</td><td>NM_001363739.1</td><td>NM_001363739</td><td>ENSG00000000460</td><td>+</td><td>  2.57</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001320047.2</td><td>NM_001320047</td><td>ENSG00000000460</td><td>+</td><td>  2.57</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366771.1</td><td>NM_001366771</td><td>ENSG00000000460</td><td>+</td><td>  2.57</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366772.1</td><td>NM_001366772</td><td>ENSG00000000460</td><td>+</td><td>  2.57</td></tr>
	<tr><td>chr1 </td><td>169762180</td><td>169765180</td><td>NM_001366768.1</td><td>NM_001366768</td><td>ENSG00000000460</td><td>+</td><td>  2.57</td></tr>
	<tr><td>chr1 </td><td>169761870</td><td>169764870</td><td>NM_001320051.1</td><td>NM_001320051</td><td>ENSG00000000460</td><td>+</td><td>  2.57</td></tr>
	<tr><td>chr1 </td><td> 27951751</td><td> 27954751</td><td>NM_001042747.1</td><td>NM_001042747</td><td>ENSG00000000938</td><td>-</td><td>  0.00</td></tr>
	<tr><td>chr1 </td><td> 27960696</td><td> 27963696</td><td>NM_005248.3   </td><td>NM_005248   </td><td>ENSG00000000938</td><td>-</td><td>  0.00</td></tr>
	<tr><td>chr1 </td><td> 27952108</td><td> 27955108</td><td>NM_001042729.2</td><td>NM_001042729</td><td>ENSG00000000938</td><td>-</td><td>  0.00</td></tr>
	<tr><td>chr1 </td><td>196619172</td><td>196622172</td><td>NM_000186.4   </td><td>NM_000186   </td><td>ENSG00000000971</td><td>+</td><td>  0.56</td></tr>
	<tr><td>chr1 </td><td>196619007</td><td>196622007</td><td>NM_001014975.2</td><td>NM_001014975</td><td>ENSG00000000971</td><td>+</td><td>  0.56</td></tr>
	<tr><td>chr6 </td><td>143831857</td><td>143834857</td><td>NM_032020.5   </td><td>NM_032020   </td><td>ENSG00000001036</td><td>-</td><td> 36.93</td></tr>
	<tr><td>chr6 </td><td> 53408899</td><td> 53411899</td><td>NM_001498.4   </td><td>NM_001498   </td><td>ENSG00000001084</td><td>-</td><td>280.46</td></tr>
	<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>
	<tr><td>chr4 </td><td> 87812575</td><td> 87815575</td><td>NM_001369889.1</td><td>NM_001369889</td><td>ENSG00000285458</td><td>-</td><td>0.00</td></tr>
	<tr><td>chr4 </td><td> 87812575</td><td> 87815575</td><td>NM_001369888.1</td><td>NM_001369888</td><td>ENSG00000285458</td><td>-</td><td>0.00</td></tr>
	<tr><td>chr4 </td><td> 87812575</td><td> 87815575</td><td>NM_144645.4   </td><td>NM_144645   </td><td>ENSG00000285458</td><td>-</td><td>0.00</td></tr>
	<tr><td>chr7 </td><td>150906574</td><td>150909574</td><td>NM_001369125.1</td><td>NM_001369125</td><td>ENSG00000285480</td><td>-</td><td>0.00</td></tr>
	<tr><td>chr19</td><td> 35604731</td><td> 35607731</td><td>NM_001136009.1</td><td>NM_001136009</td><td>ENSG00000285526</td><td>+</td><td>0.00</td></tr>
	<tr><td>chr19</td><td> 35604726</td><td> 35607726</td><td>NM_021910.3   </td><td>NM_021910   </td><td>ENSG00000285526</td><td>+</td><td>0.00</td></tr>
	<tr><td>chr19</td><td> 35604726</td><td> 35607726</td><td>NM_001136007.2</td><td>NM_001136007</td><td>ENSG00000285526</td><td>+</td><td>0.00</td></tr>
	<tr><td>chr19</td><td> 35604726</td><td> 35607726</td><td>NM_001136012.2</td><td>NM_001136012</td><td>ENSG00000285526</td><td>+</td><td>0.00</td></tr>
	<tr><td>chr19</td><td> 35604726</td><td> 35607726</td><td>NM_005971.4   </td><td>NM_005971   </td><td>ENSG00000285526</td><td>+</td><td>0.00</td></tr>
	<tr><td>chr19</td><td> 35604731</td><td> 35607731</td><td>NM_001136010.1</td><td>NM_001136010</td><td>ENSG00000285526</td><td>+</td><td>0.00</td></tr>
	<tr><td>chr19</td><td> 35604731</td><td> 35607731</td><td>NM_001136008.1</td><td>NM_001136008</td><td>ENSG00000285526</td><td>+</td><td>0.00</td></tr>
	<tr><td>chr19</td><td> 35604726</td><td> 35607726</td><td>NM_001136011.2</td><td>NM_001136011</td><td>ENSG00000285526</td><td>+</td><td>0.00</td></tr>
	<tr><td>chr13</td><td> 64406186</td><td> 64409186</td><td>NM_001370368.2</td><td>NM_001370368</td><td>ENSG00000285566</td><td>-</td><td>0.37</td></tr>
	<tr><td>chr13</td><td> 78235938</td><td> 78238938</td><td>NM_001310140.1</td><td>NM_001310140</td><td>ENSG00000285746</td><td>-</td><td>0.00</td></tr>
	<tr><td>chr21</td><td> 40750251</td><td> 40753251</td><td>NM_001350300.2</td><td>NM_001350300</td><td>ENSG00000285815</td><td>+</td><td>0.63</td></tr>
	<tr><td>chr21</td><td> 40750251</td><td> 40753251</td><td>NM_001317744.2</td><td>NM_001317744</td><td>ENSG00000285815</td><td>+</td><td>0.63</td></tr>
	<tr><td>chr11</td><td> 65027432</td><td> 65030432</td><td>NM_002689.4   </td><td>NM_002689   </td><td>ENSG00000285816</td><td>+</td><td>1.03</td></tr>
	<tr><td>chr1 </td><td>152052400</td><td>152055400</td><td>NM_001310142.1</td><td>NM_001310142</td><td>ENSG00000285818</td><td>-</td><td>0.00</td></tr>
	<tr><td>chr17</td><td> 56479082</td><td> 56482082</td><td>NM_001305545.1</td><td>NM_001305545</td><td>ENSG00000285897</td><td>-</td><td>0.08</td></tr>
	<tr><td>chr17</td><td> 56493895</td><td> 56496895</td><td>NM_001305544.2</td><td>NM_001305544</td><td>ENSG00000285897</td><td>-</td><td>0.08</td></tr>
	<tr><td>chr17</td><td> 56493943</td><td> 56496943</td><td>NM_017763.5   </td><td>NM_017763   </td><td>ENSG00000285897</td><td>-</td><td>0.08</td></tr>
	<tr><td>chr15</td><td> 42839991</td><td> 42842991</td><td>NM_153260.3   </td><td>NM_153260   </td><td>ENSG00000285942</td><td>-</td><td>0.08</td></tr>
	<tr><td>chr3 </td><td>113232691</td><td>113235691</td><td>NM_001331079.1</td><td>NM_001331079</td><td>ENSG00000285943</td><td>-</td><td>1.89</td></tr>
	<tr><td>chr3 </td><td>113233003</td><td>113236003</td><td>NM_144718.4   </td><td>NM_144718   </td><td>ENSG00000285943</td><td>-</td><td>1.89</td></tr>
	<tr><td>chr3 </td><td>113233003</td><td>113236003</td><td>NM_001331078.2</td><td>NM_001331078</td><td>ENSG00000285943</td><td>-</td><td>1.89</td></tr>
	<tr><td>chr6 </td><td> 64279916</td><td> 64282916</td><td>NM_003463.4   </td><td>NM_003463   </td><td>ENSG00000285976</td><td>+</td><td>9.94</td></tr>
	<tr><td>chr6 </td><td>150211170</td><td>150214170</td><td>NM_001243327.1</td><td>NM_001243327</td><td>ENSG00000285991</td><td>-</td><td>0.06</td></tr>
	<tr><td>chr6 </td><td>150211170</td><td>150214170</td><td>NM_139165.2   </td><td>NM_139165   </td><td>ENSG00000285991</td><td>-</td><td>0.06</td></tr>
	<tr><td>chr6 </td><td>150211170</td><td>150214170</td><td>NM_001243325.1</td><td>NM_001243325</td><td>ENSG00000285991</td><td>-</td><td>0.06</td></tr>
	<tr><td>chr6 </td><td>150216195</td><td>150219195</td><td>NM_001243328.1</td><td>NM_001243328</td><td>ENSG00000285991</td><td>-</td><td>0.06</td></tr>
</tbody>
</table>



## Filter based on TPM>0


```R
Promoter_list_ENSG_TPM_ExprFiltered0 <- Promoter_list_ENSG_TPM %>% # 55591
  filter(TPM>0) # 45693

nrow(Promoter_list_ENSG_TPM)
nrow(Promoter_list_ENSG_TPM_ExprFiltered0)

# Write to output
write_tsv(Promoter_list_ENSG_TPM_ExprFiltered0, "Promoter_list_ENSG_TPM_ExprFiltered0.withHeaders.txt", col_names = T)

write_tsv(Promoter_list_ENSG_TPM_ExprFiltered0, "Promoter_list_ENSG_TPM_ExprFiltered0.txt", col_names = F)




```


55591



45693


### B cell 


```R
GM_Promoter_list_ENSG_TPM_ExprFiltered0 <- Promoter_list_ENSG_TPM_GM_12 %>% # 55591
  filter(TPM>0) # 45693

nrow(Promoter_list_ENSG_TPM_GM_12)
nrow(GM_Promoter_list_ENSG_TPM_ExprFiltered0)

# Write to output
write_tsv(GM_Promoter_list_ENSG_TPM_ExprFiltered0, "GM12878.Promoter_list_ENSG_TPM_ExprFiltered0.withHeaders.txt", col_names = T)


print("Ran.")
```


55591



47847


    [1] "Ran."


### Liver


```R
Hep_Promoter_list_ENSG_TPM_ExprFiltered0 <- Promoter_list_ENSG_TPM_Hep_12 %>% # 55591
  filter(TPM>0) # 45693

nrow(Promoter_list_ENSG_TPM_Hep_12)
nrow(Hep_Promoter_list_ENSG_TPM_ExprFiltered0)

# Write to output
write_tsv(Hep_Promoter_list_ENSG_TPM_ExprFiltered0, "HepG2.Promoter_list_ENSG_TPM_ExprFiltered0.withHeaders.txt", col_names = T)

print("Ran.")
```


55591



46187


    [1] "Ran."


---------------------LIVER SOLO----------------------


```R
Promoter_list_ENSG_TPM_ExprFiltered0_Liver <- Promoter_list_ENSG_TPM_Liver %>% # 55591
  filter(TPM>0) # 45693

nrow(Promoter_list_ENSG_TPM_Liver)
nrow(Promoter_list_ENSG_TPM_ExprFiltered0_Liver)

# Write to output
write_tsv(Promoter_list_ENSG_TPM_ExprFiltered0_Liver, "Promoter_list_ENSG_TPM_ExprFiltered0.Liver.withHeaders.txt", col_names = T)

write_tsv(Promoter_list_ENSG_TPM_ExprFiltered0_Liver, "Promoter_list_ENSG_TPM_ExprFiltered0.Liver.txt", col_names = F)




```


56378



43970


# Find nearest neighbor genes and filter by TAD 


```R
mkdir -p /data/hodges_lab/Tim/nnRNA_TPM/intermediate_files
cd /data/hodges_lab/Tim/nnRNA_TPM/intermediate_files
```

Sort the input files 


```R
wc -l /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell*
```

      13043 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_all_cellspecific.txt
      21027 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_all_shared.txt
       1040 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters_containsCS.txt
       2218 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters_individualHMRs_cellspecific.txt
       3756 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters_individualHMRs_shared.txt
       5974 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters_individualHMRs.txt
       1579 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters.txt
        539 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters_withoutCS.txt
       6463 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_unclustered_cellspecific.txt
      10722 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_unclustered_shared.txt
      17185 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_unclustered.txt
      19944 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_whitelistRegions_cluster_individualHMRs_temp.txt
       3435 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_whitelistRegions_contain3ormoreHMRs.txt
     198742 /data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_whitelist.txt
     305667 total



```R
CLUST_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters.txt
UNCLUST_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_unclustered.txt

CLUSTERED_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters_individualHMRs.txt
CLUSTERED_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters_individualHMRs_cellspecific.txt
UNCLUSTERED_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_unclustered_cellspecific.txt



INTER_DIR=/data/hodges_lab/Tim/nnRNA_TPM/intermediate_files/
REF_DIR=/data/hodges_lab/Tim/nnRNA_TPM/reference_files/
OUT_DIR=/data/hodges_lab/Tim/nnRNA_TPM/output_files/
```


```R
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${CLUST_FILE} | bedtools sort -i - > HMR.clusters.temp1.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${UNCLUST_FILE} | bedtools sort -i - > HMR.unclustered.temp1.txt

awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${CLUSTERED_FILE} | bedtools sort -i - > HMR.clustered.temp1.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${CLUSTERED_CS_FILE} | bedtools sort -i - > HMR.clustered_cs.temp1.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${UNCLUSTERED_CS_FILE} | bedtools sort -i - > HMR.unclustered_cs.temp1.txt


bedtools sort -i ${REF_DIR}Promoter_list_ENSG_TPM_ExprFiltered0.txt > PROM_ENSG_TPM.temp1.txt
```

Find the closest 50 genes per HMR 


```R
####### (1) Find 50 NN Genes
bedtools closest -d -k 50 -a HMR.clusters.temp1.txt -b PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Bcell_clusters_50NearGenes_TPMFiltered0.txt
```


```R
bedtools closest -d -k 50 -a HMR.unclustered.temp1.txt -b PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Bcell_unclustered_50NearGenes_TPMFiltered0.txt
```


```R
bedtools closest -d -k 50 -a HMR.clustered.temp1.txt -b PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Bcell_clustered_50NearGenes_TPMFiltered0.txt

bedtools closest -d -k 50 -a HMR.clustered_cs.temp1.txt -b PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0.txt

bedtools closest -d -k 50 -a HMR.unclustered_cs.temp1.txt -b PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0.txt
```

----------------LIVER----------------


```R
mkdir -p /data/hodges_lab/Tim/nnRNA_TPM/intermediate_files
cd /data/hodges_lab/Tim/nnRNA_TPM/intermediate_files
```


```R
LIV_CLUST_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Liver_internalClusters.txt
LIV_UNCLUST_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Liver_unclustered.txt

LIV_IND_CLUST_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Liver_internalClusters_individualHMRs.txt
LIV_IND_CLUST_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Liver_internalClusters_individualHMRs_cellspecific.txt
LIV_UNCLUST_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Liver_unclustered_cellspecific.txt



INTER_DIR=/data/hodges_lab/Tim/nnRNA_TPM/intermediate_files/
REF_DIR=/data/hodges_lab/Tim/nnRNA_TPM/reference_files/
OUT_DIR=/data/hodges_lab/Tim/nnRNA_TPM/output_files/
```


```R
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${LIV_CLUST_FILE} | bedtools sort -i - > Liver.HMR.clusters.temp1.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${LIV_UNCLUST_FILE} | bedtools sort -i - > Liver.HMR.unclustered.temp1.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${LIV_IND_CLUST_FILE} | bedtools sort -i - > Liver.HMR.clustered.temp1.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${LIV_IND_CLUST_CS_FILE} | bedtools sort -i - > Liver.HMR.clustered.cellspecific.temp1.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${LIV_UNCLUST_CS_FILE} | bedtools sort -i - > Liver.HMR.unclustered.cellspecific.temp1.txt

bedtools sort -i ${REF_DIR}Promoter_list_ENSG_TPM_ExprFiltered0.Liver.txt > Liver.PROM_ENSG_TPM.temp1.txt

echo "Done."
```

    Done.



```R

bedtools closest -d -k 50 -a Liver.HMR.clusters.temp1.txt -b Liver.PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Liver_clusters_50NearGenes_TPMFiltered0.txt
```


```R
bedtools closest -d -k 50 -a Liver.HMR.unclustered.temp1.txt -b Liver.PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Liver_unclustered_50NearGenes_TPMFiltered0.txt
```


```R
bedtools closest -d -k 50 -a Liver.HMR.clustered.temp1.txt -b Liver.PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Liver_clustered_50NearGenes_TPMFiltered0.txt
```


```R
bedtools closest -d -k 50 -a Liver.HMR.clustered.cellspecific.temp1.txt -b Liver.PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Liver_clustered_cellspecific_50NearGenes_TPMFiltered0.txt
```


```R
bedtools closest -d -k 50 -a Liver.HMR.unclustered.cellspecific.temp1.txt -b Liver.PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0.txt
```

## Get 50 NN 


```R
echo "Is ACCRE working?"
```

    Is ACCRE working?


### B cell 


```R
# Define working directory
mkdir -p /data/hodges_lab/Tim/nnRNA_TPM/intermediate_files
cd /data/hodges_lab/Tim/nnRNA_TPM/intermediate_files

# Define HMR files to process 
BCELL_CLUST_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_internalClusters_individualHMRs_cellspecific.txt
BCELL_UNCLUST_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Bcell_unclustered_cellspecific.txt

# Define other directories for working
INTER_DIR=/data/hodges_lab/Tim/nnRNA_TPM/intermediate_files/
REF_DIR=/data/hodges_lab/Tim/nnRNA_TPM/reference_files/
OUT_DIR=/data/hodges_lab/Tim/nnRNA_TPM/output_files/

echo "Done."
```

    Done.



```R
# Prepare input file 
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${BCELL_CLUST_CS_FILE} | bedtools sort -i - > Bcell.HMR.clustered.cellspecific.temp1.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${BCELL_UNCLUST_CS_FILE} | bedtools sort -i - > Bcell.HMR.unclustered.cellspecific.temp1.txt

# Prepare TSS_ENSG_TPM file (sort)
awk 'BEGIN{OFS=FS="\t"}{if (NR>1) print}' ${REF_DIR}GM12878.Promoter_list_ENSG_TPM_ExprFiltered0.withHeaders.txt | bedtools sort -i - > GM12878.PROM_ENSG_TPM.temp1.txt

echo "Done."
```

    Done.



```R
# Find 50 NN 
bedtools closest -d -k 50 -a Bcell.HMR.clustered.cellspecific.temp1.txt -b GM12878.PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0.txt
bedtools closest -d -k 50 -a Bcell.HMR.unclustered.cellspecific.temp1.txt -b GM12878.PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0.txt

echo "Done."
```

    Done.


### Liver


```R
# Define working directory
mkdir -p /data/hodges_lab/Tim/nnRNA_TPM/intermediate_files
cd /data/hodges_lab/Tim/nnRNA_TPM/intermediate_files

# Define HMR files to process 
LIV_CLUST_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Liver_internalClusters_individualHMRs_cellspecific.txt
LIV_UNCLUST_CS_FILE=/data/hodges_lab/Tim/finalAnalyses_HMRs/HMRs_goodGenes/HMRs/Liver_unclustered_cellspecific.txt

# Define other directories for working
INTER_DIR=/data/hodges_lab/Tim/nnRNA_TPM/intermediate_files/
REF_DIR=/data/hodges_lab/Tim/nnRNA_TPM/reference_files/
OUT_DIR=/data/hodges_lab/Tim/nnRNA_TPM/output_files/

echo "Done."
```

    Done.



```R
# Prepare input file 
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${LIV_CLUST_CS_FILE} | bedtools sort -i - > Liver.HMR.clustered.cellspecific.temp1.txt
awk 'BEGIN{OFS=FS="\t"}{print $1,$2,$3}' ${LIV_UNCLUST_CS_FILE} | bedtools sort -i - > Liver.HMR.unclustered.cellspecific.temp1.txt

# Prepare TSS_ENSG_TPM file (sort)
awk 'BEGIN{OFS=FS="\t"}{if (NR>1) print}' ${REF_DIR}HepG2.Promoter_list_ENSG_TPM_ExprFiltered0.withHeaders.txt | bedtools sort -i - > HepG2.PROM_ENSG_TPM.temp1.txt


echo "Done."
```

    Done.



```R
# Find 50 NN 
bedtools closest -d -k 50 -a Liver.HMR.clustered.cellspecific.temp1.txt -b HepG2.PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Liver_clustered_cellspecific_50NearGenes_TPMFiltered0.txt
bedtools closest -d -k 50 -a Liver.HMR.unclustered.cellspecific.temp1.txt -b HepG2.PROM_ENSG_TPM.temp1.txt > ${INTER_DIR}Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0.txt

echo "Done."
```

    Done.


## Compare and keep HMR-NNGene pairs that don't cross (contain) a TAD boundary

### Create a BED file representing the whole expanse from HMR to TSS

#### B cell 


```R
awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt 

awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt

echo "Made continuous BED file."
```

    Made continuous BED file.


#### Liver


```R
awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Liver_clustered_cellspecific_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Liver_clustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt 

awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt

echo "Made continuous BED file."
```

    Made continuous BED file.


#### Developmental code 


```R
head ${INTER_DIR}Bcell_clusters_50NearGenes_TPMFiltered0.txt
```

    chr1	564470	570301	chr1	859110	862110	NM_152486.3	NM_152486	ENSG00000187634	+	0.02	288810
    chr1	564470	570301	chr1	893636	896636	NM_015658.4	NM_015658	ENSG00000188976	-	127.59	323336
    chr1	564470	570301	chr1	893963	896963	NM_198317.3	NM_198317	ENSG00000187961	+	1.17	323663
    chr1	564470	570301	chr1	899861	902861	NM_001160184.2	NM_001160184	ENSG00000187583	+	0.09	329561
    chr1	564470	570301	chr1	899861	902861	NM_001367552.1	NM_001367552	ENSG00000187583	+	0.09	329561
    chr1	564470	570301	chr1	899861	902861	NM_032129.3	NM_032129	ENSG00000187583	+	0.09	329561
    chr1	564470	570301	chr1	934477	937477	NM_001142467.2	NM_001142467	ENSG00000188290	-	0.08	364177
    chr1	564470	570301	chr1	934477	937477	NM_021170.4	NM_021170	ENSG00000188290	-	0.08	364177
    chr1	564470	570301	chr1	946876	949876	NM_005101.4	NM_005101	ENSG00000187608	+	212.52	376576
    chr1	564470	570301	chr1	953499	956499	NM_001305275.2	NM_001305275	ENSG00000188157	+	0.58	383199



```R
# Strategy: Create a new BED represting whole stretch between HMR and Prom
# Need to check, therfore, if HMR is up or downstream
awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Bcell_clusters_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Bcell_clusters_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt 
```


```R
awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Bcell_unclustered_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Bcell_unclustered_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt 
```


```R
awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Bcell_clustered_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Bcell_clustered_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt 
```


```R
awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt 
```


```R
awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt 
```

----------------LIVER-------------


```R
awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Liver_clusters_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Liver_clusters_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt 

awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Liver_unclustered_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Liver_unclustered_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt
```


```R
awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Liver_clustered_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Liver_clustered_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt 

awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Liver_clustered_cellspecific_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Liver_clustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt 

awk 'BEGIN{OFS=FS="\t"}{if ($2<$5)
print $1,$2,$6,$1,$2,$3,$4,$5,$6,$9,$11,$12;
else print $1,$5,$3,$1,$2,$3,$4,$5,$6,$9,$11,$12;
}' ${INTER_DIR}Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0.txt | awk 'BEGIN{OFS=FS="\t"}{if ($2!~/-1/) print}' - > ${INTER_DIR}Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt 


echo "Done."
```

    Done.


### Compare against TADs


```R
OUT_DIR=/data/hodges_lab/Tim/nnRNA_TPM/output_files/
mkdir -p ${OUT_DIR}
```

#### B cell


```R
bedtools intersect -v -a ${INTER_DIR}Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}GM12878_Lieberman-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt 

echo "Done."

bedtools intersect -v -a ${INTER_DIR}Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}GM12878_Lieberman-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt 

echo "Done."
```

    Done.
    Done.


#### Liver


```R
bedtools intersect -v -a ${INTER_DIR}Liver_clustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Liver_clustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt 

echo "Done."

bedtools intersect -v -a ${INTER_DIR}Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt 

echo "Done."
```

    Done.
    Done.


#### Developmental code


```R
OUT_DIR=/data/hodges_lab/Tim/nnRNA_TPM/output_files/
mkdir -p ${OUT_DIR}
```


```R
bedtools intersect -v -a ${INTER_DIR}Bcell_clusters_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}GM12878_Lieberman-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Bcell_clusters_50NearGenes_TPMFiltered0_TADFiltered.txt 

echo "Done."
```

    Done.



```R
bedtools intersect -v -a ${INTER_DIR}Bcell_unclustered_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}GM12878_Lieberman-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Bcell_unclustered_50NearGenes_TPMFiltered0_TADFiltered.txt 

echo "Done."
```

    Done.



```R
bedtools intersect -v -a ${INTER_DIR}Bcell_clustered_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}GM12878_Lieberman-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Bcell_clustered_50NearGenes_TPMFiltered0_TADFiltered.txt 

echo "Done."
```

    Done.



```R
bedtools intersect -v -a ${INTER_DIR}Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}GM12878_Lieberman-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt 

echo "Done."
```

    Done.



```R
bedtools intersect -v -a ${INTER_DIR}Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}GM12878_Lieberman-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt 

echo "Done."
```

    Done.



```R
cd $OUT_DIR
ls
head -n 3 *TADFiltered.txt
```

    Bcell_clusters_50NearGenes_TPMFiltered0_TADFiltered.txt
    Bcell_unclustered_50NearGenes_TPMFiltered0_TADFiltered.txt
    ==> Bcell_clusters_50NearGenes_TPMFiltered0_TADFiltered.txt <==
    chr1	832618	862110	chr1	832618	848467	chr1	859110	862110	ENSG00000187634	0.02	10644
    chr1	832618	896636	chr1	832618	848467	chr1	893636	896636	ENSG00000188976	127.59	45170
    chr1	832618	896963	chr1	832618	848467	chr1	893963	896963	ENSG00000187961	1.17	45497
    
    ==> Bcell_unclustered_50NearGenes_TPMFiltered0_TADFiltered.txt <==
    chr1	713671	862110	chr1	713671	715041	chr1	859110	862110	ENSG00000187634	0.02	144070
    chr1	713671	896636	chr1	713671	715041	chr1	893636	896636	ENSG00000188976	127.59	178596
    chr1	713671	896963	chr1	713671	715041	chr1	893963	896963	ENSG00000187961	1.17	178923


------------LIVER-------------


```R
OUT_DIR=/data/hodges_lab/Tim/nnRNA_TPM/output_files/
mkdir -p ${OUT_DIR}

# Initiliaze some directories
INTER_DIR=/data/hodges_lab/Tim/nnRNA_TPM/intermediate_files/
REF_DIR=/data/hodges_lab/Tim/nnRNA_TPM/reference_files/
OUT_DIR=/data/hodges_lab/Tim/nnRNA_TPM/output_files/
```


```R
# Prepare TAD file as a BED file of TAD ends
awk 'BEGIN{OFS=FS="\t"}{printf "%s\t%d\t%d\n%s\t%d\t%d\n", $1,$2,($2+1),$1,$3,($3+1)}' ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.txt > ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.tadBoundaryBED.txt
```


```R
# Check against TADs
bedtools intersect -v -a ${INTER_DIR}Liver_clusters_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Liver_clusters_50NearGenes_TPMFiltered0_TADFiltered.txt 

bedtools intersect -v -a ${INTER_DIR}Liver_unclustered_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Liver_unclustered_50NearGenes_TPMFiltered0_TADFiltered.txt 

echo "Done."
```

    Done.



```R
# Check against TADs
bedtools intersect -v -a ${INTER_DIR}Liver_clustered_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Liver_clustered_50NearGenes_TPMFiltered0_TADFiltered.txt 

bedtools intersect -v -a ${INTER_DIR}Liver_clustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Liver_clustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt 
Liver_clustered_50NearGenes_TPMFiltered0_TADFiltered.txt 

bedtools intersect -v -a ${INTER_DIR}Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0_ContinuousBEDFormat.txt -b ${REF_DIR}Liver_STL011_Leung2015-raw_TADs.tadBoundaryBED.txt > ${OUT_DIR}Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt 
Liver_clustered_50NearGenes_TPMFiltered0_TADFiltered.txt 

echo "Done."
```

    bash: Liver_clustered_50NearGenes_TPMFiltered0_TADFiltered.txt: command not found
    bash: Liver_clustered_50NearGenes_TPMFiltered0_TADFiltered.txt: command not found
    Done.



```R
cd $OUT_DIR
ls
head -n 3 *TADFiltered.txt
```

    Bcell_clustered_cellspecific_2NN_Exp0TADFiltered.txt
    Bcell_clusters_50NearGenes_TPMFiltered0_TADFiltered.txt
    Bcell_unclustered_50NearGenes_TPMFiltered0_TADFiltered.txt
    Bcell_unclustered_cellspecific_2NN_Exp0TADFiltered.txt
    Liver_clusters_50NearGenes_TPMFiltered0_TADFiltered.txt
    Liver_unclustered_50NearGenes_TPMFiltered0_TADFiltered.txt
    ==> Bcell_clustered_cellspecific_2NN_Exp0TADFiltered.txt <==
    ChrHMRProm	StartHMRProm	EndHMRProm	ChrHMR	StartHMR	EndHMR	ChrProm	StartProm	EndProm	ENSEMBL	TPM	HMRPromDist
    chr1	832618	862110	chr1	832618	848467	chr1	859110	862110	ENSG00000187634	0.02	10644
    chr1	832618	896636	chr1	832618	848467	chr1	893636	896636	ENSG00000188976	127.59	45170
    
    ==> Bcell_clusters_50NearGenes_TPMFiltered0_TADFiltered.txt <==
    chr1	832618	862110	chr1	832618	848467	chr1	859110	862110	ENSG00000187634	0.02	10644
    chr1	832618	896636	chr1	832618	848467	chr1	893636	896636	ENSG00000188976	127.59	45170
    chr1	832618	896963	chr1	832618	848467	chr1	893963	896963	ENSG00000187961	1.17	45497
    
    ==> Bcell_unclustered_50NearGenes_TPMFiltered0_TADFiltered.txt <==
    chr1	713671	862110	chr1	713671	715041	chr1	859110	862110	ENSG00000187634	0.02	144070
    chr1	713671	896636	chr1	713671	715041	chr1	893636	896636	ENSG00000188976	127.59	178596
    chr1	713671	896963	chr1	713671	715041	chr1	893963	896963	ENSG00000187961	1.17	178923
    
    ==> Bcell_unclustered_cellspecific_2NN_Exp0TADFiltered.txt <==
    ChrHMRProm	StartHMRProm	EndHMRProm	ChrHMR	StartHMR	EndHMR	ChrProm	StartProm	EndProm	ENSEMBL	TPM	HMRPromDist
    chr1	713671	862110	chr1	713671	715041	chr1	859110	862110	ENSG00000187634	0.02	144070
    chr1	713671	896636	chr1	713671	715041	chr1	893636	896636	ENSG00000188976	127.59	178596
    
    ==> Liver_clusters_50NearGenes_TPMFiltered0_TADFiltered.txt <==
    chr1	839737	896636	chr1	839737	856881	chr1	893636	896636	ENSG00000188976	73.33	36756
    chr1	839737	896963	chr1	839737	856881	chr1	893963	896963	ENSG00000187961	7.2	37083
    chr1	839737	902861	chr1	839737	856881	chr1	899861	902861	ENSG00000187583	0.07	42981
    
    ==> Liver_unclustered_50NearGenes_TPMFiltered0_TADFiltered.txt <==
    chr1	28511	368658	chr1	28511	30155	chr1	365658	368658	ENSG00000284733	0.02	335504
    chr1	28511	624034	chr1	28511	30155	chr1	621034	624034	ENSG00000284662	0.02	590880
    chr1	51441	368658	chr1	51441	51734	chr1	365658	368658	ENSG00000284733	0.02	313925


# R - Plot for 2 Nearest Neighbors

## Load libraries


```R
library(tidyverse)
library(ggplot2)
library(ggpubr)
```

    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.1 ──
    
    [32m✔[39m [34mggplot2[39m 3.3.6     [32m✔[39m [34mpurrr  [39m 1.0.1
    [32m✔[39m [34mtibble [39m 3.2.1     [32m✔[39m [34mdplyr  [39m 1.1.1
    [32m✔[39m [34mtidyr  [39m 1.3.0     [32m✔[39m [34mstringr[39m 1.5.0
    [32m✔[39m [34mreadr  [39m 2.1.2     [32m✔[39m [34mforcats[39m 0.5.1
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    


## Load in 50NN files (TAD and Expression filtered)


```R
# Set working directory 
setwd("/data/hodges_lab/Tim/nnRNA_TPM/output_files/")

print("Done.")
```

    [1] "Done."



```R
Bcell_clustered_cellspecific_50NN_TPMTADFilt <- read_tsv("./Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 

Bcell_unclustered_cellspecific_50NN_TPMTADFilt <- read_tsv("./Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 

print("Done.")
```

    [1mRows: [22m[34m45806[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m95931[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


    [1] "Done."



```R
Liver_clustered_cellspecific_50NN_TPMTADFilt <- read_tsv("./Liver_clustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 

Liver_unclustered_cellspecific_50NN_TPMTADFilt <- read_tsv("./Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 

print("Done.")
```

    [1mRows: [22m[34m51141[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m162933[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


    [1] "Done."


## Find 2NN


```R
Bcell_clustered_cellspecific_TPMTADFilt_2NN <- Bcell_clustered_cellspecific_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)

Bcell_unclustered_cellspecific_TPMTADFilt_2NN <- Bcell_unclustered_cellspecific_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)

write_tsv(Bcell_clustered_cellspecific_TPMTADFilt_2NN, "Bcell_clustered_cellspecific_2NN_Exp0TADFiltered.txt", col_names = T)
write_tsv(Bcell_unclustered_cellspecific_TPMTADFilt_2NN, "Bcell_unclustered_cellspecific_2NN_Exp0TADFiltered.txt", col_names = T)

print("Done.")
```

    [1] "Done."



```R
Liver_clustered_cellspecific_TPMTADFilt_2NN <- Liver_clustered_cellspecific_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)

Liver_unclustered_cellspecific_TPMTADFilt_2NN <- Liver_unclustered_cellspecific_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)

write_tsv(Liver_clustered_cellspecific_TPMTADFilt_2NN, "Liver_clustered_cellspecific_2NN_Exp0TADFiltered.txt", col_names = T)
write_tsv(Liver_unclustered_cellspecific_TPMTADFilt_2NN, "Liver_unclustered_cellspecific_2NN_Exp0TADFiltered.txt", col_names = T)

print("Done.")
```

    [1] "Done."


## Look at the stats


```R
mean(Bcell_clustered_cellspecific_TPMTADFilt_2NN$TPM)
mean(Bcell_unclustered_cellspecific_TPMTADFilt_2NN$TPM)

wilcox.test(Bcell_clustered_cellspecific_TPMTADFilt_2NN$TPM, Bcell_unclustered_cellspecific_TPMTADFilt_2NN$TPM)

```


66.1022280807472



48.3784621559633



    
    	Wilcoxon rank sum test with continuity correction
    
    data:  Bcell_clustered_cellspecific_TPMTADFilt_2NN$TPM and Bcell_unclustered_cellspecific_TPMTADFilt_2NN$TPM
    W = 66296090, p-value < 2.2e-16
    alternative hypothesis: true location shift is not equal to 0




```R

mean(Liver_clustered_cellspecific_TPMTADFilt_2NN$TPM)
mean(Liver_unclustered_cellspecific_TPMTADFilt_2NN$TPM)

wilcox.test(Liver_clustered_cellspecific_TPMTADFilt_2NN$TPM, Liver_unclustered_cellspecific_TPMTADFilt_2NN$TPM)
```


92.2679763975155



70.5857792860734



    
    	Wilcoxon rank sum test with continuity correction
    
    data:  Liver_clustered_cellspecific_TPMTADFilt_2NN$TPM and Liver_unclustered_cellspecific_TPMTADFilt_2NN$TPM
    W = 34136495, p-value = 9.213e-11
    alternative hypothesis: true location shift is not equal to 0



## Combine files to plot in same plot


```R
Bcell_CLCS_vs_UNCS_min0_2NN <- rbind((Bcell_clustered_cellspecific_TPMTADFilt_2NN %>% mutate(Celltype="Clustered_CS")),
                         (Bcell_unclustered_cellspecific_TPMTADFilt_2NN %>% mutate(Celltype="Unclustered_CS")))

```


```R
Liver_CLCS_vs_UNCS_min0_2NN <- rbind((Liver_clustered_cellspecific_TPMTADFilt_2NN %>% mutate(Celltype="Clustered_CS")),
                         (Liver_unclustered_cellspecific_TPMTADFilt_2NN %>% mutate(Celltype="Unclustered_CS")))

```

## Add binned distance 


```R
Bcell_CLCS_vs_UNCS_min0_distBinned_2NN <- Bcell_CLCS_vs_UNCS_min0_2NN %>% 
  mutate(distBin = case_when(
    HMRPromDist < 10000 ~ "0-10",
    HMRPromDist >= 10000 & HMRPromDist < 20000 ~ "10-20",
    HMRPromDist >= 20000 & HMRPromDist < 30000 ~ "20-30",
    HMRPromDist >= 30000 & HMRPromDist < 40000 ~ "30-30",
    HMRPromDist >= 40000 & HMRPromDist < 50000 ~ "40-50",
    HMRPromDist >= 50000 & HMRPromDist < 100000 ~ "50-100",
    HMRPromDist >= 100000 ~ ">100"
  ))

print("Added a distance bin categorical column.")
```

    [1] "Added a distance bin categorical column."



```R
write_tsv(Bcell_CLCS_vs_UNCS_min0_distBinned_2NN, "Bcell_CLCS_vs_UNCS_min0_distBinned_2NN.txt", col_names = T)
```


```R
Liver_CLCS_vs_UNCS_min0_distBinned_2NN <- Liver_CLCS_vs_UNCS_min0_2NN %>% 
  mutate(distBin = case_when(
    HMRPromDist < 10000 ~ "0-10",
    HMRPromDist >= 10000 & HMRPromDist < 20000 ~ "10-20",
    HMRPromDist >= 20000 & HMRPromDist < 30000 ~ "20-30",
    HMRPromDist >= 30000 & HMRPromDist < 40000 ~ "30-30",
    HMRPromDist >= 40000 & HMRPromDist < 50000 ~ "40-50",
    HMRPromDist >= 50000 & HMRPromDist < 100000 ~ "50-100",
    HMRPromDist >= 100000 ~ ">100"
  ))

print("Added a distance bin categorical column.")
```

    [1] "Added a distance bin categorical column."



```R
write_tsv(Liver_CLCS_vs_UNCS_min0_distBinned_2NN, "Liver_CLCS_vs_UNCS_min0_distBinned_2NN.txt", col_names = T)
```

## ggplot call

### Get n's for Bcell/Liver


```R
Bcell_CLCS_vs_UNCS_min0_distBinned_2NN %>% 
  group_by(Celltype) %>% 
  summarise(n = n())

Bcell_CLCS_vs_UNCS_min0_distBinned_2NN %>% 
  group_by(Celltype, distBin) %>% 
  summarise(n = n())
```


<table class="dataframe">
<caption>A tibble: 2 × 2</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Clustered_CS  </td><td> 6638</td></tr>
	<tr><td>Unclustered_CS</td><td>17440</td></tr>
</tbody>
</table>



    [1m[22m`summarise()` has grouped output by 'Celltype'. You can override using the
    `.groups` argument.



<table class="dataframe">
<caption>A grouped_df: 14 × 3</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>distBin</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Clustered_CS  </td><td>0-10  </td><td> 831</td></tr>
	<tr><td>Clustered_CS  </td><td>10-20 </td><td> 565</td></tr>
	<tr><td>Clustered_CS  </td><td>20-30 </td><td> 410</td></tr>
	<tr><td>Clustered_CS  </td><td>30-30 </td><td> 426</td></tr>
	<tr><td>Clustered_CS  </td><td>40-50 </td><td> 311</td></tr>
	<tr><td>Clustered_CS  </td><td>50-100</td><td> 995</td></tr>
	<tr><td><span style=white-space:pre-wrap>Clustered_CS  </span></td><td><span style=white-space:pre-wrap>&gt;100  </span></td><td>3100</td></tr>
	<tr><td>Unclustered_CS</td><td>0-10  </td><td>1044</td></tr>
	<tr><td>Unclustered_CS</td><td>10-20 </td><td>1419</td></tr>
	<tr><td>Unclustered_CS</td><td>20-30 </td><td>1205</td></tr>
	<tr><td>Unclustered_CS</td><td>30-30 </td><td>1007</td></tr>
	<tr><td>Unclustered_CS</td><td>40-50 </td><td> 850</td></tr>
	<tr><td>Unclustered_CS</td><td>50-100</td><td>3052</td></tr>
	<tr><td>Unclustered_CS</td><td><span style=white-space:pre-wrap>&gt;100  </span></td><td>8863</td></tr>
</tbody>
</table>




```R
Liver_CLCS_vs_UNCS_min0_distBinned_2NN %>% 
  group_by(Celltype) %>% 
  summarise(n = n())

Liver_CLCS_vs_UNCS_min0_distBinned_2NN %>% 
  group_by(Celltype, distBin) %>% 
  summarise(n = n())
```


<table class="dataframe">
<caption>A tibble: 2 × 2</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Clustered_CS  </td><td> 4025</td></tr>
	<tr><td>Unclustered_CS</td><td>15912</td></tr>
</tbody>
</table>



    [1m[22m`summarise()` has grouped output by 'Celltype'. You can override using the
    `.groups` argument.



<table class="dataframe">
<caption>A grouped_df: 14 × 3</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>distBin</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Clustered_CS  </td><td>0-10  </td><td> 401</td></tr>
	<tr><td>Clustered_CS  </td><td>10-20 </td><td> 364</td></tr>
	<tr><td>Clustered_CS  </td><td>20-30 </td><td> 329</td></tr>
	<tr><td>Clustered_CS  </td><td>30-30 </td><td> 290</td></tr>
	<tr><td>Clustered_CS  </td><td>40-50 </td><td> 220</td></tr>
	<tr><td>Clustered_CS  </td><td>50-100</td><td> 760</td></tr>
	<tr><td><span style=white-space:pre-wrap>Clustered_CS  </span></td><td><span style=white-space:pre-wrap>&gt;100  </span></td><td>1661</td></tr>
	<tr><td>Unclustered_CS</td><td>0-10  </td><td> 743</td></tr>
	<tr><td>Unclustered_CS</td><td>10-20 </td><td>1121</td></tr>
	<tr><td>Unclustered_CS</td><td>20-30 </td><td> 892</td></tr>
	<tr><td>Unclustered_CS</td><td>30-30 </td><td> 725</td></tr>
	<tr><td>Unclustered_CS</td><td>40-50 </td><td> 753</td></tr>
	<tr><td>Unclustered_CS</td><td>50-100</td><td>2506</td></tr>
	<tr><td>Unclustered_CS</td><td><span style=white-space:pre-wrap>&gt;100  </span></td><td>9172</td></tr>
</tbody>
</table>



### Order factors


```R
Bcell_CLCS_vs_UNCS_min0_distBinned_2NN$distBin <- factor(Bcell_CLCS_vs_UNCS_min0_distBinned_2NN$distBin, levels = c("0-10", "10-20", "20-30", "30-30", "40-50", "50-100", ">100"))
```


```R
Liver_CLCS_vs_UNCS_min0_distBinned_2NN$distBin <- factor(Liver_CLCS_vs_UNCS_min0_distBinned_2NN$distBin, levels = c("0-10", "10-20", "20-30", "30-30", "40-50", "50-100", ">100"))
```

### B cell - ALL 


```R
pdf("Bcell_clusteredCS_unclusteredCS_2NN.all.2reps.pdf")

B_all <- ggplot(Bcell_CLCS_vs_UNCS_min0_distBinned_2NN, aes(x=Celltype, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)
B_all

dev.off()


B_all
```


<strong>png:</strong> 2



![png](output_156_1.png)


### B cell - BINNED


```R
pdf("Bcell_clusteredCS_unclusteredCS_2NN.binned.spaced.2reps.pdf")

B_bin <- ggplot(Bcell_CLCS_vs_UNCS_min0_distBinned_2NN, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype), width = .5, position=position_dodge(.75)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25) +
  theme(aspect.ratio = .6)
B_bin

dev.off()


B_bin
```


<strong>png:</strong> 2



![png](output_158_1.png)


### Liver - ALL 


```R
pdf("Liver_clusteredCS_unclusteredCS_2NN.all.2reps.pdf")

L_all <- ggplot(Liver_CLCS_vs_UNCS_min0_distBinned_2NN, aes(x=Celltype, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)
L_all

dev.off()



L_all
```


<strong>png:</strong> 2



![png](output_160_1.png)


### Liver - BINNED


```R
pdf("Liver_clusteredCS_unclusteredCS_2NN.binned.spaced.2reps.pdf")

L_bin <- ggplot(Liver_CLCS_vs_UNCS_min0_distBinned_2NN, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype), width = .5, position=position_dodge(.75)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25) +
  theme(aspect.ratio = .6)
L_bin

dev.off()


L_bin
```


<strong>png:</strong> 2



![png](output_162_1.png)


# Developmental code for the R plot

## Load libraries


```R
library(tidyverse)
library(ggplot2)
library(ggpubr)
```

    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.1 ──
    
    [32m✔[39m [34mggplot2[39m 3.3.6     [32m✔[39m [34mpurrr  [39m 1.0.1
    [32m✔[39m [34mtibble [39m 3.2.1     [32m✔[39m [34mdplyr  [39m 1.1.1
    [32m✔[39m [34mtidyr  [39m 1.3.0     [32m✔[39m [34mstringr[39m 1.5.0
    [32m✔[39m [34mreadr  [39m 2.1.2     [32m✔[39m [34mforcats[39m 0.5.1
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    


## Load in output from 3.2.2.1 and 3.2.2.2


```R
# Set working directory 
setwd("/data/hodges_lab/Tim/nnRNA_TPM/output_files/")
```


```R
# Read in gene files: one with BED info, one with expression info
Bcell_clust_50NN_TPMTADFilt <- read_tsv("./Bcell_clusters_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 


Bcell_unclust_50NN_TPMTADFilt <- read_tsv("./Bcell_unclustered_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 




Bcell_clustered_50NN_TPMTADFilt <- read_tsv("./Bcell_clustered_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 

Bcell_clustered_cellspecific_50NN_TPMTADFilt <- read_tsv("./Bcell_clustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 

Bcell_unclustered_cellspecific_50NN_TPMTADFilt <- read_tsv("./Bcell_unclustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 

```

    [1mRows: [22m[34m27921[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m234187[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m111123[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m44229[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m92187[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



```R
head(Bcell_clust_50NN_TPMTADFilt)
head(Bcell_unclust_50NN_TPMTADFilt)

head(Bcell_clustered_cellspecific_50NN_TPMTADFilt)
head(Bcell_unclustered_cellspecific_50NN_TPMTADFilt)
```


<table class="dataframe">
<caption>A tibble: 6 × 12</caption>
<thead>
	<tr><th scope=col>ChrHMRProm</th><th scope=col>StartHMRProm</th><th scope=col>EndHMRProm</th><th scope=col>ChrHMR</th><th scope=col>StartHMR</th><th scope=col>EndHMR</th><th scope=col>ChrProm</th><th scope=col>StartProm</th><th scope=col>EndProm</th><th scope=col>ENSEMBL</th><th scope=col>TPM</th><th scope=col>HMRPromDist</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1</td><td>832618</td><td>862110</td><td>chr1</td><td>832618</td><td>848467</td><td>chr1</td><td>859110</td><td>862110</td><td>ENSG00000187634</td><td>  0.02</td><td>10644</td></tr>
	<tr><td>chr1</td><td>832618</td><td>896636</td><td>chr1</td><td>832618</td><td>848467</td><td>chr1</td><td>893636</td><td>896636</td><td>ENSG00000188976</td><td>127.59</td><td>45170</td></tr>
	<tr><td>chr1</td><td>832618</td><td>896963</td><td>chr1</td><td>832618</td><td>848467</td><td>chr1</td><td>893963</td><td>896963</td><td>ENSG00000187961</td><td>  1.17</td><td>45497</td></tr>
	<tr><td>chr1</td><td>832618</td><td>902861</td><td>chr1</td><td>832618</td><td>848467</td><td>chr1</td><td>899861</td><td>902861</td><td>ENSG00000187583</td><td>  0.09</td><td>51395</td></tr>
	<tr><td>chr1</td><td>832618</td><td>902861</td><td>chr1</td><td>832618</td><td>848467</td><td>chr1</td><td>899861</td><td>902861</td><td>ENSG00000187583</td><td>  0.09</td><td>51395</td></tr>
	<tr><td>chr1</td><td>832618</td><td>902861</td><td>chr1</td><td>832618</td><td>848467</td><td>chr1</td><td>899861</td><td>902861</td><td>ENSG00000187583</td><td>  0.09</td><td>51395</td></tr>
</tbody>
</table>




<table class="dataframe">
<caption>A tibble: 6 × 12</caption>
<thead>
	<tr><th scope=col>ChrHMRProm</th><th scope=col>StartHMRProm</th><th scope=col>EndHMRProm</th><th scope=col>ChrHMR</th><th scope=col>StartHMR</th><th scope=col>EndHMR</th><th scope=col>ChrProm</th><th scope=col>StartProm</th><th scope=col>EndProm</th><th scope=col>ENSEMBL</th><th scope=col>TPM</th><th scope=col>HMRPromDist</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1</td><td>713671</td><td>862110</td><td>chr1</td><td>713671</td><td>715041</td><td>chr1</td><td>859110</td><td>862110</td><td>ENSG00000187634</td><td>  0.02</td><td>144070</td></tr>
	<tr><td>chr1</td><td>713671</td><td>896636</td><td>chr1</td><td>713671</td><td>715041</td><td>chr1</td><td>893636</td><td>896636</td><td>ENSG00000188976</td><td>127.59</td><td>178596</td></tr>
	<tr><td>chr1</td><td>713671</td><td>896963</td><td>chr1</td><td>713671</td><td>715041</td><td>chr1</td><td>893963</td><td>896963</td><td>ENSG00000187961</td><td>  1.17</td><td>178923</td></tr>
	<tr><td>chr1</td><td>713671</td><td>902861</td><td>chr1</td><td>713671</td><td>715041</td><td>chr1</td><td>899861</td><td>902861</td><td>ENSG00000187583</td><td>  0.09</td><td>184821</td></tr>
	<tr><td>chr1</td><td>713671</td><td>902861</td><td>chr1</td><td>713671</td><td>715041</td><td>chr1</td><td>899861</td><td>902861</td><td>ENSG00000187583</td><td>  0.09</td><td>184821</td></tr>
	<tr><td>chr1</td><td>713671</td><td>902861</td><td>chr1</td><td>713671</td><td>715041</td><td>chr1</td><td>899861</td><td>902861</td><td>ENSG00000187583</td><td>  0.09</td><td>184821</td></tr>
</tbody>
</table>




<table class="dataframe">
<caption>A tibble: 6 × 12</caption>
<thead>
	<tr><th scope=col>ChrHMRProm</th><th scope=col>StartHMRProm</th><th scope=col>EndHMRProm</th><th scope=col>ChrHMR</th><th scope=col>StartHMR</th><th scope=col>EndHMR</th><th scope=col>ChrProm</th><th scope=col>StartProm</th><th scope=col>EndProm</th><th scope=col>ENSEMBL</th><th scope=col>TPM</th><th scope=col>HMRPromDist</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1</td><td>833785</td><td>862110</td><td>chr1</td><td>833785</td><td>834596</td><td>chr1</td><td>859110</td><td>862110</td><td>ENSG00000187634</td><td>  0.02</td><td>24515</td></tr>
	<tr><td>chr1</td><td>833785</td><td>896636</td><td>chr1</td><td>833785</td><td>834596</td><td>chr1</td><td>893636</td><td>896636</td><td>ENSG00000188976</td><td>127.59</td><td>59041</td></tr>
	<tr><td>chr1</td><td>833785</td><td>896963</td><td>chr1</td><td>833785</td><td>834596</td><td>chr1</td><td>893963</td><td>896963</td><td>ENSG00000187961</td><td>  1.17</td><td>59368</td></tr>
	<tr><td>chr1</td><td>833785</td><td>902861</td><td>chr1</td><td>833785</td><td>834596</td><td>chr1</td><td>899861</td><td>902861</td><td>ENSG00000187583</td><td>  0.09</td><td>65266</td></tr>
	<tr><td>chr1</td><td>833785</td><td>902861</td><td>chr1</td><td>833785</td><td>834596</td><td>chr1</td><td>899861</td><td>902861</td><td>ENSG00000187583</td><td>  0.09</td><td>65266</td></tr>
	<tr><td>chr1</td><td>833785</td><td>902861</td><td>chr1</td><td>833785</td><td>834596</td><td>chr1</td><td>899861</td><td>902861</td><td>ENSG00000187583</td><td>  0.09</td><td>65266</td></tr>
</tbody>
</table>




<table class="dataframe">
<caption>A tibble: 6 × 12</caption>
<thead>
	<tr><th scope=col>ChrHMRProm</th><th scope=col>StartHMRProm</th><th scope=col>EndHMRProm</th><th scope=col>ChrHMR</th><th scope=col>StartHMR</th><th scope=col>EndHMR</th><th scope=col>ChrProm</th><th scope=col>StartProm</th><th scope=col>EndProm</th><th scope=col>ENSEMBL</th><th scope=col>TPM</th><th scope=col>HMRPromDist</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>chr1</td><td>1927749</td><td>1982849</td><td>chr1</td><td>1927749</td><td>1927982</td><td>chr1</td><td>1979849</td><td>1982849</td><td>ENSG00000067606</td><td>0.28</td><td>51868</td></tr>
	<tr><td>chr1</td><td>1927749</td><td>2005900</td><td>chr1</td><td>1927749</td><td>1927982</td><td>chr1</td><td>2002900</td><td>2005900</td><td>ENSG00000067606</td><td>0.28</td><td>74919</td></tr>
	<tr><td>chr1</td><td>1927749</td><td>2005900</td><td>chr1</td><td>1927749</td><td>1927982</td><td>chr1</td><td>2002900</td><td>2005900</td><td>ENSG00000067606</td><td>0.28</td><td>74919</td></tr>
	<tr><td>chr1</td><td>1927749</td><td>2005900</td><td>chr1</td><td>1927749</td><td>1927982</td><td>chr1</td><td>2002900</td><td>2005900</td><td>ENSG00000067606</td><td>0.28</td><td>74919</td></tr>
	<tr><td>chr1</td><td>1927749</td><td>2005900</td><td>chr1</td><td>1927749</td><td>1927982</td><td>chr1</td><td>2002900</td><td>2005900</td><td>ENSG00000067606</td><td>0.28</td><td>74919</td></tr>
	<tr><td>chr1</td><td>1927749</td><td>2006424</td><td>chr1</td><td>1927749</td><td>1927982</td><td>chr1</td><td>2003424</td><td>2006424</td><td>ENSG00000067606</td><td>0.28</td><td>75443</td></tr>
</tbody>
</table>



-------------LIVER--------------


```R
# Set working directory 
setwd("/data/hodges_lab/Tim/nnRNA_TPM/output_files/")
```


```R
# Read in gene files: one with BED info, one with expression info
Liver_clust_50NN_TPMTADFilt <- read_tsv("./Liver_clusters_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 


Liver_unclust_50NN_TPMTADFilt <- read_tsv("./Liver_unclustered_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 
```

    [1mRows: [22m[34m56634[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m576127[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.



```R
# Read in gene files: one with BED info, one with expression info
Liver_clustered_50NN_TPMTADFilt <- read_tsv("./Liver_clustered_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 


Liver_clustered_cellspecific_50NN_TPMTADFilt <- read_tsv("./Liver_clustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 

Liver_unclustered_cellspecific_50NN_TPMTADFilt <- read_tsv("./Liver_unclustered_cellspecific_50NearGenes_TPMFiltered0_TADFiltered.txt", col_names=F) %>% magrittr::set_colnames(c("ChrHMRProm","StartHMRProm","EndHMRProm","ChrHMR","StartHMR","EndHMR","ChrProm","StartProm","EndProm","ENSEMBL","TPM","HMRPromDist")) 
```

    [1mRows: [22m[34m229108[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m50555[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.
    [1mRows: [22m[34m160261[39m [1mColumns: [22m[34m12[39m
    [36m──[39m [1mColumn specification[22m [36m────────────────────────────────────────────────────────[39m
    [1mDelimiter:[22m "\t"
    [31mchr[39m (4): X1, X4, X7, X10
    [32mdbl[39m (8): X2, X3, X5, X6, X8, X9, X11, X12
    
    [36mℹ[39m Use `spec()` to retrieve the full column specification for this data.
    [36mℹ[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.


## Find two nearest neighbors per HMR cluster or unclustered HMR


```R
######## 2NN - 2 nearest neighbors 
Bcell_clust_TPMTADFilt_2NN <- Bcell_clust_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)

Bcell_unclust_TPMTADFilt_2NN <- Bcell_unclust_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)
```


```R
Bcell_clustered_cellspecific_TPMTADFilt_2NN <- Bcell_clustered_cellspecific_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)

Bcell_unclustered_cellspecific_TPMTADFilt_2NN <- Bcell_unclustered_cellspecific_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)
```


```R
# Write output for future reference
write_tsv(Bcell_clust_TPMTADFilt_2NN, "Bcell_clusters_2NN_Exp0TADFiltered.txt", col_names = T)
write_tsv(Bcell_unclust_TPMTADFilt_2NN, "Bcell_unclustered_2NN_Exp0TADFiltered.txt", col_names = T)

write_tsv(Bcell_clustered_cellspecific_TPMTADFilt_2NN, "Bcell_clustered_cellspecific_2NN_Exp0TADFiltered.txt", col_names = T)
write_tsv(Bcell_unclustered_cellspecific_TPMTADFilt_2NN, "Bcell_unclustered_cellspecific_2NN_Exp0TADFiltered.txt", col_names = T)
```

---------------LIVER------------


```R
######## 2NN - 2 nearest neighbors 
Liver_clust_TPMTADFilt_2NN <- Liver_clust_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)

Liver_unclust_TPMTADFilt_2NN <- Liver_unclust_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)
```


```R
# Write output for future reference
write_tsv(Liver_clust_TPMTADFilt_2NN, "Liver_clustered_2NN_Exp0TADFiltered.txt", col_names = T)
write_tsv(Liver_unclust_TPMTADFilt_2NN, "Liver_unclustered_2NN_Exp0TADFiltered.txt", col_names = T)
```


```R
######## 2NN - 2 nearest neighbors 
Liver_clustered_TPMTADFilt_2NN <- Liver_clustered_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)

Liver_clustered_cellspecific_TPMTADFilt_2NN <- Liver_clustered_cellspecific_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)

Liver_unclustered_cellspecific_TPMTADFilt_2NN <- Liver_unclustered_cellspecific_50NN_TPMTADFilt %>%
  group_by(ChrHMR, StartHMR, EndHMR, ENSEMBL) %>%
  slice_min(order_by=HMRPromDist, n=1) %>%
  group_by(ChrHMR, StartHMR, EndHMR) %>%
  slice_min(order_by=HMRPromDist, n=2)
```


```R
# Write output for future reference
write_tsv(Liver_clustered_TPMTADFilt_2NN, "Liver_clustered_2NN_Exp0TADFiltered.txt", col_names = T)
write_tsv(Liver_clustered_cellspecific_TPMTADFilt_2NN, "Liver_clustered_cellspecific_2NN_Exp0TADFiltered.txt", col_names = T)
write_tsv(Liver_unclustered_cellspecific_TPMTADFilt_2NN, "Liver_unclustered_cellspecific_2NN_Exp0TADFiltered.txt", col_names = T)
```

## Look at the stats


```R
mean(Bcell_clust_TPMTADFilt_2NN$TPM)
mean(Bcell_unclust_TPMTADFilt_2NN$TPM)
```


65.1722368742369



47.607903195924



```R
wilcox.test(Bcell_clust_TPMTADFilt_2NN$TPM, Bcell_unclust_TPMTADFilt_2NN$TPM)

```


    
    	Wilcoxon rank sum test with continuity correction
    
    data:  Bcell_clust_TPMTADFilt_2NN$TPM and Bcell_unclust_TPMTADFilt_2NN$TPM
    W = 93936176, p-value = 3.585e-11
    alternative hypothesis: true location shift is not equal to 0




```R
mean(Bcell_clustered_cellspecific_TPMTADFilt_2NN$TPM)
mean(Bcell_unclustered_cellspecific_TPMTADFilt_2NN$TPM)

wilcox.test(Bcell_clustered_cellspecific_TPMTADFilt_2NN$TPM, Bcell_unclustered_cellspecific_TPMTADFilt_2NN$TPM)
```


70.8630795262267



51.9743299149283



    
    	Wilcoxon rank sum test with continuity correction
    
    data:  Bcell_clustered_cellspecific_TPMTADFilt_2NN$TPM and Bcell_unclustered_cellspecific_TPMTADFilt_2NN$TPM
    W = 64245362, p-value < 2.2e-16
    alternative hypothesis: true location shift is not equal to 0



------------LIVER-----------


```R

mean(Liver_clustered_cellspecific_TPMTADFilt_2NN$TPM)
mean(Liver_unclustered_cellspecific_TPMTADFilt_2NN$TPM)

wilcox.test(Liver_clustered_cellspecific_TPMTADFilt_2NN$TPM, Liver_unclustered_cellspecific_TPMTADFilt_2NN$TPM)
```


99.977



72.3511745827985



    
    	Wilcoxon rank sum test with continuity correction
    
    data:  Liver_clustered_cellspecific_TPMTADFilt_2NN$TPM and Liver_unclustered_cellspecific_TPMTADFilt_2NN$TPM
    W = 32721542, p-value = 3.391e-06
    alternative hypothesis: true location shift is not equal to 0




```R
mean(Liver_clust_TPMTADFilt_2NN$TPM)
mean(Liver_unclust_TPMTADFilt_2NN$TPM)

wilcox.test(Liver_clust_TPMTADFilt_2NN$TPM, Liver_unclust_TPMTADFilt_2NN$TPM)
```


68.7212024182714



63.7140564266784



    
    	Wilcoxon rank sum test with continuity correction
    
    data:  Liver_clust_TPMTADFilt_2NN$TPM and Liver_unclust_TPMTADFilt_2NN$TPM
    W = 119602290, p-value = 0.1126
    alternative hypothesis: true location shift is not equal to 0




```R
mean(Liver_clustered_TPMTADFilt_2NN$TPM)
mean(Liver_clustered_cellspecific_TPMTADFilt_2NN$TPM)

wilcox.test(Liver_clustered_TPMTADFilt_2NN$TPM, Liver_unclust_TPMTADFilt_2NN$TPM)
wilcox.test(Liver_clustered_cellspecific_TPMTADFilt_2NN$TPM, Liver_unclust_TPMTADFilt_2NN$TPM)
```


63.4323448551221



99.977



    
    	Wilcoxon rank sum test with continuity correction
    
    data:  Liver_clustered_TPMTADFilt_2NN$TPM and Liver_unclust_TPMTADFilt_2NN$TPM
    W = 465345024, p-value = 4.425e-06
    alternative hypothesis: true location shift is not equal to 0




    
    	Wilcoxon rank sum test with continuity correction
    
    data:  Liver_clustered_cellspecific_TPMTADFilt_2NN$TPM and Liver_unclust_TPMTADFilt_2NN$TPM
    W = 114779532, p-value = 1.429e-08
    alternative hypothesis: true location shift is not equal to 0



## Plot

### Combine


```R
both_min0_2NN <- rbind((Bcell_clust_TPMTADFilt_2NN %>% mutate(Celltype="Clustered")),
                         (Bcell_unclust_TPMTADFilt_2NN %>% mutate(Celltype="Unclustered")))
```


```R
CLCS_vs_UNCS_min0_2NN <- rbind((Bcell_clustered_cellspecific_TPMTADFilt_2NN %>% mutate(Celltype="Clustered_CS")),
                         (Bcell_unclustered_cellspecific_TPMTADFilt_2NN %>% mutate(Celltype="Unclustered_CS")))

```

---------------LIVER------------


```R
Liver_CLCS_vs_UNCS_min0_2NN <- rbind((Liver_clustered_cellspecific_TPMTADFilt_2NN %>% mutate(Celltype="Clustered_CS")),
                         (Liver_unclustered_cellspecific_TPMTADFilt_2NN %>% mutate(Celltype="Unclustered_CS")))

```


```R
clusters_vs_un_min0_2NN_Liver <- rbind((Liver_clust_TPMTADFilt_2NN %>% mutate(Celltype="Clusters")),
                         (Liver_unclust_TPMTADFilt_2NN %>% mutate(Celltype="Unclustered")))

clustered_vs_un_min0_2NN_Liver <- rbind((Liver_clustered_TPMTADFilt_2NN %>% mutate(Celltype="Clustered")),
                         (Liver_unclust_TPMTADFilt_2NN %>% mutate(Celltype="Unclustered")))

clustered_cs_vs_un_min0_2NN_Liver <- rbind((Liver_clustered_cellspecific_TPMTADFilt_2NN %>% mutate(Celltype="Clustered_cellspecific")),
                         (Liver_unclust_TPMTADFilt_2NN %>% mutate(Celltype="Unclustered")))
```


```R

```

### Add a categorical value for HMR-TSS distance


```R
both_min0_distBinned_2NN <- both_min0_2NN %>% 
  mutate(distBin = case_when(
    HMRPromDist < 10000 ~ "0-10",
    HMRPromDist >= 10000 & HMRPromDist < 20000 ~ "10-20",
    HMRPromDist >= 20000 & HMRPromDist < 30000 ~ "20-30",
    HMRPromDist >= 30000 & HMRPromDist < 40000 ~ "30-30",
    HMRPromDist >= 40000 & HMRPromDist < 50000 ~ "40-50",
    HMRPromDist >= 50000 & HMRPromDist < 100000 ~ "50-100",
    HMRPromDist >= 100000 ~ ">100"
  ))

print("Added a distance bin categorical column.")
```


```R
CLCS_vs_UNCS_min0_distBinned_2NN <- CLCS_vs_UNCS_min0_2NN %>% 
  mutate(distBin = case_when(
    HMRPromDist < 10000 ~ "0-10",
    HMRPromDist >= 10000 & HMRPromDist < 20000 ~ "10-20",
    HMRPromDist >= 20000 & HMRPromDist < 30000 ~ "20-30",
    HMRPromDist >= 30000 & HMRPromDist < 40000 ~ "30-30",
    HMRPromDist >= 40000 & HMRPromDist < 50000 ~ "40-50",
    HMRPromDist >= 50000 & HMRPromDist < 100000 ~ "50-100",
    HMRPromDist >= 100000 ~ ">100"
  ))

print("Added a distance bin categorical column.")
```

    [1] "Added a distance bin categorical column."


---------------LIVER------------


```R
Liver_CLCS_vs_UNCS_min0_distBinned_2NN <- Liver_CLCS_vs_UNCS_min0_2NN %>% 
  mutate(distBin = case_when(
    HMRPromDist < 10000 ~ "0-10",
    HMRPromDist >= 10000 & HMRPromDist < 20000 ~ "10-20",
    HMRPromDist >= 20000 & HMRPromDist < 30000 ~ "20-30",
    HMRPromDist >= 30000 & HMRPromDist < 40000 ~ "30-30",
    HMRPromDist >= 40000 & HMRPromDist < 50000 ~ "40-50",
    HMRPromDist >= 50000 & HMRPromDist < 100000 ~ "50-100",
    HMRPromDist >= 100000 ~ ">100"
  ))

print("Added a distance bin categorical column.")
```

    [1] "Added a distance bin categorical column."



```R
both_min0_distBinned_2NN_Liver_clusters_vs_un <- clusters_vs_un_min0_2NN_Liver %>% 
  mutate(distBin = case_when(
    HMRPromDist < 10000 ~ "0-10",
    HMRPromDist >= 10000 & HMRPromDist < 20000 ~ "10-20",
    HMRPromDist >= 20000 & HMRPromDist < 30000 ~ "20-30",
    HMRPromDist >= 30000 & HMRPromDist < 40000 ~ "30-30",
    HMRPromDist >= 40000 & HMRPromDist < 50000 ~ "40-50",
    HMRPromDist >= 50000 & HMRPromDist < 100000 ~ "50-100",
    HMRPromDist >= 100000 ~ ">100"
  ))

print("Added a distance bin categorical column.")
```

    [1] "Added a distance bin categorical column."



```R
both_min0_distBinned_2NN_Liver_clustered_vs_un <- clustered_vs_un_min0_2NN_Liver %>% 
  mutate(distBin = case_when(
    HMRPromDist < 10000 ~ "0-10",
    HMRPromDist >= 10000 & HMRPromDist < 20000 ~ "10-20",
    HMRPromDist >= 20000 & HMRPromDist < 30000 ~ "20-30",
    HMRPromDist >= 30000 & HMRPromDist < 40000 ~ "30-30",
    HMRPromDist >= 40000 & HMRPromDist < 50000 ~ "40-50",
    HMRPromDist >= 50000 & HMRPromDist < 100000 ~ "50-100",
    HMRPromDist >= 100000 ~ ">100"
  ))

print("Added a distance bin categorical column.")
```

    [1] "Added a distance bin categorical column."



```R
both_min0_distBinned_2NN_Liver_clustered_cs_vs_un <- clustered_cs_vs_un_min0_2NN_Liver %>% 
  mutate(distBin = case_when(
    HMRPromDist < 10000 ~ "0-10",
    HMRPromDist >= 10000 & HMRPromDist < 20000 ~ "10-20",
    HMRPromDist >= 20000 & HMRPromDist < 30000 ~ "20-30",
    HMRPromDist >= 30000 & HMRPromDist < 40000 ~ "30-30",
    HMRPromDist >= 40000 & HMRPromDist < 50000 ~ "40-50",
    HMRPromDist >= 50000 & HMRPromDist < 100000 ~ "50-100",
    HMRPromDist >= 100000 ~ ">100"
  ))

print("Added a distance bin categorical column.")
```

    [1] "Added a distance bin categorical column."


### ggplot2 call 

#### Get N's for B cell and Liver


```R
CLCS_vs_UNCS_min0_distBinned_2NN %>% 
  group_by(Celltype) %>% 
  summarise(n = n())

CLCS_vs_UNCS_min0_distBinned_2NN %>% 
  group_by(Celltype, distBin) %>% 
  summarise(n = n())
```


<table class="dataframe">
<caption>A tibble: 2 × 2</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Clustered_CS  </td><td> 6501</td></tr>
	<tr><td>Unclustered_CS</td><td>17162</td></tr>
</tbody>
</table>



    [1m[22m`summarise()` has grouped output by 'Celltype'. You can override using the
    `.groups` argument.



<table class="dataframe">
<caption>A grouped_df: 14 × 3</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>distBin</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Clustered_CS  </td><td>0-10  </td><td> 722</td></tr>
	<tr><td>Clustered_CS  </td><td>10-20 </td><td> 556</td></tr>
	<tr><td>Clustered_CS  </td><td>20-30 </td><td> 397</td></tr>
	<tr><td>Clustered_CS  </td><td>30-30 </td><td> 428</td></tr>
	<tr><td>Clustered_CS  </td><td>40-50 </td><td> 297</td></tr>
	<tr><td>Clustered_CS  </td><td>50-100</td><td>1028</td></tr>
	<tr><td><span style=white-space:pre-wrap>Clustered_CS  </span></td><td><span style=white-space:pre-wrap>&gt;100  </span></td><td>3073</td></tr>
	<tr><td>Unclustered_CS</td><td>0-10  </td><td>1002</td></tr>
	<tr><td>Unclustered_CS</td><td>10-20 </td><td>1382</td></tr>
	<tr><td>Unclustered_CS</td><td>20-30 </td><td>1142</td></tr>
	<tr><td>Unclustered_CS</td><td>30-30 </td><td> 979</td></tr>
	<tr><td>Unclustered_CS</td><td>40-50 </td><td> 823</td></tr>
	<tr><td>Unclustered_CS</td><td>50-100</td><td>3015</td></tr>
	<tr><td>Unclustered_CS</td><td><span style=white-space:pre-wrap>&gt;100  </span></td><td>8819</td></tr>
</tbody>
</table>




```R
Liver_CLCS_vs_UNCS_min0_distBinned_2NN %>% 
  group_by(Celltype) %>% 
  summarise(n = n())

Liver_CLCS_vs_UNCS_min0_distBinned_2NN %>% 
  group_by(Celltype, distBin) %>% 
  summarise(n = n())
```


<table class="dataframe">
<caption>A tibble: 2 × 2</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Clustered_CS  </td><td> 4010</td></tr>
	<tr><td>Unclustered_CS</td><td>15580</td></tr>
</tbody>
</table>



    [1m[22m`summarise()` has grouped output by 'Celltype'. You can override using the
    `.groups` argument.



<table class="dataframe">
<caption>A grouped_df: 14 × 3</caption>
<thead>
	<tr><th scope=col>Celltype</th><th scope=col>distBin</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Clustered_CS  </td><td>0-10  </td><td> 390</td></tr>
	<tr><td>Clustered_CS  </td><td>10-20 </td><td> 358</td></tr>
	<tr><td>Clustered_CS  </td><td>20-30 </td><td> 324</td></tr>
	<tr><td>Clustered_CS  </td><td>30-30 </td><td> 280</td></tr>
	<tr><td>Clustered_CS  </td><td>40-50 </td><td> 220</td></tr>
	<tr><td>Clustered_CS  </td><td>50-100</td><td> 705</td></tr>
	<tr><td><span style=white-space:pre-wrap>Clustered_CS  </span></td><td><span style=white-space:pre-wrap>&gt;100  </span></td><td>1733</td></tr>
	<tr><td>Unclustered_CS</td><td>0-10  </td><td> 684</td></tr>
	<tr><td>Unclustered_CS</td><td>10-20 </td><td>1086</td></tr>
	<tr><td>Unclustered_CS</td><td>20-30 </td><td> 840</td></tr>
	<tr><td>Unclustered_CS</td><td>30-30 </td><td> 689</td></tr>
	<tr><td>Unclustered_CS</td><td>40-50 </td><td> 719</td></tr>
	<tr><td>Unclustered_CS</td><td>50-100</td><td>2387</td></tr>
	<tr><td>Unclustered_CS</td><td><span style=white-space:pre-wrap>&gt;100  </span></td><td>9175</td></tr>
</tbody>
</table>



#### B cell ALL 


```R
pdf("Bcell_clusteredCS_unclusteredCS_2NN.all.pdf")

ggplot(CLCS_vs_UNCS_min0_distBinned_2NN, aes(x=Celltype, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)

dev.off()
```


<strong>png:</strong> 2


#### B cell Distance Binned


```R
pdf("Bcell_clusteredCS_unclusteredCS_2NN.binned.spaced.pdf")

ggplot(CLCS_vs_UNCS_min0_distBinned_2NN, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype), width = .5, position=position_dodge(.75)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25) +
  theme(aspect.ratio = .6)

dev.off()
```


<strong>png:</strong> 2



```R
pdf("Bcell_clusteredCS_unclusteredCS_2NN.binned.pdf")

ggplot(CLCS_vs_UNCS_min0_distBinned_2NN, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25) +
  theme(aspect.ratio = .6)

dev.off()
```


<strong>png:</strong> 2


#### Liver ALL 


```R
pdf("Liver_clusteredCS_unclusteredCS_2NN.all.pdf")

ggplot(Liver_CLCS_vs_UNCS_min0_distBinned_2NN, aes(x=Celltype, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)

dev.off()
```


<strong>png:</strong> 2


#### Liver Distance Binned


```R
pdf("Liver_clusteredCS_unclusteredCS_2NN.binned.spaced.pdf")

ggplot(Liver_CLCS_vs_UNCS_min0_distBinned_2NN, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype), width = .5, position=position_dodge(.75)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25) +
  theme(aspect.ratio = .6)

dev.off()
```


<strong>png:</strong> 2



```R
pdf("Liver_clusteredCS_unclusteredCS_2NN.binned.pdf")

ggplot(Liver_CLCS_vs_UNCS_min0_distBinned_2NN, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25) +
  theme(aspect.ratio = .6)

dev.off()
```


<strong>png:</strong> 2



```R
getwd()
```


'/gpfs52/data/hodges_lab/Tim/nnRNA_TPM/output_files'


#### bin


```R
ggplot(both_min0_distBinned_2NN, aes(x=Celltype, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)
```


![png](output_223_0.png)



```R
ggplot(both_min0_distBinned_2NN, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)
```


![png](output_224_0.png)


--------------LIVER-----------


```R
ggplot(both_min0_distBinned_2NN_Liver_clusters_vs_un, aes(x=Celltype, y=log10(TPM+1))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)
```


![png](output_226_0.png)



```R
ggplot(both_min0_distBinned_2NN_Liver_clusters_vs_un, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)
```


![png](output_227_0.png)


CLUSTERED INDIVIDUAL VS UNCLUSTERED


```R
ggplot(both_min0_distBinned_2NN_Liver_clustered_vs_un, aes(x=Celltype, y=log10(TPM+1))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)

ggplot(both_min0_distBinned_2NN_Liver_clustered_vs_un, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)
```


![png](output_229_0.png)



![png](output_229_1.png)


CLUSTERED INDIVIDUAL CELL SPECIFIC VS UNCLUSTERED


```R
ggplot(both_min0_distBinned_2NN_Liver_clustered_cs_vs_un, aes(x=Celltype, y=log10(TPM+1))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25)

ggplot(both_min0_distBinned_2NN_Liver_clustered_cs_vs_un, aes(x=distBin, y=log10(TPM))) +
  geom_boxplot(aes(fill=Celltype)) +
  theme_classic() +
  ggtitle("Binned by Distance") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) +
  xlab("HMR to Gene Distance") +
  ylab("log10(DESeq2 Normalized Count)") +
  stat_compare_means(aes(group=Celltype), 
                     method="wilcox.test",  
                     method.args = list(alternative = "two.sided"),
                     label="p",
                     label.y=6.25) +
    theme(aspect.ratio = .55)
```


![png](output_231_0.png)



![png](output_231_1.png)

