GPG_TTY=$(tty)

export GPG_TTY
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

export PATH=$HOME/local/bin:$PATH
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"

alias dc='docker-compose'

# aliases are in .gitconfig
alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias gbr='git br'

alias ll='ls -la'

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PATH=/usr/local/bin:$PATH

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash

# Installed with brew install bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh" ]; then
  source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
