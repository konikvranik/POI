-- Function: put_poi(character varying, character varying, character varying, character varying, character varying, timestamp with time zone, time with time zone, numeric, numeric, numeric, numeric, numeric, numeric, numeric, numeric, numeric, numeric, numeric)

-- DROP FUNCTION put_poi(character varying, character varying, character varying, character varying, character varying, timestamp with time zone, time with time zone, numeric, numeric, numeric, numeric, numeric, numeric, numeric, numeric, numeric, numeric, numeric);

CREATE OR REPLACE FUNCTION put_poi(character varying, character varying, character varying, character varying, character varying, character varying, timestamp with time zone, timestamp with time zone, float, integer, float, float, float, float, integer, integer, integer, integer, integer, integer, integer)
  RETURNS void AS
$BODY$
DECLARE
	i_position ALIAS FOR $1;
	i_name ALIAS FOR $2;
	i_description ALIAS FOR $3;
	i_comment ALIAS FOR $4;
	i_link ALIAS FOR $5;
	i_phone ALIAS FOR $6;
	i_timestamp timestamp with time zone;
	i_time ALIAS FOR $8;
	i_fix ALIAS FOR $9;
	i_satellites ALIAS FOR $10;
	i_hdop ALIAS FOR $11;
	i_vdop ALIAS FOR $12;
	i_pdop ALIAS FOR $13;
	i_ageofdgpsdata ALIAS FOR $14;
	i_dgpsid ALIAS FOR $15;
	i_category ALIAS FOR $16;
	i_source int4;
	i_type ALIAS FOR $18;
	i_symbol ALIAS FOR $19;
	i_country ALIAS FOR $20;
	i_region ALIAS FOR $21;
	v_dup int4;
	v_distance float;
	i_priority int4;
	v_priority int4;
	v_timestamp timestamp with time zone;
	c_projection int4;
	i_geometry geometry;
	v_expand float;
BEGIN
	IF i_position IS NULL THEN
		RAISE EXCEPTION 'ERROR: Missing position!';
		RETURN 1;
	END IF;
	i_source := $17;
	c_projection = 4326;
	IF $7 IS NULL THEN
		i_timestamp := now();
	ELSE
		i_timestamp := $7;		
	END IF;
	i_geometry := GeomFromText('POINT(' || i_position || ')', c_projection);


	SELECT radius_of_duplicity INTO v_distance FROM Category WHERE id = i_category;
	v_expand := 0.600000 * 360.000000 / 12756270.000000 * v_distance;
/*
	RAISE INFO 'i_position: %', i_position;
	RAISE INFO 'i_name: %', i_name;
	RAISE INFO 'i_description: %', i_description;
	RAISE INFO 'i_comment: %', i_comment;
	RAISE INFO 'i_link: %', i_link;
	RAISE INFO 'i_timestamp: %', i_timestamp;
	RAISE INFO 'i_time: %', i_time;
	RAISE INFO 'i_fix: %', i_fix;
	RAISE INFO 'i_satellites: %', i_satellites;
	RAISE INFO 'i_hdop: %', i_hdop;
	RAISE INFO 'i_vdop: %', i_vdop;
	RAISE INFO 'i_pdop: %', i_pdop;
	RAISE INFO 'i_ageofdgpsdata: %', i_ageofdgpsdata;
	RAISE INFO 'i_dgpsid: %', i_dgpsid;
	RAISE INFO 'i_category: %', i_category;
	RAISE INFO 'i_source: %', i_source;
	RAISE INFO 'i_type: %', i_type;
	RAISE INFO 'i_symbol: %', i_symbol;
	RAISE INFO 'i_country: %', i_country;
	RAISE INFO 'i_region: %', i_region;

	RAISE INFO 'v_distance: %', v_distance;
	RAISE INFO 'v_expand: %', v_expand;
	RAISE INFO 'i_category: %', i_category;
	RAISE INFO 'i_geometry: %', i_geometry;
*/

	SELECT POI.id, priority, timestamp INTO v_dup, v_priority, v_timestamp FROM POI, Source WHERE ( category_id = i_category ) AND ( POI.Source_id = Source.id ) AND ( position && expand( i_geometry, v_expand ) );
	-- SELECT POI.id, priority, timestamp INTO v_dup, v_priority, v_timestamp FROM POI, Source WHERE ( category_id = i_category ) AND ( POI.Source_id = Source.id ) AND ( position && expand( i_geometry, v_expand ) ) AND ( distance( transform(position, 32732), transform(i_geometry, 32732) ) < ( v_distance * 1000 ) );
	-- RAISE INFO 'v_dup: %', v_dup;
	IF NOT found THEN
		-- RAISE INFO 'Not found';
		IF i_source IS NULL THEN
			SELECT source_id INTO i_source FROM Category WHERE id = i_category;
		END IF;
		INSERT INTO POI (
			position,
			name,
			description,
			comment,
			link,
			phone,
			timestamp,
			category_id,
			source_id,
			type_id,
			symbol_id,
			country_id
		) VALUES (
			i_geometry,
			i_name,
			i_description,
			i_comment,
			i_link,
			i_phone,
			i_timestamp,
			i_category,
			i_source,
			i_type,
			i_symbol,
			i_country
		);
	ELSE
		-- RAISE INFO 'Found';
		SELECT priority INTO i_priority FROM Source WHERE id = i_source;
		SELECT priority INTO v_priority FROM POI, Source WHERE POI.id = v_dup AND Source_id = Source.id;
		IF i_timestamp < v_timestamp OR i_priority < v_priority THEN
			UPDATE POI SET name = i_name WHERE id = v_dup AND name IS NULL;
			UPDATE POI SET description = i_description WHERE id = v_dup AND description IS NULL;
			UPDATE POI SET comment = i_comment WHERE id = v_dup AND comment IS NULL;
			UPDATE POI SET link = i_link WHERE id = v_dup AND link IS NULL;
			UPDATE POI SET phone = i_phone WHERE id = v_dup AND phone IS NULL;
			UPDATE POI SET type_id = i_type WHERE id = v_dup AND type_id IS NULL;
			UPDATE POI SET symbol_id = i_symbol WHERE id = v_dup AND symbol_id IS NULL;
			UPDATE POI SET country_id = i_country WHERE id = v_dup AND country_id IS NULL;
		ELSE
			UPDATE POI SET position = coalesce(i_geometry, position) WHERE id = v_dup;
			UPDATE POI SET name = coalesce(i_name, name) WHERE id = v_dup;
			UPDATE POI SET description = coalesce(i_description, description) WHERE id = v_dup;
			UPDATE POI SET comment = coalesce(i_comment, comment) WHERE id = v_dup;
			UPDATE POI SET link = coalesce(i_link, link) WHERE id = v_dup;
			UPDATE POI SET phone = coalesce(i_phone, phone ) WHERE id = v_dup;
			UPDATE POI SET timestamp = coalesce(i_timestamp, timestamp) WHERE id = v_dup;
			UPDATE POI SET category_id = coalesce(i_category, category_id) WHERE id = v_dup;
			UPDATE POI SET source_id = coalesce(i_source, source_id) WHERE id = v_dup;
			UPDATE POI SET type_id = coalesce(i_type, type_id) WHERE id = v_dup;
			UPDATE POI SET symbol_id = coalesce(i_symbol, symbol_id) WHERE id = v_dup;
			UPDATE POI SET country_id = coalesce(i_country, country_id) WHERE id = v_dup;
		END IF;
	END IF;
	RETURN 0;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION get_category_id_by_code(character varying, character varying)
  RETURNS integer AS
$BODY$
DECLARE
	cid integer;
BEGIN
	SELECT id INTO cid FROM Category WHERE code = $1;
	IF NOT FOUND THEN
		INSERT INTO Category (code, name) VALUES ($1, $2);
		cid := currval('sq_category');
	END IF;
	RETURN cid;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION get_category_id_by_code(character varying)
  RETURNS integer AS
$BODY$
BEGIN
	RETURN get_category_id_by_code($1, $1);
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION get_country_id_by_code(character varying)
  RETURNS integer AS
$BODY$
DECLARE
	cid integer;
BEGIN
	SELECT id INTO cid FROM Country WHERE code = $1;
	IF NOT FOUND THEN
		INSERT INTO Country (code) VALUES ($1);
		cid := currval('sq_country');
	END IF;
	RETURN cid;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION get_source_id_by_code(character varying)
  RETURNS integer AS
$BODY$
DECLARE
	cid integer;
BEGIN
	SELECT id INTO cid FROM Source WHERE code = $1;
	IF NOT FOUND THEN
		INSERT INTO Source (code) VALUES ($1);
		cid := currval('sq_source');
	END IF;
	RETURN cid;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION get_radius_of_duplicity_by_category_id(integer)
  RETURNS float AS
$BODY$
DECLARE
	cid float;
BEGIN
	SELECT radius_of_duplicity INTO cid FROM Category WHERE id = $1;
	RETURN cid;
END;
$BODY$
  LANGUAGE 'plpgsql' STABLE;

