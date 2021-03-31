#!/bin/bash

# if[[-d "out"]];
# then 
#     cd out && make clean && make distclean && make mrproper & cd ..
# else
#     mkdir -p out
export ARCH=arm64
export KBUILD_BUILD_USER=$user
export KBUILD_BUILD_HOST=$hostname
#set where ur compiler located
export LD_LIBRARY_PATH="$HOME/toolchain/nusantaraclang/bin/../lib:$PATH"


# export ARCH=arm64 && export KBUILD_BUILD_USER=$user && export KBUILD_BUILD_HOST=$hostname && export LD_LIBRARY_PATH="$HOME/toolchain/nusantaraclang/bin/../lib:$PATH"
#sirius_defconfig -> set to ur device name_defconfig
make -C $(pwd) -j$(nproc) O=out sirius_defconfig
#set where ur compiler located
PATH="${HOME}/toolchain/nusantaraclang/bin:${PATH}"

make        O=out   \
            ARCH=arm64 \
            CC=clang \
            CLANG_TRIPLE=aarch64-linux-gnu- \
            CROSS_COMPILE=aarch64-linux-gnu- \
            CROSS_COMPILE_ARM32=arm-linux-gnueabi- \
            -j$(nproc)
