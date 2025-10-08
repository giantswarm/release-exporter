FROM alpine:3.22.2

RUN apk update && apk --no-cache add ca-certificates && \
  update-ca-certificates

ADD ./release-exporter /usr/local/bin/release-exporter
ENTRYPOINT ["/usr/local/bin/release-exporter"]
