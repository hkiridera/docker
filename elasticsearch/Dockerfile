FROM elasticsearch

MAINTAINER sfukazu

RUN apt-get update
RUN apt-get install -y unzip python curl python-pip python-dev vim unzip
RUN apt-get install -y build-essential autoconf libtool pkg-config python-opengl python-imaging python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev libyaml-cpp-dev libyaml-dev
 
RUN pip install pyyaml
RUN /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head
RUN /usr/share/elasticsearch/bin/plugin install analysis-kuromoji
#RUN /usr/share/elasticsearch/bin/plugin install org.codelibs/elasticsearch-analysis-kuromoji-neologd/2.3.0
RUN pip install elasticsearch-curator
RUN mkdir /etc/cron.d

COPY config /usr/share/elasticsearch/config
COPY curator /etc/cron.d/

VOLUME /usr/share/elasticsearch/data

EXPOSE 9200 9300

USER elasticsearch
WORKDIR /usr/share/elasticsearch

CMD ["elasticsearch"]
