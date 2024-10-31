# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


alias copyLastCmd="fc -ln -1 | awk '{\$1=\$1}1' | pbcopy"
alias update='brew upgrade; zplug update;'
alias ip='ifconfig en0'
source ${0:A:h}/zsh/main.sh
export LinuxConfig="$HOME/Nutstore Files/LinuxConfig"
alias edpower='vim "${LinuxConfig}/power.txt"'

fnm use system