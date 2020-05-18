#! /bin/bash
sudo sh -c "
	pacman -Syu \
		facter \
		lm_sensors \
		nmap \
		ntp \
		python \
		python-pip \
		python-virtualenv \
		sl \
		snapd \
		speedtest-cli \
		thefuck	\
		tldr \
		vim --noconfirm
"

if [ ! -L /snap ]; then
	sudo ln -s /var/lib/snapd/snap /snap
fi
