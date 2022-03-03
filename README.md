# scRNA-seq Feature plot Module
This is one of the modules for 10X scRNA-seq data analysis pipeline - scRNA-seq Feature plot Module


### Input
* library required: Seurat,filesstrings
* Raw expression count matrix
* Projection (coordinates from CellRanger analysis or coordinates from the third party tools, e.g. Seurat)
* gene_list for plotting
* name for file profix

### Demo data:
* demo_expression_feature_plot.csv - raw expression count matrix
* demo_projection.csv - coordinates file
* demo_gene_list.csv
* demo_feature_plot.pdf

Please follow the format of "demo_projection.csv" and "demo_gene_list.csv" to generate the corresponding files

### Usage(on titan): 
```r
source activate my_python_3_7

Rscript scRNA_Feature_plot.R demo_expression_feature_plot.csv demo_projection.csv demo_gene_list.csv test
```

### Outputs:
* Feature plot for provided genes list

###Notes:
* it is better to put only 4 or 6 genes in on feature plot. (maybe add this function in future)

```r
> sessionInfo()
R version 3.6.2 (2019-12-12)
Platform: x86_64-conda_cos6-linux-gnu (64-bit)
Running under: Ubuntu 18.04.2 LTS

Matrix products: default
BLAS/LAPACK: /home/genomics/anaconda3/envs/my_python_3_7/lib/libopenblasp-r0.3.7.so

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C
 [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8
 [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8
 [7] LC_PAPER=en_US.UTF-8       LC_NAME=C
 [9] LC_ADDRESS=C               LC_TELEPHONE=C
[11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base

loaded via a namespace (and not attached):
[1] compiler_3.6.2
```


