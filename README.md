# dotfiles

[Homebrew](https://brew.sh/index_ja)

## エディタ系

https://progriro.net/zsh-prezto/

```
$ git clone --recursive https://github.com/aiandrox/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# 以下4行を全てコピーして貼り付け、実行する

$ setopt EXTENDED_GLOB
	   for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 		ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	   done
```

`.zshrc`は退避しておいたほうがいいかも。

### brew

デフォルトのzshのパスは`/usr/local/bin/zsh`になっている。そのままでもデフォルトでzshがインストールされてはいるんだけど、brewで入れておく。  
gitも`.zshrc`で`/usr/local/etc/bash_completion.d/git-prompt.sh`を読み込むので、brewでインストールする（インストールすると自動でこのファイルが作成される）。

```
brew install zsh git peco yarn
```

yarnをインストールすると、ついでにnodeとかもインストールされる。  
`Installing dependencies for yarn: icu4c and node`

`brew install anyenv`でanyenvを入れておく。  
ついでにpluginも。  
[anyenvの\*envたちを一括でアップデートする \- Qiita](https://qiita.com/sawadashota/items/825002d84088c0129c4b)
[direnvを使おう \- Qiita](https://qiita.com/kompiro/items/5fc46089247a56243a62)
`brew install hub`

### Git

[Gitを使い始めたら一番最初にやりたい \`git config\`設定メモ](https://blog.katsubemakito.net/git/git-config-1st)

## ツール系

### アプリ

- Alfred
- 1password
- Clipy
- VScode
- iTerm2
- Sequel Pro
- Google日本語入力
- Skitch
- LibreOffice

## Chrome拡張

- Octotree
- 1password
- Create Link

場合によっては

- Emoji Palette
