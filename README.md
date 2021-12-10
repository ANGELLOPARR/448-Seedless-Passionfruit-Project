### Welcome from Team Seedless Passionfruit :)

This repository will walk you through running a GWAS pipeline on genomic data for yeast samples.

## Downloading the data
Because of GitHub's big data limit, we can't upload files > 100 MB. Thus, you'll have to get these data files locally on your own... but we will guide you through that!

1. Navigate to [this research paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5849340/), which is what our project is based on.

2. Under "Supplementary Materials" in the "Associated Data" section near the top, scroll all the way down to **S1 Table** and download the linked spreadsheet. Alternatively, [this download link](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5849340/bin/pgen.1007217.s010.xlsx) should also work. This is the phenotype data for our yeast samples.

3. To get the Gzipped VCF file for SNPs, head over to [EBI accession #: ERZ486690](https://www.ebi.ac.uk/ena/browser/view/ERZ486690), click on the check box next to `Dataset1_Complete_MS.vcf.gz` and then click `Download selected files`
    * After this is done and you have it locally, you should decompress it (it's gzipped) with the command `gzip -d Dataset1_Complete_MS.vcf.gz` to get just the VCF.

## Setting up the data
There's a few steps to do before we can run the GWAS pipeline.

1. Clean the phenotype data and remove extraneous data / columns.

2. Output the cleaned phenotype file (no spaces in column names) to a *tab-delimited* .tsv file.

3. Convert our VCF file of data to a Hapmap file for use in the GWA algorithm.
    * This requires Tassle to be downloaded. Please download tassle and keep the `tassel-5-standalone` directory with the Tassel executable in its folder in this directory. You might need to change the name of this file in the script `pipeline.sh`

This is actually all taken care of by running the script `./pipeline.sh` (assuming the .vcf file `Dataset1_Complete_MS.vcf`, the phenotype file `pgen.1007217.s010.xlsx`, and the Tassle directory `tassel-5-standalone` are all within the current directory).

## Running the GWA algorithm

Once this is done, download and open RStudio. Copy and paste the R script `gwas.R` into RStudio but be careful when copying the `setwd(...)` line, as this should be specific to your machine and should be where you're keeping all of this data. Make sure it's an absolute path.

If you were successful, you should be running a GWA algorithm using a Mixed Linear Model! :) It should take about 15-20 minutes to fully execute.

After this, you can run `.cleanup.sh`, which will essentially just move all of the `GAPIT....` files that were created to a new directory called `gapit_output`.

Explore the plots, charts, and output spreadsheets as wanted! :)