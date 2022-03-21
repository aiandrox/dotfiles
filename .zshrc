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

# 過去に移動したことのあるディレクトリを選択。ctrl-uにバインド
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

export PATH="$PATH:`yarn global bin`"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home
PATH=/usr/local/opt/openssl@1.1/bin:/Users/k_end/.anyenv/envs/rbenv/shims/gem:/Users/k_end/.anyenv/envs/rbenv/shims:/Users/k_end/.anyenv/envs/rbenv/bin:/Users/k_end/.anyenv/envs/nodenv/shims:/Users/k_end/.anyenv/envs/nodenv/bin:/Users/k_end/.anyenv/bin:/usr/local/opt/openssl@1.1/bin:/Users/k_end/.anyenv/envs/rbenv/shims/gem:/Users/k_end/.anyenv/envs/rbenv/shims:/Users/k_end/.anyenv/envs/rbenv/bin:/Users/k_end/.anyenv/envs/nodenv/shims:/Users/k_end/.anyenv/envs/nodenv/bin:/Users/k_end/.anyenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/openssl@1.1/bin:/Users/k_end/.anyenv/envs/rbenv/shims/gem:/Users/k_end/.anyenv/envs/rbenv/shims:/Users/k_end/.anyenv/envs/rbenv/bin:/Users/k_end/.anyenv/envs/nodenv/shims:/Users/k_end/.anyenv/envs/nodenv/bin:/Users/k_end/.anyenv/bin:/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin:/usr/local/bin:/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin:/usr/local/bin:/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin:/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin
