#!/bin/sh
export PGUSER=postgres
createdb -E utf8 POI
createlang plpgsql POI
createlang plperl POI
psql -U postgres POI -f /usr/share/postgresql/contrib/lwpostgis.sql
psql -U postgres POI -f /usr/share/postgresql/contrib/spatial_ref_sys.sql

psql -U postgres POI -f pg_create_db.sql
