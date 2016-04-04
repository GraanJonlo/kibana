#!/bin/bash

/usr/local/bin/confd -onetime -backend env

mkdir -p /var/logs/kibana

chown -R kibana:kibana /kibana
chown kibana:kibana /var/logs/kibana

chmod 0755 /kibana
chmod 0755 /var/logs/kibana

exec /sbin/setuser kibana /kibana/bin/kibana
