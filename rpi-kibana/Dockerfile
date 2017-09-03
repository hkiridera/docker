#
# jpodeszwik/kibana Dockerfile
#
 
FROM resin/rpi-raspbian:jessie

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget ca-certificates

# Install kibana
ENV KIBANA_VERSION 5.1.1
RUN \
  cd /tmp && \
  wget https://artifacts.elastic.co/downloads/kibana/kibana-5.1.1-linux-x86_64.tar.gz && \
  tar -xvzf kibana-5.1.1-linux-x86_64.tar.gz && \
  mv /tmp/kibana-$KIBANA_VERSION-linux-x86_64 /opt && \
  rm kibana-$KIBANA_VERSION-linux-x86_64.tar.gz && \
  ln -s /opt/kibana-$KIBANA_VERSION-linux-x86_64 /opt/kibana

RUN \
  wget http://node-arm.herokuapp.com/node_latest_armhf.deb && \
  DEBIAN_FRONTEND=noninteractive dpkg -i node_latest_armhf.deb && \
  ln -sf /usr/local/bin/node /opt/kibana/node/bin/node && \
  ln -sf /usr/local/bin/npm /opt/kibana/node/bin/npm

VOLUME /data

ADD config/kibana.yml /opt/kibana/config/kibana.yml

ADD run.sh /bin/run.sh
RUN chmod +x /bin/run.sh
CMD /bin/run.sh
