source ${0:A:h}/universal/main.sh

if [ $ISMAC -eq 1 ]; then
    alias copyLastCmd="fc -ln -1 | awk '{\$1=\$1}1' | pbcopy"
    alias update='brew upgrade; zplug update;'
    alias ip='ifconfig en0'
    source ${0:A:h}/zsh/main.sh
fi