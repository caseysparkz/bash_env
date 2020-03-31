### Run as root
#! /bin/bash

### Change ownership to user and hide bash_profile.d.
if [ -d ~/bash_env ]; then
	sudo chown -R $(whoami) ~/bash_env
	mv ~/bash_env ~/.bash
fi

### Install packages based on Linux distro.
if [ -f "/etc/debian_version" ]; then
	~/.bash/distro_packages/debian.sh
elif [ -f "/etc/redhat-release" ]; then
 	~/.bash/distro_packages/rhel.sh
elif [ -f "/etc/arch-release" ]; then
	~/.bash/distro_packages/arch.sh
fi

### Save existing profile.
if [ ! -f ~/.profile.original ]; then
	mv ~/.profile ~/.profile.original
	ln -s ~/.bash/profile ~/.profile
fi

### Save existing bashrc.
if [ ! -f ~/.bashrc.original ]; then
	mv ~/.bashrc ~/.bashrc.original
	ln -s ~/.bash/bashrc ~/.bashrc
fi

### Load new profile
source ~/.profile
source ~/.bashrc
