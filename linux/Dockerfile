# Author : Mitchel Humpherys
# Date   : 23/03/2021
# Source : https://mgalgs.io/2021/03/23/how-to-build-a-custom-linux-kernel-for-qemu-using-docker.html

FROM debian:10.8

RUN apt-get update 
RUN apt-get install -y \
    bc \
    bison \
    build-essential \
    cpio \
    flex \
    libelf-dev \
    libncurses-dev \
    libssl-dev \
    gcc-x86-64-linux-gnu \
    gcc-arm-linux-gnueabi \
    vim-tiny