FROM phusion/baseimage:0.9.22

MAINTAINER Andy Grant <andy.a.grant@gmail.com>

ADD https://github.com/kelseyhightower/confd/releases/download/v0.13.0/confd-0.13.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

RUN \
  apt-get update && apt-get upgrade -y && apt-get install -y \
  wget

RUN rm -rf /var/lib/apt/lists/*

ENV KIBANA_VERSION 5.6.4

RUN \
  cd /tmp && \
  wget -O kibana.tar.gz https://artifacts.elastic.co/downloads/kibana/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz && \
  tar xvzf kibana.tar.gz && \
  mv kibana-$KIBANA_VERSION-linux-x86_64 /kibana && \
  groupadd kibana && \
  useradd -g kibana kibana && \
  rm -rf /tmp/*

RUN mkdir -p /etc/service/kibana
ADD kibana.sh /etc/service/kibana/run

ADD kibana.toml /etc/confd/conf.d/kibana.toml
ADD kibana.yml.tmpl /etc/confd/templates/kibana.yml.tmpl

VOLUME ["/var/logs/kibana"]

EXPOSE 5601

CMD ["/sbin/my_init", "--quiet"]
