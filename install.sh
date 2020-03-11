### Run as root
#! /bin/bash

if [ -f "/etc/os-release" ] || [ -f "/etc/debian_version" ]; then
  distroname="Debian"
elif [ -f "/etc/redhat-release" ]; then
  distroname="RHEL"
fi

if [ "$distroname" = "Debian" ]; then
  ### Install apt packages
  sudo sh -c "
    apt update;
    apt upgrade -y;
    apt install		\
      facter		\
      libnotify-bin	\
      nmap		\
      ntp		\
      python3		\
      python3-dev	\
      python3-pip	\
      python3-venv	\
      safe-rm		\
      sl		\
      snapd		\
      speedtest-cli	\
      thefuck		\
      tldr		\
      lm-sensors -y
  "
fi

if [ "$distroname" = "RHEL" ]; then
  ### Install yum packages
  sudo sh -c "
    yum  update;
    yum upgrade -y;
    yum install		\
      epel-release	\
      facter		\
      libnotify-bin	\
      nmap		\
      ntp		\
      python3		\
      python3-dev	\
      python3-pip	\
      python3-venv	\
      safe-rm		\
      speedtest-cli	\
      thefuck		\
      tldr		\
      lm-sensors -y
  "
fi

### Install Pip3 packages
pip3 install		\
  thefuck

### Hide bash_profile.d.
if [ -d ~/bash_profile.d ]; then
  sudo chown -R $(whoami) ~/bash_profile.d;
  mv ~/bash_profile.d ~/.bash_profile.d
fi

### Save existing profile.
if [ ! -f ~/.profile.original ];then
  mv ~/.profile ~/.profile.original
  ln -s ~/.bash_profile.d/profile ~/.profile
fi

### Save existing bashrc.
if [ ! -f ~/.bashrc.original ];then
  mv ~/.bashrc ~/.bashrc.original
  ln -s ~/.bash_profile.d/bashrc ~/.bashrc
fi

### Load new profile
if [ -f ~/.profile ]; then
  source ~/.profile
elif [ -f ~/.bashrc ]
  source ~/.bashrc
fi
