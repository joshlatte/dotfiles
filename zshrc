eval "$(rbenv init -)"
setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

GPG_TTY=$(tty)

export GPG_TTY
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

parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#PS1="$ %~%{$fg[green]%}%{$parse_git_branch%}%{$reset_color%} $ "

PROMPT='[%n@%m %1/]%{$fg[green]%}$(parse_git_branch)%{$reset_color%} $ '

#PS1="%~$fg[green]$parse_git_branch$reset_color $ "# The following lines were added by compinstall
zstyle :compinstall filename '/Users/joshlatte/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
