### Run as root
#! /bin/bash
sudo sh -c "
	apt update;
	apt upgrade -y;
	apt install -y	\
		facter		\
		libnotify-bin	\
		lm-sensors	\
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
		vim
"
