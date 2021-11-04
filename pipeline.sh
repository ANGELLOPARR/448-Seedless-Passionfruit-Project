#!/bin/bash

# Data from the study
vcf_file="Dataset1_Complete_MS.vcf"
pheno_file="pheno_data.tsv"
tassel="./tassel-5-standalone/run_pipeline.pl"

echo "Converting spreadsheets from research into tab-delimited files for GAPIT\n"
python3 data_cleanup.py

echo "Please make sure you have Tassel installed to convert VCF --> Hapmap"
echo "Converting SNP VCF file to Hapmap format\n"
$tassel -Xms64G -Xmx64G -vcf $vcf_file -export yeast_data -exportType Hapmap


