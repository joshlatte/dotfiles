#!/bin/bash
############################
# .make.sh
source_dir=$HOME/dotfiles/vscode
target_dir=$HOME/Library/Application\ Support/Code/User                    # settings directory
backup_dir=$target_dir/original_settings                                  # original settings backup
files="keybindings.json material-icon-theme.json settings.json snippets"    # list of files/folders to symlink in homedir

##########

echo "Backing up old settings"
mkdir -p "$backup_dir"
echo "...done"

echo "Changing to source directory: $source_dir"
cd $source_dir
echo "...done"

# move any existing settings json to backup directory, then create symlinks
for file in $files; do
    echo "Moving original $file to $backup_dir/$file"
    mv "$target_dir/$file" "$backup_dir/"
    echo "Creating symlink to source $file in target directory."
    ln -s $source_dir/$file "$target_dir/$file"
    echo $'...done\n'
done
