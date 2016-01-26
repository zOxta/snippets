server {
    listen 80;
    ### map sub-directories to sub-domains
    server_name ~^(?<subdomain>.+)?\.domain\.com$;
    root /var/www/domain.com/$subdomain;

    # ssl_certificate;
    # ssl_certificate_key;

    ssl_protocols TLSv1.2;

    index index.html index.htm index.php;

    charset utf-8;

    location / {
        add_header X-App-Server SERVER-01 always;
        
        ### handy when testing nginx config ###
        #add_header Content-Type text/plain;
        #return 200 $http_host$uri;
        
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/domain.com-error.log error;

    error_page 404 /index.php;

    location ~ \.php$ {
        add_header X-App-Server SERVER-01 always;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        
        ### should be actual path to your unix sock
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
    }

    location ~ /\. {
        deny all;
    }
}
