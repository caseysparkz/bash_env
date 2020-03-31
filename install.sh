### Run as root
#! /bin/bash

### Change ownership to user and hide bash_profile.d.
if [ -d ~/bash_profile.d ]; then
	sudo chown -R $(whoami) ~/bash_profile.d
	mv ~/bash_profile.d ~/.bash_profile.d
fi

### Install packages based on Linux distro.
if [ -f "/etc/debian_version" ]; then
	~/.bash_profile.d/distro_packages/debian.sh
elif [ -f "/etc/redhat-release" ]; then
 	~/.bash_profile.d/distro_packages/rhel.sh
elif [ -f "/etc/arch-release" ]; then
	~/.bash_profile.d/distro_packages/arch.sh
fi

### Save existing profile.
if [ ! -f ~/.profile.original ]; then
	mv ~/.profile ~/.profile.original
	ln -s ~/.bash_profile.d/profile ~/.profile
fi

### Save existing bashrc.
if [ ! -f ~/.bashrc.original ]; then
	mv ~/.bashrc ~/.bashrc.original
	ln -s ~/.bash_profile.d/bashrc ~/.bashrc
fi

### Load new profile
source ~/.profile
source ~/.bashrc
