FROM        quay.io/prometheus/busybox:latest
MAINTAINER  The Prometheus Authors <prometheus-developers@googlegroups.com>

RUN  wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.11.0/blackbox_exporter-0.11.0.linux-arm64.tar.gz && tar xvf blackbox_exporter-0.11.0.linux-arm64.tar.gz && cp blackbox_exporter-0.11.0.linux-arm64/blackbox_exporter /bin/blackbox_exporter && chmod +x /bin/blackbox_exporter
COPY blackbox.yml       /etc/blackbox_exporter/config.yml

EXPOSE      9115
ENTRYPOINT  [ "/bin/blackbox_exporter" ]
CMD         [ "--config.file=/etc/blackbox_exporter/config.yml" ]
