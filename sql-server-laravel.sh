# install the following for PHP 7.1
sudo apt-get install php7.1-odbc php7.1-mysql php7.1-sybase freetds-bin freetds-common freetds-dev tdsodbc odbcinst unixodbc openssl libkrb5-3 libc6 e2fsprogs

# edit the following file and make sure you update global TDS to 8.0
sudo vi /etc/freetds/freetds.conf

# test connection from your machine
tsql -S instance.database.windows.net -U user@something -D DB_NAME
