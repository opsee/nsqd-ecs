# CONTAINER_TAG is git revision unless overriden by SLATE_VERSION
CONTAINER_TAG := $(shell git rev-parse HEAD)
ifneq ($(NSQD_VERSION), "")
	CONTAINER_TAG := $(NSQD_VERSION)
endif
ifeq (${CONTAINER_TAG}, "")
	CONTAINER_TAG := $(CIRCLE_SHA1)
endif
CONTAINER_NAME := "quay.io/opsee/nsqd"

all: clean build

clean:
	$(MAKE) -i docker-clean

build:
	docker build --build-arg CONTAINER_TAG=${CONTAINER_TAG} -t ${CONTAINER_NAME}:${CONTAINER_TAG} . 

docker-clean:
	docker rmi -f ${CONTAINER_NAME}:${CONTAINER_TAG}

docker-push:
	docker push ${CONTAINER_NAME}:${CONTAINER_TAG} 

.PHONY: clean all
