source("http://zzlab.net/GAPIT/GAPIT.library.R")
source("http://zzlab.net/GAPIT/gapit_functions.txt")

setwd(PATH_TO_DIR_WITH_DATA_FILES)
myY <- read.table("pheno_data.tsv", head=TRUE)
myG <- read.csv("YeastDataHapmap.hmp.txt", sep='\t', head=FALSE)

# Generate statistical distributions of phenotypes
myPhenotype<-GAPIT.Phenotype.View(
myY=myY
)

# Run GWAS with a Mixed Linear Model (MLM)
myGAPIT <- GAPIT(
Y=myY,
G=myG,
PCA.total=3,
model="MLM"
)