#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root!"
  exit
fi

echo 'Prepare system'

if [ -n "`which apt-get`" ]; then

V=$(uname -r | awk -F. '{print $1*100+$2}')
if [ $V -lt 41 ]; then
    echo "Please, update kernel to version 4.15 or or newer."
    exit 1
fi
    apt-get update
    apt-get -y install \
        build-essential \
        patchutils \
        linux-headers-$(uname -r) \
        git \
        libproc-processtable-perl

systemctl disable apt-daily.service
systemctl disable apt-daily.timer
#rm -rf /usr/src/media_build /usr/src/dvb-firmwares.tar.bz2
#cd /usr/src
#git clone https://github.com/tbsdtv/media_build.git

elif [ -n "`which yum`" ]; then
        yum -y group install "Development Tools"
        yum -y install epel-release
        yum -y install \
        perl-core \
        perl-Proc-ProcessTable \
        perl-Digest-SHA \
        kernel-headers \
        kernel-devel \
        elfutils-libelf-devel \
        perl-Proc-ProcessTable
rm -rf /usr/src/media_build /usr/src/dvb-firmwares.tar.bz2
cd /usr/src
git clone https://github.com/tbsdtv/media_build.git
sed -i '/vm_fault_t;/d' /usr/src/media_build/v4l/compat.h
sed -i '/add v4.20_access_ok.patch/d' /usr/src/media_build/backports/backports.txt
fi

###### install fimware
curl -L https://github.com/tbsdtv/media_build/releases/download/latest/dvb-firmwares.tar.bz2 | \
    tar -jxf - -C /lib/firmware/

cd /usr/src/media_build
./build
make install
    echo 'Done! Please reboot the server'
