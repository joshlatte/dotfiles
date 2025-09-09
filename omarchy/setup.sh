#!/bin/bash
############################
# Omarchy (Arch Linux) setup script
# This script sets up Hyprland configs and other Arch-specific settings
############################

########## Variables
dir=$PWD                           # current directory (should be ~/dotfiles/omarchy)
hypr_config_dir=$HOME/.config/hypr
nvim_config_dir=$HOME/.config/nvim
alacritty_config_dir=$HOME/.config/alacritty

##########

echo "Setting up Omarchy (Arch Linux) configurations..."

# Create hypr config directory if it doesn't exist
if [ ! -d "$hypr_config_dir" ]; then
    echo "Creating $hypr_config_dir directory..."
    mkdir -p $hypr_config_dir
fi

# Setup Hyprland monitors.conf
if [ -f "$dir/hypr/monitors.conf" ]; then
    if [ -L "$hypr_config_dir/monitors.conf" ]; then
        echo "Existing symlink for monitors.conf, skipping"
    elif [ -f "$hypr_config_dir/monitors.conf" ]; then
        echo "Backing up existing monitors.conf to monitors.conf.backup"
        mv $hypr_config_dir/monitors.conf $hypr_config_dir/monitors.conf.backup
        ln -s $dir/hypr/monitors.conf $hypr_config_dir/monitors.conf
        echo "Created symlink for monitors.conf"
    else
        ln -s $dir/hypr/monitors.conf $hypr_config_dir/monitors.conf
        echo "Created symlink for monitors.conf"
    fi
else
    echo "Warning: hypr/monitors.conf not found in dotfiles"
fi

# Setup Hyprland bindings.conf
if [ -f "$dir/hypr/bindings.conf" ]; then
    if [ -L "$hypr_config_dir/bindings.conf" ]; then
        echo "Existing symlink for bindings.conf, skipping"
    elif [ -f "$hypr_config_dir/bindings.conf" ]; then
        echo "Backing up existing bindings.conf to bindings.conf.backup"
        mv $hypr_config_dir/bindings.conf $hypr_config_dir/bindings.conf.backup
        ln -s $dir/hypr/bindings.conf $hypr_config_dir/bindings.conf
        echo "Created symlink for bindings.conf"
    else
        ln -s $dir/hypr/bindings.conf $hypr_config_dir/bindings.conf
        echo "Created symlink for bindings.conf"
    fi
else
    echo "Warning: hypr/bindings.conf not found in dotfiles"
fi

# Setup Hyprland input.conf
if [ -f "$dir/hypr/input.conf" ]; then
    if [ -L "$hypr_config_dir/input.conf" ]; then
        echo "Existing symlink for input.conf, skipping"
    elif [ -f "$hypr_config_dir/input.conf" ]; then
        echo "Backing up existing input.conf to input.conf.backup"
        mv $hypr_config_dir/input.conf $hypr_config_dir/input.conf.backup
        ln -s $dir/hypr/input.conf $hypr_config_dir/input.conf
        echo "Created symlink for input.conf"
    else
        ln -s $dir/hypr/input.conf $hypr_config_dir/input.conf
        echo "Created symlink for input.conf"
    fi
else
    echo "Warning: hypr/input.conf not found in dotfiles"
fi

# Setup Alacritty config
if [ ! -d "$alacritty_config_dir" ]; then
    echo "Creating $alacritty_config_dir directory..."
    mkdir -p $alacritty_config_dir
fi

if [ -f "$dir/alacritty/alacritty.toml" ]; then
    if [ -L "$alacritty_config_dir/alacritty.toml" ]; then
        echo "Existing symlink for alacritty.toml, skipping"
    elif [ -f "$alacritty_config_dir/alacritty.toml" ]; then
        echo "Backing up existing alacritty.toml to alacritty.toml.backup"
        mv $alacritty_config_dir/alacritty.toml $alacritty_config_dir/alacritty.toml.backup
        ln -s $dir/alacritty/alacritty.toml $alacritty_config_dir/alacritty.toml
        echo "Created symlink for alacritty.toml"
    else
        ln -s $dir/alacritty/alacritty.toml $alacritty_config_dir/alacritty.toml
        echo "Created symlink for alacritty.toml"
    fi
else
    echo "Warning: alacritty/alacritty.toml not found in dotfiles"
fi

# Setup Neovim config
if [ -d "$dir/nvim" ]; then
    if [ -L "$nvim_config_dir" ]; then
        echo "Existing symlink for nvim config, skipping"
    elif [ -d "$nvim_config_dir" ]; then
        echo "Backing up existing nvim config to $nvim_config_dir.backup"
        mv $nvim_config_dir $nvim_config_dir.backup
        ln -s $dir/nvim $nvim_config_dir
        echo "Created symlink for nvim config"
    else
        mkdir -p $(dirname $nvim_config_dir)
        ln -s $dir/nvim $nvim_config_dir
        echo "Created symlink for nvim config"
    fi
else
    echo "Warning: nvim directory not found in dotfiles"
fi

echo ""
echo "Omarchy setup complete!"
echo ""
echo "Additional steps:"
echo "1. For MacBook keyboard LUKS fix, run: sudo ./fix-macbook-keyboard-luks.sh"
echo "2. Open Neovim and run :Lazy to install plugins"
echo "3. Remember to reload Hyprland config after changes"