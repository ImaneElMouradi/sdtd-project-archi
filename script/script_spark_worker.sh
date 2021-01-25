#!/bin/bash
sudo apt update -y &&
sudo apt install docker.io -y &&
sudo docker pull phedri/sdtd-spark-worker:master-1a680c2 &&
sudo docker run --network="host" phedri/sdtd-spark-worker:master-1a680c2
