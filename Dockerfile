FROM debian:jessie
MAINTAINER Benjamin Böhmke

# get and install software
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y make gcc g++ gdb cmake \
        g++-multilib qt4-default:i386 libidn11-dev:i386 libstdc++5:i386 \
        libqt4-dev-bin:i386 qt4-qmake:i386 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# set build volume
VOLUME /build

# add build user
RUN useradd -d /build -s /bin/bash build

# set env variable
ENV QT_SELECT=qt4-i386-linux-gnu

# set working dir and user
WORKDIR /build
USER build
