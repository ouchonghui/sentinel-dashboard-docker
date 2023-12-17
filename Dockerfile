FROM centos:8
LABEL maintainer="chongh.ou <ochhgz@163.com>"

ENV BASE_DIR="/home/sentinel-dashboard" \
    TIME_ZONE="Asia/Shanghai"

ARG SENTINEL_DASHBOARD_VERSION=1.8.6

WORKDIR $BASE_DIR

RUN set -x \
    && sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-* \
    && yum update -y \
    && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel \
    && yum clean all
RUN curl -SL https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_DASHBOARD_VERSION}/sentinel-dashboard-${SENTINEL_DASHBOARD_VERSION}.jar -o $BASE_DIR/sentinel-dashboard.jar \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone

EXPOSE 8858 8719

ENTRYPOINT ["java" "-Dserver.port=8858" "-Dcsp.sentinel.api.port=8719" "-Dcsp.sentinel.dashboard.server=localhost:8858" "-Dproject.name=sentinel-dashboard" "-jar" "sentinel-dashboard.jar"]