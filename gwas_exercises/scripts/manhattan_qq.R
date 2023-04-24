# load packages ####
library("qqman")

# read data into R ####
results_log <- read.table("logistic_results.assoc_2.logistic", head = TRUE)
results_as <- read.table("assoc_results.assoc", head = TRUE)

# plot Manhattan: logistic ####
png("../plots/manhattan_logistic.png")
manhattan(results_log, chr = "CHR", bp = "BP", p = "P", snp = "SNP", main = "Manhattan plot: logistic", annotatePval = 0.001)
dev.off()

# plot Manhattan: assoc ####
png("../plots/manhattan_assoc.png")
manhattan(results_as, chr = "CHR", bp = "BP", p = "P", snp = "SNP", main = "Manhattan plot: assoc", annotatePval = 0.001)
dev.off()

# plot Manhattan: assoc for CHR 8 ####
png("../plots/manhattan_assoc_CHR8.png")
manhattan(subset(results_as, CHR == 8), chr = "CHR", bp = "BP", p = "P", snp = "SNP", main = "Manhattan plot: assoc | chr 8", annotatePval = 0.001)
dev.off()

# plot QQ-plot: logistic ####
png("../plots/qq_plot_logistic.png")
qq(results_log$P, main = "Q-Q plot of GWAS p-values : log")
dev.off()

# plot QQ-plot: assoc ####
png("../plots/qq_plot_assoc.png")
qq(results_as$P, main = "Q-Q plot of GWAS p-values : log")
dev.off()