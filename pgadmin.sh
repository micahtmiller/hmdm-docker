docker run -p 8081:80 \
    -e 'PGADMIN_DEFAULT_EMAIL=me@me.com' \
    -e 'PGADMIN_DEFAULT_PASSWORD=changeme' \
    -d dpage/pgadmin4