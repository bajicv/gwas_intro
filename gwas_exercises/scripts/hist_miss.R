# load packages ####
library(tidyverse)
library(ggpubr)

# read data into R ####
imiss <- read_table(file = "hapmap.imiss", col_types = "fffddd")
lmiss <- read_table(file = "hapmap.lmiss", col_types = "ffddd")

# plot histograms ####
imiss_p <- ggplot(imiss, aes(x = F_MISS)) +
            geom_histogram() +
            labs(title = "Histogram sample-based missingness")

lmiss_p <- ggplot(lmiss, aes(x = F_MISS)) +
            geom_histogram() +
            labs(title = "Histogram variant-based missingness")

# arrange all plots into single plot ####
all_p <- ggarrange(imiss_p, lmiss_p, ncol = 2)

# save plots as png files ####
ggsave("../plots/hist_miss.png", all_p,
    dpi = 300, width = 20, height = 10,
    units = "cm", device = "png")