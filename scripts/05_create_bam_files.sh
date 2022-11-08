#!/bin/bash

# create bam files from hisat2 outputfiles and remove .sam files

# get currend directory
DIR=$PWD
# change to working directory
parentdir=$(dirname `pwd`)
working_dir="${parentdir}/data/aligned"
echo "working dir = $working_dir"

for f in $working_dir/*.sam
do
	# ctrl statements
#	echo "sam files = $f"
	file=${f##*/}
	file="${file%.*}"

	#samtools view --threads ${p} -bS -o ${OUTDIR}/${OUTPUT}.bam ${OUTDIR}/${OUTFILE}.sam
     	#echo "samtools view -bS -o ../data/aligned/$file.bam ../data/aligned/$file.sam"

	# example of command: 
	#samtools view -bS -o ../data/aligned/SRR442098_1.bam ../data/aligned/SRR442098_1.sam
	
	# unmask line below for batch:
	 samtools view -bS -o ../data/aligned/$file.bam ../data/aligned/$file.sam
	
	# remove .sam - files ( to save disk space)
	echo "rm $f"
	rm $f
done

