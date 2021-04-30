#!/bin/bash

# Configure macOS defaults
source ./basic_tools/config_finder.sh
source ./basic_tools/config_dock.sh

# Install basic tools to simplify the rest of the installation
source ./basic_tools/homebrew.sh
source ./basic_tools/iterm.sh
source ./basic_tools/zsh.sh
# source ./basic_tools/gnupg.sh # TODO: check if gpg is installed by default

# Keep virtualbox at end of install list as it requires system restart
source ./basic_tools/virtualbox.sh