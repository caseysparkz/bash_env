# /bin/bash

### Change ownership to user and hide bash_profile.d.
chown -R $(whoami) ~/bash_env
mv ~/bash_env ~/.bash

### Install packages for installed distro or exit if distro not supported.
if [ -f /etc/debian_version ]; then
  sudo sh -c "
    apt update &&
    apt upgrade -y &&
    cat ~/.bash/packages/debian.txt |
    xargs apt install -y
  "

elif [ -f /etc/redhat-release ]; then
  sudo sh -c "
    yum update &&
    yum upgrade -y &&
    cat ~/.bash/packages/rhel.txt |
    xargs yum install -y
  "

elif [ -f /etc/arch-release ]; then
  cat ~/.bash/packages/arch.txt |
  xargs sudo pacman -Syu --no-confirm

  if [ -L /snap ]; then
    sudo ln -s /var/lib/snapd/snap /snap
  fi

else
  echo "Unknown distro";
  exit
fi

### Install pip3 packages.
cat ${HOME}/.bash/packages/pip3.txt |
xargs pip3 install

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
