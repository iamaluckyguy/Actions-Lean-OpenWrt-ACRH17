  
#!/bin/sh

# This is not in use any longer as the seed.config is cofigured to upload to WeTransfer and CowTransfer in the main file.

#upload config to ftp after menuconfig

./scripts/diffconfig.sh > seed.config

# cd openwrt is not necessary as it's config in RUN to cd openwrt
#cd openwrt
date=`date +%Y-%m-%d-%H-%M-%S`
newfilename=seed.config-newwifi3-$date

cp seed.config $newfilename

PUTFILE=$newfilename
ftp -v -n 252.188.136.8<<EOF
user FTPUser FTPPass
passive
put $PUTFILE
bye
#here document
EOF
echo "Commit to ftp completed"
