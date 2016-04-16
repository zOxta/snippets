# generate a private key (use any password for now)
openssl genrsa -des3 -out server.key 1024

# generate a CSR (use the same password in previous step)
# when it asks about Common Name (e.g. server FQDN or YOUR name) enter your domain name
openssl req -new -key server.key -out server.csr

# remove the password from the key we created
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key

# generate the cert
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

# then integrate into nginx or Apache
