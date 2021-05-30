#!/bin/bash

# Install `poetry` to run trezor cli from source then clone
# 		the source repository and build the virtual environment 
# https://github.com/trezor/trezor-firmware/tree/master/python
# How to run from source in a venv-specific shell:
# 	cd ~/code/trezor-firmware
# 	poetry shell
pip3 install poetry
mkdir ~/code/trezor-firmware
git clone https://github.com/trezor/trezor-firmware ~/code/trezor-firmware
pushd ~/code/trezor-firmware
poetry install
poetry update
popd

# Trezor agent installation instructions: https://github.com/romanz/trezor-agent/blob/master/doc/INSTALL.md
# Note: `libusb` is already installed if gpg is already installed
brew install trezor-agent
