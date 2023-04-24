# load packages ####
library(tidyverse)

# read data into R ####
sexcheck <- read_table(file = "hapmap_1.sexcheck",
                col_types = "fffffd")

# plot histograms ####
sexcheck_p <- ggplot(sexcheck, aes(x = F, fill = PEDSEX)) +
                geom_histogram(position = "identity") +
                facet_wrap(~PEDSEX,
                    labeller = as_labeller(c(`2` = "Female", 
                                             `1` = "Male", 
                                             `0` = "Unknown")))

# save plots as png files ####
ggsave("../plots/sex_check.png", sexcheck_p,
    dpi = 300, width = 20, height = 10,
    units = "cm", device = "png")