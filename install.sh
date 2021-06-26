#!/bin/env bash

### Change ownership to user and hide directory.
chown -R $(whoami):$(whoami) ${HOME}/env
mv ${HOME}/env ${HOME}/.env

### Remove existing profile and symlink new profile.
rm ${HOME}/.profile
ln -s ${HOME}/.env/profile ${HOME}/.profile

### Remove existing bashrc and symlink new bashrc.
rm ${HOME}/.bashrc
ln -s ${HOME}/.env/bashrc ${HOME}/.bashrc

### Remove existing screenrc and symlink to new bashrc.
rm ${HOME}/.screenrc
ln -s ${HOME}/.env/screen/screenrc ${HOME}/.screenrc

### Remove vim settings and symlink to new settings.
rm -rf ${HOME}/.vim
ln -s ${HOME}/.env/vim ${HOME}/.vim

rm ${HOME}/.vimrc
ln -s ${HOME}/.env/vim/vimrc ${HOME}/.vimrc

### Remove git config and symlink to new settings.
rm ${HOME}/.gitconfig
ln -s ${HOME}/.env/git/gitconfig ${HOME}/.gitconfig

### Load new profile
source ${HOME}/.profile
