FROM       alpine:latest
EXPOSE     9001

RUN wget https://github.com/dcu/mongodb_exporter/releases/download/v1.0.0/mongodb_exporter-linux-amd64 -O /bin/mongodb_exporter && chmod +x /bin/mongodb_exporter

ENTRYPOINT [ "/bin/mongodb_exporter" ]
