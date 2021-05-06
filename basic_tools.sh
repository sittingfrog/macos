#!/bin/bash

# Configure macOS defaults
source ./basic_tools/config_computer_name.sh
source ./basic_tools/config_finder.sh
source ./basic_tools/config_dock.sh

# Install basic tools to simplify the rest of the installation
source ./basic_tools/homebrew.sh #this also installs xcode which includes git
source ./basic_tools/iterm.sh
source ./basic_tools/zsh.sh
source ./basic_tools/ssh.sh
source ./basic_tools/gnupg.sh

# Keep virtualbox at end of install list as it requires 
#	system restart and it is required to install docker
source ./basic_tools/virtualbox.sh
