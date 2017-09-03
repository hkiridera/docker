FROM hypriot/rpi-java:1.8.0

MAINTAINER sfukazu

RUN \
  groupadd -g 999 elasticsearch && \
  useradd -g elasticsearch -s /bin/bash -u 999 elasticsearch

RUN apt-get update
RUN apt-get install unzip python curl python-pip python-dev
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /usr/share

RUN \
  wget --no-check-certificate https://github.com/elastic/elasticsearch/archive/v5.1.1.zip && \
  unzip v5.1.1.zip && \
  mv v5.1.1.zip elasticsearch && \
  chown -R elasticsearch:elasticsearch elasticsearch && \
  rm -rf v5.1.1.zip


ENV ELASTICSEARCH_MAJOR 5.1
ENV ELASTICSEARCH_VERSION 5.1.1

ENV PATH /usr/share/elasticsearch/bin:$PATH

#RUN set -ex \
#	&& for path in \
#		/usr/share/elasticsearch/data \
#		/usr/share/elasticsearch/logs \
#		/usr/share/elasticsearch/config \
#		/usr/share/elasticsearch/config/scripts \
#	; do \
#		mkdir -p "$path"; \
#		chown -R elasticsearch:elasticsearch "$path"; \
#	done

#RUN /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head
#RUN /usr/share/elasticsearch/bin/plugin install analysis-kuromoji
#RUN /usr/share/elasticsearch/bin/plugin install org.codelibs/elasticsearch-analysis-fess/2.3.0 && \
#    /usr/share/elasticsearch/bin/plugin install org.codelibs/elasticsearch-analysis-ja/2.3.0 && \
#    /usr/share/elasticsearch/bin/plugin install org.codelibs/elasticsearch-analysis-synonym/2.3.0 && \
#    /usr/share/elasticsearch/bin/plugin install org.codelibs/elasticsearch-configsync/2.3.1 && \
#    /usr/share/elasticsearch/bin/plugin install org.codelibs/elasticsearch-dataformat/2.3.0 && \
#    /usr/share/elasticsearch/bin/plugin install org.codelibs/elasticsearch-langfield/2.3.0 && \
#    /usr/share/elasticsearch/bin/plugin install http://maven.codelibs.org/archive/elasticsearch/plugin/kopf/elasticsearch-kopf-2.0.1.0.zip && \
#    /usr/share/elasticsearch/bin/plugin install org.codelibs/elasticsearch-analysis-kuromoji-neologd/2.3.1

RUN pip install elasticsearch-curator
RUN mkdir /etc/cron.d

COPY config /usr/share/elasticsearch/config
COPY curator /etc/cron.d/

#VOLUME /usr/share/elasticsearch/data

EXPOSE 9200 9300

USER elasticsearch
#WORKDIR /usr/share/elasticsearch

CMD ["elasticsearch"]
