#!/bin/bash
sudo apt update -y &&
sudo apt install docker.io -y &&
sudo docker pull phedri/sdtd-kafka:v0.2 &&
sudo docker run -p 9092:9092 phedri/sdtd-kafka:v0.2
