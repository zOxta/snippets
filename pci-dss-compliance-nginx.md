THESE SETTINGS CHANGE OVER TIME AND APPLY AS OF JULY 2017 - use at your own risk

## NGINX Config

```
server {
  .
  ..
  ...

  ssl_protocols TLSv1.1 TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:RSA+AESGCM:RSA+AES:!aNULL:!MD5:!DSS;

  ssl_session_cache shared:SSL:10m;
  ssl_session_timeout 10m;

  # if you dont have it make sure you generate it
  # $ openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048
  ssl_dhparam /etc/nginx/dhparams.pem;

  ssl_stapling on;
  ssl_stapling_verify on;
  ssl_trusted_certificate /etc/nginx/ssl/path/to/server.crt; # usually the same path of the certificate used for ssl_certificate

  add_header Strict-Transport-Security "max-age=31536000; includeSubdomains; preload";
  add_header X-Frame-Options "SAMEORIGIN";
  add_header X-XSS-Protection "1; mode=block";
  add_header X-Content-Type-Options "nosniff";
  
  ...
  ..
  .
}
```
    
    
## SSH/SSHD Config

1. Edit ssh_config `vi /etc/ssh/ssh_config` then add/edit the following line: 
**Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc** (the end result is having these ciphers only)

2. Edit sshd_config `vi /etc/ssh/sshd_config` then add/edit the following line: 
**Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc** (the end result is having these ciphers only)

3. To check ciphers: `sudo sshd -T |grep ciphers`

4. Restart SSH: `service ssh restart`

## Hints
- make sure you have a default_server listed in your NGINX config and for that server enfore the same SSL config above, example:

```
  server { 
    listen 443 ssl default_server; 
    #ssl config .... 
  }
```

- if you are behind CloudFlare put in mind that their SSL config overrides yours (you may need to disable it for your domain because to pass PCI compliance if you are on the free plan)

### To test connection over SSH using a particular cipher
`ssh user@hostname -c arcfour`

### Sample rejection response
Unable to negotiate with hostname port 22: no matching cipher found. Their offer: aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc

### To check algorithms/ciphers supported by a host
`nmap -Pn -sV --script ssh2-enum-algos hostname -p22`
