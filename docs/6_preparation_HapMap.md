# Preparing HapMap dataset for tutorial

----

## Download 1KGP data

Download HapMap.

    cd ~/gwas_intro/exercises/
    
    mkdir prep_hapmap

    cd prep_hapmap

    wget https://ftp.ncbi.nlm.nih.gov/hapmap/genotypes/hapmap3_r3/plink_format/hapmap3_r3_b36_fwd.consensus.qc.poly.map.gz
    
    wget https://ftp.ncbi.nlm.nih.gov/hapmap/genotypes/hapmap3_r3/plink_format/hapmap3_r3_b36_fwd.consensus.qc.poly.ped.gz
    
    gzip -d *gz
    
    wget https://ftp.ncbi.nlm.nih.gov/hapmap/genotypes/hapmap3_r3/relationships_w_pops_041510.txt
    

Make binary plink files.

    plink --file hapmap3_r3_b36_fwd.consensus.qc.poly --make-bed --out hapmap3_r3


----

## Adding outlier individuals to European individuals

Make list of (randomply chosen) FID individuals to keep as outliers.

    echo "Y057" > keep_outliers_FID
    echo "Y058" >> keep_outliers_FID
    echo "Y059" >> keep_outliers_FID


Extract outlier individuals from original HapMap dataset.

    plink --bfile hapmap3_r3 --keep <(grep -f keep_outliers_FID hapmap3_r3.fam) --make-bed --out keep_outliers


Merge outlier individuals with European HapMap data (from Marees 2018 tutorial - this file is not presenti in repository) and save them in `data` directory.

    plink --bfile HapMap_3_r3_1 --bmerge keep_outliers --make-bed --out hapmap

----