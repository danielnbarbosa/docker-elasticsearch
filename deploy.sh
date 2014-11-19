#! /bin/bash

SHA1=$1

# Deploy image to Docker Hub
#docker push danielnbarbosa/elasticsearch:$SHA1
docker push danielnbarbosa/elasticsearch

# Deploy to CoreOS cluster
ssh core@54.67.14.65 -C 'fleetctl stop elasticsearch@{1..3}.service; fleetctl start elasticsearch@{1..3}.service'
