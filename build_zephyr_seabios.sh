#!/bin/bash

set -xe

if [[ ! -f "Makefile" ]]; then
    echo "ERROR: Need to run in SeaBIOS directory"
    exit 1
fi

mkdir -p build/128k
cp ../qemu/roms/config.seabios-128k build/128k/.config
make EXTRAVERSION="-zephyr" KCONFIG_CONFIG=$PWD/build/128k/.config OUT=$PWD/build/128k/ CROSS_PREFIX=/opt/zephyr-sdk/0.11/x86_64-zephyr-elf/bin/x86_64-zephyr-elf- -j oldnoconfig
make EXTRAVERSION="-zephyr" KCONFIG_CONFIG=$PWD/build/128k/.config OUT=$PWD/build/128k/ CROSS_PREFIX=/opt/zephyr-sdk/0.11/x86_64-zephyr-elf/bin/x86_64-zephyr-elf- -j all

mkdir -p build/256k
cp ../qemu/roms/config.seabios-256k build/256k/.config
make EXTRAVERSION="-zephyr" KCONFIG_CONFIG=$PWD/build/256k/.config OUT=$PWD/build/256k/ CROSS_PREFIX=/opt/zephyr-sdk/0.11/x86_64-zephyr-elf/bin/x86_64-zephyr-elf- -j oldnoconfig
make EXTRAVERSION="-zephyr" KCONFIG_CONFIG=$PWD/build/256k/.config OUT=$PWD/build/256k/ CROSS_PREFIX=/opt/zephyr-sdk/0.11/x86_64-zephyr-elf/bin/x86_64-zephyr-elf- -j all
