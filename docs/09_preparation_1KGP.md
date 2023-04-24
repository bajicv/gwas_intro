# Preparing 1KGP dataset for merge with HapMap

Here is description on how `1kgp.bed`, `1kgp.bim`, and `1kgp.fam` plink files were created. We will not reproduce these commands due to time constrans, but the curious ones can take a look here to see how 1KGP plink files were prepared.

Assumption is that you have access to the "raw" 1KGP (described bellow how to download) and HapMap files (`hapmap_0` plink files present `exercise/data` directory i.e. before any QC was performed on them). By using these files we can maximize the number of overlapping SNPs between two datasets, which can be useful for constructing PCA or MDS. The 1KGP plink files that we use in tutorial (`1kgp` plink files preset in `exercise/data`) contain only SNPs found in HapMap plink files, and non-overlapping individuals between 1KGP and HapMap (81 individuals out of 629 from 1KGP present in HapMap were removed).

----

## Download 1KGP data

To download the __1000 Genomes Project (1KGP)__ `vcf` file containing 629 individuals from different populations one can use the ftp link from an official [International Genome Sample Resource (IGSR) webpage](https://www.internationalgenome.org/). The 1KGP vcf file is quite large (>60 gigabyte), and for the sake of the time and memory we will not run those command. Commands presented here are only for the reference on how the files we are using were created. 
    
    cd ~/gwas_exercises/data
    
    wget ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/release/20100804/ALL.2of4intersection.20100804.genotypes.vcf.gz

    cd ~/gwas_exercises

SNP calls based on 628 individuals from the 2010-08-04 sequence and alignment release of the 1000 Genomes Project is based on the __GRCh37__ assembly of the human genome, and are released in the format VCF 4.0 ([IGSR November 2010 Data Release](https://www.internationalgenome.org/announcements/november-2010-data-release-2010-11-09/)).

Once the data is downloaded (e.g. in `gwas_exercises/data` directory), we can prepare a list of SNPs present in HapMap plink files (i.e. `hapmap_0.bim`)

    awk '{print $2}' data/hapmap_0.bim > out/hapmap_0.SNPs

And then we can extract SNPs present in unfilltered HapMap dataset from 1KGP.
    
    plink --bfile data/ALL.2of4intersection.20100804.genotypes --extract out/hapmap_0.SNPs --make-bed --out out/1kgp_0


----

## Change 1KGP build

The datasets must have the same __build__. We can change the 1KGP build to match HapMap.
- HapMap: __NCBI build 36__ / __UCSC hg18__
- 1KGP: __GRCh37__ / __UCSC hg19__

[The dbSNP Reference SNP (rs or RefSNP)](https://www.ncbi.nlm.nih.gov/snp/docs/RefSNP_about/) do not depend on a reference genome. They point to a specified locus regardless of the differences in genomic assemblies. So we will just change the location of the SNPs based on their rsID.

Update chromosome and physical position of SNPs on the chromosome in 1KGP

    awk '{print $2, $1}' data/hapmap_0.bim > out/hapmap_0.snp_chr
    awk '{print $2, $4}' data/hapmap_0.bim > out/hapmap_0.snp_map
    plink --bfile out/1kgp_0 --update-chr out/hapmap_0.snp_chr --update-map out/hapmap_0.snp_map --make-bed --out out/1kgp_1

Use `plink2` to sort variants

    plink2 --bfile out/1kgp_1 --sort-vars --make-pgen --out out/1kgp_2tmp
    plink2 --pfile out/1kgp_2tmp --make-bed --out out/1kgp_2
    rm out/1kgp_2tmp*

Set reference genome of 1kgp to match HapMap

    awk '{print $2, $5}' data/hapmap_0.bim > out/hapmap_0.ref_list
    plink --bfile out/1kgp_2 --reference-allele out/hapmap_0.ref_list --make-bed --out out/1kgp_3

Check for potential strand issues and resolve them

    awk '{print $2, $5, $6}' out/1kgp_3.bim > out/1kgp_3.snp_strands
    awk '{print $2, $5, $6}' data/hapmap_0.bim > out/hapmap_0.snp_strands
    sort out/1kgp_3.snp_strands out/hapmap_0.snp_strands | uniq -u > out/all_differences.txt

Flip SNPs for resolving strand issues
    
    awk '{print $1}' out/all_differences.txt | sort -u > out/flip_list.txt
    plink --bfile out/1kgp_3 --flip out/flip_list.txt --reference-allele out/hapmap_0.ref_list --make-bed --out out/1kgp_4

Check for SNPs which are still problematic after they have been flipped

    awk '{print $2 , $5, $6}' out/1kgp_4.bim > out/1kgp_4.snp_strans
    sort out/1kgp_4.snp_strans out/hapmap_0.snp_strands | uniq -u  > out/uncorresponding_SNPs.txt

Remove problematic SNPs from 1KGP

    awk '{print $1}' out/uncorresponding_SNPs.txt | sort -u > out/SNPs_for_exlusion.txt
    plink --bfile out/1kgp_4 --exclude out/SNPs_for_exlusion.txt --make-bed --out out/1kgp_5


## Update sex

File `data/igsr_samples.tsv` containing metadata for 1KGP samples was downloaded from https://www.internationalgenome.org/data-portal/sample

    awk '{print $2}' out/1kgp_5.fam > out/1kgp_5.ind

    grep -f out/1kgp_5.ind data/igsr_samples.tsv | awk 'FS="\t" {print $1, $1, $2, $4, $6}' > out/1kgp_5.metadata 

    sed -i 's/female/2/g' out/1kgp_5.metadata 
    sed -i 's/male/1/g' out/1kgp_5.metadata 

    plink --bfile out/1kgp_5 --update-sex out/1kgp_5.metadata 1 --make-bed --out out/1kgp_6


## Remove HapMap individuals from 1KGP

    awk '{print $2, $2}' data/hapmap_0.fam > out/hapmap_0.ind

    plink --bfile out/1kgp_6 --remove out/hapmap_0.ind --make-bed --out out/1kgp_7


## Update IDs 

We will use FID to indicate continental population of individual.

    awk 'FS=" " {print $1, $2, $5, $2}' out/1kgp_5.metadata > out/update_IDs
    
    plink --bfile out/1kgp_7 --update-ids out/update_IDs --make-bed --out data/1kgp

The output file of this command can be found in `exercises/data`, and we will use `1kgp` plink files as a starting point for our tutorials.

----