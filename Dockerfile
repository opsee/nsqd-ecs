FROM nsqio/nsq:latest
ADD entrypoint /

ARG CONTAINER_TAG
ENV CONTAINER_TAG ${CONTAINER_TAG:-""}


ENTRYPOINT ["/entrypoint"]
