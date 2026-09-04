#!/bin/bash
############################
# !! DEPRECATED -- DO NOT RUN !!
#
# Symlinks an old macOS-era dotfiles set into $HOME. On an Omarchy box the
# `tmux.conf` entry is actively harmful: tmux loads BOTH ~/.tmux.conf and
# ~/.config/tmux/tmux.conf, so this drags the old config in underneath
# Omarchy's and clobbers terminal-overrides (killing truecolor).
#
# Kept for reference/history only. Nothing here is maintained and it has NOT
# been verified against a current Omarchy install.
#
# For the one piece that is still current, see: omarchy/tmux/install.sh
############################
if [ "${1:-}" != "--i-know-this-is-deprecated" ]; then
    echo "This script is DEPRECATED and is not safe to run as-is." >&2
    echo "It symlinks a stale macOS dotfiles set and breaks tmux truecolor on Omarchy." >&2
    echo "" >&2
    echo "Current setup: omarchy/tmux/install.sh" >&2
    echo "" >&2
    echo "To run anyway: $0 --i-know-this-is-deprecated" >&2
    exit 1
fi

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
