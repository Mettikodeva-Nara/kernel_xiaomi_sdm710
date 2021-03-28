#!/bin/bash

if[[-d "out"]];
then 
    cd out && make clean && make distclean && make mrproper & cd ..
else
    mkdir -p out

make O=out ARCH=arm64 sirius_defconfig

PATH="${HOME}/toolchain/proton-clang/bin:${PATH}"\
make        O=out   \
            ARCH=arm64\
            CC=clang\
            CROSS_COMPILE=aarch64-linux-gnu-\
            CROSS_COMPILE_ARM32=arm-linux-gnueabi-\
            -j8