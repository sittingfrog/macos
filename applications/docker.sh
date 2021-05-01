#!/bin/bash

brew install docker-machine
brew install docker
brew install docker-compose
docker-machine create --driver virtualbox default
docker-machine stop default
echo "Enabling USB functionality on default..."
vboxmanage modifyvm default --usb on
# vboxmanage usbfilter add 0 --target default --name <name> --vendorid <vid> --productid <pid>
docker-machine start default
eval $(docker-machine env default)
