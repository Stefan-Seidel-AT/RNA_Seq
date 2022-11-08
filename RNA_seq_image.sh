#!/bin/bash

#cd ../rawdata
# get cwd
echo "$PWD"

# docker -v  mount volume
#        -p  use port
#        -e  authentication required

echo "docker run -v \"$PWD\":/home/jovyan/work -p 8888:8888 -e PASSWORD=\"jupyter\" quay.io/cellgeni/scrna-seq-course:v5.14"
docker run -v "$PWD":/home/jovyan/work -p 8888:8888 -e PASSWORD="jupyter" quay.io/cellgeni/scrna-seq-course:v5.14
