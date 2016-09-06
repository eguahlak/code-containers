#!/bin/bash

apt-get update
apt-get install -y docker.io

mkdir -p /var/containers/jenkins_home
chown -R 1000:1000 /var/containers/jenkins_home

cd jenkins
docker build -t eguahlak/jenkins .
