# imports
import pandas as pd
import numpy as np

def main():
    
    phenotype_file = 'pgen.1007217.s010.xlsx'

    with pd.ExcelFile(phenotype_file) as xlsx:
        yeast_info = pd.read_excel(xlsx, "Column Information")
        yeast_pheno_data = pd.read_excel(xlsx, "DATA")
        
    pheno_data = yeast_pheno_data.drop(columns=['Niche', 'Location'])
    pheno_data = pheno_data.iloc[:,:5]
    cleaned_columns = [col.replace(' ', '_') for col in pheno_data.columns]
    pheno_data.columns = cleaned_columns
    
    pheno_data.to_csv("pheno_data.tsv", sep='\t')
    
if __name__ == '__main__':
    main()