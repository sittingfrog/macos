#!/bin/bash

echo '\n\n\n*** STOP *******************************************'
echo 'Enter a name for your computer that will appear on public networks'
echo 'Warning: Avoid spaces and special characters'
echo 'Warning: Avoid using personal information in the name'
echo 'Enter name (Leave blank to use "mbp"):'; read cname;
if [ -z "$cname" ]; then
	cname="mbp"
fi
defaults write com.apple.rapport familySyncedName -string "$cname"
