#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=`pwd`                    # dotfiles directory
olddir=~/tmp/dotfiles_old             # old dotfiles backup directory
files="vimrc vim gemrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# if the olddir doesn't exist create it
[ -d $olddir ] || mkdir $olddir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
  echo "Cleaning the dotfiles backup dir"
  rm -rf $olddir/* $olddir/.*
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv -f ~/.$file $olddir
  echo "Copy $file to home directory."
  cp -r $dir/$file ~/.$file
done 

#Installing the plugins
vim +PluginInstall +qall
