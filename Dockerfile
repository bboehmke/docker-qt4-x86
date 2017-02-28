FROM debian:jessie
MAINTAINER Benjamin Böhmke

# get and install software
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y make git gcc g++ gdb cmake \
        g++-multilib qt4-default:i386 libidn11-dev:i386 libstdc++5:i386 \
        libqt4-dev-bin:i386 qt4-qmake:i386 libcurl3:i386 libxml2-dev:i386 cppcheck && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# build latest cppcheck
RUN git clone https://github.com/danmar/cppcheck.git /tmp/cppcheck && \
    mkdir -p /tmp/cppcheck/build && \
    cd /tmp/cppcheck/build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/cppcheck ../ && \
    make -j4 install && \
    rm -rf /tmp/cppcheck

# set build volume
VOLUME /build

# add build user
RUN useradd -d /build -s /bin/bash build

# set env variable
ENV QT_SELECT=qt4-i386-linux-gnu

# set working dir and user
WORKDIR /build
USER build
