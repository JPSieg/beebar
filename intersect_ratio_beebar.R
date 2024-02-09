#JPSieg 02/08/24

args <- commandArgs(trailingOnly = TRUE)

library(tidyverse)
library(ggbeeswarm)

df.data = read_delim(args[1])
df.random = read_delim(args[2])

#Makes the MnO4 concentration a discrete variable{
df.data$MnO4.mM = as.character(df.data$MnO4.mM)
df.random$MnO4.mM = "Random" 
#}

df.all = bind_rows(df.data, df.random)

P = ggplot(df.all, aes(x = MnO4.mM, y = Harmonic_Mean, label = Sample_Name)) +
    geom_bar(position = "dodge",
           stat = "summary",
           fun = "mean") +
    geom_beeswarm(size = 1) +
    theme_classic() +
    facet_wrap(~Window_Size, nrow = 1) +
    xlab("[MnO4] (mM)") +
    ylab("Intersect ratio (harmonic mean)") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(args[3], P)

print("Done")

