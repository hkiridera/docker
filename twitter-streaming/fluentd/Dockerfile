FROM ruby:2.2

RUN apt-get update
RUN apt-get install -y libcurl4-gnutls-dev net-tools build-essential vim
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN gem install fluentd -v "~>0.12.26" --no-ri --no-rdoc
#RUN /usr/local/bin/gem install fluent-plugin-secure-forward --no-ri --no-rdoc
RUN /usr/local/bin/gem install eventmachine --no-ri --no-rdoc
RUN /usr/local/bin/gem install fluent-plugin-twitter --no-ri --no-rdoc
RUN /usr/local/bin/gem install fluent-plugin-norikra --no-ri --no-rdoc
RUN /usr/local/bin/gem install fluent-plugin-mail --no-ri --no-rdoc
#RUN /usr/local/bin/gem install fluent-plugin-elasticsearch --no-ri --no-rdoc

RUN mkdir /etc/fluent
RUN mkdir /var/log/fluent

ADD fluent.conf /etc/fluent/
#ADD ca_cert.pem /etc/fluent/

EXPOSE 24224
#EXPOSE 24284

ENTRYPOINT ["/usr/local/bundle/bin/fluentd", "-c", "/etc/fluent/fluent.conf"]
