# syntax=docker/dockerfile:1

FROM ubuntu:22.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        build-essential \
        ca-certificates \
        chrpath \
        cmake \
        cpio \
        debianutils \
        diffstat \
        file \
        gawk \
        gcc \
        git \
        iputils-ping \
        libegl1-mesa \
        libsdl1.2-dev \
        liblz4-tool \
        locales \
        mesa-common-dev \
        ninja-build \
        python3 \
        python3-git \
        python3-jinja2 \
        python3-pip \
        python3-pexpect \
        python3-setuptools \
        python3-subunit \
        python3-wheel \
        socat \
        texinfo \
        unzip \
        wget \
        xz-utils \
        zstd

ENV LANG=en_US.UTF-8
RUN apt-get install -y locales && \
    sed -i -e "s/# $LANG.*/$LANG UTF-8/" /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=$LANG \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash build
USER build
