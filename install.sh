#!/bin/bash
INSTALL_TO=~/.dotfiles
BACKUP_TO=~/.dotfiles_backup
EXCLUDED_FILES="LICENSE README.md"

CURRENT_DIR=`pwd`

backup () {
  cd ~
  destination=$BACKUP_TO/$(date +"%Y-%m-%d_%H-%M-%S")
  mv -v .vim* $destination/
}

install () {
  cd $CURRENT_DIR
  mkdir -p $INSTALL_TO
  # Download vim plugin bundles
  git submodule init
  git submodule update

  cp -rv * "$INSTALL_TO"
  # Symlink ~/.vim and ~/.vimrc
  cd ~
  ln -sf "$INSTALL_TO/vimrc" .vimrc
  ln -sf "$INSTALL_TO/vim" .vim

  echo "Installed and configured .vim, have fun."
}

backup
install

#Installing the plugins
vim +PluginInstall +qall
