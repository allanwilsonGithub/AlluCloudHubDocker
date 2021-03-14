FROM ubuntu:18.04

MAINTAINER "Allan Wilson"

LABEL name="Docker build AlluCloudHub"

RUN apt-get update && apt-get install -y git && apt-get install -y wget && apt-get install unzip
RUN apt-get install vim -y
RUN apt-get install -y net-tools
RUN mkdir /DATA/
RUN mkdir /DATA/git
RUN cd /DATA/git
RUN chmod 777 /DATA/git
ARG CACHEBUST=1
RUN wget https://github.com/allanwilsonGithub/AlluCloudHub/archive/master.zip
RUN cp master.zip /DATA/git
WORKDIR "/DATA/git"
RUN unzip master.zip
RUN apt-get install curl -y
RUN apt-get install -y software-properties-common
RUN curl -sL https://deb.nodesource.com/setup_12.x  | bash -
RUN apt-get install -y nodejs
WORKDIR "/DATA/git/AlluCloudHub-master"
RUN npm install
EXPOSE 80/tcp

WORKDIR "/DATA/git"
RUN git clone https://github.com/allanwilsonGithub/AllanWilsonMinecraft.git
WORKDIR "/DATA/git/AllanWilsonMinecraft"
RUN chmod 777 start_minecraft.sh
RUN start_minecraft.sh || true
EXPOSE 25565/tcp