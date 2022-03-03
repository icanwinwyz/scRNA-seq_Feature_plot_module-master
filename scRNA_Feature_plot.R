library(Seurat)

##Rscript raw_expression.csv proejct.csv gene_list.csv name


args=commandArgs(TRUE)
raw_expr_matrix<-args[1] ####first input file is the raw count expression matrix
project<-args[2]  ####second input file is the projection(coordination) from CellRanger output
gene_list<-args[3] ###gene list for feature plot
name<-args[4] ### file prefix

data<-read.csv(raw_expr_matrix,header=T,row.names=1,check.names=F) 
project<-read.csv(project,row.names = 1,header = T,check.names = F)
gene<-read.csv(gene_list,header=T)
gene<-as.vector(gene[,1])
colnames(data)<-sub("\\.","-",colnames(data))


pbmc <- CreateSeuratObject(counts = data, project = "feature", min.cells = 0, min.features = 0)
pbmc <- NormalizeData(pbmc, normalization.method = "LogNormalize", scale.factor = 10000)
pbmc <- FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = 2000)
all.genes <- rownames(pbmc)
pbmc <- ScaleData(pbmc, features = all.genes)




if (grepl("\\d+",colnames(pbmc)[1]) == TRUE){
  project<-as.matrix(project)
  if (grepl("UMAP",colnames(project)[1]) == TRUE){
    pbmc[["umap"]] <- CreateDimReducObject(embeddings = project, key = "UMAP_", assay = DefaultAssay(pbmc))
    pdf(paste(name,"_feature_plot.pdf",sep=""),16,16)
    print(FeaturePlot(pbmc,features=gene,dims=c(1,2),reduction="umap"))
    dev.off()
  }else if (grepl("SNE",colnames(project)[1]) == TRUE){
    pbmc[["tsne"]] <- CreateDimReducObject(embeddings = project, key = "tSNE_", assay = DefaultAssay(pbmc))
    pdf(paste(name,"_feature_plot.pdf",sep=""),16,16)
    print(FeaturePlot(pbmc,features=gene,dims=c(1,2),reduction="tsne"))
    dev.off()
  }
}else{
    rownames(project)<-gsub("-\\d+","",rownames(project))
    project<-as.matrix(project)
    if (grepl("UMAP",colnames(project)[1]) == TRUE){
      pbmc[["umap"]] <- CreateDimReducObject(embeddings = project, key = "UMAP_", assay = DefaultAssay(pbmc))
      pdf(paste(name,"_feature_plot.pdf",sep=""),16,16)
      print(FeaturePlot(pbmc,features=gene,dims=c(1,2),reduction="umap"))
      dev.off()
    }else if (grepl("SNE",colnames(project)[1]) == TRUE){
      pbmc[["tsne"]] <- CreateDimReducObject(embeddings = project, key = "tSNE_", assay = DefaultAssay(pbmc))
      pdf(paste(name,"_feature_plot.pdf",sep=""),16,16)
      print(FeaturePlot(pbmc,features=gene,dims=c(1,2),reduction="tsne"))
      dev.off()
    }
}
