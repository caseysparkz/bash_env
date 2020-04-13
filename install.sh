# /bin/bash

### Change ownership to user and hide bash_profile.d.
chown -R $(whoami) ~/bash_env
mv ~/bash_env ~/.bash

### Install packages for installed distro or exit if distro not supported.
if [ -f /etc/debian_version ]; then
	~/.bash/distro_packages/debian.sh
elif [ -f /etc/redhat-release ]; then
 	~/.bash/distro_packages/rhel.sh
elif [ -f /etc/arch-release ]; then
	~/.bash/distro_packages/arch.sh
else
	echo "Unknown distro";
	exit
fi

### Save existing profile and symlink new profile.
if [ -f ~/.profile ] && [ ! -L ~/.profile ]; then
	mv ~/.profile ~/.profile.original
fi
ln -s ~/.bash/profile ~/.profile

### Save existing bashrc and symlink new bashrc.
if [ -f ~/.bashrc] && [ ! -L ~/.bashrc ]; then
	mv ~/.bashrc ~/.bashrc.original
fi
ln -s ~/.bash/bashrc ~/.bashrc

### Save existing screenrc and symlink to new bashrc.
if [ -f ~/.screenrc ] && [ ! -L ~/.screenrc ]; then
	mv ~/.screenrc ~/.screenrc.original
fi
ln -s ~/.bash/screenrc ~/.screenrc

### Load new profile
source ~/.profile
