#!/bin/bash
sudo apt update -y &&
sudo apt install docker.io -y &&
sudo docker pull phedri/sdtd-spark-master:master-245c4db &&
sudo docker run -p 7077:7077 -p 80:8080 phedri/sdtd-spark-master:master-245c4db
#sudo docker run -it -p 7077:7077 -p 80:8080 3a9f5dd8e3e2
