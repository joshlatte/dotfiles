eval "$(rbenv init -)"
setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

GPG_TTY=$(tty)

export GPG_TTY
export PATH="/usr/local/opt/node@10/bin:$PATH" # This is used on MB 12, can be commented out
export PATH=$HOME/local/bin:$PATH
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=15
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_DEFAULT_OPTS=''
