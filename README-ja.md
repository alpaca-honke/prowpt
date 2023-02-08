# Prowpt - シンプルで軽量、カスタマイズ可能な Bash、Zsh 用 Powerline 風プロンプトテーマ  
![GitHub top language](https://img.shields.io/github/languages/top/alpaca-honke/prowpt?style=flat-square)![](https://images.shelds.io/github/languages/top/alpaca-honke/prowpt)
![GitHub repo size](https://img.shields.io/github/repo-size/alpaca-honke/prowpt?style=flat-square)
![GitHub](https://img.shields.io/github/license/alpaca-honke/prowpt?style=flat-square)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/alpaca-honke/prowpt/main?label=last%20commit%20%28main%29&style=flat-square)![GitHub last commit (branch)](https://img.shields.io/github/last-commit/alpaca-honke/prowpt/main?label=last%20commit%20%28main%29&style=flat-square)
作者は日本人にも関わらず、英語版のREADMEから書き始めてしまい、それを翻訳したものなので、不自然な日本語があるかと思います。ご了承ください。（一応不自然なところは直したつもりです。）  
## スクリーンショット  
![スクリーンショット](images/Screenshot.png)  
注：シンタックスハイライトは付属しません。  
## 目次  
- [Prowpt - シンプルで軽量、カスタマイズ可能な Bash、Zsh 用 Powerline 風プロンプトテーマ](#prowpt---シンプルで軽量カスタマイズ可能な-bashzsh-用-powerline-風プロンプトテーマ)
  - [スクリーンショット](#スクリーンショット)
  - [目次](#目次)
  - [特徴](#特徴)
  - [必須条件](#必須条件)
  - [見た目](#見た目)
    - [Git ステータスアイコン](#git-ステータスアイコン)
  - [インストール方法](#インストール方法)
    - [Bash](#bash)
    - [Manual](#manual)
      - [Sheldon](#sheldon)
    - [Zsh](#zsh)
      - [Manual](#manual-1)
      - [Oh-My-Zsh](#oh-my-zsh)
      - [Zinit](#zinit)
      - [Zplug](#zplug)
      - [Sheldon](#sheldon-1)
  - [カスタマイズ](#カスタマイズ)
    - [カスタマイズ可能な値](#カスタマイズ可能な値)
      - [文字列](#文字列)
      - [区切り文字](#区切り文字)
      - [ホームディレクトリ（~）をハイライトするかどうか](#ホームディレクトリをハイライトするかどうか)
      - [プロンプトの色](#プロンプトの色)
      - [Git セグメント](#git-セグメント)
    - [その他のカスタマイズ](#その他のカスタマイズ)
  - [Contributing](#contributing)
  - [お問い合わせ](#お問い合わせ)
  - [ライセンス](#ライセンス)

## 特徴  
- Zinit や Oh-My-Zsh などの一般的なプラグインマネージャで簡単にプラグインを管理できる  
- コードが単純なため、カスタマイズが容易  
- カスタマイズ可能な変数が多い  
- リポジトリが軽量  

## 必須条件  
- Bash または Zsh  
Fish Shellでは動作しません。  
- Gitコマンド  
- [Nerd Fonts](https://www.nerdfonts.com)  
グリフを表示するために Nerd Fonts が必要です。  
（カスタマイズしなければ、[Powerline Fonts](https://github.com/powerline/fonts)も使用できます。）  
- 256色表示可能な端末エミュレータ  

## 見た目  
![プロンプトサンプル](images/prompt-sample.png)  
### Git ステータスアイコン 
- ステージされていないファイルがある場合: ```*```  
- ステージングされたファイル: ```+```  
- 退避（stash）されたファイル: ```$```  
- 未追跡ファイル: ```%```  

HEAD とアップストリームとの差  
- HEADが先行: ```<```  
- アップストリームが先行: ``>``  
- 分岐している: ``<>``  
- up-to-date: ```=```  

## インストール方法  
### Bash  
### Manual  
1. リポジトリをクローンする  
    ```bash
    git clone https://github.com/alpaca-honke/prowpt.git  ~/.prowpt/
    ```
1. 以下の行を ``~/.bashrc`` の ``PS1`` 設定の下に追加  
    ```bash:.bashrc
    source ~/.prowpt/prowpt.bash
    ```
1. ターミナルを再起動  

#### Sheldon  
1. 次のコマンドを実行  
    ```bash
    sheldon add prowpt --github alpaca-honke/prowpt --use '*.bash'
    ```
1. ターミナルを再起動  

### Zsh  
#### Manual  
1. リポジトリをクローンする  
    ```zsh
    git clone https://github.com/alpaca-honke/prowpt.git ~/.prowpt/
    ```
1. ```~/.zshrc``` の以下の行をコメントアウト  
    ```zsh:.zshrc
    autoload -Uz promptinit
    promptinit
    prompt adam1
    ```
1. ```~/.zshrc``` の ```PROMPT``` 設定の下に、以下の行を追加  
    ```zsh:.zshrc
    source ~/.prowpt/prowpt.plugin.zsh
    ```
1. ターミナルを再起動  

#### Oh-My-Zsh  
1. リポジトリをクローンする  
    ```zsh
    git clone https://github.com/alpaca-honke/prowpt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/prowpt/
    ```
1. ```~/.zshrc``` の以下の行をコメントアウト  
    ```zsh:.zshrc
    autoload -Uz promptinit
    promptinit
    prompt adam1
    ```
1. ```~/.zshrc```内のOh-My-Zsh のプラグインリストに ``prowpt`` を追加  
    ```zsh:.zshrc
    plugins=(
        #他のプラグイン
        prowpt
    )
    ```
1. ターミナルを再起動  

#### Zinit  
1. 以下のコマンドを実行  
    ```zsh
    zinit light alpaca-honke/prowpt
    ```
1. ターミナルを再起動  

#### Zplug  
1. 以下の行を ``~/.zshrc`` に追加  
    ```zsh:.zshrc
    zplug "alpaca-honke/prowpt", as:plugin
    ```
1. ターミナルを再起動  

#### Sheldon  
1. 以下のコマンドを実行  
    ``zsh
    sheldon add prowpt --github alpaca-honke/prowpt
    ```
1. ターミナルを再起動  

## カスタマイズ  
``~/.config/prowpt/config.sh`` を使用すると、簡単にカスタマイズすることができます。  
1. ディレクトリを作成します。  
    ```sh
    mkdir ~/.config/prowpt/
    ```
1. 設定ファイルの作成と編集（他のテキストエディタでも可能です。）  
    ```sh
    vim ~/.config/prowpt/config.sh
    ```

### カスタマイズ可能な値   
以下のようにいくつかの変数を設定することで、簡単にprowptをカスタマイズすることができます。  
```sh:config.sh
PROWPT_SEGMENT_SEPARATOR=$'\ue0b8'
PROWPT_CURRENT_TIME_BG="5"
GIT_PS1_SHOWUPSTREAM=""
```

#### 文字列  
| 変数名 | 説明 | デフォルト |
| ---- | ---- | ---- |  
| PROWPT_CURRENT_TIME | 最初のセグメント値 | Bash: ```\t```, Zsh: ```%*``` |  
| PROWPT_USER | 2番目のセグメントの値 | Bash: ```\u```, Zsh: ```%n``` |
| PROWPT_HOST | セグメントの3番目の値 | Bash: ```\h```, Zsh: ```%n``` |  
| PROWPT_PROMPT | 最後（2行目）のセグメント値 | Bash: ```\$```, Zsh: ```%#``` |  

#### 区切り文字  
セグメント (プロンプトのブロック) の区切り文字を設定します。  
区切り文字は ```$'\ue0b0'``` のようにUniocdeで設定できます。  
以下はよく使用される区切り文字のリストです。  
[区切り文字サンプル](images/delimiter-sample.png)  
注：PWD区切り文字にはリスト中のe0b1, e0b5, e0b9, e0bb, e0c1, e0cd、セグメント区切り文字には他の文字を使用することができます。  
垂直なセグメント区切り文字を使用する場合は、```PROWPT_SEGMENT_DELIMITER=""``` と指定してください。PWD区切り文字も同じようにするには、```|``` （パイプ）を指定してください。  

| 変数名 | 説明 | デフォルト |  
| ---- | --- | ---- |  
| PROWPT_SEGMENT_DELIMITER | セグメント区切り文字 | ```$'\ue0b0'``` |  
| PROWPT_PWD_DELIMITER | ```/``` の代わりとして表示されるカレントディレクトリの区切り文字 | ```$'\ue0b1'``` |  

#### ホームディレクトリ（~）をハイライトするかどうか  
ホームディレクトリをハイライト表示させたい場合は  
```PROWPT_PWD_HOME_HIGHLIGHT="yes"``` と設定してください。  
そうでない場合は  
```PROWPT_PWD_HOME_HIGHLIGHT="no"``` または他の値に設定してください。  

#### プロンプトの色  
プロンプトの色は、ANSIの256色で設定することができます。  
[256色チートシート](https://www.ditig.com/256-colors-cheat-sheet)  

| 変数名 | 説明 | デフォルト |  
| ---- | ---- | ---- |  
| PROWPT_CURRENT_TIME_FG | 最初のセグメントの前景色 | ```253``` |  
| PROWPT_CURRENT_TIME_BG | 最初のセグメントの背景色 | ```31``` |  
| PROWPT_USER_FG | 2つ目のセグメントの前景色 | ```253``` |  
| PROWPT_USER_BG | 2つ目のセグメントの背景色 | ```242``` |  
| PROWPT_HOST_FG | 3つ目のセグメントの前景色 | ```253``` |  
| PROWPT_HOST_BG | 3つ目のセグメントの背景色 | ```239``` |  
| PROWPT_PWD_FG | PWD セグメントの前景色 | ```253``` |  
| PROWPT_PWD_BG | PWD セグメントの背景色 | ```237``` |  
| PROWPT_PWD_HOME_FG | ホームディレクトリのセグメントの前景色 (```PROWPT_PWD_HOME_HIGHLIGHT="yes"``` の場合) | ```253``` |  
| PROWPT_PWD_HOME_BG | ホームディレクトリのセグメントの背景色 (```PROWPT_PWD_HOME_HIGHLIGHT="no"``` の場合) | ```31``` |  
| PROWPT_GIT_FG | Git セグメントの前景色 | ```236``` |  
| PROWPT_GIT_BG｜Git セグメントの背景色 | ```148``` |  
| PROWPT_PROMPT_FG | 最後の（2行目）セグメントの前景色 | ```253``` |  
| PROWPT_PROMPT_BG | 最後の（2行目）セグメントの背景色 | ```237``` |  
| PROWPT_PROMPT_ERROR_FG | 最後の（2行目）セグメントの前景色（終了ステータスが0でない場合） | ```253``` |  
| PROWPT_PROMPT_ERROR_BG | 最後の（2行目）セグメントの背景色（終了ステータスが0でない場合） | ```5``` |  

#### Git セグメント  
Git セグメントでは、[https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh) を使用しています。  
カスタマイズ可能な変数は、このスクリプトに従います。  

| 変数 | 説明 | デフォルト |  
| ---- | ---- | ---- |  
| GIT_PS1_SHOWDIRTYSTATE | これをnoemptyに設定すると、ブランチ名の隣にステージされていない(*)変更とステージされた(+)変更が表示されます。| ```yes``` |  
| GIT_PS1_SHOWSTASHSTATE | これを空でない値に設定すると、stashされた変更があれば、ブランチ名の横に '$' が表示されます。| ```yes``` |  
| GIT_PS1_SHOWUNTRACKEDFILES | 空ではない値を設定することで、もし未追跡のファイルがあれば、ブランチ名の横に'%'が表示されます。| ```yes``` |  
| GIT_PS1_SHOWUPSTREAM | ```GIT_PS1_SHOWUPSTREAM="auto"``` と設定すると、HEAD とその上流との差分がブランチ名の横に表示されるようになります。<" 上流が先行、">" HEADが先行、"<>" は分岐、"=" は差がないことを表します。| ```auto``` |  
詳しくは [https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh) もしくは [prowpt/git-prompt.sh](git-prompt.sh) を参照してください。その他のカスタマイズ可能な変数もそこに書かれています。  

### その他のカスタマイズ  
カスタマイズしたいが、そのためのカスタマイズ可能な変数がない場合、 ```prowpt-core.sh``` などのファイルを上書きしてカスタマイズしてください。  

## Contributing  
このプログラムが完全でないことは承知しています。このプログラムへの貢献は歓迎です。もしあなたが貢献する気があれば、ぜひプルリクエストを作成してください。  
同様に、何か問題や質問を見つけたら、issue を作成してください。 

## お問い合わせ  
何か問題がある場合、  
- このプログラムに関することであれば、issueを開いてください。   
- GitHub のアカウントを持っていない、または他にissue を開くべきでない理由がある場合は、Twitter の DM: [Twitter @alpaca_honke](https://twitter.com/alpaca_honke) に連絡してください。  

## ライセンス  
Prowpt は GNU General Public Licence version 2.0 の下で配布されています。  
このプログラムは、商品性や特定目的への適合性の暗黙の保証もなく、いかなる保証もなく頒布されます。  
詳しくは [COPYING](COPYING) または [GNU General Public Licence version 2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html), 及び [Licenses - GNU Project - Free Software Foundation](https://www.gnu.org/licenses/) を参照してください。  

Copyright (C) 2023 Alkappa/alpaca-honke  