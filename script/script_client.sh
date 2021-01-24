#!/bin/bash
sudo apt update -y &&
sudo apt install python3-pip -y &&
pip3 install numpy kafka-python

# python3 ./country_crimes.py France