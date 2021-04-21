#!/bin/bash

# Cask can be used but doesn;t install docker-machine and virtualbox.
# Virtualbox and docker machine are needed to permit devices from 
# 	osx host machine mountable in docker containers
# Virtual box install may fail on the first try this will require 
# 	permissions to be granted in Settings -> Security/Privacy ,
# 	terminal will need to be granted full disk access to 
# 	uninstall virtual box and osx may need to be restarted
# 
# TODO: see if it's possible to set sercurity permissions and restart osx as part of this shell script
# https://medium.com/crowdbotics/a-complete-one-by-one-guide-to-install-docker-on-your-mac-os-using-homebrew-e818eb4cfc3
# http://biercoff.com/how-to-fix-docker-machine-installation-on-mac-os-x/
# https://stackoverflow.com/questions/37865439/terminal-command-to-change-security-and-privacy-advanced-setting
# https://christopherjmcclellan.wordpress.com/2019/04/21/using-usb-with-docker-for-mac/

# # sudo shutdown -r now
# brew install --cask docker

brew install virtualbox --cask
brew install docker-machine
brew install docker
brew install docker-compose
docker-machine create --driver virtualbox default
docker-machine stop
vboxmanage modifyvm default --usb on
docker-machine start
eval $(docker-machine env default)

# brew uninstall virtualbox --force --zap

vboxmanage usbfilter add 0 --target default --name ftdi --vendorid 0x1209 --productid 0x53c1