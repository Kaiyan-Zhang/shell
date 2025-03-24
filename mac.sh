# 这里是一些软件安装之后要求添加到.zshrc到东西

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# pyenv is too slow
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# cargo
export PATH=$PATH:$HOME/.cargo/bin

source ${0:A:h}/universal/main.sh
source ${0:A:h}/fancy_zsh/main.sh
source ${0:A:h}/music.sh


alias copyLastCmd="fc -ln -1 | awk '{\$1=\$1}1' | pbcopy"
alias update='brew upgrade;'
alias ip='ifconfig en0'
