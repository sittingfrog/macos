#!/bin/bash

defaults write com.apple.dock show-recents -int 0
defaults write com.apple.dock autohide -int 0
defaults write com.apple.dock tilesize -int 32
defaults delete com.apple.dock persistent-apps
killall Dock
