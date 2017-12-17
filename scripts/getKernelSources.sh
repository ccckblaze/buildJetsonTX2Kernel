#!/bin/bash
apt-add-repository universe
apt-get update
apt-get install qt5-default pkg-config -y
cd /usr/src
wget http://developer.download.nvidia.com/embedded/L4T/r28_Release_v1.0/BSP/source_release.tbz2
tar -xvf source_release.tbz2 sources/kernel_src-tx2.tbz2
tar -xvf sources/kernel_src-tx2.tbz2
cd kernel/kernel-4.4
zcat /proc/config.gz > .config
sudo sed -i 's/# CONFIG_SPI_SPIDEV is not set/CONFIG_SPI_SPIDEV=m/' .config
sudo sed -i 's/CONFIG_LOCALVERSION=""/CONFIG_LOCALVERSION="-sugey1sensor"/' .config
make xconfig

