FROM jenkins/jenkins

USER root

##################################################################################################################
# Install AWS CLI
##################################################################################################################
RUN curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o "awscli-bundle.zip"

RUN unzip awscli-bundle.zip && \
  ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws  && \
  rm awscli-bundle.zip



RUN mkdir /var/jenkins_home/.aws




##################################################################################################################
# Install docker binaries
##################################################################################################################
RUN apt-get update && \
apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get -y install docker-ce



##################################################################################################################
# Install Maven
##################################################################################################################

RUN apt-get -y install maven




#RUN addgroup --gid 999 docker

#RUN apt-get -yqq update && apt-get -yqq install docker.io && usermod -g docker jenkins
#VOLUME /var/run/docker.sock

USER jenkins
