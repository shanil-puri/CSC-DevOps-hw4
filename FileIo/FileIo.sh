#!/bin/bash
cd ~/devops/FileIoIn
docker build -t inp .
docker run -td --name file_inp inp

cd ~/devops/FileIoOut
docker build -t out .
#docker run -td --name file_out out_file
docker run -td --link file_inp:input --name file_out out
docker exec -it file_out bash
curl inp:9001
