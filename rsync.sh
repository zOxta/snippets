# of course, we first add pub key of target host to the source server
/usr/bin/rsync -avzt --delete /source/directory USERNAME@TARGET_HOST_IP_ADDRESS:/destination/
