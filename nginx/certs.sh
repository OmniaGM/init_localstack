#!/usr/bin/env bash

REGION=$1
OUT=$2

CRT_COUNTRY=AU
CRT_STATE=State
CRT_City=City
CRT_ORG=amazonaws.com
CRT_ORG_UNT=Cloud
CRT_COMMON_NAME="*.$REGION.amazonaws.com"

CRT_DIR=$OUT
CRT_PERFIX=awslocal-$REGION
mkdir -p $CRT_DIR

apt-get update
apt-get install -y libssl-dev openssl

openssl genrsa -out "$CRT_DIR/$CRT_PERFIX.key" 2048
openssl req -new -key "$CRT_DIR/$CRT_PERFIX.key" \
    -out "$CRT_DIR/$CRT_PERFIX.csr" \
    -subj "/C=$CRT_COUNTRY/ST=$CRT_STATE/L=$CRT_City/O=$CRT_ORG/OU=$CRT_ORG_UNT/CN=$CRT_COMMON_NAME"

openssl x509 -req -days 365 \
    -in "$CRT_DIR/$CRT_PERFIX.csr" \
    -signkey "$CRT_DIR/$CRT_PERFIX.key" \
    -out "$CRT_DIR/$CRT_PERFIX.crt"

cat $CRT_DIR/$CRT_PERFIX.crt $CRT_DIR/$CRT_PERFIX.key > $CRT_DIR/$CRT_PERFIX.pem
openssl x509 -noout -fingerprint -text < "$CRT_DIR/$CRT_PERFIX.crt" > "$CRT_DIR/$CRT_PERFIX.info"