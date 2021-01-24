#!/bin/bash
sudo apt update -y &&
sudo apt install docker.io -y &&
sudo docker pull phedri/sdtd-zookeeper:master-1a003f0 &&
sudo docker run phedri/sdtd-zookeeper:master-1a003f0
