# export PYENV_HOME if it is not defined
[[ -z "$PYENV_HOME" ]] && export PYENV_HOME="$HOME/.pyenv"

_zsh_pyenv_install() {
    echo "Installing pyenv..."
    curl https://pyenv.run | bash
}


_zsh_pyenv_load() {
    export PATH="$PYENV_HOME/bin:$PATH"
    eval "$(pyenv init - zsh)"
    eval "$(pyenv virtualenv-init - zsh)"
}

# install pyenv if it isnt already installed
[[ ! -d "$PYENV_HOME" ]] && _zsh_pyenv_install

# load pyenv if it is installed
if [[ -d "$PYENV_HOME" ]]; then
    _zsh_pyenv_load
fi

unset -f _zsh_pyenv_install
unset -f _zsh_pyenv_load
