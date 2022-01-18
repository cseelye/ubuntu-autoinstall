FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    ca-certificates \
    curl \
    genisoimage \
    rsync \
    syslinux-utils \
    && \
    apt-get autoremove --yes && apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /host
WORKDIR /host

ENTRYPOINT ["./build-iso"]
