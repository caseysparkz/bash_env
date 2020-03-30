### Run as root
#! /bin/bash
sudo sh -c "
	pacman -Syu;
	pacman -S
		facter		\
		libnotify-bin	\
		lm-sensors	\
		nmap		\
		ntp		\
		python		\
		python-dev	\
		python-pip	\
		python-venv	\
		sl		\
		snapd		\
		speedtest-cli	\
		thefuck		\
		tldr		\
		vim
"
if [ ! -L /snap ]; then
	sudo ln -s /var/lib/snapd/snap /snap
fi
