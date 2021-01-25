sudo apt update -y &&
sudo apt install docker.io -y &&
sudo docker pull phedri/sdtd-spark:master-7135dfe &&
sudo docker run -p 7077:7077 -p 80:8080 phedri/sdtd-spark:master-7135dfe
