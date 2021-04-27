#!/bin/bash
# INSTALL_TO=~/.dotfiles
INSTALL_TO=~/.vim
BACKUP_TO=~/.dotfiles_backup
EXCLUDED_FILES="LICENSE README.md"

CURRENT_DIR=`pwd`

backup () {
  cd ~
  destination=$BACKUP_TO/$(date +"%Y-%m-%d_%H-%M-%S")
  mv -v .vim* $destination/
}

bash(){
#read -d '' code << EOF
code=$(cat <<'EOF'
if [[ -d "$HOME"/.config/bashrc.d ]] ; then
  for config in $HOME/.config/bashrc.d/*.bash ; do
    . "$config"
  done
fi
EOF
)
echo "Copying bashrc files"
cp -rv bashrc.d "$HOME/.config/"

if ! grep -qF '"$HOME"/.bashrc.d/*.bash' "$HOME/.bashrc";then
  echo "$code" >> "$HOME/.bashrc"
fi
}

vim_settings(){
  echo "Installing vim-plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Copying .vimrc"
  cp vimrc ~/.vimrc

  echo "Copying vim plugins and settings"
  cp -rv vim/* "$INSTALL_TO"
}

config(){
  echo "Copying config files"
  for file in config/*;
  do
    cp -v "$file" ~/.$(basename $file);
  done
}

install () {
  cd $CURRENT_DIR
  mkdir -p $INSTALL_TO

  echo  "################################################################################"
  bash
  echo "--------------------------------------------------------------------------------"
  echo  "################################################################################"
  vim_settings
  echo "--------------------------------------------------------------------------------"
  echo  "################################################################################"
  config
  echo "--------------------------------------------------------------------------------"
}

# backup
install

#Installing the plugins
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"


echo "🎉🎉🎉 All Installed and configured, have fun.🎉🎉🎉"
