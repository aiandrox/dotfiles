# Rails Command
alias be='bundle exec'
alias bi='bundle install'
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias rubo='bundle exec rubocop'
alias sp='bundle exec rspec'
alias rstop='for x in `lsof -i:3000 | awk '\''{print $2}'\'' | grep -v PID` ; do kill -9 $x ; done'

# git command
alias g='git'

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

### 過去に移動したことのあるディレクトリを選択。ctrl-uにバインド
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey '^u' peco-cdr

# ブランチを簡単切り替え。git switch lbで実行できる
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'


# cdの後にlsを表示
setopt auto_cd
function chpwd() { ls }

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# 会社の方
export PATH="$HOME/.anyenv/envs/rbenv/shims/gem:$PATH"
export PATH="$PATH:`yarn global bin`"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# privateの方
export PATH="$HOME/.anyenv/envs/rbenv/shims/gem:$PATH"
export PATH="$PATH:$HOME/.flutter/flutter/bin"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH="$PATH:`yarn global bin`"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH=$PATH:$GOPATH/bin # go path
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
