#!/bin/bash
curl -XPUT http://192.168.12.20:9200/_template/twitter -d @mapping.json
