# load packages ####
library(tidyverse)
library(ggpubr)

# read data into R ####
genome <- read_table(file = "hapmap_7.genome", col_types = "fffffddddddddd")

# plot histogram and scatter plot of Z0 and Z1 ####
genome_hist_p <- ggplot(genome, aes(x = PI_HAT, fill = RT)) +
        geom_histogram(binwidth = 0.01) +
        geom_vline(xintercept = 0.2, col = "red", linetype = "dashed", alpha = 0.5)

sp_Z0Z1_p <- ggplot(genome, aes(x = Z0, y = Z1, col = RT)) +
    geom_point(alpha = 0.5) +
    theme(legend.position = "none")

# arrange all plots into single ####
all_p <- ggarrange(sp_Z0Z1_p, genome_hist_p, ncol = 2)

# save plots as png file ####
ggsave("../plots/genome_plots.png", all_p,
    dpi = 300, width = 20, height = 10,
    units = "cm", device = "png")