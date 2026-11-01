#!/bin/bash
set -e

echo "[MAR-STORAGE] Initializing PostgreSQL auxiliary databases..."

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    SELECT 'CREATE DATABASE authelia_db'
    WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'authelia_db')\gexec
    GRANT ALL PRIVILEGES ON DATABASE authelia_db TO $POSTGRES_USER;
EOSQL

echo "[MAR-STORAGE] Auxiliary databases initialized."
