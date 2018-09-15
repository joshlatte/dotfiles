asdfexport PATH=$HOME/local/bin:$PATH

export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
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

eval "$(rbenv init -)"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash