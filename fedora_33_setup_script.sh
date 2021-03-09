#!/bin/bash

sudo su

cd /root

dnf install -y \
  keylime \
  wget \
  gcc \
  make \
  openssl-devel \
  vim \
  iputils

dnf install -y dbus \
  dbus-daemon \
  dbus-devel \
  swtpm \
  swtpm-tools