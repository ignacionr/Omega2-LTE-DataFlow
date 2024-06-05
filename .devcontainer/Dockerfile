FROM ubuntu:24.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    unzip \
    cmake \
    ninja-build \
    file \
    qemu-system-mips


# Set up the OpenWRT SDK
WORKDIR /opt
RUN wget https://downloads.openwrt.org/releases/23.05.2/targets/ramips/mt76x8/openwrt-sdk-23.05.2-ramips-mt76x8_gcc-12.3.0_musl.Linux-x86_64.tar.xz
RUN tar -xvf openwrt-sdk-23.05.2-ramips-mt76x8_gcc-12.3.0_musl.Linux-x86_64.tar.xz
RUN mv openwrt-sdk-23.05.2-ramips-mt76x8_gcc-12.3.0_musl.Linux-x86_64 openwrt-sdk

# Set environment variables for the toolchain
ENV STAGING_DIR=/opt/openwrt-sdk/staging_dir
ENV PATH=$PATH:/opt/openwrt-sdk/staging_dir/toolchain-mipsel_24kc_gcc-12.3.0_musl/bin

# Clean up
RUN rm openwrt-sdk-23.05.2-ramips-mt76x8_gcc-12.3.0_musl.Linux-x86_64.tar.xz
