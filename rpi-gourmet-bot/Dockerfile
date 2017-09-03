# Pull base image.
FROM resin/rpi-raspbian
MAINTAINER sfukazu

RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y wget curl vim mysql-client git ca-certificates tidy
RUN apt-get update
RUN apt-get install -y php5 mysql-client cron
RUN apt-get install -y php5-mysql php5-curl php5 php-html-common
RUN git clone https://github.com/sfukazu/bot.git
ADD ./ ./

RUN mysql -uroot -pmy-secret-pw         -e "CREATE DATABASE sedori;"
RUN mysql -uroot -pmy-secret-pw  sedori -e "CREATE TABLE sedori(name text CHARACTER SET utf8, amiami_price int, amazon_price int);"
RUN mysql -uroot -pmy-secret-pw         -e "ALTER DATABASE sedori default character set utf8";

#RUN echo '* 4 * * * root cd /bot/amiami; bash 98_all_sedori.sh' >> /etc/crontab
#RUN echo '* 3 * * * root cd /bot/surugaya; bash 98_all_sedori.sh' >> /etc/crontab

#CMD ["cron", "-f"]
