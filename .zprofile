echo 'Loading .zprofile'

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# fnm
FNM_PATH="/Users/bytedance/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/bytedance/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

