FROM phusion/baseimage:0.9.16

MAINTAINER Andy Grant <andy.a.grant@gmail.com>

RUN \
  apt-get update && apt-get upgrade -y && apt-get install -y \
  wget

ENV KIBANA_VERSION 4.1.0

RUN \
  cd /tmp && \
  wget -O kibana.tar.gz https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz && \
  tar xvzf kibana.tar.gz && \
  mv kibana-$KIBANA_VERSION-linux-x64 /kibana && \
  groupadd kibana && \
  useradd -g kibana kibana && \
  rm -rf /tmp/*

RUN mkdir -p /etc/service/kibana
ADD kibana.sh /etc/service/kibana/run
ADD kibana.yml /kibana/config/kibana.yml

VOLUME ["/data"]

EXPOSE 5601

CMD ["/sbin/my_init", "--quiet"]

