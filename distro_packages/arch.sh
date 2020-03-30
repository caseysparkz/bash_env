### Run as root
#! /bin/bash
sudo sh -c "
  pacman -Syu;
  pacman -S
    facter		\
    libnotify-bin	\
    nmap		\
    ntp			\
    python		\
    python-dev		\
    python-pip		\
    python-venv		\
    sl			\
    snapd		\
    speedtest-cli	\
    thefuck		\
    tldr		\
    lm-sensors
"

sudo ln -s /var/lib/snapd/snap /snap
