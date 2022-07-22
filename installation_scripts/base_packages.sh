#!/bin/bash

# base package
echo "Installing base package"
pacstrap /mnt \
  # Base arch package
  base \
  base-devel \ 

  # Linux kernel and additional packages
  linux \
  linux-firmware \
  linux-headers \
