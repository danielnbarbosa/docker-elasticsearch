# ElasticSearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#
#
 
# Pull base image.
FROM dockerfile/java
 
# Install ElasticSearch.
# legit versions: 1.2.1, 1.3.0, 1.4.0
ENV version 1.3.0
RUN \
  cd /tmp && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${version}.tar.gz && \
  tar xvzf elasticsearch-${version}.tar.gz && \
  rm -f elasticsearch-${version}.tar.gz && \
  mv /tmp/elasticsearch-${version} /elasticsearch

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
