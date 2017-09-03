FROM hypriot/rpi-java

RUN apt-get update
RUN apt-get install -y build-essential g++ flex bison gperf ruby perl libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev  libpng-dev libjpeg-dev libx11-dev libxext-dev git ca-certificates
RUN git clone http://github.com/ariya/phantomjs.git
RUN cd phantomjs
#RUN git checkout 2.1
#RUN git submodule init
#RUN git submodule update
#RUN cd bin
#RUN chmod a+x ./phantomjs
#RUN sudo cp ./phantomjs /usr/local/bin/
#RUN sudo apt-get install -y fontconfig-config fonts-dejavu-core libfontconfig1
#RUN sudo apt-get install -y fonts-ipafont
#RUN sudo apt-get install -y fontconfig
#RUN fc-list

