FROM phusion/baseimage:0.9.18

MAINTAINER Andy Grant <andy.a.grant@gmail.com>

ADD https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

RUN \
  apt-get install -y \
  wget

ENV KIBANA_VERSION 4.1.7

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