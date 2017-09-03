# Pull base image
FROM resin/rpi-raspbian:wheezy
MAINTAINER sfukazu

# Install Java.
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get update
RUN apt-get install -y oracle-java8-installer --no-install-recommends
RUN apt-get clean -y
RUN apt-get autoclean -y
RUN apt-get autoremove -y
RUN rm -rf /var/cache/oracle-jdk8-installer
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]
