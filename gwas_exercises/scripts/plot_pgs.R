# load packages ####
library(tidyverse)

# read data into R ####
prs <- read_table(file = "pgs_1kgp.profile",
                col_types = "fffddd")

# plot histograms ####
prs_p <- ggplot(prs, aes(x = reorder(FID, SCORESUM), y = SCORESUM, fill = FID)) +
                geom_boxplot() +
                theme(legend.position = "none") +
                xlab("Continental population")

# save plots as pdf files ####
ggsave("../plots/pgs_plot.png", prs_p,
    dpi = 300, width = 20, height = 10,
    units = "cm", device = "png")
