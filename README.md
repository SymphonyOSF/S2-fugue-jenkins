# S2-fugue-jenkins
Docker image build for local CICD server

Clone this repo

```
$ mkdir /tmp/git
$ cd /tmp/git
$ git clone S2-fugue-jenkins
$ cd S2-fugue-jenkins
$
```

Build the docker image

```
$ ./build.sh
Sending build context to Docker daemon  3.584kB
Step 1/8 : FROM jenkins/jenkins
 ---> 287060ea0ef3
Step 2/8 : USER root
 ---> Using cache
 ---> 45b3430b6394
Step 3/8 : RUN curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o "awscli-bundle.zip"
 ---> Using cache
 ---> ea4f7f2c204d
Step 4/8 : RUN unzip awscli-bundle.zip &&   ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws  &&   rm awscli-bundle.zip
 ---> Using cache
 ---> 8d7f55ae76ab
Step 5/8 : RUN mkdir /var/jenkins_home/.aws
 ---> Using cache
 ---> 8a48373c2272
Step 6/8 : RUN apt-get update && apt-get -y install apt-transport-https      ca-certificates      curl      gnupg2      software-properties-common && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")    $(lsb_release -cs)    stable" && apt-get update && apt-get -y install docker-ce
 ---> Using cache
 ---> 7e9358b82e44
Step 7/8 : RUN apt-get -y install maven
 ---> Using cache
 ---> 06c823f293c1
Step 8/8 : USER jenkins
 ---> Using cache
 ---> b2fc84fe0f2d
Successfully built b2fc84fe0f2d
Successfully tagged fugue/jenkins-aws:0.1
```

Run the image

```
$ ./run.sh
880b00ae330f35cad67bf30675f968273ab032f196bb3d14f0621752f154e2d6
$ docker ps
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS                                              NAMES
880b00ae330f        fugue/jenkins-aws:0.1   "/sbin/tini -- /usr/…"   2 seconds ago       Up 8 seconds        0.0.0.0:8080->8080/tcp, 0.0.0.0:50000->50000/tcp   fugue-jenkins
$
```

Check the logs and get the initial admin password

```
$ docker logs -f fugue-jenkins
Running from: /usr/share/jenkins/jenkins.war
webroot: EnvVars.masterEnvVars.get("JENKINS_HOME")
Jul 09, 2018 9:56:29 AM org.eclipse.jetty.util.log.Log initialized
INFO: Logging initialized @297ms to org.eclipse.jetty.util.log.JavaUtilLog
Jul 09, 2018 9:56:29 AM winstone.Logger logInternal
INFO: Beginning extraction from war file

```
some lines removed for clarity, eventually you will see an entry like this:
```
INFO: 

*************************************************************
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

0cc2a250bbca4da28a4282f53722f2ef

This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

*************************************************************
*************************************************************
*************************************************************
^C
$
```
Open your browser on http://127.0.0.1:8080 and you should see a page like this:

![image](https://user-images.githubusercontent.com/14877967/42444352-c1cbe094-8367-11e8-904e-57e0845062df.png)
