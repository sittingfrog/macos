#!/bin/bash

brew install docker-machine
brew install docker
brew install docker-compose
docker-machine create --driver virtualbox default
docker-machine stop default
vboxmanage modifyvm default --usb on
vboxmanage usbfilter add 0 --target default --name trezor --vendorid 0x1209 --productid 0x53c1
docker-machine start default
eval $(docker-machine env default)
