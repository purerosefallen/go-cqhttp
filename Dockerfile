FROM golang:1.14.7-alpine AS builder
ARG GO_CQHTTP_VERSION
ENV GO_CQHTTP_VERSION ${GO_CQHTTP_VERSION:-v0.9.25-fix3-mycard}

RUN go env -w GO111MODULE=auto \
  && go env -w CGO_ENABLED=0 \
  && go env -w GOPROXY=https://goproxy.cn,https://gocenter.io,https://goproxy.io,direct \
  && mkdir /build

WORKDIR /build

COPY ./ .

RUN cd /build \
  && go build -ldflags "-s -w -extldflags '-static' -X 'github.com/Mrs4s/go-cqhttp/coolq.version=$GO_CQHTTP_VERSION'" -o cqhttp

FROM alpine:latest

COPY --from=builder /build/cqhttp /usr/bin/cqhttp
RUN chmod +x /usr/bin/cqhttp

WORKDIR /data

ENV UIN 11111111
ENV PASS password
ENV HTTP_POST http://app
ENV HTTP_SECRET aaaaaaaaaa
ENV ACCESS_TOKEN bbbbbbbbbb
ENV ENABLE_DB 'true'
ENV DEBUG 'false'
ENV IGNORE_INVALID_CQCODE 'false'
ENV FORCE_FRAGMENTED 'true'

ENTRYPOINT [ "/usr/bin/cqhttp" ]
