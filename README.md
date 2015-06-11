# What is Kibana?

Kibana is an open source analytics and visualization platform designed to work with Elasticsearch. You use Kibana to search, view, and interact with data stored in Elasticsearch indices. You can easily perform advanced data analysis and visualize your data in a variety of charts, tables, and maps.

Kibana makes it easy to understand large volumes of data. Its simple, browser-based interface enables you to quickly create and share dynamic dashboards that display changes to Elasticsearch queries in real time.

> [www.elastic.co/guide/en/kibana](https://www.elastic.co/guide/en/kibana)

# How to use this image

## start an kibana instance

    docker run --name kibana [-p 5601:5601] [-v /some/directory:/data] [--link elasticsearch:es] -d graanjonlo/kibana[:tag]

This image includes `EXPOSE 5601`, so standard container linking will make it automatically available to the linked containers.  The above example shows it being linked to an already running elasticsearch instance. Volume `/data` is also available and is where the log file is written.

