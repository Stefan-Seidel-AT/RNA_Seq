#!/bin/bash

# this file builds the indices for hisat2

GENOME_FNA_GZ="../rawdata/genomic_files/GCF_000001735.4_TAIR10.1_genomic.fna.gz"
echo "fgz =  $GENOME_FNA_GZ "
GENOME_FNA=${GENOME_FNA_GZ%.*}      # drops the .gz extension
echo "fna = $GENOME_FNA"
GENOME=${GENOME_FNA%.*}             # drops the .fna extension
echo "file = $GENOME"

# build index for hisat2 
hisat2-build ${GENOME_FNA} ${GENOME}
