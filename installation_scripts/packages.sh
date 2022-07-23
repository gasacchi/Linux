#!/bin/bash

### Base system packages
pacman -S \
  # processor microcode
  intel-ucode \ # for intel proc
  #amd-ucode \ # for amd proc
        
  # video driver
  # for another driver check
  # https://wiki.archlinux.org/title/Xorg#Driver_installation
  xf86-video-intel \

  # version control
  git \

  # disk / fs utility
  dosfstool \
  exfatprogs \
  ntfs-3g \

  # boot manager
  grub \
  efibootmgr \

  # Arch linux mirrorlist updater
  reflector \

  # man pages
  man-db \
  man-pages \

  # network manager
  networkmanager \

 # super user tools
  opendoas \

  # xdg utils
  xdg-user-dirs \
  
### Desktop Environment
  xorg \
  gnome \ 
  gnome-tweaks \
  chrome-gnome-shell \
  
### Sound
  pulseaudio \
  pulseaudio-alsa \  
  alsa-utils \

### Fonts
  noto-fonts \
  noto-fonts-cjk \
  noto-fonts-emoji \ 
  nerd-fonts-jetbrains-mono \

### Development tools
  upwork \ # git clone https://aur.archlinux.org/upwork.git
  kitty \
  fish \ 
  starship \
  nodejs \
  helix \
  # required by helix for system clipboard
  wl-clipboard \
  filezilla \
  figma-linux-bin \
  pnpm-bin \

### Hardware Development
  kicad \
  kicad-library \
  kicad-library-3d \
  freecad \
  librecad \

### Daily Program
  brave-beta-bin \
  discord \
  mpv \
  virtualbox \
  android-file-transfer \
  imagewriter \

### Terminal Utility
  bat \
  fd \
  exa \
  dust \
  duf \
  ripgrep \
  tokei \
  unrar \
  unzip \
  wget \
  pfetch \
  git-delta \
  hyperfine \
  glow \
  bottom \
  zellij \
  yay \

