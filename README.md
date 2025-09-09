dotfiles
========
```
git clone git://github.com/joshlatte/dotfiles.git
cd ~/dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
```

Vundle (https://github.com/VundleVim/Vundle.vim)
`$git clone git@github.com:joshlatte/dotfiles.git ~/.vim/bundle/Vundle.vim`
Launch vim and run `:PluginInstall`

vscode settings
========
```
cd ~/dotfiles/vscode
chmod +x setup.sh
./setup.sh
```


```
System setup

1) Install Homebrew
*  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

2) Install tmux
*  brew install tmux

3) Install fzf
*  brew install fzf

4) Install gpg
*  brew install gpg

5) Install rbenv
* brew install rbenv

6) Install rails
* sudo gem install rails

7) Install yarn + node
* brew install yarn

8) Install Postgresql
* brew install postgresql

9) Install redis
* brew install redis
```

Omarchy (Arch Linux) setup
========
```
cd ~/dotfiles/omarchy
chmod +x setup.sh
./setup.sh
```

This will:
- Set up Hyprland monitor configuration
- Create symlinks for config files

For MacBook keyboard LUKS fix instructions, see: `omarchy/macbook-keyboard-luks-fix.md`
