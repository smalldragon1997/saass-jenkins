FROM jenkins/jenkins:lts
USER root

RUN echo '' > /etc/apt/sources.list.d/jessie-backports.list \
  && echo "deb http://mirrors.aliyun.com/debian jessie main contrib non-free" > /etc/apt/sources.list \
  && echo "deb http://mirrors.aliyun.com/debian jessie-updates main contrib non-free" >> /etc/apt/sources.list \
  && echo "deb http://mirrors.aliyun.com/debian-security jessie/updates main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y libltdl7

ARG dockerGid=999
RUN echo "docker:x:${dockerGid}:jenkins" >> /etc/group \
USER jenkins
