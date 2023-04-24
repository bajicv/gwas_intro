# load packages ####
suppressMessages(library(tidyverse))

# read data into R ####
mds <- suppressWarnings(read_table(file = "hapmap_gwa.mds", col_types = "fffdddddddddd"))


# mds plot ####
mds_p <- ggplot(mds, aes(x = C1, y = C2, col = FID, shape=FID)) +
                    geom_point() +
                    coord_fixed(ratio = 1) +
                    theme_bw() +
                    scale_shape_manual(values = rep(0:17, 10)) + 
                    scale_color_manual(values = rep(c("#1f78b4", "#33a02c", "#e31a1c", "#ff7f00", "#6a3d9a", "#b15928"), 10, each = 5))


# save plots as png file ####
ggsave("../plots/mds_EUR_plot.png", mds_p,
    dpi = 300, width = 20, height = 20,
    units = "cm", device = "png")










