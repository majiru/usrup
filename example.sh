#!/bin/sh

# Build a repo called folderName using meson, do not install
git_repo_do folderName meson_build

# Build the repo and install using sudo
git_repo_do folderName meson_build meson_install

#Define custom build instructions for a repo
git_repo_do otherFolder 'SOMEVAR=value make' 'PREFIX=/usr/local sudo make install'

#Always build and install a project using make
usrup_do thirdFolder false make make_install
