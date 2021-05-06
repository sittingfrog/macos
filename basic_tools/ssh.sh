#!/bin/bash

# Configure SSH
mkdir -p ~/.ssh && chmod 700 ~/.ssh
ln -s "$HOME/code/macos/ssh/config" ~/.ssh/config
chmod 600 ~/.ssh/config
touch ~/.ssh/known_hosts
chmod 600 ~/.ssh/known_hosts
