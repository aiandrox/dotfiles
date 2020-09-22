# Rails Command
alias be='bundle exec'
alias bi='bundle install'
alias rs='bundle exec rails server'
alias rc='rails console'
alias mig='bundle exec rails db:migrate'

# git command
alias g='git'
alias gca='git commit --amend'

# dockerコンテナに入る。deで実行できる
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# peco settings
# 過去に実行したコマンドを選択。ctrl-rにバインド
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# search a destination from cdr list
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH="$HOME/.anyenv/envs/rbenv/shims/gem:$PATH"
export PATH="$PATH:$HOME/.flutter/flutter/bin"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH="$PATH:`yarn global bin`"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH=$PATH:$GOPATH/bin # go path
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
