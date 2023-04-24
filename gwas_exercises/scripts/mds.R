# load packages ####
suppressMessages(library(tidyverse))

# read data into R ####
mds <- suppressWarnings(read_table(file = "merge_mds_qc_pruned.mds", col_types = "fffdddddddddd"))


# mds plot ####
mds_p <- ggplot(mds, aes(x = C1, y = C2, col = FID, shape = FID)) +
                    geom_point(alpha = 0.5) +
                    coord_fixed(ratio = 1) +
                    theme_bw()

# save plots as png file ####
ggsave("../plots/mds_plot.png", mds_p,
    dpi = 300, width = 20, height = 20,
    units = "cm", device = "png")
