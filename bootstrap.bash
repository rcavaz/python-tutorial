#!/usr/bin/bash

requires_command() {
    command -v "$1" >/dev/null && return
    printf 'Unknown command: %s' "$1" && exit 1
}


# -*- Main -*-

requires_command 'direnv'
requires_command 'pyenv'
install_dependencies

pyenv install --skip-existing $PYTHON_VERSION
pyenv virtualenv $PYTHON_VERSION $VIRTUALENV_NAME
pyenv local $VIRTUALENV_NAME

pip install --upgrade pip
pip install -r requirements.txt
