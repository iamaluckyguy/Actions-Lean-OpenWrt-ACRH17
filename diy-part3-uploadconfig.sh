#!/bin/sh

#upload config to ftp after menuconfig

./scripts/diffconfig.sh > seed.config

cd openwrt
date=`date +%Y-%m-%d-%H-%M-%S`
newfilename=seed.config-$date

cp seed.config $newfilename

PUTFILE=$newfilename
ftp -v -n 34.92.60.168<<EOF
user yourchinaoffice yourchinaofficeftp
passive
binary
prompt

put $PUTFILE

bye
#here document
EOF
echo "commit to ftp successfully"
