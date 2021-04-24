#!/bin/bash

# Install basic tools to simplify the rest of the installation

source ./basic_tools/homebrew.sh
source ./basic_tools/git.sh
source ./basic_tools/iterm.sh
source ./basic_tools/zsh.sh
source ./basic_tools/generate_ssh_keys.sh

# Keep virtualbox at end of install list as it requires system restart
source ./basic_tools/virtualbox.sh