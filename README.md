# sentinel-dashboard-docker

Sentinel控制台的Docker镜像构建源码

## 如何下载

```sh
docker pull ochh/sentinel-dashboard:tagname
```

## 如何运行

```sh
docker run --name sentinel-dashboard -p 8858:8858 -d ochh/sentinel-dashboard:tagname
```

## 如何访问web面板

1. 打开`http://localhost:8858/`
2. 账号密码默认都为: `sentinel`
