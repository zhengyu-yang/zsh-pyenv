FOUND_PYENV=$+commands[pyenv]

if [[ $FOUND_PYENV -ne 1 ]]; then
    pyenvdirs=("$HOME/.pyenv" "/usr/local/pyenv" "/opt/pyenv" "/usr/local/opt/pyenv")
    for dir in $pyenvdirs; do
        if [[ -d $dir/bin ]]; then
            FOUND_PYENV=1
            break
        fi
    done
fi

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
[[ FOUND_PYENV ]] && _zsh_pyenv_install

# load pyenv if it is installed
if [[ FOUND_PYENV ]]; then
    _zsh_pyenv_load
fi
