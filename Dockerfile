FROM ubuntu:14.04
MAINTAINER chinadns-c 

RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update -y

RUN apt-get install gcc -y

RUN apt-get install g++ -y

RUN apt-get install automake -y

RUN apt-get install build-essential -y

RUN apt-get install wget -y

RUN apt-get install unzip -y

WORKDIR /home/

RUN wget https://github.com/clowwindy/ChinaDNS/archive/1.3.1.zip

RUN unzip 1.3.1.zip

WORKDIR /home/ChinaDNS-1.3.1

RUN ./autogen.sh

RUN ./configure && make

EXPOSE 53/udp 53/tcp

CMD ["src/chinadns", "-c", "chnroute.txt" ,"-b", "0.0.0.0", "-v"]
