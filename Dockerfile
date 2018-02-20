FROM circleci/node:6.12.3

RUN sudo apt-get update
RUN sudo apt-get install python-pip python-dev jq
RUN sudo pip install awscli

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer
  
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle