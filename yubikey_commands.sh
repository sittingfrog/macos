#!/bin/bash

alias yk='ykman'
alias ykp='yubico-piv-tool'


reset_yubikey_piv () {
	# Yubico defaults
	dpin="123456"
	dpuk="12345678"
	dmk="010203040506070801020304050607080102030405060708"
	ykman piv reset
#    echo 'Enter PUK retry limit (default = 3):'; read pukr;
#	if [ -z "$pukr" ]; then
#		pukr=3
#	fi
#    echo 'Enter PIN retry limit (default = 3):'; read pinr;
#	if [ -z "$pinr" ]; then
#		pinr=3
#	fi
#    ykman piv access set-retries --force --pin $dpin --management-key $dmk $pinr $pukr
#    echo "PUK retry limit is set to $pukr"
#    echo "PIN retry limit is set to $pinr"
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
ykp -A RSA2048 -H "SHA256" -S "/CN=unused" -s 9a -0 ~/Desktop/g.pem -a generate -a selfsign-certificate
ykp -v 1 -s 9a -a generate

ykman piv keys generate --algorithm RSA2048 9a ~/Desktop/pubkey.pem
ykman piv certificates generate --subject "CN=yubico" 9a ~/Desktop/pubkey.pem


https://ruimarinho.gitbooks.io/yubikey-handbook/content/ssh/authenticating-ssh-with-piv-and-pkcs11-client/
export MGMT="110203040506070801020304050607080102030405060708"

export KEY_PATH=~/Desktop
yubico-piv-tool -s 9a -a generate -k --pin-policy=once --touch-policy=always --algorithm=RSA2048 -o $KEY_PATH/public.pem
yubico-piv-tool -a verify-pin -a selfsign-certificate -s 9a -S '/CN=ssh/' --valid-days=365 -i $KEY_PATH/public.pem -o $KEY_PATH/cert.pem
yubico-piv-tool -k -a import-certificate -s 9a -i $KEY_PATH/cert.pem
ssh-keygen -D /usr/local/lib/opensc-pkcs11_NOTALINK.so -e
ssh-add -s /usr/local/lib/opensc-pkcs11_NOTALINK.so

/usr/local/lib/pkcs11/p11-kit-client.so

sudo cp /usr/local/lib/pkcs11/p11-kit-client.so /usr/local/lib/pkcs11/p11-kit-client_NOTALINK.so


sudo cp /usr/local/lib/libykcs11.dylib /usr/local/lib/libykcs11_NOTALINK.dylib
sudo chmod 755 /usr/local/lib/libykcs11_NOTALINK.dylib

/usr/local/lib/libykcs11_NOTALINK.dylib


chmod 755 /usr/local/lib/p11-kit-client.so


sudo cp /usr/local/lib/opensc-pkcs11.so /usr/local/lib/opensc-pkcs11_NOTALINK.so
sudo chmod 755 /usr/local/lib/opensc-pkcs11_NOTALINK.so

opensc-pkcs11.so


ssh -I /usr/lib/Cellar/opensc/0.21.0/lib/opensc-pkcs11.so git@github.com
