#!/bin/bash


ykp -A RSA2048 -H "SHA256" -S "/CN=unused" -s 9a -0 ~/Desktop/g.pem -a generate -a selfsign-certificate
ykp -v 1 -s 9a -a generate

ykman piv keys generate --algorithm RSA2048 9a ~/Desktop/pubkey.pem
ykman piv certificates generate --subject "CN=yubico" 9a ~/Desktop/pubkey.pem


https://ruimarinho.gitbooks.io/yubikey-handbook/content/ssh/authenticating-ssh-with-piv-and-pkcs11-client/
export MGMT="110203040506070801020304050607080102030405060708"

export desktop_folder=~/Desktop_folder
yubico-piv-tool -s 9a -a generate -k --pin-policy=once --touch-policy=always --algorithm=RSA2048 -o $desktop_folder/yubikey_public.pem
yubico-piv-tool -a verify-pin -a selfsign-certificate -s 9a -S '/CN=ssh/' --valid-days=365 -i $desktop_folder/yubikey_public_key.pem -o $desktop_folder/yubikey_certificate.pem
yubico-piv-tool -k -a import-certificate -s 9a -i $desktop_folder/cert.pem


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
