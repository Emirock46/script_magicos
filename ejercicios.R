if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
#sacarowito
BiocManager::install("ggmsa")
#clase 30/9/24
globinas<-readAAStringSet("01_Rawdata/DivergentGlobins.fasta")
globinas
alineamiento1<-msa(globinas)
alineamiento1
install.packages("dplyr")
library(dplyr)
#ARCHIVO ANOTACION DE ECOLI
archivo_anotacion<-read.csv("01_Rawdata/proteins_167_161521.csv")
archivo_anotacion
#bases divididas
locus_mas<- subset(archivo_anotacion,Strand %in% c("+"), select = c(Strand))
locus_mas
locus_menos<-subset(archivo_anotacion,Strand %in% c("-"), select = c(Strand))
locus_menos
#Boxplot
pdf

#de roberto
archivo_anotacion[which(archivo_anotacion$Strand=="+"),c("Strand","Locus")]->positivos
positivos
archivo_anotacion[which(archivo_anotacion$Strand=="-"),c("Strand","Locus")]->negativos
negativos

write.csv(positivos, file = "01_Rawdata/positivos_ecoli.csv")


pdf("01_Rawdata/plots")
boxplot(archivo_anotacion$Length)
dev.off()

min(archivo_anotacion$Length)
mas_grande<-archivo_anotacion[archivo_anotacion$Length==max(archivo_anotacion$Length),"Protein_Name"]
mas_grande
