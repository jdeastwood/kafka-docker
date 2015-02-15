FROM centos:7

MAINTAINER Wurstmeister 

RUN yum -y install unzip java-1.6.0-openjdk wget tar git docker

RUN wget -q http://apache.mirrors.lucidnetworks.net/kafka/0.8.2.0/kafka_2.10-0.8.2.0.tgz -O /tmp/kafka_2.10-0.8.2.0.tgz
RUN tar xfz /tmp/kafka_2.10-0.8.2.0.tgz -C /opt

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka_2.10-0.8.2.0
ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh
CMD start-kafka.sh 
