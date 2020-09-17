
https://progriro.net/zsh-prezto/

```
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# 以下4行を全てコピーして貼り付け、実行する

$ setopt EXTENDED_GLOB
	   for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 		ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	   done
```

`.zshrc`は置いておいてよい。

## brew

デフォルトのzshのパスは`/usr/local/bin/zsh`なので、`brew install zsh`

あえてbrewからインストールする

`brew install git`
`brew install peco`


`brew install yarn`
ついでにnodeとかもインストールされる。
`Installing dependencies for yarn: icu4c and node`
