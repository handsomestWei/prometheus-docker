#!/bin/bash

mkdir /opt/grafana-storage
chmod 777 -R /opt/grafana-storage

docker rm -f grafana
image=grafana/grafana
docker pull $image
## 挂载数据存储目录
docker run -d --name grafana --user root -p 3000:3000 -it \
-v /opt/grafana-storage:/var/lib/grafana \
$image