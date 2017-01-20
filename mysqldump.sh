mysqldump -uSOURCEUSER -pSOURCEPASSWORD -h source.host \
    --databases source_db \
    --single-transaction \
    --compress \
    --order-by-primary | mysql -uTARGETUSER -p \
        --port=3306 \
        --host=target.host
