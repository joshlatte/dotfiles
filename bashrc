PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$HOME/local/bin:$PATH

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PGHOST=localhost

alias gco='git co'
alias gci='git ci'
alias grb='git rb'

alias ll='ls -la'

alias gbr='git br'

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PATH=/usr/local/bin:$PATH

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# All ENV related to Android development for windows
export ANDROID_HOME=/mnt/c/Users/joshlatte/AppData/Local/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
alias emu6p="emulator.exe -avd Nexus_6p_API_23"
# END

#export PATH="./bin:$PATH"
#export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.yarn/bin:$PATH"
