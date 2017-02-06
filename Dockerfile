FROM lochnair/base:ubuntu
MAINTAINER Lochnair <me@lochnair.net>

LABEL Description="Mono base image (Ubuntu)"

# Install the Mono runtime
RUN \
apt update && \
apt install --no-install-recommends -y \
	ca-certificates-mono \
	libmono-cil-dev \
    mono-runtime \
    paxctl && \
rm -rf /var/lib/apt/lists/*

# Disable PaX mprotect
RUN \
paxctl -c /usr/bin/mono && \
paxctl -c /usr/bin/mono-sgen && \
paxctl -m /usr/bin/mono && \
paxctl -m /usr/bin/mono-sgen