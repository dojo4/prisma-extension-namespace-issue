#!/bin/bash

createdb extension_test
psql extension_test -c 'CREATE SCHEMA IF NOT EXISTS extensions_only'
psql extension_test -c 'CREATE EXTENSION citext SCHEMA extensions_only'


# show the extension in the own namespace
psql extension_test -c "select extname, pg_namespace.nspname from pg_extension join pg_namespace on pg_extension.extnamespace = pg_namespace.oid where extname = 'citext'"
