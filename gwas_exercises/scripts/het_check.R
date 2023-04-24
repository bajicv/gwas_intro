# load packages
library(tidyverse)

# read data into R
het <- read_table(file = "hapmap_6.het", col_types = "ffdddd")

# calculate mean and sd of F
F_mean <- mean(het$F)
F_3SD <- 3 * sd(het$F)

# plot histograms
F_hist_p <- ggplot(het, aes(x = F,
                fill = ifelse(
                        F > F_mean + F_3SD |
                        F < F_mean - F_3SD, 
                        "Outside 3SD",
                        "Within 3SD"))) +
        geom_histogram(binwidth = 0.001) +
        geom_vline(xintercept = F_mean, col = "black", linetype = "dashed", alpha = 0.5) +
        geom_vline(xintercept = F_mean + F_3SD, col = "red", linetype = "dashed", alpha = 0.5) +
        geom_vline(xintercept = F_mean - F_3SD, col = "red", linetype = "dashed", alpha = 0.5) +
        labs(title = "Heterozygosity Histogram") +
        labs(fill = "Data")

# save plots as png files
ggsave("../plots/hist_F.png", F_hist_p,
    dpi = 300, width = 20, height = 10,
    units = "cm", device = "png")

# find individuals that are outside 3SD and write them in a table
het %>% 
        filter(F < (F_mean - F_3SD) | F > (F_mean + F_3SD)) %>% 
        select(FID, IID) %>% 
        write_delim("hapmap_6.het_fail_ind", quote = "none")