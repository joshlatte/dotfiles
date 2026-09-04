dotfiles
========

> **Status:** Only `omarchy/tmux/` is current and maintained. Everything else in
> this repo is legacy from an older macOS setup and is **deprecated** — see
> [Deprecated](#deprecated) below. `bootstrap.sh` and `omarchy/setup.sh` will
> refuse to run.

Current: tmux on Omarchy
========

Omarchy ships its own `~/.config/tmux/tmux.conf` and owns it — `omarchy refresh
tmux` overwrites the file. So personal keybindings live in a separate
`omarchy/tmux/user.conf`, sourced from the last line of Omarchy's config. That
way they survive a refresh, and they stay out of the way of `omarchy theme set`.

```
cd ~/dotfiles/omarchy/tmux
./install.sh
```

Symlinks `user.conf` to `~/.config/tmux/user.conf`, appends the include line to
Omarchy's `tmux.conf`, and reloads a running server. Idempotent — re-run it
after `omarchy refresh tmux` to restore the include line.

It touches **tmux only**. It does not symlink nvim, alacritty, or hypr configs.

What it adds
------------

| Key | Action |
|---|---|
| `Ctrl+h` / `j` / `k` / `l` | Focus pane left / down / up / right |
| `prefix` + `Ctrl+L` | Clear the visible screen, **keep** scrollback (prefix is `Ctrl+a`) |
| `prefix` + `Ctrl+K` | Clear screen **and** wipe scrollback — destructive, not undoable |

Pane navigation is passed through to the editor when the pane is running
vim/nvim/view/gvim/helix, so editor splits keep working. Detection uses a tmux
format test (`if-shell -F`) rather than shelling out to `grep`, so no subprocess
is spawned per keypress.

These sit *alongside* Omarchy's defaults — its `Ctrl+Alt+Arrow` pane navigation,
`Alt+1..9` window switching and the rest are untouched. Bindings carry `-N`
descriptions so they show up in the `SUPER+ALT+K` tmux keybindings menu.

**Trade-off:** grabbing `Ctrl+h/j/k/l` at the tmux root level takes them from
readline. Inside tmux you lose `Ctrl+K` (kill-line), `Ctrl+H`
(backward-delete-char) and `Ctrl+J` (accept-line), and plain `Ctrl+L` no longer
clears — that moved to `prefix + Ctrl+L`.

Pairs with `christoomey/vim-tmux-navigator` on the nvim side (spec in
`omarchy/nvim/lua/plugins/`, part of the deprecated tree). Not required — the
tmux side detects editors by process name and works standalone.

Current: Hyprland on the MacBook10,1
========

**This machine only.** `omarchy/hypr/macbook10-1/` holds hardware-specific
Hyprland config for the 2017 MacBook10,1 and is wrong on anything else:

- `monitors.lua` — 1.6 scale for the 2304x1440 panel, plus a Dell S2721DGF
  docked to the physical left at 1.25 scale
- `input.lua` — MacBook trackpad: tap-to-click off, middle-click-paste off

```
~/dotfiles/omarchy/hypr/macbook10-1/install.sh
```

The script reads `/sys/class/dmi/id/product_name` and **refuses to run** unless
it reports `MacBook10,1`. Don't remove that guard — these symlinks on another
box give you a wrong display layout and a trackpad that feels broken. It
symlinks both files, then validates with `hyprctl reload` + `hyprctl
configerrors`. Idempotent.

`bindings.lua` is deliberately not tracked: it currently has zero non-comment
lines, so there is nothing machine-specific to keep.

Deprecated
========

Kept for reference only. None of it is maintained or verified against a current
system. Both scripts exit unless passed `--i-know-this-is-deprecated`.

- **`bootstrap.sh`** — symlinks the old macOS set (`vimrc`, `gitconfig`,
  `zshrc`, `tmux.conf`, …) into `$HOME`. On Omarchy the `tmux.conf` entry is
  actively harmful: tmux loads **both** `~/.tmux.conf` and
  `~/.config/tmux/tmux.conf`, so it pulls the old config in underneath
  Omarchy's and clobbers `terminal-overrides`, killing truecolor.
- **`omarchy/setup.sh`** — written for an older Omarchy that used
  `~/.config/hypr/*.conf`. Current Omarchy is Lua (`bindings.lua`, `input.lua`,
  `monitors.lua`) and never reads those `.conf` files, so the symlinks land
  dead. It also replaces `~/.config/nvim` and `~/.config/alacritty` with stale
  copies.
- **`omarchy/hypr/*.conf`** — dead. Current Omarchy reads `.lua`; these
  `.conf` files are never loaded. Superseded by `omarchy/hypr/macbook10-1/`.
- **`omarchy/nvim/`, `omarchy/alacritty/`** — never installed on the current
  machine; the live configs were set up directly.
- **`vimrc`, `gvimrc`, `zshrc`, `bashrc`, `bash_profile`, `pryrc`, `gitconfig`,
  `gitignore`, `git-completion.bash`, `tmux.conf`, `vscode/`, `openvpn/`,
  `Procfile`** — macOS-era, unused.

`omarchy/macbook-keyboard-luks-fix.md` and `fix-macbook-keyboard-luks.sh` are
hardware notes, not dotfiles — still potentially useful, unverified.
