FROM circleci/node:6.13.1

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

RUN sudo add-apt-repository ppa:ondrej/php
RUN sudo apt-get install curl php5-cli git
RUN php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');" & \
    sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# install latest npm
# RUN sudo npm install -g npm@latest