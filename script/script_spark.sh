#!/bin/bash
sudo apt update -y &&
sudo apt install docker.io -y &&
sudo docker pull phedri/sdtd-spark:v0.7 &&
sudo docker run -p 8080:8080 phedri/sdtd-spark:v0.7
