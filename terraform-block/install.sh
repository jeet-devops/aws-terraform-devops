#!/bin/sh

sudo amazon-linux-extras install docker

sudo service docker start

docker --version

sudo usermod -a -G docker "ec2-user"

sudo docker run --name nginx -d -p 80:80  nginx

sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o metadata.html

sudo docker cp metadata.html nginx:/usr/share/nginx/html