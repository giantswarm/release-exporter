FROM alpine:3.24.1

RUN apk update && apk --no-cache add ca-certificates && \
  update-ca-certificates

# architect/go-build emits one static binary per target platform
# (release-exporter-linux-amd64, release-exporter-linux-arm64) plus an
# unsuffixed copy of the linux/amd64 build. Copy the one matching buildx's
# TARGETARCH so the arm64 image gets an arm64 binary. For a local build,
# produce it first:
#   CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o release-exporter-linux-amd64 .
ARG TARGETARCH
COPY ./release-exporter-linux-${TARGETARCH} /usr/local/bin/release-exporter
ENTRYPOINT ["/usr/local/bin/release-exporter"]
