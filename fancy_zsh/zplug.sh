# https://github.com
# zplug:       https://github.com/zplug/zplug
# oh-my-zsh:   https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
# How to use Tags: https://github.com/zplug/zplug#3-tags-for-zplug

# Installing zplug
    # Do not use apt
    export ZPLUG_HOME=~/.zplug
    if [ ! -d $ZPLUG_HOME ]; then git clone https://github.com/zplug/zplug $ZPLUG_HOME; fi
    source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh   
zplug "plugins/macos", from:oh-my-zsh
zplug "plugins/zsh-interactive-cd", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verbose; then printf "Install? [y/N]: "; if read -q; then echo; zplug install; fi ; fi
zplug load
