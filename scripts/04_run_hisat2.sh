#!/bin/bash

#set -o xtrace

dir=$PWD
echo "dir = $dir"
# set the reference index:
GENOME="$(dirname $dir)/rawdata/genomic_files/GCF_000001735.4_TAIR10.1_genomic.fna"
#echo "genome = $GENOME"

# make an outputdirectory
OUTDIR="$(dirname $dir)/data/aligned"
#echo "outdir: $OUTDIR "
[[ -d ${OUTDIR} ]] || mkdir -p ${OUTDIR}    # if outputdirectory doesn't exist, create one

p=8 # use 8 threads
#if [ "${1: -4}" == ".ht2" ];
#	then
	R1_FQ="$1" # first argument
	R2_FQ="$2" # second argument

	# outfile name
	OUTFILE=$(basename ${R1_FQ} | cut -f 1,2,3,4 -d "_");

	# set options for hisat2
	echo "outfile = $OUTFILE "
#	echo "outdir = $OUTDIR"
	echo "R1_FQ  = $R1_FQ "
	echo "R2_FQ  = $R2_FQ "

#	hisat2 \
#		-p ${p} \
#		-x ${GENOME} \
#		 ${R1_FQ}  \
#		 ${R2_FQ}  \
#		-S ${OUTDIR}/${OUTPUT}.sam &> ${OUTPUT}.log
	
	
        # does not work ....
	# hisat2 -x -1 ../rawdata/genomic_files/GCF_000001735.4_TAIR10.1_genomic -2 ../rawdata/SRR4420293/SRR4420293_1.fastq.gz -S ../data/aligned/SRR442093_1.sam

	#echo "R1_FQ  = $R1_FQ "
	# hisat2 -x ../rawdata/genomic_files/GCF_000001735.4_TAIR10.1_genomic -1 ../rawdata/SRR4420293/SRR4420293_1.fastq.gz -2 ../rawdata/SRR4420293/SRR4420293_2.fastq.gz -S ../data/aligned/SRR442093_1.sam
	# hisat2 -x ../rawdata/genomic_files/GCF_000001735.4_TAIR10.1_genomic -1 ../rawdata/SRR4420298/SRR4420298_1.fastq.gz -2 ../rawdata/SRR4420298/SRR4420298_2.fastq.gz -S ../data/aligned/SRR442093_1.sam &> /data/aligned/SRR442093.log
	#  hisat2 -x ../rawdata/genomic_files/GCF_000001735.4_TAIR10.1_genomic -1 ../rawdata/SRR4420294/SRR4420294_1.fastq.gz -2 ../rawdata/SRR4420294/SRR4420294_2.fastq.gz -S ../data/aligned/SRR442094_1.sam &> ../data/aligned/SRR442094.log
	 hisat2 -x ../rawdata/genomic_files/GCF_000001735.4_TAIR10.1_genomic -1 ../rawdata/SRR4420295/SRR4420295_1.fastq.gz -2 ../rawdata/SRR4420295/SRR4420295_2.fastq.gz -S ../data/aligned/SRR442095_1.sam &> ../data/aligned/SRR442095.log
	 hisat2 -x ../rawdata/genomic_files/GCF_000001735.4_TAIR10.1_genomic -1 ../rawdata/SRR4420296/SRR4420296_1.fastq.gz -2 ../rawdata/SRR4420296/SRR4420296_2.fastq.gz -S ../data/aligned/SRR442096_1.sam &> ../data/aligned/SRR442096.log
	 hisat2 -x ../rawdata/genomic_files/GCF_000001735.4_TAIR10.1_genomic -1 ../rawdata/SRR4420297/SRR4420297_1.fastq.gz -2 ../rawdata/SRR4420297/SRR4420297_2.fastq.gz -S ../data/aligned/SRR442097_1.sam &> ../data/aligned/SRR442097.log

#	samtools view --threads ${p} -bS -o ${OUTDIR}/${OUTPUT}.bam ${OUTDIR}/${OUTFILE}.sam

#	rm ${OUTDIR}/${OUTFILE}.sam
#else
#	echo " other file than \".ht2\" found"
#fi

