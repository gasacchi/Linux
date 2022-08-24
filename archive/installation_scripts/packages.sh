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
  nushell \ 
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
  librecad \

### Daily Program
  brave-beta-bin \
  discord \
  mpv \
  virtualbox \
  android-file-transfer \
  android-tools \
  imagewriter \

### Terminal Utility
  bandwhich \ # see bandwith
  bat \ # cat alt
  bottom \ # process monitor
  broot \ # tree with cd
  git-delta \ # git log highlighting
  duf \ # disk utils
  dust \ # du alt
  gitui \ # git terminal ui
  hyperfine \ # benchmark
  ripgrep \ # rg alt
  tealdeer \ # tldr alt
  tokei \ # count LOC
  zellij \ # multiplexer 
  
  unrar \
  unzip \
  wget \
  pfetch \
  lolcat \
  nyancat \
  glow \
  yay \

