#! /bin/bash

### Delete installed profile if it exists and replace with saved profile.
if [ $(head -n 1 ${HOME}/.profile)="###transnat" ]; then
	rm ${HOME}/.profile
  
	if [ -f ${HOME}/.profile.original ]; then
		mv ${HOME}/.profile.original ${HOME}/.profile
	fi
fi

### Delete installed bashrc if it exists and replace with saved bashrc.
if [ $(head -n 1 ${HOME}/.bashrc)="###transnat" ]; then
	rm ${HOME}/.bashrc
  
	if [ -f ${HOME}/.bashrc.original ]; then
		mv ${HOME}/.bashrc.original ${HOME}/.bashrc
	fi
fi

### Delete installed screenrc if it exists and replace with saved screenrc.
if [ $(head -n 1 ${HOME}/.screenrc)="###transnat" ]; then
	rm ${HOME}/.screenrc
  
	if [ -f ${HOME}/.screenrc.original ]; then
		mv ${HOME}/.screenrc.original ${HOME}/.screenrc
	fi
fi

### Delete profile folder if it exists.
if [ -d ${HOME}/.bash ]; then
	rm -rf ${HOME}/.bash
fi

### Load old profile.
source ${HOME}/.profile
