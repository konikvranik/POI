CREATE OR REPLACE VIEW vi_poi_group AS SELECT poi.*, category.name as category_name, category.description as category_description, radius_of_duplicity, category.code as category_code  FROM poi, category WHERE category_id = category.id;

DROP INDEX expanded_poi_group_gist;
CREATE INDEX expanded_poi_group_gist ON poi USING GIST ( expand( position, 0.600000 * 360.000000 / 12756270.000000 * 50 ) );


CREATE OR REPLACE VIEW vi_duplicates AS SELECT a.id, b.id FROM POI AS a, poi AS b WHERE a.id != b.id AND a.category_id = b.category_id AND a.id < b.id AND a.position && expand( b.position, 0.600000 * 360.000000 / 12756270.000000 * 50 );
