#!/bin/bash

# This program combines the count output of "featureCounts"
# into one file

# get currend directory
DIR=$PWD

# change to working directory
parentdir=$(dirname `pwd`)

# working directory containing annotated
working_dir="${parentdir}/data/annotated"
#echo "working dir = $working_dir"


paste <(awk 'BEGIN {OFS="\t"} {print $1,$7}' $working_dir/SRR442093.gene.txt) \
  <(awk 'BEGIN {OFS="\t"} {print $7}' $working_dir/SRR442094.gene.txt) \
  <(awk 'BEGIN {OFS="\t"} {print $7}' $working_dir/SRR442095.gene.txt) \
  <(awk 'BEGIN {OFS="\t"} {print $7}' $working_dir/SRR442096.gene.txt) \
  <(awk 'BEGIN {OFS="\t"} {print $7}' $working_dir/SRR442097.gene.txt) \
  <(awk 'BEGIN {OFS="\t"} {print $7}' $working_dir/SRR442098.gene.txt) | \
  grep -v '^\#' > $working_dir/At_count.txt

  # shorten/substitute headers of columns
cat ../data/annotated/At_count.txt | sed '1 s/^.*$/Genid\t2093\t 2094\t2095\t2096\t2097\t2098/' > ../data/annotated/all_count.txt
  
