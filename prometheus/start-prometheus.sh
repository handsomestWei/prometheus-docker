#!/bin/bash

docker rm -f prometheus
image=prom/prometheus
docker pull $image
## 挂载配置文件、数据存储目录
docker run -d --name prometheus --user root -p 9090:9090 -it \
-v /opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
-v /data/prometheus:/prometheus \
$image