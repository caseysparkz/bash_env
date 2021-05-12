#!/bin/env bash

### Change ownership to user and hide directory.
chown -R $(whoami) ${HOME}/env
mv ${HOME}/env ${HOME}/.env

### Remove existing profile and symlink new profile.
if [ -f ${HOME}/.profile ] && [ ! -L ${HOME}/.profile ]; then
  rm ${HOME}/.profile
fi
ln -s ${HOME}/.env/profile ${HOME}/.profile

### Remove existing bashrc and symlink new bashrc.
if [ -f ${HOME}/.bashrc ] && [ ! -L ${HOME}/.bashrc ]; then
  rm ${HOME}/.bashrc
fi
ln -s ${HOME}/.env/bashrc ${HOME}/.bashrc


### Remove existing screenrc and symlink to new bashrc.
if [ -f ${HOME}/.screenrc ] && [ ! -L ${HOME}/.screenrc ]; then
  rm ${HOME}/.screenrc
fi
ln -s ${HOME}/.env/screen/screenrc ${HOME}/.screenrc

### Remove vim settings and symlink to new settings.
if [ -d ${HOME}/.vim ] && [ ! -L ${HOME}/.vim ]; then
  rm -rf ${HOME}/.vim
fi
ln -s ${HOME}/.env/vim ${HOME}/.vim

if [ -f ${HOME}/.vimrc ] && [ ! -L ${HOME}/.vimrc ]; then
  rm ${HOME}/.vimrc
fi
ln -s ${HOME}/.env/vim/vimrc ${HOME}/.vimrc

### Load new profile
source ${HOME}/.profile
