FROM nsqio/nsq:latest
ADD entrypoint /
ENTRYPOINT ["/entrypoint"]
