[[ -z "$PYENV_HOME" ]] && export PYENV_HOME="$HOME/.pyenv"

_zsh_pyenv_install() {
    echo "Installing pyenv..."
    curl https://pyenv.run | bash
}

_zsh_pyenv_load() {
    # export PATH
    export PATH="$PYENV_HOME/bin:$PATH"

    eval "$(pyenv init - zsh)"
    eval "$(pyenv virtualenv-init - zsh)"
}

# install pyenv if it isnt already installed
[[ ! -f "$PYENV_HOME/libexec/pyenv" ]] && _zsh_pyenv_install

# load pyenv if it is installed
if [[ -f "$PYENV_HOME/libexec/pyenv" ]]; then
    _zsh_pyenv_load
fi
