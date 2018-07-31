FROM mysql:5.7.22

COPY schema.sql schema-populate.sql /docker-entrypoint-initdb.d/