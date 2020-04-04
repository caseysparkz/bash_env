#! /bin/bash
sudo sh -c "
	pacman -Syu;
	pacman -S			\
		facter			\
		libnotify		\
		lm_sensors		\
		nmap			\
		ntp			\
		python			\
		python-pip		\
		python-virtualenv	\
		sl			\
		snapd			\
		speedtest-cli		\
		thefuck			\
		tldr			\
		vim
"

if [ ! -L /snap ]; then
	sudo ln -s /var/lib/snapd/snap /snap
fi
