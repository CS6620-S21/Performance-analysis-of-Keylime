#!/bin/bash
sudo su
apt-get update
apt-get upgrade

# install keylime v6.0.1
apt-get install -y wget gcc make vim python3-pip
apt-get install -y build-essential libssl-dev swig python3-dev
cd /root
wget https://github.com/keylime/keylime/archive/6.0.1.tar.gz
tar -zxvf 6.0.1.tar.gz
cd keylime-6.0.1
pip3 install M2Crypto
./installer.sh -s -m

# install libtpms v0.7.7
cd /root
wget https://github.com/stefanberger/libtpms/archive/v0.7.7.tar.gz
tar -zxvf v0.7.7.tar.gz
cd libtpms-0.7.7/
apt-get -y install automake autoconf libtool gcc build-essential libssl-dev dh-exec pkg-config gawk
./autogen.sh --with-openssl
make dist
dpkg-buildpackage -us -uc -j4
cd ..
dpkg -i libtpms0_0.7.7_amd64.deb libtpms-dev_0.7.7_amd64.deb

# install swtpm v0.5.2
cd /root
wget https://github.com/stefanberger/swtpm/archive/v0.5.2.tar.gz
tar -zxvf v0.5.2.tar.gz
cd swtpm-0.5.2/
apt-get -y install  libfuse-dev libglib2.0-dev libgmp-dev expect libtasn1-dev socat tpm-tools python3-twisted gnutls-dev gnutls-bin net-tools softhsm2 libseccomp-dev
dpkg-buildpackage -us -uc -j$(nproc)
cd ..
dpkg -i swtpm-dev_0.5.2_amd64.deb swtpm-libs_0.5.2_amd64.deb swtpm-tools_0.5.2_amd64.deb swtpm_0.5.2_amd64.deb

# install dbus
apt-get install dbus

# install tpm2-abrmd, tpm2-tools
# apt-get install tpm2-abrmd tpm2-tools


# install tpm2-tss dependencies
apt-get -y install \
  autoconf-archive \
  libcmocka0 \
  libcmocka-dev \
  procps \
  iproute2 \
  build-essential \
  git \
  pkg-config \
  gcc \
  libtool \
  automake \
  libssl-dev \
  uthash-dev \
  autoconf \
  doxygen \
  libjson-c-dev \
  libini-config-dev \
  libcurl4-gnutls-dev

# install tpm2-tss
wget https://github.com/tpm2-software/tpm2-tss/releases/download/2.4.5/tpm2-tss-2.4.5.tar.gz
tar -zxvf tpm2-tss-2.4.5.tar.gz
cd tpm2-tss-2.4.5
useradd --system --user-group tss
./configure --prefix=/usr
make -j$(nproc)
make install
ldconfig

# install tpm2-tools
apt-get install -y uuid uuid-dev
wget https://github.com/tpm2-software/tpm2-tools/releases/download/4.3.0/tpm2-tools-4.3.0.tar.gz
tar -zxvf tpm2-tools-4.3.0.tar.gz
cd tpm2-tools-4.3.0
./configure --prefix=/usr/local
make -j$(nproc)
make install

# install tpm2-abrmd
wget https://github.com/tpm2-software/tpm2-abrmd/releases/download/2.3.3/tpm2-abrmd-2.3.3.tar.gz
tar -zxvf tpm2-abrmd-2.3.3.tar.gz
cd tpm2-abrmd-2.3.3
apt-get install -y libglib2.0-dev
./configure --with-dbuspolicydir=/etc/dbus-1/system.d \
            --with-systemdsystemunitdir=/lib/systemd/system \
            --with-systemdpresetdir=/lib/systemd/system-preset \
            --datarootdir=/usr/share
make -j$(nproc)
make install
