# Software 

For QC and statistical analyses will use [plink 1.9](https://www.cog-genomics.org/plink/1.9/), and for the data visualization we will use `R`.

----

## Plink

We will be working with `plink`, a free, open-source whole-genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner. Even though the focus of `plink` is  on analysis of genotype/phenotype data, it is widely used in popgen as it has many features for data manipulation, it offers basic statistics, and many popgen tools assume input files to be in plink format (e.g. `fastStructure`, `ADMIXTURE`, etc.). `Plink` parses each command line as a collection of flags (each of which starts with two dashes `--`), plus parameters (which immediately follow a flag).

### Plink file formats

`plink` can either read 
<br />1. __text-format files__ (`.ped` + `.map`) or 
<br />2. __binary files__ (`.bed` + `.bim` + `.fam`). 

Because reading large text files can be time-consuming, it is recommended to use binary files. 

![plink data formats (Marees et al. 2017)](https://www.researchgate.net/publication/323424714/figure/fig3/AS:667766705098757@1536219397189/Overview-of-various-commonly-used-PLINK-files-SNP-single-nucleotide-polymorphism_W640.jpg){width=80%}


#### Text-format plink files

Text `plink` data consist of two files (which should have matching names and they should be stored together): 
<br />1. `.ped` contains information on the __individuals and their genotypes__; 
<br />2. `.map` contains information on the __genetic markers__.

#### Binary plink files

Binary `plink` data consist of three files (one binary and two text files which should have matching names and which should be stored together):
<br />1. `.bed`  contains individual identifiers (IDs) and genotypes, 
<br />2. `.fam` contain information on the individuals, 
<br />3. `.bim` contains information on the genetic markers. 

Analysis using __covariates__ often requires the fourth file, containing the values of these covariates for each individual.

----

## R

The focus of this tutorial is on GWAS and thus we are paying less importance to steps involving data visualization in `R`. This is why R scripts are ready to be used from command line. However, we encourage you to take a look at each of them and try to understand what is inside. Most of the `R` scripts are written in `tidyverse` syntax and in order to run them you will need to install several R packages. 

### Required R packages

- `tidyverse`
- `ggpubr`
- `qqman`

----

