FROM circleci/node:6.12.3

RUN sudo apt-get update
RUN sudo apt-get install python-pip python-dev jq
RUN sudo pip install awscli

RUN sudo apt-get install software-properties-common

RUN \
  sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && \
  sudo add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" && \
  sudo apt-get update && \
  sudo apt-get install -y oracle-java8-installer && \
  sudo rm -rf /var/lib/apt/lists/* && \
  sudo rm -rf /var/cache/oracle-jdk8-installer
  
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# install latest npm
RUN npm install -g npm@latest