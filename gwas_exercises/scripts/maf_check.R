# load packages ####
library(tidyverse)

# read data into R ####
maf_freq <- read_table(file = "hapmap_3.frq",
                col_types = "ffffdd")


# plot histograms ####
maf_freq_p <- ggplot(maf_freq, aes(x = MAF)) +
                geom_histogram(position = "identity")

# save plots as png files  ####
ggsave("../plots/hist_maf.png", maf_freq_p,
    dpi = 300, width = 20, height = 10,
    units = "cm", device = "png")