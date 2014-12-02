#!/bin/sh
export PGUSER=postgres
createdb -E utf8 POI
createlang plpgsql POI
createlang plperl POI
psql -U postgres POI -f /usr/share/postgresql/contrib/lwpostgis.sql
psql -U postgres POI -f /usr/share/postgresql/contrib/spatial_ref_sys.sql

psql -U postgres POI -f create_db.sql
psql -U postgres POI -f functions.sql
psql -U postgres POI -f system_data.sql
