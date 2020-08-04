!/bin/bash
### Installer for preferred packages.

### Install packages for installed distro or exit if distro not supported.
if [ -f /etc/debian_version ]; then
  sudo sh -c "
    apt update &&
    apt upgrade -y &&
    apt install -y $(cat ${HOME}/.env/packages/apt.txt)
  "

elif [ -f /etc/redhat-release ]; then
  sudo sh -c "
    dnf update &&
    dnf upgrade -y &&
    dnf install -y $(cat ${HOME}/.env/packages/dnf.txt)
  "

elif [ -f /etc/arch-release ]; then
  sudo pacman -Syu --noconfirm $(cat ${HOME}/.env/packages/arch.txt)

else
  echo "Unknown distro";
  exit
fi

### Symlink snap.
if [ ! -L /snap ] && [ -d /var/lib/snapd/snap ]; then
  sudo ln -s /var/lib/snapd/snap /snap
fi


### Install pip3 packages.
sudo pip3 install $(cat ${HOME}/.env/packages/pip3.txt)
