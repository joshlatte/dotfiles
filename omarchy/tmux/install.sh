#!/bin/bash
############################
# tmux personal overrides for Omarchy
#
# Standalone on purpose. Touches ONLY tmux -- it does not symlink nvim,
# alacritty, or hypr configs. Do not fold this into ../setup.sh (deprecated).
#
# Omarchy ships and owns ~/.config/tmux/tmux.conf; `omarchy refresh tmux`
# overwrites it. So personal keybindings live in a separate user.conf that is
# sourced from the last line of Omarchy's config. Re-run this after a refresh
# to restore the include line. Idempotent.
############################
set -euo pipefail

dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
tmux_config_dir=$HOME/.config/tmux

echo "Setting up tmux overrides from $dir"

mkdir -p "$tmux_config_dir"

# 1. Symlink user.conf
if [ -L "$tmux_config_dir/user.conf" ]; then
    echo "  Existing symlink for user.conf, skipping"
elif [ -e "$tmux_config_dir/user.conf" ]; then
    echo "  Backing up existing user.conf to user.conf.backup"
    mv "$tmux_config_dir/user.conf" "$tmux_config_dir/user.conf.backup"
    ln -s "$dir/user.conf" "$tmux_config_dir/user.conf"
    echo "  Created symlink for user.conf"
else
    ln -s "$dir/user.conf" "$tmux_config_dir/user.conf"
    echo "  Created symlink for user.conf"
fi

# 2. Make sure Omarchy's tmux.conf sources it
if [ ! -f "$tmux_config_dir/tmux.conf" ]; then
    echo "  Warning: $tmux_config_dir/tmux.conf not found -- is Omarchy installed?"
    echo "  Skipped adding the include line."
elif grep -q "user.conf" "$tmux_config_dir/tmux.conf"; then
    echo "  tmux.conf already sources user.conf, skipping"
else
    printf '\n# Personal overrides (keybindings only). Keep this last.\nsource-file -q ~/.config/tmux/user.conf\n' \
        >> "$tmux_config_dir/tmux.conf"
    echo "  Added user.conf include to tmux.conf"
fi

# 3. Reload if a server is running
if tmux list-sessions >/dev/null 2>&1; then
    tmux source-file "$tmux_config_dir/tmux.conf"
    echo "  Reloaded running tmux server"
fi

echo "Done."
