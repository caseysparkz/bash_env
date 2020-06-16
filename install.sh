# /bin/bash

### Change ownership to user and hide bash_profile.d.
chown -R $(whoami) ~/bash_env
mv ~/bash_env ~/.bash

### Install packages for installed distro or exit if distro not supported.
if [ -f /etc/debian_version ]; then
  sudo sh -c "
    apt update &&
    apt upgrade -y &&
    cat ~/.bash/distro_packages/packages.txt |
    xargs apt install -y
  "
  #	~/.bash/distro_packages/debian.sh

elif [ -f /etc/redhat-release ]; then
  sudo sh -c "
    yum update &&
    yum upgrade -y &&
    cat ~/.bash/distro_packages/packages.txt |
    xargs yum install -y
  "
  # 	~/.bash/distro_packages/rhel.sh

elif [ -f /etc/arch-release ]; then
  cat ~/.bash/distro_packages/packages.txt |
  xargs sudo pacman -Syu --no-confirm
  #	~/.bash/distro_packages/arch.sh

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
ln -s ~/.bash/screen.d/screenrc ~/.screenrc

### Load new profile
source ~/.profile

