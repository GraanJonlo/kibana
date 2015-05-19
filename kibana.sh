#!/bin/bash
sed -i "s/localhost:9200/$ES_PORT_9200_TCP_ADDR:$ES_PORT_9200_TCP_PORT/g" /kibana/config/kibana.yml

exec /sbin/setuser kibana /kibana/bin/kibana

