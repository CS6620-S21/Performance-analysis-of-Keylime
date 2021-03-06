#!/bin/bash
sudo su
apt-get update
apt-get upgrade

# install keylime v6.0.1
apt-get install -y wget gcc make vim python3-pip
apt-get install -y build-essential libssl-dev swig python3-dev libtss2-dev
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
sudo apt-get -y install automake autoconf libtool gcc build-essential libssl-dev dh-exec pkg-config
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
cd ..
dpkg -i swtpm-dev_0.5.2_amd64.deb swtpm-libs_0.5.2_amd64.deb swtpm-tools_0.5.2_amd64.deb swtpm_0.5.2_amd64.deb

# install dbus
apt-get install dbus
