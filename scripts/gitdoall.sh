#!/bin/bash
### gitdoall: Update all git repositories in the home directory.

for DIRECTORY in $HOME/{.env,.config}; do
  cd $DIRECTORY &&
  git add . &&
  git pull &&
  git commit &&
  git push 
done
