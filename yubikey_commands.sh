#!/bin/bash

alias yk='ykman'
alias ykp='yubico-piv-tool'


reset_yubikey_piv () {
	# Yubico defaults
	dpin="123456"
	dpuk="12345678"
	dmk="010203040506070801020304050607080102030405060708"
	ykman piv reset
    echo 'Enter PUK retry limit (default = 3):'; read pukr;
	if [ -z "$pukr" ]; then
		pukr=3
	fi
    echo 'Enter PIN retry limit (default = 3):'; read pinr;
	if [ -z "$pinr" ]; then
		pinr=3
	fi
    ykman piv access set-retries --force --pin $dpin --management-key $dmk $pinr $pukr
    echo "PUK retry limit is set to $pukr"
    echo "PIN retry limit is set to $pinr"
    ykman piv access change-management-key
    echo "Default PUK: $dpuk"
    ykman piv access change-puk
    echo "Default PIN: $dpin"
    ykman piv access change-pin
}
# Default Keys
#	PIN:	123456
#	PUK:	12345678
#	Management Key:	010203040506070801020304050607080102030405060708

alias yk='ykman'
alias ykp='yubico-piv-tool'

