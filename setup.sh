#!/bin/bash

apt-get update
apt-get install -y docker.io

mkdir -p /var/containers/jenkins_home
chown -R 1000:1000 /var/containers/jenkins_home

cd jenkins
docker build -t eguahlak/jenkins .
docker run -p 8080:8080 -p 50000:50000 -v /var/containers/jenkins_home:/var/jenkins_home eguahlak/jenkins
