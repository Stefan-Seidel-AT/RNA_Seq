#!/bin/bash

# NOTE: this script takes fastqc files and creates fastqc-reports to OUT directory
# FILE path needs to be adapted
FILE="../rawdata/SRR442029*/*"
OUT="../data/fastqc/"

for f in $FILE
do
  echo "Processing file: $f "
  # fastqc command    -> to OUT directory
  echo "fastqc $f -o $OUT "
  fastqc $f -o $OUT
  
done

#### run 
#echo "fastqc ../rawdata/SRR4420293/SRR4420293_2.fastq.gz -o ../data/fastqc/"
#fastqc ../rawdata/SRR4420293/SRR4420293_2.fastq.gz -o ../data/fastqc/
