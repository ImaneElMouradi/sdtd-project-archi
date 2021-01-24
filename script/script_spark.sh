#!/bin/bash
sudo apt update -y &&
sudo apt install docker.io -y &&
sudo docker pull phedri/sdtd-spark:master-74eab56 &&
sudo docker run -p 80:8080 phedri/sdtd-spark:master-74eab56
