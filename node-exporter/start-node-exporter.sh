#!/bin/bash

docker rm -f node-exporter
image=prom/node-exporter
docker pull $image
## 暴露数据拉取接口http://xxxx:9100/metrics
docker run -d --name node-exporter -p 9100:9100 -it \
-v "/proc:/host/proc:ro" \
-v "/sys:/host/sys:ro" \
-v "/:/rootfs:ro" \
--net="host" \
$image