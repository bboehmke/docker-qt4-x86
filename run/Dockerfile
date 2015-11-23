FROM debian:jessie
MAINTAINER Benjamin Böhmke

# get and install software
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y libidn11:i386 libstdc++5:i386 \
        libqt4-core:i386 libqt4-network:i386 libqt4-xml:i386 libqt4-xmlpatterns:i386 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
