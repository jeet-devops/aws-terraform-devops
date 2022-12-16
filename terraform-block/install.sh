#!/bin/sh

sudo amazon-linux-extras install docker

sudo service docker start

docker --version

sudo usermod -a -G docker "ec2-user"

sudo docker run -d -p 80:80 nginx