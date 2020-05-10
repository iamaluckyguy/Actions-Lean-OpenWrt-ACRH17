#!/bin/sh

./scripts/diffconfig.sh > seed.config

date=`date +%Y-%m-%d-%H-%M-%S`
newfilename=seed.config-$date

cp seed.config $newfilename

PUTFILE=$newfilename
ftp -v -n 34.92.60.168<<EOF
user yourchinaoffice yourchinaofficeftp
binary
prompt

put $PUTFILE

bye
#here document
EOF
echo "commit to ftp successfully"
