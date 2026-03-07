FROM debian:bookworm-slim

LABEL maintainer="kiseru.io"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends \
    httpie \
    curl \
    nmap \
    wget \
    procps \
    lsof \
    python3 \
    python3-pip \
    netcat-openbsd \
    jq \
    telnet \
    traceroute \
    net-tools \
    iputils-ping \
    dnsutils \
    ca-certificates \
 && pip3 install --no-cache-dir --upgrade --break-system-packages setuptools sslyze \
 && curl -sL https://github.com/trimstray/htrace.sh/archive/refs/tags/v1.0.7.tar.gz | tar xz \
 && ./htrace.sh-1.0.7/setup.sh install \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]