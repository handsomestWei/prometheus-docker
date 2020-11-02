# prometheus-docker
基于docker容器，搭建**node-exporter**+**prometheus**+**grafana**服务监控平台

## 平台架构
<div align=center><img width="782" height="468" src="https://github.com/handsomestWei/prometheus-docker/blob/master/resources/prometheus-architecture.png" /></div>

## 组件依赖

|组件                              |版本                                |
|:------------------------------------:|------------------------------------|
|[node-exporter](#部署node-exporter)                               |lastest|
|[prometheus](#部署prometheus)                              |lastest|
|[grafana](#部署grafana)                              |lastest|


## 部署node-exporter
### 监控linux系统
docker run挂载系统文件
```
-v "/proc:/host/proc:ro" \
-v "/sys:/host/sys:ro" \
-v "/:/rootfs:ro" \
```
### 提供数据拉取接口
```
数据访问地址http://xxxx:9100/metrics/
拉取地址http://xxxx:9100/
```

## 部署prometheus
### 拉取监控数据
prometheus.yml配置
```
  - job_name: linux
    static_configs:  
      - targets: ['localhost:9100']
        labels:
          instance: localhost
```
docker run挂载配置文件和数据存储目录
```
-v /opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
-v /data/prometheus:/prometheus \
```
### 提供数据访问接口
```
http://xxx:9090/graph
http://xxx:9090/targets
```

## 部署grafana
### 控制台访问
```
http://xxx:3000/
初始账号密码admin/admin
```
### 配置prometheus数据源
```
数据源访问地址为http://xxx:9090/
```