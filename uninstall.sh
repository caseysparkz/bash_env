#! /bin/bash
#sudo sh -c "
#  apt --purge remove	\
#    facter		\
#    libnotify-bin	\
#    ntp			\
#    python3		\
#    safe-rm		\
#    sl			\
#    snapd		\
#    speedtest-cli	\
#    thefuck		\
#    tldr		\
#    lm-sensors -y;
#
#  apt --purge autoremove -y;
#  apt autoclean"

if [ $(head -n 1 ~/.bashrc)="###transnat" ]; then
  rm ~/.bashrc
fi

if [ -f ~/.bashrc.original ]; then
  mv ~/.bashrc.original ~/.bashrc
fi

if [ -d ~/.bash_profile.d ]; then
  rm -rf ~/.bash_profile.d
fi

if [ -d ~/bash_profile.d ]; then
  rm -rf ~/bash_profile.d
fi


