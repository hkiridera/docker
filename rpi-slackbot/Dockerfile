FROM hypriot/rpi-ruby

RUN apt-get update
RUN apt-get install -y build-essential g++ flex bison gperf ruby perl libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev  libpng-dev libjpeg-dev libx11-dev libxext-dev git ca-certificates vim
RUN apt-get install -y npm nodejs
RUN npm cache clean
RUN npm install n -g
RUN n stable
RUN ln -sf /usr/local/bin/node /usr/bin/node
#RUN git clone https://github.com/howdyai/botkit.git
RUN git clone http://192.168.12.253:10080/sfukazu/botkit.git
RUN cd botkit;npm install

CMD token=xoxb-65034493702-0OkV9fDURW4o6jfluuRx1SdT node botkit/slack_bot.js
