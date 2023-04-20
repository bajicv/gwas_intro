# Background

## GWAS

## Dataset

This tutorial is based on the freely available __HapMap__ data: `hapmap3_r3_b36_fwd.consensus.qc` that can be obtained from https://ftp.ncbi.nlm.nih.gov/hapmap/genotypes/hapmap3_r3/plink_format/. 

Alleles are expressed in the forward (+) strand of the reference human genome (__NCBI build 36__ or __UCSC hg18__). 

__Simulated binary outcome measure__ (i.e., a binary phenotypic trait) was added this to the dataset. The outcome measure was only simulated for the founders in the HapMap data. We referre to this data set as `hapmap`. 

For simplicity reasons in this tutorial we focus on a __binary outcome measure__, and thus this tutorial is not ideal if you are working with __quantitative outcome measures__.

Most GWAS studies are performed on genetically homogenous population, in which population outliers are removed. The HapMap data, used in this tutorial, contains multiple distinct populations, which makes it problematic for analysis.

In order to ensure that our population is relatively homogenous we included only the __EUR individuals__ from the HapMap project in the `hapmap`. 

The R scripts used in this tutorial could be executed from the command line.

This means that you can complet this tutorial by simply copy-pasting commands.


# Software

## plink

## R

The focus of this tutorial is on GWAS and thus we are paying attention to steps performed in `plink` and less importance to steps involving data visualization in R. This is why R scripts are already ready to be used from command line, but we encourage you to take a look at each of them and try to understand what is inside. Most of R scripts are written in `tidyverse` syntax and in order to run them you will need to install several R packages 

### Required R packages

`tidyverse`
`ggpubr`
`qqman`
`PRSice` (https://choishingwan.github.io/PRSice/)

## Downloading tutorials and exercises

Download tutorials and exercises in your home directory, and then change your current working directory to `gwas_intro/exercises` from which you should run all of the commands for this tutorial. 

    cd ~
    wget #######
    cd gwas_intro/exercises