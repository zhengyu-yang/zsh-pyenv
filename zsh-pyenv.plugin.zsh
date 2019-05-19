# export PATH
[[ -z "$PYENV_HOME" ]] && export PYENV_HOME="$HOME/.pyenv"

export PATH="$PYENV_HOME/bin:$PATH"

eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init - zsh)"
