# dotfiles

[Homebrew](https://brew.sh/index_ja)

## エディタ系

https://progriro.net/zsh-prezto/

```
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# 以下4行を全てコピーして貼り付け、実行する

$ setopt EXTENDED_GLOB
	   for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 		ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	   done
```

`.zshrc`は置いておいたままでよい。

### brew

デフォルトのzshのパスは`/usr/local/bin/zsh`になっている。そのままでもデフォルトでzshがインストールされてはいるんだけど、brewで入れておく。  
gitも`.zshrc`で`/usr/local/etc/bash_completion.d/git-prompt.sh`を読み込むので、brewでインストールする（インストールすると自動でこのファイルが作成される）。

```
brew install zsh git peco yarn
```

yarnをインストールすると、ついでにnodeとかもインストールされる。  
`Installing dependencies for yarn: icu4c and node`

`brew install anyenv`でanyenvを入れておく。

## ツール系

### アプリ

- Alfred
- 1password
- Clipy
- VScode
- iTerm2
- Sequel Pro
- Google日本語入力

## Chrome拡張

- Octotree
- Octolinker
- 1password
- Create Link
