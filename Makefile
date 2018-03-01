USERNAME=epanoff
VERSION=latest
default: all

build_ui:
	cd src/ui && bash docker_build.sh

build_comment:
	cd src/comment && bash docker_build.sh

build_post:
	cd src/post-py && bash docker_build.sh

build_prometheus:
	cd docker build -t $(USER_NAME)/prometheus:$(VERSION) monitoring/prometheus

build_mongo_exporter:
	cd monitoring/mongo-exporter && docker build -t $(USER_NAME)/mongo-exporter:$(VERSION) .

build_blackbox_exporter:
	cd monitoring/blackbox-exporter/ && docker build -t $(USER_NAME)/blackbox-exporter:$(VERSION) .

build_all: build_ui build_comment build_post build_prometheus build_mongo_exporter build_blackbox_exporter

push_ui:
	docker push $(USER_NAME)/ui:$(VERSION)

push_comment:
	docker push $(USER_NAME)/comment:$(VERSION)

push_post:
	docker push $(USER_NAME)/post:$(VERSION)

push_prometheus:
	docker push $(USER_NAME)/prometheus:$(VERSION)

push_mongodb_exporter:
	docker push $(USER_NAME)/mongo-exporter:$(VERSION)

push_blackbox_exporter:
	docker push $(USER_NAME)/blackbox-exporter:$(VERSION)

all: build_all push_ui push_comment push_post push_prometheus push_mongodb_exporter push_blackbox_exporter 
