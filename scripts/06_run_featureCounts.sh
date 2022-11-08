#!/bin/bash

# this script runs featureCounts to annotate aligned reads into a "gene.txt" -file, a "summary" and a ".log"-flie
# to be further processed in DGE analysis


# get currend directory
DIR=$PWD

# change to working directory
parentdir=$(dirname `pwd`)

# working directory containing bam files
working_dir="${parentdir}/data/aligned"
#echo "working dir = $working_dir"

# directory containing annotation GFF file
GFF_ANNOT_DIR="${parentdir}/rawdata/genomic_files"
ANNOTATION_DIR="${parentdir}/data/annotated"

	# check if ANNOTIATION_DIR exists, if not -> make directory
if [ ! -e $ANNOTATION_DIR ]
	then
	mkdir $ANNOTATION_DIR
	fi

for g in $GFF_ANNOT_DIR/*.gff.gz 
	do
	echo "GFF true"
	echo "g= $g"
	GFF_FILE=$g

		for f in $working_dir/*.bam
		do
			#remove path before file
			outfile_pre="$(basename -- $f)"   # remove path before file

			#remove file extension ("_1.bam")
			outfile=${outfile_pre%_*}

			# -T4     : Threads( -T4)  
			# -s 2    : 2 specific strands for alin (-s 2) 
			# -p      : fragments or templates will be counted as reads
			# -t gene : feature type of GTF notation "gene"
			# -g ID   : specify attribute type from Meta-features from GFF file
			# -o      : outputfile (-o)
			
		echo "featureCounts -T 4 -s 2 -p -t gene -g ID -a $GFF_FILE -o $ANNOTATION_DIR/$outfile.gene.txt $f &> $ANNOTATION_DIR/$outfile.log"
		featureCounts -T 4 -s 2 -p -t gene -g ID -a $GFF_FILE -o $ANNOTATION_DIR/$outfile.gene.txt $f &> $ANNOTATION_DIR/$outfile.log
		#echo "outfile_pre = $outfile_pre"
		#echo "outfile     = $outfile"
		#echo " f          = $f      "
		#echo "gff         = $GFF_FILE	"
		done

	done

# not working/tested yet 
#featureCounts -T 4 -s 2 -p -t gene -g ID -a ${ANNOT_GFF} -o ${workingdir}/{/.}.gene.txt {}" ::: {INDIR}/*.bam



