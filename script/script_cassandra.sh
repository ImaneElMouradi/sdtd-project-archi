#!/bin/bash
sudo apt update -y &&
sudo apt install docker.io -y &&
sudo docker pull phedri/sdtd-cassandra:v0.3 &&
sudo docker run -p 9042:9042 phedri/sdtd-cassandra:v0.3
