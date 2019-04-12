#!/bin/bash

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -s ${ROOT_DIR}/.bash_profile ${HOME}/
ln -s ${ROOT_DIR}/.bashrc ${HOME}/
ln -s ${ROOT_DIR}/.bashrc.global ${HOME}/
ln -s ${ROOT_DIR}/.emacs.d ${HOME}/
ln -s ${ROOT_DIR}/.gdbinit ${HOME}/
ln -s ${ROOT_DIR}/.tmux ${HOME}/
ln -s ${ROOT_DIR}/.tmux.conf ${HOME}/
ln -s ${ROOT_DIR}/.vimrc ${HOME}/
ln -s ${ROOT_DIR}/.vim ${HOME}/
ln -s ${ROOT_DIR}/.zshrc ${HOME}/
ln -s ${ROOT_DIR}/.zsh ${HOME}/

mkdir -p ${HOME}/.config
ln -s ${ROOT_DIR}/.config/nvim ${HOME}/.config
ln -s ${ROOT_DIR}/.config/vifm ${HOME}/.config

exit 0
