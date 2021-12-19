#!/bin/bash
#

#
#create certificate authority 
#

caKeyFile=example-ca.key

if [ ! -f  ${caKeyFile} ]; then
	openssl genrsa -out ${caKeyFile} -aes256 8192
fi

SUBJECT="/C=GB/ST=Dorset/L=Christichurch/O=MFord Tech"

#
# sign public certificate 
# 
# for mac os we need to define our own ca config file


openssl req -x509 -new \
  -extensions v3_ca \
  -key "${caKeyFile}" \
  -subj "${SUBJECT}/CN=MFord Tech CA" \
  -days 365 \
  -out example-ca-pub.crt