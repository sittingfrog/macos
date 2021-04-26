#!/bin/bash

brew install docker-machine
brew install docker
brew install docker-compose
docker-machine create --driver virtualbox default
docker-machine stop default
echo "Enabling USB functionality on default..."
vboxmanage modifyvm default --usb on
# vboxmanage usbfilter add 0 --target default --name trezor --vendorid 0x1209 --productid 0x53c1
docker-machine start default
eval $(docker-machine env default)
# hid.Device(vid=0x1209, pid=0x53c1)
usb.core.find(idVendor=0x1209, idProduct=0x53c1)
