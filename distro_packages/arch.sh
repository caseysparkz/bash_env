#! /bin/bash
sudo sh -c "
	pacman -Syu \
		facter \
		grok \
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
		vim
    whois --noconfirm
"

if [ ! -L /snap ]; then
	sudo ln -s /var/lib/snapd/snap /snap
fi
