#! /bin/bash

### Delete installed profile if it exists and replace with saved profile.
if [ $(head -n 1 ~/.profile)="###transnat" ]; then
	rm ~/.profile
  
	if [ -f ~/.profile.original ]; then
		mv ~/.profile.original ~/.profile
	fi
fi

### Delete installed bashrc if it exists and replace with saved bashrc.
if [ $(head -n 1 ~/.bashrc)="###transnat" ]; then
	rm ~/.bashrc
  
	if [ -f ~/.bashrc.original ]; then
		mv ~/.bashrc.original ~/.bashrc
	fi
fi

### Delete installed screenrc if it exists and replace with saved screenrc.
if [ $(head -n 1 ~/.screenrc)="###transnat" ]; then
	rm ~/.screenrc
  
	if [ -f ~/.screenrc.original ]; then
		mv ~/.screenrc.original ~/.screenrc
	fi
fi

### Delete profile folder if it exists.
if [ -d ~/.bash ]; then
	rm -rf ~/.bash
fi

### Load old profile.
source ~/.profile
