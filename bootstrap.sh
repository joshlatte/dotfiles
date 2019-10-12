#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=$PWD		                   # dotfiles directory
olddir=$(PWD)_old		           # old dotfiles backup directory
files="vimrc gitconfig gitignore git-completion.bash pryrc tmux.conf zshrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
if [ -d $olddir ]; then
  echo "$olddir exists"
else
  echo "Creating $olddir for backup of any existing dotfiles in ~"
  mkdir -p $olddir
  echo "...done"
fi

# change to the dotfiles directory
echo "Changing directory to $dir"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  if [ -L $HOME/.$file ]
  then
    echo "Existing symlink for .$file, skipping"

  elif [ -f $HOME/.$file ] && [ ! -f $olddir/.$file ]
  then
    mv $HOME/.$file $olddir
    echo "Existing $file, moving to $olddir";
  fi

  ln -s $dir/$file $HOME/.$file
  echo "Creating symlink from $dir/$file to $HOME/.$file"
  echo " "
done

echo "dotfiles extraction complete"
