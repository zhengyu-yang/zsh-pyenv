# export PYENV_HOME if it is not defined
[[ -z "$PYENV_HOME" ]] && export PYENV_HOME="$HOME/.pyenv"

export PATH="$PYENV_HOME/bin:$PATH"

_zsh_pyenv_install() {
    echo "Installing pyenv..."
    curl https://pyenv.run | bash
}


_zsh_pyenv_load() {
    eval "$(pyenv init - zsh)"
    eval "$(pyenv virtualenv-init - zsh)"
}

# install pyenv if it isnt already installed
if ! command -v pyenv &>/dev/null; then
    _zsh_pyenv_install
fi

# load pyenv if it is installed
if command -v pyenv &>/dev/null; then
    _zsh_pyenv_load
fi

unset -f _zsh_pyenv_install
unset -f _zsh_pyenv_load
