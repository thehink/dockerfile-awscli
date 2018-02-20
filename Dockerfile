FROM circleci/node:6.12.3

RUN sudo apt-get update
RUN sudo apt-get install python-pip python-dev jq
RUN sudo pip install awscli

RUN sudo apt-get install default-jre