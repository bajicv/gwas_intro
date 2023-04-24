# load packages ####
library(tidyverse)
library(ggpubr)

# read data into R ####
hwe <- read_table(file = "hapmap_4.hwe", col_types = "fffffcddd")

# plot histograms of p-values ####
hwe_p <- ggplot(hwe, aes(x = P, fill = TEST)) +
            geom_histogram(binwidth = 0.01, position = "stack") +
            labs(title = "HWE Histogram") +
            geom_vline(xintercept = 10e-6,
                color = "red", linetype = "dashed") +
            theme(legend.position = "none")

hwe_p_zoom <- hwe  %>%
                filter(P < 10e-6) %>%
                ggplot(aes(x = P, fill = TEST)) +
                    geom_histogram(position = "stack") +
                    geom_vline(xintercept = 10e-6,
                        color = "red", linetype = "dashed") +
                    labs(title = "HWE Histogram for P < 0.00001")

# scatter plot of observed vs expected heterozygosity ####
hwe_sp_p <- ggplot(hwe, aes(x = `O(HET)`, y = `E(HET)`, col = P)) +
                    geom_point() +
                    geom_abline(intercept = 0, slope = 1) +
                    coord_fixed(ratio = 1) +
                    scale_color_gradientn(
                        colors = c("white", "blue", "yellow", "red"),
                        values = scales::rescale(c(1, 0.5, 10e-6, 0))) +
                    facet_wrap(~TEST)

# arrange all plots into single ####
all_p <- ggarrange(hwe_sp_p,
            ggarrange(hwe_p, hwe_p_zoom, ncol = 2),
            nrow = 2)


# save plots as png file ####
ggsave("../plots/hwe_plots.png", all_p,
    dpi = 300, width = 20, height = 20,
    units = "cm", device = "png")