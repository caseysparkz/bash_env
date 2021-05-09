#!/bin/env bash
### Installer for preferred packages.

### Variable declarations.
PACKAGEFILE=${HOME}/.env/packages/distro-packages.txt
SNAPFILE=${HOME}/.env/packages/snap-packages.txt
PIPFILE=${HOME}/.env/packages/pip-packages.txt

### Install packages for distro or exit if distro not supported.
if [ -f ${PACKAGEFILE} ]; then
	if [ -f /etc/debian_version ]; then
			sudo sh -c "
			apt update &&
			apt upgrade -y &&
			apt install -y $(cat ${PACKAGEFILE})
		"

	elif [ -f /etc/redhat-release ]; then
		sudo sh -c "
			dnf update &&
			dnf upgrade -y &&
			dnf install -y $(cat ${PACKAGEFILE})
		"

	elif [ -f /etc/arch-release ]; then
		sudo pacman -Syu --noconfirm $(cat ${PACKAGEFILE})

	else
		echo "Unknown distro";
		exit
	fi
fi

### Symlink snap.
if [ ! -L /snap ] && [ -d /var/lib/snapd/snap ] && [ -x $(which snap) ]; then
  sudo ln -s /var/lib/snapd/snap /snap

	### Install snap packages.
	if [ -f ${SNAPFILE} ]; then
		snap install $(cat ${SNAPFILE})
	fi
fi


### Install pip3 packages.
if [ -f $(which pip) ] && [ -f ${PIPFILE} ]; then
	sudo pip3 install $(cat ${PIPFILE})
fi
