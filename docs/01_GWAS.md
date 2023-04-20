# GWAS

Genome-wide association studies (GWAS) test hundreds of thousands of genetic variants across many genomes to find those statistically associated with a specific trait or disease. This methodology has generated a myriad of robust associations for a range of traits and diseases, and the number of associated variants is expected to grow steadily as GWAS sample sizes increase. GWAS results have a range of applications, such as gaining insight into a phenotype’s underlying biology, estimating its heritability, calculating genetic correlations, making clinical risk predictions, informing drug development programmes and inferring potential causal relationships between risk factors and health outcomes.

![gwas](https://media.springernature.com/lw685/springer-static/image/art%3A10.1038%2Fs43586-021-00056-9/MediaObjects/43586_2021_56_Fig1_HTML.png?as=webp)

__a)__  Data can be collected from study cohorts or available genetic and phenotypic information can be used from biobanks or repositories. Confounders need to be carefully considered and recruitment strategies must not introduce biases such as [collider bias](https://en.wikipedia.org/wiki/Collider_(statistics)). 

__b)__  Genotypic data can be collected using __microarrays__ to capture common variants, or next-generation sequencing methods for whole-genome sequencing (__WGS__) or whole-exome sequencing (__WES__). 

__c)__ Quality control (__QC__) includes steps at the wet-laboratory stage, such as genotype calling and DNA switches, and dry-laboratory stages on called genotypes, such as deletion of bad single-nucleotide polymorphisms (__SNPs__) and individuals, detection of population strata in the sample and principle component analysis (__PCA__). Figure depicts clustering of individuals according to genetic substrata. 

__d)__ Genotypic data can be phased, and untyped genotypes imputed using information from matched reference populations from repositories such as [1000 Genomes Project](https://www.internationalgenome.org/1000-genomes-summary) or [TopMed](https://topmed.nhlbi.nih.gov/). In this example, genotypes of SNP1 and SNP3 are imputed based on the directly assayed genotypes of other SNPs. 

__e)__ Genetic association tests are run for each genetic variant, using an appropriate model (for example, additive, non-additive, linear or logistic regression). Confounders are corrected for, including population strata, and multiple testing needs to be controlled. Output is inspected for unusual patterns and summary statistics are generated. 

__f)__ Results from multiple smaller cohorts are combined using standardized statistical pipelines. 

__g)__ Results can be replicated using internal replication or external replication in an independent cohort. For external replication, the independent cohort must be ancestrally matched and not share individuals or family members with the discovery cohort. 

__h)__ In silico analysis of genome-wide association studies (GWAS), using information from external resources. This can include in silico fine-mapping, SNP to gene mapping, gene to function mapping, pathway analysis, genetic correlation analysis, [Mendelian randomization](https://www.cdc.gov/genomics/events/precision_med_pop.htm#:~:text=Mendelian%20randomization%20is%20a%20method,on%20disease%20in%20observational%20studies.) and [polygenic risk prediction](https://en.wikipedia.org/wiki/Polygenic_score#:~:text=In%20a%20polygenic%20risk%20predictor,nucleotide%20polymorphisms%2C%20or%20SNPs). After GWAS, functional hypotheses can be tested using experimental techniques such as [CRISPR](https://en.wikipedia.org/wiki/CRISPR) or massively parallel reporter assays, or results can be validated in a human trait/disease model.

----

