# Objective

Summarizes the results of Kaivan's MACS2 package (https://github.com/kxk302/MACS2) in a combination beeswarm/barplot graph. The geometric mean intersect ratio for each replicate is represented by a individual point ("bee") and the average intersect ratio for replicates is represented by a bar. Plots are faceted by windowsize.  

# Usage

```{console}
Rscript intersect_ratio_beebar.R intersect_summaries.tsv random_intersect_summaries.tsv Test.svg
```
Note that you can specify other file formats by specifying a different extension to argument 3, "test.png" for example.

# Instructions

## 1.) Generate a compatible R environment

### In an existing R environment:

```{r}
install.packages("tidyverse", "ggbeeswarm", "svglite")
```

### Using conda or mamba

```{console}
mamba env create --name beebar --file=intersect_ratio_beebar.yaml
mamba activate beebar
```

## 2.) Add a column in the "intersect_summaries.tsv" file with the header "MnO4.mM" and the MnO4 concentration in each sample.

## Run

```{console}
Rscript intersect_ratio_beebar.R Test_intersect_summaries.tsv Test_random_intersect_summaries.tsv Test.svg
```
