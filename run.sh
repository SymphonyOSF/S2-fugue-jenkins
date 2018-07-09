#!/usr/bin/env bash

docker run -u root --name fugue-jenkins -d -p 8080:8080 -p 50000:50000 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock fugue/jenkins-aws:0.1
