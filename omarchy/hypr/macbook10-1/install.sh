#!/bin/bash
############################
# Hyprland config for THIS MACHINE ONLY: the 2017 MacBook10,1.
#
# These settings are hardware-specific and WRONG on any other machine:
#   monitors.lua  1.6 scale for the 2304x1440 panel, plus a Dell S2721DGF
#                 docked to the physical left at 1.25 scale.
#   input.lua     MacBook trackpad -- tap-to-click off, middle-click-paste off.
#
# The script refuses to run on anything that is not a MacBook10,1. Do not
# remove that guard; symlinking these onto another box will give you a wrong
# display layout and a trackpad that feels broken.
#
# Idempotent. Safe to re-run.
############################
set -euo pipefail

EXPECTED_MODEL="MacBook10,1"
dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
hypr_config_dir=$HOME/.config/hypr

model=$(cat /sys/class/dmi/id/product_name 2>/dev/null || echo "unknown")

if [ "$model" != "$EXPECTED_MODEL" ]; then
    echo "REFUSING TO RUN." >&2
    echo "  These configs are only for: $EXPECTED_MODEL" >&2
    echo "  This machine reports:       $model" >&2
    echo "" >&2
    echo "  They would give you a wrong display layout and trackpad." >&2
    exit 1
fi

echo "Machine is $model -- proceeding."

for f in monitors.lua input.lua; do
    if [ -L "$hypr_config_dir/$f" ]; then
        echo "  Existing symlink for $f, skipping"
    elif [ -e "$hypr_config_dir/$f" ]; then
        echo "  Backing up existing $f to $f.backup"
        mv "$hypr_config_dir/$f" "$hypr_config_dir/$f.backup"
        ln -s "$dir/$f" "$hypr_config_dir/$f"
        echo "  Created symlink for $f"
    else
        ln -s "$dir/$f" "$hypr_config_dir/$f"
        echo "  Created symlink for $f"
    fi
done

# Hyprland auto-reloads, but validate explicitly.
if command -v hyprctl >/dev/null 2>&1 && hyprctl monitors >/dev/null 2>&1; then
    hyprctl reload >/dev/null
    errors=$(hyprctl configerrors 2>&1)
    if [ -n "$errors" ] && [ "$errors" != "no errors" ]; then
        echo "  WARNING: hyprctl reported config errors:" >&2
        echo "$errors" >&2
    else
        echo "  Reloaded Hyprland, no config errors"
    fi
fi

echo "Done."
