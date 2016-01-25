sudo fallocate -l 1G /swapfile \
sudo chmod 600 /swapfile \
sudo mkswap /swapfile \
sudo swapon /swapfile \
sudo swapon -s \
free -m \
echo '/swapfile   none    swap    sw    0   0' >> /etc/fstab \
sudo sysctl vm.swappiness=10 \
echo 'vm.swappiness=10' >> /etc/sysctl.conf \
cat /proc/sys/vm/swappiness
sudo sysctl vm.vfs_cache_pressure=50 \
echo 'vm.vfs_cache_pressure = 50' >> /etc/sysctl.conf \
cat /proc/sys/vm/vfs_cache_pressure
