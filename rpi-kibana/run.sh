#!/bin/sh

# set elasticsearch location
#sed -i "s/^#elasticsearch_url: .*/elasticsearch_url: \"http:\/\/$ELASTICSEARCH:9200\"/g" /opt/kibana/config/kibana.yml
sed -i "s/--no-warnings//g" /opt/kibana/bin/kibana
sed -i "s/--no-warnings//g" /opt/kibana/bin/kibana-plugin

exec /opt/kibana/bin/kibana > /data/kibana.log 
