FROM hypriot/rpi-java

RUN apt-get update
RUN apt-get install -y git apache2

RUN git clone https://github.com/katsuobushiFPGA/MyLogger.git
RUN cd /var/www/
RUN cp -r Maptest /var/www/
RUN git clone https://github.com/katsuobushiFPGA/Maptest.git

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
