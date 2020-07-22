# /bin/bash

### Change ownership to user and hide directory.
chown -R $(whoami) ${HOME}/env
mv ${HOME}/env ${HOME}/.bash

### Install packages for installed distro or exit if distro not supported.
#if [ -f /etc/debian_version ]; then
#  sudo sh -c "
#    apt update &&
#    apt upgrade -y &&
#    cat ${HOME}/.bash/packages/debian.txt |
#    xargs apt install -y
#  "
#
#elif [ -f /etc/redhat-release ]; then
#  sudo sh -c "
#    yum update &&
#    yum upgrade -y &&
#    cat ${HOME}/.bash/packages/rhel.txt |
#    xargs yum install -y
#  "
#
#elif [ -f /etc/arch-release ]; then
#  cat ${HOME}/.bash/packages/arch.txt |
#  xargs sudo pacman -Syu --noconfirm
#
#  if [ -L /snap ]; then
#    sudo ln -s /var/lib/snapd/snap /snap
#  fi
#
#else
#  echo "Unknown distro";
#  exit
#fi
#
#### Install pip3 packages.
#cat ${HOME}/.bash/packages/pip3.txt |
#xargs pip3 install

### Remove existing profile and symlink new profile.
if [ -f ${HOME}/.profile ] && [ ! -L ${HOME}/.profile ]; then
  mv ${HOME}/.profile ${HOME}/.profile.original
fi
ln -s ${HOME}/.bash/profile ${HOME}/.profile

### Remove existing bashrc and symlink new bashrc.
if [ -f ${HOME}/.bashrc ] && [ ! -L ${HOME}/.bashrc ]; then
  rm ${HOME}/.bashrc
fi
ln -s ${HOME}/.bash/bashrc ${HOME}/.bashrc

### Remove existing screenrc and symlink to new bashrc.
if [ -f ${HOME}/.screenrc ] && [ ! -L ${HOME}/.screenrc ]; then
  rm ${HOME}/.screenrc
fi
ln -s ${HOME}/.bash/screen/screenrc ${HOME}/.screenrc

### Remove vim settings and symlink to new settings.
if [ -d ${HOME}/.vim ] && [ ! -L ${HOME}/.vim ]; then
  rm -rf ${HOME}/.vim
fi

ln -s ${HOME}/.bash/vim ${HOME}/.vim

if [ -f ${HOME}/.vimrc ] && [ ! -L ${HOME}/.vimrc ]; then
  rm ${HOME}/.vimrc
fi
ln -s ${HOME}/.bash/vim/vimrc ${HOME}/.vimrc

### Load new profile
source ${HOME}/.profile
