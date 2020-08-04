#!/bin/bash

if [ -f ${HOME}/.Xresources ]; then
  mv ${HOME}/.Xresources ${HOME}/.Xresources.orig;
  ln -s ${HOME}/.config/Xresources ${HOME}/.Xresources
fi
