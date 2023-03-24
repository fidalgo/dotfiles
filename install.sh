#!/bin/bash
VIM_HOME=~/.vim
BACKUP_TO=~/.dotfiles_backup
EXCLUDED_FILES="LICENSE README.md"
BIN_DIR=~/bin

CURRENT_DIR=`pwd`

backup () {
  cd ~
  destination=$BACKUP_TO/$(date +"%Y-%m-%d_%H-%M-%S")
  mv -v .vim* $destination/
}

add_code_to_bashrc() {
  code_to_add="$1"
  unique_pattern="$2"

  if ! grep -qF "$unique_pattern" "$HOME/.bashrc"; then
    echo "$code_to_add" >> "$HOME/.bashrc"
  fi
}

bash(){
  code=$(cat <<'EOF'
    if [[ -d "$HOME"/.config/bashrc.d ]] ; then
      for config in $HOME/.config/bashrc.d/*.bash ; do
        . "$config"
      done
    fi
EOF
)

echo "Copying bashrc.d files"
cp -rv bashrc.d "$HOME/.config/"

echo "Adding code to load .config/bashrc.d/* files"
pattern='if [[ -d "$HOME"/.config/bashrc.d ]] ; then'
add_code_to_bashrc "$code" "$pattern"
}

vim_settings(){
  echo "Installing vim-plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Copying .vimrc"
  cp -v vimrc ~/.vimrc

  echo "Copying vim plugins and settings"
  cp -rv vim/* "$VIM_HOME"
}

config(){
  echo "Copying config files"
  for file in config/*;
  do
    cp -v "$file" ~/.$(basename $file);
  done
}

execute(){
  local function="$1"
  TIMEFORMAT="$function elapsed time: %R s, %U user, %S system, %P CPU, %E real"
  (time $function) 2>&1
  echo "--------------------------------------------------------------------------------"
}

reset(){
  echo "Reseting configs"
  rm -rvf "$HOME/.config/bashrc.d" ~/.vim ~/.vimrc
  uninstall_packages
}

install() {
  cd $CURRENT_DIR
  mkdir -p $VIM_HOME
  if [ $OPT = "--reset" ]; then
    execute "reset"
  fi
  execute bash
  execute vim_settings
  execute config
  execute install_packages
}

OPT=$1

# load packages script
. packages.sh

install

#Installing the plugins
vim -es -u vimrc -i NONE -c "PlugUpdate" -c "qa"

echo "🎉🎉🎉 All Installed and configured, have fun.🎉🎉🎉"
