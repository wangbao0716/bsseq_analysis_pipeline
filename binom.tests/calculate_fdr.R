
args <- commandArgs(trailingOnly = TRUE)
meth_file <- args[1]
suffix <- args[2]

dat <- read.table(meth_file, header=F, sep="\t")
dat$fdr <- p.adjust(dat$V8, "fdr")

write.table(dat, file = paste(c(suffix, "fdr.tsv"), collapse = "."), row.names=F, col.names=F, quote=F, sep = "\t")

dat <- dat[dat$fdr <= 0.01, ]
write.table(dat, file = paste(c(suffix, "fdr.meth.tsv"), collapse = "."), row.names=F, col.names=F, quote=F, sep = "\t")


