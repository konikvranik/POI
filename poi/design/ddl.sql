--
-- PostgreSQL database dump
--

-- Started on 2007-09-05 14:48:21

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 3022 (class 1262 OID 18286)
-- Name: POI; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "POI" WITH TEMPLATE = template0 ENCODING = 'UTF8';


\connect "POI"

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 1252 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- TOC entry 1142 (class 0 OID 0)
-- Name: chkpass; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE chkpass;


--
-- TOC entry 140 (class 1255 OID 16557)
-- Dependencies: 4 1142
-- Name: chkpass_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chkpass_in(cstring) RETURNS chkpass
    AS '$libdir/chkpass', 'chkpass_in'
    LANGUAGE c STRICT;


--
-- TOC entry 141 (class 1255 OID 16558)
-- Dependencies: 4 1142
-- Name: chkpass_out(chkpass); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chkpass_out(chkpass) RETURNS cstring
    AS '$libdir/chkpass', 'chkpass_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1141 (class 1247 OID 16556)
-- Dependencies: 140 4 141
-- Name: chkpass; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE chkpass (
    INTERNALLENGTH = 16,
    INPUT = chkpass_in,
    OUTPUT = chkpass_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 1141
-- Name: TYPE chkpass; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE chkpass IS 'password type with checks';


--
-- TOC entry 1145 (class 0 OID 0)
-- Name: cube; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE cube;


--
-- TOC entry 145 (class 1255 OID 16567)
-- Dependencies: 4 1145
-- Name: cube_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_in(cstring) RETURNS cube
    AS '$libdir/cube', 'cube_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 148 (class 1255 OID 16570)
-- Dependencies: 4 1145
-- Name: cube_out(cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_out(cube) RETURNS cstring
    AS '$libdir/cube', 'cube_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1144 (class 1247 OID 16566)
-- Dependencies: 145 4 148
-- Name: cube; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE cube (
    INTERNALLENGTH = variable,
    INPUT = cube_in,
    OUTPUT = cube_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 1144
-- Name: TYPE cube; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE cube IS 'multi-dimensional cube ''(FLOAT-1, FLOAT-2, ..., FLOAT-N), (FLOAT-1, FLOAT-2, ..., FLOAT-N)''';


--
-- TOC entry 1166 (class 0 OID 0)
-- Name: ean13; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ean13;


--
-- TOC entry 307 (class 1255 OID 16790)
-- Dependencies: 4 1166
-- Name: ean13_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ean13_in(cstring) RETURNS ean13
    AS '$libdir/isn', 'ean13_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 308 (class 1255 OID 16791)
-- Dependencies: 4 1166
-- Name: ean13_out(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ean13_out(ean13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1165 (class 1247 OID 16789)
-- Dependencies: 308 4 307
-- Name: ean13; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ean13 (
    INTERNALLENGTH = 8,
    INPUT = ean13_in,
    OUTPUT = public.ean13_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 1165
-- Name: TYPE ean13; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE ean13 IS 'International European Article Number (EAN13)';


--
-- TOC entry 1133 (class 0 OID 0)
-- Name: gbtreekey16; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey16;


--
-- TOC entry 22 (class 1255 OID 16412)
-- Dependencies: 4 1133
-- Name: gbtreekey16_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey16_in(cstring) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbtreekey_in'
    LANGUAGE c STRICT;


--
-- TOC entry 23 (class 1255 OID 16413)
-- Dependencies: 4 1133
-- Name: gbtreekey16_out(gbtreekey16); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey16_out(gbtreekey16) RETURNS cstring
    AS '$libdir/btree_gist', 'gbtreekey_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1132 (class 1247 OID 16411)
-- Dependencies: 4 22 23
-- Name: gbtreekey16; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey16 (
    INTERNALLENGTH = 16,
    INPUT = gbtreekey16_in,
    OUTPUT = gbtreekey16_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1136 (class 0 OID 0)
-- Name: gbtreekey32; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey32;


--
-- TOC entry 24 (class 1255 OID 16416)
-- Dependencies: 4 1136
-- Name: gbtreekey32_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey32_in(cstring) RETURNS gbtreekey32
    AS '$libdir/btree_gist', 'gbtreekey_in'
    LANGUAGE c STRICT;


--
-- TOC entry 25 (class 1255 OID 16417)
-- Dependencies: 4 1136
-- Name: gbtreekey32_out(gbtreekey32); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey32_out(gbtreekey32) RETURNS cstring
    AS '$libdir/btree_gist', 'gbtreekey_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1135 (class 1247 OID 16415)
-- Dependencies: 4 25 24
-- Name: gbtreekey32; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey32 (
    INTERNALLENGTH = 32,
    INPUT = gbtreekey32_in,
    OUTPUT = gbtreekey32_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1118 (class 0 OID 0)
-- Name: gbtreekey4; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey4;


--
-- TOC entry 18 (class 1255 OID 16404)
-- Dependencies: 4 1118
-- Name: gbtreekey4_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey4_in(cstring) RETURNS gbtreekey4
    AS '$libdir/btree_gist', 'gbtreekey_in'
    LANGUAGE c STRICT;


--
-- TOC entry 19 (class 1255 OID 16405)
-- Dependencies: 4 1118
-- Name: gbtreekey4_out(gbtreekey4); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey4_out(gbtreekey4) RETURNS cstring
    AS '$libdir/btree_gist', 'gbtreekey_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1117 (class 1247 OID 16403)
-- Dependencies: 19 18 4
-- Name: gbtreekey4; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey4 (
    INTERNALLENGTH = 4,
    INPUT = gbtreekey4_in,
    OUTPUT = gbtreekey4_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1130 (class 0 OID 0)
-- Name: gbtreekey8; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey8;


--
-- TOC entry 20 (class 1255 OID 16408)
-- Dependencies: 4 1130
-- Name: gbtreekey8_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey8_in(cstring) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbtreekey_in'
    LANGUAGE c STRICT;


--
-- TOC entry 21 (class 1255 OID 16409)
-- Dependencies: 4 1130
-- Name: gbtreekey8_out(gbtreekey8); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey8_out(gbtreekey8) RETURNS cstring
    AS '$libdir/btree_gist', 'gbtreekey_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1129 (class 1247 OID 16407)
-- Dependencies: 21 20 4
-- Name: gbtreekey8; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey8 (
    INTERNALLENGTH = 8,
    INPUT = gbtreekey8_in,
    OUTPUT = gbtreekey8_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1139 (class 0 OID 0)
-- Name: gbtreekey_var; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey_var;


--
-- TOC entry 26 (class 1255 OID 16420)
-- Dependencies: 4 1139
-- Name: gbtreekey_var_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey_var_in(cstring) RETURNS gbtreekey_var
    AS '$libdir/btree_gist', 'gbtreekey_in'
    LANGUAGE c STRICT;


--
-- TOC entry 27 (class 1255 OID 16421)
-- Dependencies: 4 1139
-- Name: gbtreekey_var_out(gbtreekey_var); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbtreekey_var_out(gbtreekey_var) RETURNS cstring
    AS '$libdir/btree_gist', 'gbtreekey_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1138 (class 1247 OID 16419)
-- Dependencies: 26 27 4
-- Name: gbtreekey_var; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gbtreekey_var (
    INTERNALLENGTH = variable,
    INPUT = gbtreekey_var_in,
    OUTPUT = gbtreekey_var_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- TOC entry 1157 (class 0 OID 0)
-- Name: ghstore; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ghstore;


--
-- TOC entry 250 (class 1255 OID 16706)
-- Dependencies: 4 1157
-- Name: ghstore_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_in(cstring) RETURNS ghstore
    AS '$libdir/hstore', 'ghstore_in'
    LANGUAGE c STRICT;


--
-- TOC entry 251 (class 1255 OID 16707)
-- Dependencies: 4 1157
-- Name: ghstore_out(ghstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_out(ghstore) RETURNS cstring
    AS '$libdir/hstore', 'ghstore_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1156 (class 1247 OID 16705)
-- Dependencies: 250 251 4
-- Name: ghstore; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ghstore (
    INTERNALLENGTH = variable,
    INPUT = ghstore_in,
    OUTPUT = ghstore_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1206 (class 0 OID 0)
-- Name: gtrgm; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gtrgm;


--
-- TOC entry 648 (class 1255 OID 17438)
-- Dependencies: 4 1206
-- Name: gtrgm_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtrgm_in(cstring) RETURNS gtrgm
    AS '$libdir/pg_trgm', 'gtrgm_in'
    LANGUAGE c STRICT;


--
-- TOC entry 649 (class 1255 OID 17439)
-- Dependencies: 4 1206
-- Name: gtrgm_out(gtrgm); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtrgm_out(gtrgm) RETURNS cstring
    AS '$libdir/pg_trgm', 'gtrgm_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1205 (class 1247 OID 17437)
-- Dependencies: 4 649 648
-- Name: gtrgm; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gtrgm (
    INTERNALLENGTH = variable,
    INPUT = gtrgm_in,
    OUTPUT = gtrgm_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1241 (class 0 OID 0)
-- Name: gtsq; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gtsq;


--
-- TOC entry 858 (class 1255 OID 17842)
-- Dependencies: 4 1241
-- Name: gtsq_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsq_in(cstring) RETURNS gtsq
    AS '$libdir/tsearch2', 'gtsq_in'
    LANGUAGE c STRICT;


--
-- TOC entry 859 (class 1255 OID 17843)
-- Dependencies: 4 1241
-- Name: gtsq_out(gtsq); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsq_out(gtsq) RETURNS cstring
    AS '$libdir/tsearch2', 'gtsq_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1240 (class 1247 OID 17841)
-- Dependencies: 858 4 859
-- Name: gtsq; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gtsq (
    INTERNALLENGTH = 8,
    INPUT = gtsq_in,
    OUTPUT = gtsq_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1236 (class 0 OID 0)
-- Name: gtsvector; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE gtsvector;


--
-- TOC entry 819 (class 1255 OID 17774)
-- Dependencies: 4 1236
-- Name: gtsvector_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsvector_in(cstring) RETURNS gtsvector
    AS '$libdir/tsearch2', 'gtsvector_in'
    LANGUAGE c STRICT;


--
-- TOC entry 820 (class 1255 OID 17775)
-- Dependencies: 4 1236
-- Name: gtsvector_out(gtsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsvector_out(gtsvector) RETURNS cstring
    AS '$libdir/tsearch2', 'gtsvector_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1235 (class 1247 OID 17773)
-- Dependencies: 819 820 4
-- Name: gtsvector; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE gtsvector (
    INTERNALLENGTH = variable,
    INPUT = gtsvector_in,
    OUTPUT = gtsvector_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1153 (class 0 OID 0)
-- Name: hstore; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE hstore;


--
-- TOC entry 233 (class 1255 OID 16678)
-- Dependencies: 4 1153
-- Name: hstore_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hstore_in(cstring) RETURNS hstore
    AS '$libdir/hstore', 'hstore_in'
    LANGUAGE c STRICT;


--
-- TOC entry 234 (class 1255 OID 16679)
-- Dependencies: 4 1153
-- Name: hstore_out(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hstore_out(hstore) RETURNS cstring
    AS '$libdir/hstore', 'hstore_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1152 (class 1247 OID 16677)
-- Dependencies: 234 4 233
-- Name: hstore; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE hstore (
    INTERNALLENGTH = variable,
    INPUT = hstore_in,
    OUTPUT = hstore_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- TOC entry 1163 (class 0 OID 0)
-- Name: intbig_gkey; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE intbig_gkey;


--
-- TOC entry 296 (class 1255 OID 16775)
-- Dependencies: 4 1163
-- Name: _intbig_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _intbig_in(cstring) RETURNS intbig_gkey
    AS '$libdir/_int', '_intbig_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 297 (class 1255 OID 16776)
-- Dependencies: 4 1163
-- Name: _intbig_out(intbig_gkey); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _intbig_out(intbig_gkey) RETURNS cstring
    AS '$libdir/_int', '_intbig_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1162 (class 1247 OID 16774)
-- Dependencies: 4 296 297
-- Name: intbig_gkey; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE intbig_gkey (
    INTERNALLENGTH = variable,
    INPUT = _intbig_in,
    OUTPUT = _intbig_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1178 (class 0 OID 0)
-- Name: isbn; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE isbn;


--
-- TOC entry 315 (class 1255 OID 16806)
-- Dependencies: 4 1178
-- Name: isbn_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isbn_in(cstring) RETURNS isbn
    AS '$libdir/isn', 'isbn_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 316 (class 1255 OID 16807)
-- Dependencies: 4 1178
-- Name: isn_out(isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isn_out(isbn) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1177 (class 1247 OID 16805)
-- Dependencies: 4 316 315
-- Name: isbn; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE isbn (
    INTERNALLENGTH = 8,
    INPUT = isbn_in,
    OUTPUT = public.isn_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 1177
-- Name: TYPE isbn; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE isbn IS 'International Standard Book Number (ISBN)';


--
-- TOC entry 1169 (class 0 OID 0)
-- Name: isbn13; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE isbn13;


--
-- TOC entry 310 (class 1255 OID 16795)
-- Dependencies: 4 1169
-- Name: ean13_out(isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ean13_out(isbn13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 309 (class 1255 OID 16794)
-- Dependencies: 4 1169
-- Name: isbn13_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isbn13_in(cstring) RETURNS isbn13
    AS '$libdir/isn', 'isbn_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1168 (class 1247 OID 16793)
-- Dependencies: 4 310 309
-- Name: isbn13; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE isbn13 (
    INTERNALLENGTH = 8,
    INPUT = isbn13_in,
    OUTPUT = public.ean13_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 1168
-- Name: TYPE isbn13; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE isbn13 IS 'International Standard Book Number 13 (ISBN13)';


--
-- TOC entry 1181 (class 0 OID 0)
-- Name: ismn; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ismn;


--
-- TOC entry 317 (class 1255 OID 16810)
-- Dependencies: 4 1181
-- Name: ismn_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ismn_in(cstring) RETURNS ismn
    AS '$libdir/isn', 'ismn_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 318 (class 1255 OID 16811)
-- Dependencies: 4 1181
-- Name: isn_out(ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isn_out(ismn) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1180 (class 1247 OID 16809)
-- Dependencies: 318 4 317
-- Name: ismn; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ismn (
    INTERNALLENGTH = 8,
    INPUT = ismn_in,
    OUTPUT = public.isn_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 1180
-- Name: TYPE ismn; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE ismn IS 'International Standard Music Number (ISMN)';


--
-- TOC entry 1172 (class 0 OID 0)
-- Name: ismn13; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ismn13;


--
-- TOC entry 312 (class 1255 OID 16799)
-- Dependencies: 4 1172
-- Name: ean13_out(ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ean13_out(ismn13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 311 (class 1255 OID 16798)
-- Dependencies: 4 1172
-- Name: ismn13_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ismn13_in(cstring) RETURNS ismn13
    AS '$libdir/isn', 'ismn_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1171 (class 1247 OID 16797)
-- Dependencies: 4 311 312
-- Name: ismn13; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ismn13 (
    INTERNALLENGTH = 8,
    INPUT = ismn13_in,
    OUTPUT = public.ean13_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 1171
-- Name: TYPE ismn13; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE ismn13 IS 'International Standard Music Number 13 (ISMN13)';


--
-- TOC entry 1184 (class 0 OID 0)
-- Name: issn; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE issn;


--
-- TOC entry 320 (class 1255 OID 16815)
-- Dependencies: 4 1184
-- Name: isn_out(issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isn_out(issn) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 319 (class 1255 OID 16814)
-- Dependencies: 4 1184
-- Name: issn_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION issn_in(cstring) RETURNS issn
    AS '$libdir/isn', 'issn_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1183 (class 1247 OID 16813)
-- Dependencies: 319 320 4
-- Name: issn; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE issn (
    INTERNALLENGTH = 8,
    INPUT = issn_in,
    OUTPUT = public.isn_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 1183
-- Name: TYPE issn; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE issn IS 'International Standard Serial Number (ISSN)';


--
-- TOC entry 1175 (class 0 OID 0)
-- Name: issn13; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE issn13;


--
-- TOC entry 314 (class 1255 OID 16803)
-- Dependencies: 4 1175
-- Name: ean13_out(issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ean13_out(issn13) RETURNS cstring
    AS '$libdir/isn', 'ean13_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 313 (class 1255 OID 16802)
-- Dependencies: 4 1175
-- Name: issn13_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION issn13_in(cstring) RETURNS issn13
    AS '$libdir/isn', 'issn_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1174 (class 1247 OID 16801)
-- Dependencies: 314 313 4
-- Name: issn13; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE issn13 (
    INTERNALLENGTH = 8,
    INPUT = issn13_in,
    OUTPUT = public.ean13_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 1174
-- Name: TYPE issn13; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE issn13 IS 'International Standard Serial Number 13 (ISSN13)';


--
-- TOC entry 1194 (class 0 OID 0)
-- Name: lquery; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE lquery;


--
-- TOC entry 601 (class 1255 OID 17337)
-- Dependencies: 4 1194
-- Name: lquery_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lquery_in(cstring) RETURNS lquery
    AS '$libdir/ltree', 'lquery_in'
    LANGUAGE c STRICT;


--
-- TOC entry 602 (class 1255 OID 17338)
-- Dependencies: 4 1194
-- Name: lquery_out(lquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lquery_out(lquery) RETURNS cstring
    AS '$libdir/ltree', 'lquery_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1193 (class 1247 OID 17336)
-- Dependencies: 4 602 601
-- Name: lquery; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE lquery (
    INTERNALLENGTH = variable,
    INPUT = lquery_in,
    OUTPUT = lquery_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- TOC entry 1191 (class 0 OID 0)
-- Name: ltree; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ltree;


--
-- TOC entry 570 (class 1255 OID 17290)
-- Dependencies: 4 1191
-- Name: ltree_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_in(cstring) RETURNS ltree
    AS '$libdir/ltree', 'ltree_in'
    LANGUAGE c STRICT;


--
-- TOC entry 571 (class 1255 OID 17291)
-- Dependencies: 4 1191
-- Name: ltree_out(ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_out(ltree) RETURNS cstring
    AS '$libdir/ltree', 'ltree_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1190 (class 1247 OID 17289)
-- Dependencies: 571 570 4
-- Name: ltree; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ltree (
    INTERNALLENGTH = variable,
    INPUT = ltree_in,
    OUTPUT = ltree_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- TOC entry 1200 (class 0 OID 0)
-- Name: ltree_gist; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ltree_gist;


--
-- TOC entry 611 (class 1255 OID 17363)
-- Dependencies: 4 1200
-- Name: ltree_gist_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_gist_in(cstring) RETURNS ltree_gist
    AS '$libdir/ltree', 'ltree_gist_in'
    LANGUAGE c STRICT;


--
-- TOC entry 612 (class 1255 OID 17364)
-- Dependencies: 4 1200
-- Name: ltree_gist_out(ltree_gist); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_gist_out(ltree_gist) RETURNS cstring
    AS '$libdir/ltree', 'ltree_gist_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1199 (class 1247 OID 17362)
-- Dependencies: 4 612 611
-- Name: ltree_gist; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ltree_gist (
    INTERNALLENGTH = variable,
    INPUT = ltree_gist_in,
    OUTPUT = ltree_gist_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1197 (class 0 OID 0)
-- Name: ltxtquery; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE ltxtquery;


--
-- TOC entry 607 (class 1255 OID 17353)
-- Dependencies: 4 1197
-- Name: ltxtq_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltxtq_in(cstring) RETURNS ltxtquery
    AS '$libdir/ltree', 'ltxtq_in'
    LANGUAGE c STRICT;


--
-- TOC entry 608 (class 1255 OID 17354)
-- Dependencies: 4 1197
-- Name: ltxtq_out(ltxtquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltxtq_out(ltxtquery) RETURNS cstring
    AS '$libdir/ltree', 'ltxtq_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1196 (class 1247 OID 17352)
-- Dependencies: 608 4 607
-- Name: ltxtquery; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE ltxtquery (
    INTERNALLENGTH = variable,
    INPUT = ltxtq_in,
    OUTPUT = ltxtq_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- TOC entry 1160 (class 0 OID 0)
-- Name: query_int; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE query_int;


--
-- TOC entry 262 (class 1255 OID 16722)
-- Dependencies: 4 1160
-- Name: bqarr_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bqarr_in(cstring) RETURNS query_int
    AS '$libdir/_int', 'bqarr_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 263 (class 1255 OID 16723)
-- Dependencies: 4 1160
-- Name: bqarr_out(query_int); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bqarr_out(query_int) RETURNS cstring
    AS '$libdir/_int', 'bqarr_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1159 (class 1247 OID 16721)
-- Dependencies: 263 4 262
-- Name: query_int; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE query_int (
    INTERNALLENGTH = variable,
    INPUT = bqarr_in,
    OUTPUT = bqarr_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1214 (class 0 OID 0)
-- Name: seg; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE seg;


--
-- TOC entry 697 (class 1255 OID 17500)
-- Dependencies: 4 1214
-- Name: seg_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_in(cstring) RETURNS seg
    AS '$libdir/seg', 'seg_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 698 (class 1255 OID 17501)
-- Dependencies: 4 1214
-- Name: seg_out(seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_out(seg) RETURNS cstring
    AS '$libdir/seg', 'seg_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1213 (class 1247 OID 17499)
-- Dependencies: 698 697 4
-- Name: seg; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE seg (
    INTERNALLENGTH = 12,
    INPUT = seg_in,
    OUTPUT = seg_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 1213
-- Name: TYPE seg; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE seg IS 'floating point interval ''FLOAT .. FLOAT'', ''.. FLOAT'', ''FLOAT ..'' or ''FLOAT''';


--
-- TOC entry 1233 (class 0 OID 0)
-- Name: tsquery; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE tsquery;


--
-- TOC entry 793 (class 1255 OID 17744)
-- Dependencies: 4 1233
-- Name: tsquery_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_in(cstring) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_in'
    LANGUAGE c STRICT;


--
-- TOC entry 794 (class 1255 OID 17745)
-- Dependencies: 4 1233
-- Name: tsquery_out(tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_out(tsquery) RETURNS cstring
    AS '$libdir/tsearch2', 'tsquery_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1232 (class 1247 OID 17743)
-- Dependencies: 793 4 794
-- Name: tsquery; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE tsquery (
    INTERNALLENGTH = variable,
    INPUT = tsquery_in,
    OUTPUT = tsquery_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- TOC entry 1230 (class 0 OID 0)
-- Name: tsvector; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE tsvector;


--
-- TOC entry 784 (class 1255 OID 17732)
-- Dependencies: 4 1230
-- Name: tsvector_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsvector_in(cstring) RETURNS tsvector
    AS '$libdir/tsearch2', 'tsvector_in'
    LANGUAGE c STRICT;


--
-- TOC entry 785 (class 1255 OID 17733)
-- Dependencies: 4 1230
-- Name: tsvector_out(tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsvector_out(tsvector) RETURNS cstring
    AS '$libdir/tsearch2', 'tsvector_out'
    LANGUAGE c STRICT;


--
-- TOC entry 1229 (class 1247 OID 17731)
-- Dependencies: 784 785 4
-- Name: tsvector; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE tsvector (
    INTERNALLENGTH = variable,
    INPUT = tsvector_in,
    OUTPUT = tsvector_out,
    ALIGNMENT = int4,
    STORAGE = extended
);


--
-- TOC entry 1187 (class 0 OID 0)
-- Name: upc; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE upc;


--
-- TOC entry 322 (class 1255 OID 16819)
-- Dependencies: 4 1187
-- Name: isn_out(upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isn_out(upc) RETURNS cstring
    AS '$libdir/isn', 'isn_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 321 (class 1255 OID 16818)
-- Dependencies: 4 1187
-- Name: upc_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION upc_in(cstring) RETURNS upc
    AS '$libdir/isn', 'upc_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1186 (class 1247 OID 16817)
-- Dependencies: 321 4 322
-- Name: upc; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE upc (
    INTERNALLENGTH = 8,
    INPUT = upc_in,
    OUTPUT = public.isn_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 1186
-- Name: TYPE upc; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TYPE upc IS 'Universal Product Code (UPC)';


--
-- TOC entry 1210 (class 1247 OID 17490)
-- Dependencies: 2616
-- Name: bt_metap_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE bt_metap_type AS (
	magic integer,
	version integer,
	root integer,
	"level" integer,
	fastroot integer,
	fastlevel integer
);


--
-- TOC entry 1212 (class 1247 OID 17496)
-- Dependencies: 2618
-- Name: bt_page_items_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE bt_page_items_type AS (
	itemoffset integer,
	ctid tid,
	itemlen integer,
	nulls boolean,
	vars boolean,
	data text
);


--
-- TOC entry 1211 (class 1247 OID 17493)
-- Dependencies: 2617
-- Name: bt_page_stats_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE bt_page_stats_type AS (
	blkno integer,
	"type" character(1),
	live_items integer,
	dead_items integer,
	avg_item_size double precision,
	page_size integer,
	free_size integer,
	btpo_prev integer,
	btpo_next integer,
	btpo integer,
	btpo_flags integer
);


--
-- TOC entry 1147 (class 1247 OID 16643)
-- Dependencies: 2609
-- Name: dblink_pkey_results; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE dblink_pkey_results AS (
	"position" integer,
	colname text
);


--
-- TOC entry 165 (class 1255 OID 16589)
-- Dependencies: 1144 4
-- Name: cube_dim(cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_dim(cube) RETURNS integer
    AS '$libdir/cube', 'cube_dim'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 164 (class 1255 OID 16588)
-- Dependencies: 1144 4 1144
-- Name: cube_distance(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_distance(cube, cube) RETURNS double precision
    AS '$libdir/cube', 'cube_distance'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 172 (class 1255 OID 16596)
-- Dependencies: 4 1144
-- Name: cube_is_point(cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_is_point(cube) RETURNS boolean
    AS '$libdir/cube', 'cube_is_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 217 (class 1255 OID 16656)
-- Dependencies: 4
-- Name: earth(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION earth() RETURNS double precision
    AS $$SELECT '6378168'::float8$$
    LANGUAGE sql IMMUTABLE;


--
-- TOC entry 1148 (class 1247 OID 16657)
-- Dependencies: 1149 1150 1151 1144 4 148
-- Name: earth; Type: DOMAIN; Schema: public; Owner: -
--

CREATE DOMAIN earth AS cube
	CONSTRAINT not_3d CHECK ((cube_dim(VALUE) <= 3))
	CONSTRAINT not_point CHECK (cube_is_point(VALUE))
	CONSTRAINT on_surface CHECK ((abs(((cube_distance(VALUE, '(0)'::cube) / earth()) - (1)::double precision)) < 9.9999999999999995e-007::double precision));


--
-- TOC entry 1155 (class 1247 OID 16703)
-- Dependencies: 2610
-- Name: hs_each; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE hs_each AS (
	"key" text,
	value text
);


--
-- TOC entry 1189 (class 1247 OID 17286)
-- Dependencies: 4
-- Name: lo; Type: DOMAIN; Schema: public; Owner: -
--

CREATE DOMAIN lo AS oid;


--
-- TOC entry 1209 (class 1247 OID 17487)
-- Dependencies: 2615
-- Name: pgstatindex_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE pgstatindex_type AS (
	version integer,
	tree_level integer,
	index_size integer,
	root_block_no integer,
	internal_pages integer,
	leaf_pages integer,
	empty_pages integer,
	deleted_pages integer,
	avg_leaf_density double precision,
	leaf_fragmentation double precision
);


--
-- TOC entry 1208 (class 1247 OID 17483)
-- Dependencies: 2614
-- Name: pgstattuple_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE pgstattuple_type AS (
	table_len bigint,
	tuple_count bigint,
	tuple_len bigint,
	tuple_percent double precision,
	dead_tuple_count bigint,
	dead_tuple_len bigint,
	dead_tuple_percent double precision,
	free_space bigint,
	free_percent double precision
);


--
-- TOC entry 1238 (class 1247 OID 17786)
-- Dependencies: 2628
-- Name: statinfo; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE statinfo AS (
	word text,
	ndoc integer,
	nentry integer
);


--
-- TOC entry 1216 (class 1247 OID 17564)
-- Dependencies: 2619
-- Name: tablefunc_crosstab_2; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE tablefunc_crosstab_2 AS (
	row_name text,
	category_1 text,
	category_2 text
);


--
-- TOC entry 1217 (class 1247 OID 17566)
-- Dependencies: 2620
-- Name: tablefunc_crosstab_3; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE tablefunc_crosstab_3 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text
);


--
-- TOC entry 1218 (class 1247 OID 17568)
-- Dependencies: 2621
-- Name: tablefunc_crosstab_4; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE tablefunc_crosstab_4 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text,
	category_4 text
);


--
-- TOC entry 1224 (class 1247 OID 17624)
-- Dependencies: 2625
-- Name: tokenout; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE tokenout AS (
	tokid integer,
	token text
);


--
-- TOC entry 1223 (class 1247 OID 17617)
-- Dependencies: 2624
-- Name: tokentype; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE tokentype AS (
	tokid integer,
	alias text,
	descr text
);


--
-- TOC entry 1239 (class 1247 OID 17792)
-- Dependencies: 2629
-- Name: tsdebug; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE tsdebug AS (
	ts_name text,
	tok_type text,
	description text,
	token text,
	dict_name text[],
	tsvector tsvector
);


--
-- TOC entry 832 (class 1255 OID 17793)
-- Dependencies: 4
-- Name: _get_parser_from_curcfg(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _get_parser_from_curcfg() RETURNS text
    AS $$ select prs_name from pg_ts_cfg where oid = show_curcfg() $$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 268 (class 1255 OID 16731)
-- Dependencies: 4
-- Name: _int_contained(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _int_contained(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 268
-- Name: FUNCTION _int_contained(integer[], integer[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION _int_contained(integer[], integer[]) IS 'contained in';


--
-- TOC entry 267 (class 1255 OID 16730)
-- Dependencies: 4
-- Name: _int_contains(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _int_contains(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_contains'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 267
-- Name: FUNCTION _int_contains(integer[], integer[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION _int_contains(integer[], integer[]) IS 'contains';


--
-- TOC entry 271 (class 1255 OID 16734)
-- Dependencies: 4
-- Name: _int_different(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _int_different(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_different'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 271
-- Name: FUNCTION _int_different(integer[], integer[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION _int_different(integer[], integer[]) IS 'different';


--
-- TOC entry 273 (class 1255 OID 16736)
-- Dependencies: 4
-- Name: _int_inter(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _int_inter(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', '_int_inter'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 269 (class 1255 OID 16732)
-- Dependencies: 4
-- Name: _int_overlap(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _int_overlap(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_overlap'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 269
-- Name: FUNCTION _int_overlap(integer[], integer[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION _int_overlap(integer[], integer[]) IS 'overlaps';


--
-- TOC entry 270 (class 1255 OID 16733)
-- Dependencies: 4
-- Name: _int_same(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _int_same(integer[], integer[]) RETURNS boolean
    AS '$libdir/_int', '_int_same'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 270
-- Name: FUNCTION _int_same(integer[], integer[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION _int_same(integer[], integer[]) IS 'same as';


--
-- TOC entry 272 (class 1255 OID 16735)
-- Dependencies: 4
-- Name: _int_union(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _int_union(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', '_int_union'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 626 (class 1255 OID 17380)
-- Dependencies: 1195 4 1192
-- Name: _lt_q_regex(ltree[], lquery[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _lt_q_regex(ltree[], lquery[]) RETURNS boolean
    AS '$libdir/ltree', '_lt_q_regex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 627 (class 1255 OID 17381)
-- Dependencies: 1192 1195 4
-- Name: _lt_q_rregex(lquery[], ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _lt_q_rregex(lquery[], ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_lt_q_rregex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 632 (class 1255 OID 17408)
-- Dependencies: 4 1190 1192 1193
-- Name: _ltq_extract_regex(ltree[], lquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltq_extract_regex(ltree[], lquery) RETURNS ltree
    AS '$libdir/ltree', '_ltq_extract_regex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 624 (class 1255 OID 17378)
-- Dependencies: 1193 4 1192
-- Name: _ltq_regex(ltree[], lquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltq_regex(ltree[], lquery) RETURNS boolean
    AS '$libdir/ltree', '_ltq_regex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 625 (class 1255 OID 17379)
-- Dependencies: 4 1193 1192
-- Name: _ltq_rregex(lquery, ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltq_rregex(lquery, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltq_rregex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 635 (class 1255 OID 17413)
-- Dependencies: 4
-- Name: _ltree_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_compress(internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_compress'
    LANGUAGE c;


--
-- TOC entry 634 (class 1255 OID 17412)
-- Dependencies: 4
-- Name: _ltree_consistent(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_consistent(internal, internal, smallint) RETURNS boolean
    AS '$libdir/ltree', '_ltree_consistent'
    LANGUAGE c;


--
-- TOC entry 630 (class 1255 OID 17404)
-- Dependencies: 1192 1190 4 1190
-- Name: _ltree_extract_isparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_extract_isparent(ltree[], ltree) RETURNS ltree
    AS '$libdir/ltree', '_ltree_extract_isparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 631 (class 1255 OID 17406)
-- Dependencies: 1190 1192 4 1190
-- Name: _ltree_extract_risparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_extract_risparent(ltree[], ltree) RETURNS ltree
    AS '$libdir/ltree', '_ltree_extract_risparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 620 (class 1255 OID 17374)
-- Dependencies: 1192 4 1190
-- Name: _ltree_isparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_isparent(ltree[], ltree) RETURNS boolean
    AS '$libdir/ltree', '_ltree_isparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 636 (class 1255 OID 17414)
-- Dependencies: 4
-- Name: _ltree_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 637 (class 1255 OID 17415)
-- Dependencies: 4
-- Name: _ltree_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_picksplit(internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_picksplit'
    LANGUAGE c;


--
-- TOC entry 621 (class 1255 OID 17375)
-- Dependencies: 1190 4 1192
-- Name: _ltree_r_isparent(ltree, ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_r_isparent(ltree, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltree_r_isparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 623 (class 1255 OID 17377)
-- Dependencies: 4 1190 1192
-- Name: _ltree_r_risparent(ltree, ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_r_risparent(ltree, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltree_r_risparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 622 (class 1255 OID 17376)
-- Dependencies: 1190 1192 4
-- Name: _ltree_risparent(ltree[], ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_risparent(ltree[], ltree) RETURNS boolean
    AS '$libdir/ltree', '_ltree_risparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 639 (class 1255 OID 17417)
-- Dependencies: 4
-- Name: _ltree_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_same(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', '_ltree_same'
    LANGUAGE c;


--
-- TOC entry 638 (class 1255 OID 17416)
-- Dependencies: 4
-- Name: _ltree_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltree_union(internal, internal) RETURNS integer
    AS '$libdir/ltree', '_ltree_union'
    LANGUAGE c;


--
-- TOC entry 628 (class 1255 OID 17382)
-- Dependencies: 1192 4 1196
-- Name: _ltxtq_exec(ltree[], ltxtquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltxtq_exec(ltree[], ltxtquery) RETURNS boolean
    AS '$libdir/ltree', '_ltxtq_exec'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 633 (class 1255 OID 17410)
-- Dependencies: 1196 4 1190 1192
-- Name: _ltxtq_extract_exec(ltree[], ltxtquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltxtq_extract_exec(ltree[], ltxtquery) RETURNS ltree
    AS '$libdir/ltree', '_ltxtq_extract_exec'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 629 (class 1255 OID 17383)
-- Dependencies: 1192 1196 4
-- Name: _ltxtq_rexec(ltxtquery, ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _ltxtq_rexec(ltxtquery, ltree[]) RETURNS boolean
    AS '$libdir/ltree', '_ltxtq_rexec'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 245 (class 1255 OID 16698)
-- Dependencies: 4 1152
-- Name: akeys(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION akeys(hstore) RETURNS text[]
    AS '$libdir/hstore', 'akeys'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 688 (class 1255 OID 17480)
-- Dependencies: 4
-- Name: armor(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION armor(bytea) RETURNS text
    AS '$libdir/pgcrypto', 'pg_armor'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 725 (class 1255 OID 17546)
-- Dependencies: 4
-- Name: autoinc(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION autoinc() RETURNS "trigger"
    AS '$libdir/autoinc', 'autoinc'
    LANGUAGE c;


--
-- TOC entry 246 (class 1255 OID 16699)
-- Dependencies: 4 1152
-- Name: avals(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION avals(hstore) RETURNS text[]
    AS '$libdir/hstore', 'avals'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 265 (class 1255 OID 16726)
-- Dependencies: 4 1159
-- Name: boolop(integer[], query_int); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION boolop(integer[], query_int) RETURNS boolean
    AS '$libdir/_int', 'boolop'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 265
-- Name: FUNCTION boolop(integer[], query_int); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION boolop(integer[], query_int) IS 'boolean operation with array';


--
-- TOC entry 693 (class 1255 OID 17491)
-- Dependencies: 4 1210
-- Name: bt_metap(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bt_metap(text) RETURNS bt_metap_type
    AS '$libdir/pgstattuple', 'bt_metap'
    LANGUAGE c STRICT;


--
-- TOC entry 695 (class 1255 OID 17497)
-- Dependencies: 1212 4
-- Name: bt_page_items(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bt_page_items(text, integer) RETURNS SETOF bt_page_items_type
    AS '$libdir/pgstattuple', 'bt_page_items'
    LANGUAGE c STRICT;


--
-- TOC entry 694 (class 1255 OID 17494)
-- Dependencies: 4 1211
-- Name: bt_page_stats(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bt_page_stats(text, integer) RETURNS bt_page_stats_type
    AS '$libdir/pgstattuple', 'bt_page_stats'
    LANGUAGE c STRICT;


--
-- TOC entry 491 (class 1255 OID 17157)
-- Dependencies: 4 1165 1165
-- Name: btean13cmp(ean13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btean13cmp(ean13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 492 (class 1255 OID 17158)
-- Dependencies: 4 1165 1168
-- Name: btean13cmp(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btean13cmp(ean13, isbn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 493 (class 1255 OID 17159)
-- Dependencies: 4 1171 1165
-- Name: btean13cmp(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btean13cmp(ean13, ismn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 494 (class 1255 OID 17160)
-- Dependencies: 4 1174 1165
-- Name: btean13cmp(ean13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btean13cmp(ean13, issn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 495 (class 1255 OID 17161)
-- Dependencies: 4 1165 1177
-- Name: btean13cmp(ean13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btean13cmp(ean13, isbn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 496 (class 1255 OID 17162)
-- Dependencies: 1165 1180 4
-- Name: btean13cmp(ean13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btean13cmp(ean13, ismn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 497 (class 1255 OID 17163)
-- Dependencies: 4 1165 1183
-- Name: btean13cmp(ean13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btean13cmp(ean13, issn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 498 (class 1255 OID 17164)
-- Dependencies: 4 1186 1165
-- Name: btean13cmp(ean13, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btean13cmp(ean13, upc) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 500 (class 1255 OID 17168)
-- Dependencies: 4 1168 1168
-- Name: btisbn13cmp(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btisbn13cmp(isbn13, isbn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 501 (class 1255 OID 17169)
-- Dependencies: 1165 1168 4
-- Name: btisbn13cmp(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btisbn13cmp(isbn13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 502 (class 1255 OID 17170)
-- Dependencies: 1177 1168 4
-- Name: btisbn13cmp(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btisbn13cmp(isbn13, isbn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 504 (class 1255 OID 17174)
-- Dependencies: 1177 1177 4
-- Name: btisbncmp(isbn, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btisbncmp(isbn, isbn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 505 (class 1255 OID 17175)
-- Dependencies: 1177 1165 4
-- Name: btisbncmp(isbn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btisbncmp(isbn, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 506 (class 1255 OID 17176)
-- Dependencies: 1168 4 1177
-- Name: btisbncmp(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btisbncmp(isbn, isbn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 508 (class 1255 OID 17180)
-- Dependencies: 1171 1171 4
-- Name: btismn13cmp(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btismn13cmp(ismn13, ismn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 509 (class 1255 OID 17181)
-- Dependencies: 4 1171 1165
-- Name: btismn13cmp(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btismn13cmp(ismn13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 510 (class 1255 OID 17182)
-- Dependencies: 4 1171 1180
-- Name: btismn13cmp(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btismn13cmp(ismn13, ismn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 512 (class 1255 OID 17186)
-- Dependencies: 4 1180 1180
-- Name: btismncmp(ismn, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btismncmp(ismn, ismn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 513 (class 1255 OID 17187)
-- Dependencies: 4 1180 1165
-- Name: btismncmp(ismn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btismncmp(ismn, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 514 (class 1255 OID 17188)
-- Dependencies: 4 1180 1171
-- Name: btismncmp(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btismncmp(ismn, ismn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 516 (class 1255 OID 17192)
-- Dependencies: 4 1174 1174
-- Name: btissn13cmp(issn13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btissn13cmp(issn13, issn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 517 (class 1255 OID 17193)
-- Dependencies: 4 1174 1165
-- Name: btissn13cmp(issn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btissn13cmp(issn13, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 518 (class 1255 OID 17194)
-- Dependencies: 4 1174 1183
-- Name: btissn13cmp(issn13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btissn13cmp(issn13, issn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 520 (class 1255 OID 17198)
-- Dependencies: 4 1183 1183
-- Name: btissncmp(issn, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btissncmp(issn, issn) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 521 (class 1255 OID 17199)
-- Dependencies: 4 1183 1165
-- Name: btissncmp(issn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btissncmp(issn, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 522 (class 1255 OID 17200)
-- Dependencies: 4 1183 1174
-- Name: btissncmp(issn, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btissncmp(issn, issn13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 524 (class 1255 OID 17204)
-- Dependencies: 4 1186 1186
-- Name: btupccmp(upc, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btupccmp(upc, upc) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 525 (class 1255 OID 17205)
-- Dependencies: 4 1186 1165
-- Name: btupccmp(upc, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION btupccmp(upc, ean13) RETURNS integer
    AS $$btint8cmp$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 729 (class 1255 OID 17550)
-- Dependencies: 4
-- Name: check_foreign_key(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION check_foreign_key() RETURNS "trigger"
    AS '$libdir/refint', 'check_foreign_key'
    LANGUAGE c;


--
-- TOC entry 728 (class 1255 OID 17549)
-- Dependencies: 4
-- Name: check_primary_key(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION check_primary_key() RETURNS "trigger"
    AS '$libdir/refint', 'check_primary_key'
    LANGUAGE c;


--
-- TOC entry 792 (class 1255 OID 17741)
-- Dependencies: 1229 4 1229 1229
-- Name: concat(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION concat(tsvector, tsvector) RETURNS tsvector
    AS '$libdir/tsearch2', 'concat'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 747 (class 1255 OID 17574)
-- Dependencies: 4
-- Name: connectby(text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION connectby(text, text, text, text, integer, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text'
    LANGUAGE c STABLE STRICT;


--
-- TOC entry 748 (class 1255 OID 17575)
-- Dependencies: 4
-- Name: connectby(text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION connectby(text, text, text, text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text'
    LANGUAGE c STABLE STRICT;


--
-- TOC entry 749 (class 1255 OID 17576)
-- Dependencies: 4
-- Name: connectby(text, text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION connectby(text, text, text, text, text, integer, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE c STABLE STRICT;


--
-- TOC entry 750 (class 1255 OID 17577)
-- Dependencies: 4
-- Name: connectby(text, text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION connectby(text, text, text, text, text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE c STABLE STRICT;


--
-- TOC entry 741 (class 1255 OID 17562)
-- Dependencies: 4
-- Name: crosstab(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosstab(text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


--
-- TOC entry 745 (class 1255 OID 17572)
-- Dependencies: 4
-- Name: crosstab(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosstab(text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


--
-- TOC entry 746 (class 1255 OID 17573)
-- Dependencies: 4
-- Name: crosstab(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosstab(text, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab_hash'
    LANGUAGE c STABLE STRICT;


--
-- TOC entry 742 (class 1255 OID 17569)
-- Dependencies: 4 1216
-- Name: crosstab2(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosstab2(text) RETURNS SETOF tablefunc_crosstab_2
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


--
-- TOC entry 743 (class 1255 OID 17570)
-- Dependencies: 1217 4
-- Name: crosstab3(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosstab3(text) RETURNS SETOF tablefunc_crosstab_3
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


--
-- TOC entry 744 (class 1255 OID 17571)
-- Dependencies: 4 1218
-- Name: crosstab4(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosstab4(text) RETURNS SETOF tablefunc_crosstab_4
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


--
-- TOC entry 661 (class 1255 OID 17453)
-- Dependencies: 4
-- Name: crypt(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crypt(text, text) RETURNS text
    AS '$libdir/pgcrypto', 'pg_crypt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 146 (class 1255 OID 16568)
-- Dependencies: 1144 4
-- Name: cube(double precision[], double precision[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube(double precision[], double precision[]) RETURNS cube
    AS '$libdir/cube', 'cube_a_f8_f8'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 147 (class 1255 OID 16569)
-- Dependencies: 4 1144
-- Name: cube(double precision[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube(double precision[]) RETURNS cube
    AS '$libdir/cube', 'cube_a_f8'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 149 (class 1255 OID 16572)
-- Dependencies: 1144 4
-- Name: cube(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube(text) RETURNS cube
    AS '$libdir/cube', 'cube'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 149
-- Name: FUNCTION cube(text); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION cube(text) IS 'convert text to cube';


--
-- TOC entry 168 (class 1255 OID 16592)
-- Dependencies: 4 1144
-- Name: cube(double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube(double precision) RETURNS cube
    AS '$libdir/cube', 'cube_f8'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 169 (class 1255 OID 16593)
-- Dependencies: 1144 4
-- Name: cube(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube(double precision, double precision) RETURNS cube
    AS '$libdir/cube', 'cube_f8_f8'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 170 (class 1255 OID 16594)
-- Dependencies: 1144 1144 4
-- Name: cube(cube, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube(cube, double precision) RETURNS cube
    AS '$libdir/cube', 'cube_c_f8'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 171 (class 1255 OID 16595)
-- Dependencies: 1144 1144 4
-- Name: cube(cube, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube(cube, double precision, double precision) RETURNS cube
    AS '$libdir/cube', 'cube_c_f8_f8'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 156 (class 1255 OID 16580)
-- Dependencies: 1144 4 1144
-- Name: cube_cmp(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_cmp(cube, cube) RETURNS integer
    AS '$libdir/cube', 'cube_cmp'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 156
-- Name: FUNCTION cube_cmp(cube, cube); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION cube_cmp(cube, cube) IS 'btree comparison function';


--
-- TOC entry 158 (class 1255 OID 16582)
-- Dependencies: 1144 4 1144
-- Name: cube_contained(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_contained(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 158
-- Name: FUNCTION cube_contained(cube, cube); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION cube_contained(cube, cube) IS 'contained in';


--
-- TOC entry 157 (class 1255 OID 16581)
-- Dependencies: 4 1144 1144
-- Name: cube_contains(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_contains(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_contains'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 157
-- Name: FUNCTION cube_contains(cube, cube); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION cube_contains(cube, cube) IS 'contains';


--
-- TOC entry 173 (class 1255 OID 16597)
-- Dependencies: 1144 1144 4
-- Name: cube_enlarge(cube, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_enlarge(cube, double precision, integer) RETURNS cube
    AS '$libdir/cube', 'cube_enlarge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 150 (class 1255 OID 16574)
-- Dependencies: 1144 4 1144
-- Name: cube_eq(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_eq(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_eq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 150
-- Name: FUNCTION cube_eq(cube, cube); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION cube_eq(cube, cube) IS 'same as';


--
-- TOC entry 155 (class 1255 OID 16579)
-- Dependencies: 1144 1144 4
-- Name: cube_ge(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_ge(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_ge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 155
-- Name: FUNCTION cube_ge(cube, cube); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION cube_ge(cube, cube) IS 'greater than or equal to';


--
-- TOC entry 153 (class 1255 OID 16577)
-- Dependencies: 1144 1144 4
-- Name: cube_gt(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_gt(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_gt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 153
-- Name: FUNCTION cube_gt(cube, cube); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION cube_gt(cube, cube) IS 'greater than';


--
-- TOC entry 161 (class 1255 OID 16585)
-- Dependencies: 4 1144 1144 1144
-- Name: cube_inter(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_inter(cube, cube) RETURNS cube
    AS '$libdir/cube', 'cube_inter'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 154 (class 1255 OID 16578)
-- Dependencies: 4 1144 1144
-- Name: cube_le(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_le(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_le'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 154
-- Name: FUNCTION cube_le(cube, cube); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION cube_le(cube, cube) IS 'lower than or equal to';


--
-- TOC entry 166 (class 1255 OID 16590)
-- Dependencies: 4 1144
-- Name: cube_ll_coord(cube, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_ll_coord(cube, integer) RETURNS double precision
    AS '$libdir/cube', 'cube_ll_coord'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 152 (class 1255 OID 16576)
-- Dependencies: 4 1144 1144
-- Name: cube_lt(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_lt(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_lt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 152
-- Name: FUNCTION cube_lt(cube, cube); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION cube_lt(cube, cube) IS 'lower than';


--
-- TOC entry 151 (class 1255 OID 16575)
-- Dependencies: 4 1144 1144
-- Name: cube_ne(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_ne(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_ne'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 151
-- Name: FUNCTION cube_ne(cube, cube); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION cube_ne(cube, cube) IS 'different';


--
-- TOC entry 159 (class 1255 OID 16583)
-- Dependencies: 4 1144 1144
-- Name: cube_overlap(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_overlap(cube, cube) RETURNS boolean
    AS '$libdir/cube', 'cube_overlap'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 159
-- Name: FUNCTION cube_overlap(cube, cube); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION cube_overlap(cube, cube) IS 'overlaps';


--
-- TOC entry 162 (class 1255 OID 16586)
-- Dependencies: 1144 4
-- Name: cube_size(cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_size(cube) RETURNS double precision
    AS '$libdir/cube', 'cube_size'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 163 (class 1255 OID 16587)
-- Dependencies: 4 1144 1144
-- Name: cube_subset(cube, integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_subset(cube, integer[]) RETURNS cube
    AS '$libdir/cube', 'cube_subset'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 160 (class 1255 OID 16584)
-- Dependencies: 4 1144 1144 1144
-- Name: cube_union(cube, cube); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_union(cube, cube) RETURNS cube
    AS '$libdir/cube', 'cube_union'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 167 (class 1255 OID 16591)
-- Dependencies: 4 1144
-- Name: cube_ur_coord(cube, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cube_ur_coord(cube, integer) RETURNS double precision
    AS '$libdir/cube', 'cube_ur_coord'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 197 (class 1255 OID 16634)
-- Dependencies: 4
-- Name: dblink(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink(text, text) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


--
-- TOC entry 198 (class 1255 OID 16635)
-- Dependencies: 4
-- Name: dblink(text, text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink(text, text, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


--
-- TOC entry 199 (class 1255 OID 16636)
-- Dependencies: 4
-- Name: dblink(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink(text) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


--
-- TOC entry 200 (class 1255 OID 16637)
-- Dependencies: 4
-- Name: dblink(text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink(text, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_record'
    LANGUAGE c STRICT;


--
-- TOC entry 207 (class 1255 OID 16646)
-- Dependencies: 4
-- Name: dblink_build_sql_delete(text, int2vector, integer, text[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_build_sql_delete(text, int2vector, integer, text[]) RETURNS text
    AS '$libdir/dblink', 'dblink_build_sql_delete'
    LANGUAGE c STRICT;


--
-- TOC entry 206 (class 1255 OID 16645)
-- Dependencies: 4
-- Name: dblink_build_sql_insert(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_build_sql_insert(text, int2vector, integer, text[], text[]) RETURNS text
    AS '$libdir/dblink', 'dblink_build_sql_insert'
    LANGUAGE c STRICT;


--
-- TOC entry 208 (class 1255 OID 16647)
-- Dependencies: 4
-- Name: dblink_build_sql_update(text, int2vector, integer, text[], text[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_build_sql_update(text, int2vector, integer, text[], text[]) RETURNS text
    AS '$libdir/dblink', 'dblink_build_sql_update'
    LANGUAGE c STRICT;


--
-- TOC entry 215 (class 1255 OID 16654)
-- Dependencies: 4
-- Name: dblink_cancel_query(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_cancel_query(text) RETURNS text
    AS '$libdir/dblink', 'dblink_cancel_query'
    LANGUAGE c STRICT;


--
-- TOC entry 193 (class 1255 OID 16630)
-- Dependencies: 4
-- Name: dblink_close(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_close(text) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


--
-- TOC entry 194 (class 1255 OID 16631)
-- Dependencies: 4
-- Name: dblink_close(text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_close(text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


--
-- TOC entry 195 (class 1255 OID 16632)
-- Dependencies: 4
-- Name: dblink_close(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_close(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


--
-- TOC entry 196 (class 1255 OID 16633)
-- Dependencies: 4
-- Name: dblink_close(text, text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_close(text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_close'
    LANGUAGE c STRICT;


--
-- TOC entry 181 (class 1255 OID 16618)
-- Dependencies: 4
-- Name: dblink_connect(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_connect(text) RETURNS text
    AS '$libdir/dblink', 'dblink_connect'
    LANGUAGE c STRICT;


--
-- TOC entry 182 (class 1255 OID 16619)
-- Dependencies: 4
-- Name: dblink_connect(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_connect(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_connect'
    LANGUAGE c STRICT;


--
-- TOC entry 209 (class 1255 OID 16648)
-- Dependencies: 4
-- Name: dblink_current_query(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_current_query() RETURNS text
    AS '$libdir/dblink', 'dblink_current_query'
    LANGUAGE c;


--
-- TOC entry 183 (class 1255 OID 16620)
-- Dependencies: 4
-- Name: dblink_disconnect(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_disconnect() RETURNS text
    AS '$libdir/dblink', 'dblink_disconnect'
    LANGUAGE c STRICT;


--
-- TOC entry 184 (class 1255 OID 16621)
-- Dependencies: 4
-- Name: dblink_disconnect(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_disconnect(text) RETURNS text
    AS '$libdir/dblink', 'dblink_disconnect'
    LANGUAGE c STRICT;


--
-- TOC entry 216 (class 1255 OID 16655)
-- Dependencies: 4
-- Name: dblink_error_message(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_error_message(text) RETURNS text
    AS '$libdir/dblink', 'dblink_error_message'
    LANGUAGE c STRICT;


--
-- TOC entry 201 (class 1255 OID 16638)
-- Dependencies: 4
-- Name: dblink_exec(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_exec(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


--
-- TOC entry 202 (class 1255 OID 16639)
-- Dependencies: 4
-- Name: dblink_exec(text, text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_exec(text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


--
-- TOC entry 203 (class 1255 OID 16640)
-- Dependencies: 4
-- Name: dblink_exec(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_exec(text) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


--
-- TOC entry 204 (class 1255 OID 16641)
-- Dependencies: 4
-- Name: dblink_exec(text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_exec(text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_exec'
    LANGUAGE c STRICT;


--
-- TOC entry 189 (class 1255 OID 16626)
-- Dependencies: 4
-- Name: dblink_fetch(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_fetch(text, integer) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


--
-- TOC entry 190 (class 1255 OID 16627)
-- Dependencies: 4
-- Name: dblink_fetch(text, integer, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_fetch(text, integer, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


--
-- TOC entry 191 (class 1255 OID 16628)
-- Dependencies: 4
-- Name: dblink_fetch(text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_fetch(text, text, integer) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


--
-- TOC entry 192 (class 1255 OID 16629)
-- Dependencies: 4
-- Name: dblink_fetch(text, text, integer, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_fetch(text, text, integer, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_fetch'
    LANGUAGE c STRICT;


--
-- TOC entry 214 (class 1255 OID 16653)
-- Dependencies: 4
-- Name: dblink_get_connections(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_get_connections() RETURNS text[]
    AS '$libdir/dblink', 'dblink_get_connections'
    LANGUAGE c;


--
-- TOC entry 205 (class 1255 OID 16644)
-- Dependencies: 1147 4
-- Name: dblink_get_pkey(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_get_pkey(text) RETURNS SETOF dblink_pkey_results
    AS '$libdir/dblink', 'dblink_get_pkey'
    LANGUAGE c STRICT;


--
-- TOC entry 212 (class 1255 OID 16651)
-- Dependencies: 4
-- Name: dblink_get_result(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_get_result(text) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_get_result'
    LANGUAGE c STRICT;


--
-- TOC entry 213 (class 1255 OID 16652)
-- Dependencies: 4
-- Name: dblink_get_result(text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_get_result(text, boolean) RETURNS SETOF record
    AS '$libdir/dblink', 'dblink_get_result'
    LANGUAGE c STRICT;


--
-- TOC entry 211 (class 1255 OID 16650)
-- Dependencies: 4
-- Name: dblink_is_busy(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_is_busy(text) RETURNS integer
    AS '$libdir/dblink', 'dblink_is_busy'
    LANGUAGE c STRICT;


--
-- TOC entry 185 (class 1255 OID 16622)
-- Dependencies: 4
-- Name: dblink_open(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_open(text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


--
-- TOC entry 186 (class 1255 OID 16623)
-- Dependencies: 4
-- Name: dblink_open(text, text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_open(text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


--
-- TOC entry 187 (class 1255 OID 16624)
-- Dependencies: 4
-- Name: dblink_open(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_open(text, text, text) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


--
-- TOC entry 188 (class 1255 OID 16625)
-- Dependencies: 4
-- Name: dblink_open(text, text, text, boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_open(text, text, text, boolean) RETURNS text
    AS '$libdir/dblink', 'dblink_open'
    LANGUAGE c STRICT;


--
-- TOC entry 210 (class 1255 OID 16649)
-- Dependencies: 4
-- Name: dblink_send_query(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dblink_send_query(text, text) RETURNS integer
    AS '$libdir/dblink', 'dblink_send_query'
    LANGUAGE c STRICT;


--
-- TOC entry 689 (class 1255 OID 17481)
-- Dependencies: 4
-- Name: dearmor(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dearmor(text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_dearmor'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 665 (class 1255 OID 17457)
-- Dependencies: 4
-- Name: decrypt(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION decrypt(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_decrypt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 667 (class 1255 OID 17459)
-- Dependencies: 4
-- Name: decrypt_iv(bytea, bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION decrypt_iv(bytea, bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_decrypt_iv'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 239 (class 1255 OID 16686)
-- Dependencies: 1152 4
-- Name: defined(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION defined(hstore, text) RETURNS boolean
    AS '$libdir/hstore', 'defined'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 240 (class 1255 OID 16687)
-- Dependencies: 1152 4 1152
-- Name: delete(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "delete"(hstore, text) RETURNS hstore
    AS '$libdir/hstore', 'delete'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 756 (class 1255 OID 17590)
-- Dependencies: 4
-- Name: dex_init(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dex_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'dex_init'
    LANGUAGE c;


--
-- TOC entry 757 (class 1255 OID 17591)
-- Dependencies: 4
-- Name: dex_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dex_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'dex_lexize'
    LANGUAGE c STRICT;


--
-- TOC entry 230 (class 1255 OID 16674)
-- Dependencies: 4
-- Name: difference(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION difference(text, text) RETURNS integer
    AS '$libdir/fuzzystrmatch', 'difference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 657 (class 1255 OID 17449)
-- Dependencies: 4
-- Name: digest(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION digest(text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_digest'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 658 (class 1255 OID 17450)
-- Dependencies: 4
-- Name: digest(bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION digest(bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_digest'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 231 (class 1255 OID 16675)
-- Dependencies: 4
-- Name: dmetaphone(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dmetaphone(text) RETURNS text
    AS '$libdir/fuzzystrmatch', 'dmetaphone'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 232 (class 1255 OID 16676)
-- Dependencies: 4
-- Name: dmetaphone_alt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dmetaphone_alt(text) RETURNS text
    AS '$libdir/fuzzystrmatch', 'dmetaphone_alt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 249 (class 1255 OID 16704)
-- Dependencies: 4 1155 1152
-- Name: each(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "each"(hstore) RETURNS SETOF hs_each
    AS '$libdir/hstore', 'each'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 534 (class 1255 OID 17216)
-- Dependencies: 4 1165
-- Name: ean13(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ean13(text) RETURNS ean13
    AS '$libdir/isn', 'ean13_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 224 (class 1255 OID 16667)
-- Dependencies: 4 1144 1148
-- Name: earth_box(earth, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION earth_box(earth, double precision) RETURNS cube
    AS $_$SELECT cube_enlarge($1, gc_to_sec($2), 3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 223 (class 1255 OID 16666)
-- Dependencies: 1148 1148 4
-- Name: earth_distance(earth, earth); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION earth_distance(earth, earth) RETURNS double precision
    AS $_$SELECT sec_to_gc(cube_distance($1, $2))$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 664 (class 1255 OID 17456)
-- Dependencies: 4
-- Name: encrypt(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION encrypt(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_encrypt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 666 (class 1255 OID 17458)
-- Dependencies: 4
-- Name: encrypt_iv(bytea, bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION encrypt_iv(bytea, bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_encrypt_iv'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 143 (class 1255 OID 16561)
-- Dependencies: 1141 4
-- Name: eq(chkpass, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION eq(chkpass, text) RETURNS boolean
    AS '$libdir/chkpass', 'chkpass_eq'
    LANGUAGE c STRICT;


--
-- TOC entry 802 (class 1255 OID 17754)
-- Dependencies: 4 1232 1229
-- Name: exectsq(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION exectsq(tsvector, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'exectsq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 802
-- Name: FUNCTION exectsq(tsvector, tsquery); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION exectsq(tsvector, tsquery) IS 'boolean operation with text index';


--
-- TOC entry 237 (class 1255 OID 16684)
-- Dependencies: 4 1152
-- Name: exist(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION exist(hstore, text) RETURNS boolean
    AS '$libdir/hstore', 'exists'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 235 (class 1255 OID 16681)
-- Dependencies: 1152 4
-- Name: fetchval(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fetchval(hstore, text) RETURNS text
    AS '$libdir/hstore', 'fetchval'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 175 (class 1255 OID 16610)
-- Dependencies: 4
-- Name: g_cube_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_cube_compress(internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_compress'
    LANGUAGE c;


--
-- TOC entry 174 (class 1255 OID 16609)
-- Dependencies: 4 1144
-- Name: g_cube_consistent(internal, cube, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_cube_consistent(internal, cube, integer) RETURNS boolean
    AS '$libdir/cube', 'g_cube_consistent'
    LANGUAGE c;


--
-- TOC entry 176 (class 1255 OID 16611)
-- Dependencies: 4
-- Name: g_cube_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_cube_decompress(internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_decompress'
    LANGUAGE c;


--
-- TOC entry 177 (class 1255 OID 16612)
-- Dependencies: 4
-- Name: g_cube_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_cube_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 178 (class 1255 OID 16613)
-- Dependencies: 4
-- Name: g_cube_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_cube_picksplit(internal, internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_picksplit'
    LANGUAGE c;


--
-- TOC entry 180 (class 1255 OID 16615)
-- Dependencies: 1144 1144 4
-- Name: g_cube_same(cube, cube, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_cube_same(cube, cube, internal) RETURNS internal
    AS '$libdir/cube', 'g_cube_same'
    LANGUAGE c;


--
-- TOC entry 179 (class 1255 OID 16614)
-- Dependencies: 4 1144
-- Name: g_cube_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_cube_union(internal, internal) RETURNS cube
    AS '$libdir/cube', 'g_cube_union'
    LANGUAGE c;


--
-- TOC entry 290 (class 1255 OID 16767)
-- Dependencies: 4
-- Name: g_int_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_int_compress(internal) RETURNS internal
    AS '$libdir/_int', 'g_int_compress'
    LANGUAGE c;


--
-- TOC entry 289 (class 1255 OID 16766)
-- Dependencies: 4
-- Name: g_int_consistent(internal, integer[], integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_int_consistent(internal, integer[], integer) RETURNS boolean
    AS '$libdir/_int', 'g_int_consistent'
    LANGUAGE c;


--
-- TOC entry 291 (class 1255 OID 16768)
-- Dependencies: 4
-- Name: g_int_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_int_decompress(internal) RETURNS internal
    AS '$libdir/_int', 'g_int_decompress'
    LANGUAGE c;


--
-- TOC entry 292 (class 1255 OID 16769)
-- Dependencies: 4
-- Name: g_int_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_int_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_int_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 293 (class 1255 OID 16770)
-- Dependencies: 4
-- Name: g_int_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_int_picksplit(internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_int_picksplit'
    LANGUAGE c;


--
-- TOC entry 295 (class 1255 OID 16772)
-- Dependencies: 4
-- Name: g_int_same(integer[], integer[], internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_int_same(integer[], integer[], internal) RETURNS internal
    AS '$libdir/_int', 'g_int_same'
    LANGUAGE c;


--
-- TOC entry 294 (class 1255 OID 16771)
-- Dependencies: 4
-- Name: g_int_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_int_union(internal, internal) RETURNS integer[]
    AS '$libdir/_int', 'g_int_union'
    LANGUAGE c;


--
-- TOC entry 299 (class 1255 OID 16779)
-- Dependencies: 4
-- Name: g_intbig_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_intbig_compress(internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_compress'
    LANGUAGE c;


--
-- TOC entry 298 (class 1255 OID 16778)
-- Dependencies: 4
-- Name: g_intbig_consistent(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_intbig_consistent(internal, internal, integer) RETURNS boolean
    AS '$libdir/_int', 'g_intbig_consistent'
    LANGUAGE c;


--
-- TOC entry 300 (class 1255 OID 16780)
-- Dependencies: 4
-- Name: g_intbig_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_intbig_decompress(internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_decompress'
    LANGUAGE c;


--
-- TOC entry 301 (class 1255 OID 16781)
-- Dependencies: 4
-- Name: g_intbig_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_intbig_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 302 (class 1255 OID 16782)
-- Dependencies: 4
-- Name: g_intbig_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_intbig_picksplit(internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_picksplit'
    LANGUAGE c;


--
-- TOC entry 304 (class 1255 OID 16784)
-- Dependencies: 4
-- Name: g_intbig_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_intbig_same(internal, internal, internal) RETURNS internal
    AS '$libdir/_int', 'g_intbig_same'
    LANGUAGE c;


--
-- TOC entry 303 (class 1255 OID 16783)
-- Dependencies: 4
-- Name: g_intbig_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION g_intbig_union(internal, internal) RETURNS integer[]
    AS '$libdir/_int', 'g_intbig_union'
    LANGUAGE c;


--
-- TOC entry 129 (class 1255 OID 16541)
-- Dependencies: 4
-- Name: gbt_bit_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bit_compress'
    LANGUAGE c;


--
-- TOC entry 128 (class 1255 OID 16540)
-- Dependencies: 4
-- Name: gbt_bit_consistent(internal, bit, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_consistent(internal, bit, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_bit_consistent'
    LANGUAGE c;


--
-- TOC entry 130 (class 1255 OID 16542)
-- Dependencies: 4
-- Name: gbt_bit_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bit_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 131 (class 1255 OID 16543)
-- Dependencies: 4
-- Name: gbt_bit_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bit_picksplit'
    LANGUAGE c;


--
-- TOC entry 133 (class 1255 OID 16545)
-- Dependencies: 4
-- Name: gbt_bit_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bit_same'
    LANGUAGE c;


--
-- TOC entry 132 (class 1255 OID 16544)
-- Dependencies: 4 1138
-- Name: gbt_bit_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bit_union(bytea, internal) RETURNS gbtreekey_var
    AS '$libdir/btree_gist', 'gbt_bit_union'
    LANGUAGE c;


--
-- TOC entry 111 (class 1255 OID 16519)
-- Dependencies: 4
-- Name: gbt_bpchar_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bpchar_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bpchar_compress'
    LANGUAGE c;


--
-- TOC entry 109 (class 1255 OID 16517)
-- Dependencies: 4
-- Name: gbt_bpchar_consistent(internal, character, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bpchar_consistent(internal, character, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_bpchar_consistent'
    LANGUAGE c;


--
-- TOC entry 117 (class 1255 OID 16527)
-- Dependencies: 4
-- Name: gbt_bytea_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bytea_compress'
    LANGUAGE c;


--
-- TOC entry 116 (class 1255 OID 16526)
-- Dependencies: 4
-- Name: gbt_bytea_consistent(internal, bytea, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_consistent(internal, bytea, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_bytea_consistent'
    LANGUAGE c;


--
-- TOC entry 118 (class 1255 OID 16528)
-- Dependencies: 4
-- Name: gbt_bytea_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bytea_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 119 (class 1255 OID 16529)
-- Dependencies: 4
-- Name: gbt_bytea_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bytea_picksplit'
    LANGUAGE c;


--
-- TOC entry 121 (class 1255 OID 16531)
-- Dependencies: 4
-- Name: gbt_bytea_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_bytea_same'
    LANGUAGE c;


--
-- TOC entry 120 (class 1255 OID 16530)
-- Dependencies: 4 1138
-- Name: gbt_bytea_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_bytea_union(bytea, internal) RETURNS gbtreekey_var
    AS '$libdir/btree_gist', 'gbt_bytea_union'
    LANGUAGE c;


--
-- TOC entry 97 (class 1255 OID 16503)
-- Dependencies: 4
-- Name: gbt_cash_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_cash_compress'
    LANGUAGE c;


--
-- TOC entry 96 (class 1255 OID 16502)
-- Dependencies: 4
-- Name: gbt_cash_consistent(internal, money, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_consistent(internal, money, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_cash_consistent'
    LANGUAGE c;


--
-- TOC entry 98 (class 1255 OID 16504)
-- Dependencies: 4
-- Name: gbt_cash_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_cash_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 99 (class 1255 OID 16505)
-- Dependencies: 4
-- Name: gbt_cash_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_cash_picksplit'
    LANGUAGE c;


--
-- TOC entry 101 (class 1255 OID 16507)
-- Dependencies: 4
-- Name: gbt_cash_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_cash_same'
    LANGUAGE c;


--
-- TOC entry 100 (class 1255 OID 16506)
-- Dependencies: 1129 4
-- Name: gbt_cash_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_cash_union(bytea, internal) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbt_cash_union'
    LANGUAGE c;


--
-- TOC entry 84 (class 1255 OID 16488)
-- Dependencies: 4
-- Name: gbt_date_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_date_compress'
    LANGUAGE c;


--
-- TOC entry 83 (class 1255 OID 16487)
-- Dependencies: 4
-- Name: gbt_date_consistent(internal, date, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_consistent(internal, date, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_date_consistent'
    LANGUAGE c;


--
-- TOC entry 85 (class 1255 OID 16489)
-- Dependencies: 4
-- Name: gbt_date_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_date_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 86 (class 1255 OID 16490)
-- Dependencies: 4
-- Name: gbt_date_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_date_picksplit'
    LANGUAGE c;


--
-- TOC entry 88 (class 1255 OID 16492)
-- Dependencies: 4
-- Name: gbt_date_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_date_same'
    LANGUAGE c;


--
-- TOC entry 87 (class 1255 OID 16491)
-- Dependencies: 4 1129
-- Name: gbt_date_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_date_union(bytea, internal) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbt_date_union'
    LANGUAGE c;


--
-- TOC entry 30 (class 1255 OID 16425)
-- Dependencies: 4
-- Name: gbt_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_decompress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_decompress'
    LANGUAGE c;


--
-- TOC entry 56 (class 1255 OID 16454)
-- Dependencies: 4
-- Name: gbt_float4_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float4_compress'
    LANGUAGE c;


--
-- TOC entry 55 (class 1255 OID 16453)
-- Dependencies: 4
-- Name: gbt_float4_consistent(internal, real, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_consistent(internal, real, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_float4_consistent'
    LANGUAGE c;


--
-- TOC entry 57 (class 1255 OID 16455)
-- Dependencies: 4
-- Name: gbt_float4_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float4_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 58 (class 1255 OID 16456)
-- Dependencies: 4
-- Name: gbt_float4_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float4_picksplit'
    LANGUAGE c;


--
-- TOC entry 60 (class 1255 OID 16458)
-- Dependencies: 4
-- Name: gbt_float4_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float4_same'
    LANGUAGE c;


--
-- TOC entry 59 (class 1255 OID 16457)
-- Dependencies: 4 1129
-- Name: gbt_float4_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float4_union(bytea, internal) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbt_float4_union'
    LANGUAGE c;


--
-- TOC entry 62 (class 1255 OID 16461)
-- Dependencies: 4
-- Name: gbt_float8_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float8_compress'
    LANGUAGE c;


--
-- TOC entry 61 (class 1255 OID 16460)
-- Dependencies: 4
-- Name: gbt_float8_consistent(internal, double precision, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_consistent(internal, double precision, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_float8_consistent'
    LANGUAGE c;


--
-- TOC entry 63 (class 1255 OID 16462)
-- Dependencies: 4
-- Name: gbt_float8_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float8_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 64 (class 1255 OID 16463)
-- Dependencies: 4
-- Name: gbt_float8_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float8_picksplit'
    LANGUAGE c;


--
-- TOC entry 66 (class 1255 OID 16465)
-- Dependencies: 4
-- Name: gbt_float8_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_float8_same'
    LANGUAGE c;


--
-- TOC entry 65 (class 1255 OID 16464)
-- Dependencies: 1132 4
-- Name: gbt_float8_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_float8_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_float8_union'
    LANGUAGE c;


--
-- TOC entry 135 (class 1255 OID 16549)
-- Dependencies: 4
-- Name: gbt_inet_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_inet_compress'
    LANGUAGE c;


--
-- TOC entry 134 (class 1255 OID 16548)
-- Dependencies: 4
-- Name: gbt_inet_consistent(internal, inet, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_consistent(internal, inet, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_inet_consistent'
    LANGUAGE c;


--
-- TOC entry 136 (class 1255 OID 16550)
-- Dependencies: 4
-- Name: gbt_inet_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_inet_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 137 (class 1255 OID 16551)
-- Dependencies: 4
-- Name: gbt_inet_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_inet_picksplit'
    LANGUAGE c;


--
-- TOC entry 139 (class 1255 OID 16553)
-- Dependencies: 4
-- Name: gbt_inet_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_inet_same'
    LANGUAGE c;


--
-- TOC entry 138 (class 1255 OID 16552)
-- Dependencies: 1132 4
-- Name: gbt_inet_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_inet_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_inet_union'
    LANGUAGE c;


--
-- TOC entry 38 (class 1255 OID 16433)
-- Dependencies: 4
-- Name: gbt_int2_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int2_compress'
    LANGUAGE c;


--
-- TOC entry 37 (class 1255 OID 16432)
-- Dependencies: 4
-- Name: gbt_int2_consistent(internal, smallint, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_consistent(internal, smallint, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_int2_consistent'
    LANGUAGE c;


--
-- TOC entry 39 (class 1255 OID 16434)
-- Dependencies: 4
-- Name: gbt_int2_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int2_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 40 (class 1255 OID 16435)
-- Dependencies: 4
-- Name: gbt_int2_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int2_picksplit'
    LANGUAGE c;


--
-- TOC entry 42 (class 1255 OID 16437)
-- Dependencies: 4
-- Name: gbt_int2_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int2_same'
    LANGUAGE c;


--
-- TOC entry 41 (class 1255 OID 16436)
-- Dependencies: 1117 4
-- Name: gbt_int2_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int2_union(bytea, internal) RETURNS gbtreekey4
    AS '$libdir/btree_gist', 'gbt_int2_union'
    LANGUAGE c;


--
-- TOC entry 44 (class 1255 OID 16440)
-- Dependencies: 4
-- Name: gbt_int4_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int4_compress'
    LANGUAGE c;


--
-- TOC entry 43 (class 1255 OID 16439)
-- Dependencies: 4
-- Name: gbt_int4_consistent(internal, integer, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_consistent(internal, integer, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_int4_consistent'
    LANGUAGE c;


--
-- TOC entry 45 (class 1255 OID 16441)
-- Dependencies: 4
-- Name: gbt_int4_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int4_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 46 (class 1255 OID 16442)
-- Dependencies: 4
-- Name: gbt_int4_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int4_picksplit'
    LANGUAGE c;


--
-- TOC entry 48 (class 1255 OID 16444)
-- Dependencies: 4
-- Name: gbt_int4_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int4_same'
    LANGUAGE c;


--
-- TOC entry 47 (class 1255 OID 16443)
-- Dependencies: 1129 4
-- Name: gbt_int4_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int4_union(bytea, internal) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbt_int4_union'
    LANGUAGE c;


--
-- TOC entry 50 (class 1255 OID 16447)
-- Dependencies: 4
-- Name: gbt_int8_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int8_compress'
    LANGUAGE c;


--
-- TOC entry 49 (class 1255 OID 16446)
-- Dependencies: 4
-- Name: gbt_int8_consistent(internal, bigint, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_consistent(internal, bigint, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_int8_consistent'
    LANGUAGE c;


--
-- TOC entry 51 (class 1255 OID 16448)
-- Dependencies: 4
-- Name: gbt_int8_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int8_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 52 (class 1255 OID 16449)
-- Dependencies: 4
-- Name: gbt_int8_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int8_picksplit'
    LANGUAGE c;


--
-- TOC entry 54 (class 1255 OID 16451)
-- Dependencies: 4
-- Name: gbt_int8_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_int8_same'
    LANGUAGE c;


--
-- TOC entry 53 (class 1255 OID 16450)
-- Dependencies: 1132 4
-- Name: gbt_int8_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_int8_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_int8_union'
    LANGUAGE c;


--
-- TOC entry 90 (class 1255 OID 16495)
-- Dependencies: 4
-- Name: gbt_intv_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_intv_compress'
    LANGUAGE c;


--
-- TOC entry 89 (class 1255 OID 16494)
-- Dependencies: 4
-- Name: gbt_intv_consistent(internal, interval, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_consistent(internal, interval, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_intv_consistent'
    LANGUAGE c;


--
-- TOC entry 91 (class 1255 OID 16496)
-- Dependencies: 4
-- Name: gbt_intv_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_decompress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_intv_decompress'
    LANGUAGE c;


--
-- TOC entry 92 (class 1255 OID 16497)
-- Dependencies: 4
-- Name: gbt_intv_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_intv_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 93 (class 1255 OID 16498)
-- Dependencies: 4
-- Name: gbt_intv_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_intv_picksplit'
    LANGUAGE c;


--
-- TOC entry 95 (class 1255 OID 16500)
-- Dependencies: 4
-- Name: gbt_intv_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_intv_same'
    LANGUAGE c;


--
-- TOC entry 94 (class 1255 OID 16499)
-- Dependencies: 4 1135
-- Name: gbt_intv_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_intv_union(bytea, internal) RETURNS gbtreekey32
    AS '$libdir/btree_gist', 'gbt_intv_union'
    LANGUAGE c;


--
-- TOC entry 103 (class 1255 OID 16510)
-- Dependencies: 4
-- Name: gbt_macad_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_macad_compress'
    LANGUAGE c;


--
-- TOC entry 102 (class 1255 OID 16509)
-- Dependencies: 4
-- Name: gbt_macad_consistent(internal, macaddr, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_consistent(internal, macaddr, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_macad_consistent'
    LANGUAGE c;


--
-- TOC entry 104 (class 1255 OID 16511)
-- Dependencies: 4
-- Name: gbt_macad_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_macad_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 105 (class 1255 OID 16512)
-- Dependencies: 4
-- Name: gbt_macad_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_macad_picksplit'
    LANGUAGE c;


--
-- TOC entry 107 (class 1255 OID 16514)
-- Dependencies: 4
-- Name: gbt_macad_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_macad_same'
    LANGUAGE c;


--
-- TOC entry 106 (class 1255 OID 16513)
-- Dependencies: 1132 4
-- Name: gbt_macad_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_macad_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_macad_union'
    LANGUAGE c;


--
-- TOC entry 123 (class 1255 OID 16534)
-- Dependencies: 4
-- Name: gbt_numeric_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_numeric_compress'
    LANGUAGE c;


--
-- TOC entry 122 (class 1255 OID 16533)
-- Dependencies: 4
-- Name: gbt_numeric_consistent(internal, numeric, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_consistent(internal, numeric, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_numeric_consistent'
    LANGUAGE c;


--
-- TOC entry 124 (class 1255 OID 16535)
-- Dependencies: 4
-- Name: gbt_numeric_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_numeric_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 125 (class 1255 OID 16536)
-- Dependencies: 4
-- Name: gbt_numeric_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_numeric_picksplit'
    LANGUAGE c;


--
-- TOC entry 127 (class 1255 OID 16538)
-- Dependencies: 4
-- Name: gbt_numeric_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_numeric_same'
    LANGUAGE c;


--
-- TOC entry 126 (class 1255 OID 16537)
-- Dependencies: 4 1138
-- Name: gbt_numeric_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_numeric_union(bytea, internal) RETURNS gbtreekey_var
    AS '$libdir/btree_gist', 'gbt_numeric_union'
    LANGUAGE c;


--
-- TOC entry 29 (class 1255 OID 16424)
-- Dependencies: 4
-- Name: gbt_oid_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_oid_compress'
    LANGUAGE c;


--
-- TOC entry 28 (class 1255 OID 16423)
-- Dependencies: 4
-- Name: gbt_oid_consistent(internal, oid, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_consistent(internal, oid, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_oid_consistent'
    LANGUAGE c;


--
-- TOC entry 33 (class 1255 OID 16427)
-- Dependencies: 4
-- Name: gbt_oid_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_oid_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 34 (class 1255 OID 16428)
-- Dependencies: 4
-- Name: gbt_oid_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_oid_picksplit'
    LANGUAGE c;


--
-- TOC entry 36 (class 1255 OID 16430)
-- Dependencies: 4
-- Name: gbt_oid_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_oid_same'
    LANGUAGE c;


--
-- TOC entry 35 (class 1255 OID 16429)
-- Dependencies: 4 1129
-- Name: gbt_oid_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_oid_union(bytea, internal) RETURNS gbtreekey8
    AS '$libdir/btree_gist', 'gbt_oid_union'
    LANGUAGE c;


--
-- TOC entry 110 (class 1255 OID 16518)
-- Dependencies: 4
-- Name: gbt_text_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_text_compress'
    LANGUAGE c;


--
-- TOC entry 108 (class 1255 OID 16516)
-- Dependencies: 4
-- Name: gbt_text_consistent(internal, text, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_consistent(internal, text, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_text_consistent'
    LANGUAGE c;


--
-- TOC entry 112 (class 1255 OID 16520)
-- Dependencies: 4
-- Name: gbt_text_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_text_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 113 (class 1255 OID 16521)
-- Dependencies: 4
-- Name: gbt_text_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_text_picksplit'
    LANGUAGE c;


--
-- TOC entry 115 (class 1255 OID 16523)
-- Dependencies: 4
-- Name: gbt_text_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_text_same'
    LANGUAGE c;


--
-- TOC entry 114 (class 1255 OID 16522)
-- Dependencies: 1138 4
-- Name: gbt_text_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_text_union(bytea, internal) RETURNS gbtreekey_var
    AS '$libdir/btree_gist', 'gbt_text_union'
    LANGUAGE c;


--
-- TOC entry 77 (class 1255 OID 16479)
-- Dependencies: 4
-- Name: gbt_time_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_time_compress'
    LANGUAGE c;


--
-- TOC entry 75 (class 1255 OID 16477)
-- Dependencies: 4
-- Name: gbt_time_consistent(internal, time without time zone, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_consistent(internal, time without time zone, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_time_consistent'
    LANGUAGE c;


--
-- TOC entry 79 (class 1255 OID 16481)
-- Dependencies: 4
-- Name: gbt_time_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_time_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 80 (class 1255 OID 16482)
-- Dependencies: 4
-- Name: gbt_time_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_time_picksplit'
    LANGUAGE c;


--
-- TOC entry 82 (class 1255 OID 16484)
-- Dependencies: 4
-- Name: gbt_time_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_time_same'
    LANGUAGE c;


--
-- TOC entry 81 (class 1255 OID 16483)
-- Dependencies: 1132 4
-- Name: gbt_time_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_time_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_time_union'
    LANGUAGE c;


--
-- TOC entry 78 (class 1255 OID 16480)
-- Dependencies: 4
-- Name: gbt_timetz_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_timetz_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_timetz_compress'
    LANGUAGE c;


--
-- TOC entry 76 (class 1255 OID 16478)
-- Dependencies: 4
-- Name: gbt_timetz_consistent(internal, time with time zone, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_timetz_consistent(internal, time with time zone, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_timetz_consistent'
    LANGUAGE c;


--
-- TOC entry 69 (class 1255 OID 16469)
-- Dependencies: 4
-- Name: gbt_ts_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_ts_compress'
    LANGUAGE c;


--
-- TOC entry 67 (class 1255 OID 16467)
-- Dependencies: 4
-- Name: gbt_ts_consistent(internal, timestamp without time zone, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_consistent(internal, timestamp without time zone, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_ts_consistent'
    LANGUAGE c;


--
-- TOC entry 71 (class 1255 OID 16471)
-- Dependencies: 4
-- Name: gbt_ts_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_ts_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 72 (class 1255 OID 16472)
-- Dependencies: 4
-- Name: gbt_ts_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_picksplit(internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_ts_picksplit'
    LANGUAGE c;


--
-- TOC entry 74 (class 1255 OID 16474)
-- Dependencies: 4
-- Name: gbt_ts_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_same(internal, internal, internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_ts_same'
    LANGUAGE c;


--
-- TOC entry 73 (class 1255 OID 16473)
-- Dependencies: 1132 4
-- Name: gbt_ts_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_ts_union(bytea, internal) RETURNS gbtreekey16
    AS '$libdir/btree_gist', 'gbt_ts_union'
    LANGUAGE c;


--
-- TOC entry 70 (class 1255 OID 16470)
-- Dependencies: 4
-- Name: gbt_tstz_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_tstz_compress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_tstz_compress'
    LANGUAGE c;


--
-- TOC entry 68 (class 1255 OID 16468)
-- Dependencies: 4
-- Name: gbt_tstz_consistent(internal, timestamp with time zone, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_tstz_consistent(internal, timestamp with time zone, smallint) RETURNS boolean
    AS '$libdir/btree_gist', 'gbt_tstz_consistent'
    LANGUAGE c;


--
-- TOC entry 32 (class 1255 OID 16426)
-- Dependencies: 4
-- Name: gbt_var_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gbt_var_decompress(internal) RETURNS internal
    AS '$libdir/btree_gist', 'gbt_var_decompress'
    LANGUAGE c;


--
-- TOC entry 219 (class 1255 OID 16662)
-- Dependencies: 4
-- Name: gc_to_sec(double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gc_to_sec(double precision) RETURNS double precision
    AS $_$SELECT CASE WHEN $1 < 0 THEN 0::float8 WHEN $1/earth() > pi() THEN 2*earth() ELSE 2*earth()*sin($1/(2*earth())) END$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 668 (class 1255 OID 17460)
-- Dependencies: 4
-- Name: gen_random_bytes(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gen_random_bytes(integer) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_random_bytes'
    LANGUAGE c STRICT;


--
-- TOC entry 662 (class 1255 OID 17454)
-- Dependencies: 4
-- Name: gen_salt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gen_salt(text) RETURNS text
    AS '$libdir/pgcrypto', 'pg_gen_salt'
    LANGUAGE c STRICT;


--
-- TOC entry 663 (class 1255 OID 17455)
-- Dependencies: 4
-- Name: gen_salt(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gen_salt(text, integer) RETURNS text
    AS '$libdir/pgcrypto', 'pg_gen_salt_rounds'
    LANGUAGE c STRICT;


--
-- TOC entry 225 (class 1255 OID 16668)
-- Dependencies: 4
-- Name: geo_distance(point, point); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geo_distance(point, point) RETURNS double precision
    AS '$libdir/earthdistance', 'geo_distance'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 831 (class 1255 OID 17790)
-- Dependencies: 4 1229 1232
-- Name: get_covers(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION get_covers(tsvector, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'get_covers'
    LANGUAGE c STRICT;


--
-- TOC entry 732 (class 1255 OID 17553)
-- Dependencies: 4
-- Name: get_timetravel(name); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION get_timetravel(name) RETURNS integer
    AS '$libdir/timetravel', 'get_timetravel'
    LANGUAGE c STRICT;


--
-- TOC entry 252 (class 1255 OID 16709)
-- Dependencies: 4
-- Name: ghstore_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_compress(internal) RETURNS internal
    AS '$libdir/hstore', 'ghstore_compress'
    LANGUAGE c;


--
-- TOC entry 258 (class 1255 OID 16715)
-- Dependencies: 4
-- Name: ghstore_consistent(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_consistent(internal, internal, integer) RETURNS boolean
    AS '$libdir/hstore', 'ghstore_consistent'
    LANGUAGE c;


--
-- TOC entry 253 (class 1255 OID 16710)
-- Dependencies: 4
-- Name: ghstore_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_decompress(internal) RETURNS internal
    AS '$libdir/hstore', 'ghstore_decompress'
    LANGUAGE c;


--
-- TOC entry 254 (class 1255 OID 16711)
-- Dependencies: 4
-- Name: ghstore_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/hstore', 'ghstore_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 255 (class 1255 OID 16712)
-- Dependencies: 4
-- Name: ghstore_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_picksplit(internal, internal) RETURNS internal
    AS '$libdir/hstore', 'ghstore_picksplit'
    LANGUAGE c;


--
-- TOC entry 257 (class 1255 OID 16714)
-- Dependencies: 4
-- Name: ghstore_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_same(internal, internal, internal) RETURNS internal
    AS '$libdir/hstore', 'ghstore_same'
    LANGUAGE c;


--
-- TOC entry 256 (class 1255 OID 16713)
-- Dependencies: 4
-- Name: ghstore_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ghstore_union(internal, internal) RETURNS internal
    AS '$libdir/hstore', 'ghstore_union'
    LANGUAGE c;


--
-- TOC entry 868 (class 1255 OID 17854)
-- Dependencies: 4 1232
-- Name: gin_extract_tsquery(tsquery, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gin_extract_tsquery(tsquery, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gin_extract_tsquery'
    LANGUAGE c STRICT;


--
-- TOC entry 867 (class 1255 OID 17853)
-- Dependencies: 4 1229
-- Name: gin_extract_tsvector(tsvector, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gin_extract_tsvector(tsvector, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gin_extract_tsvector'
    LANGUAGE c STRICT;


--
-- TOC entry 869 (class 1255 OID 17855)
-- Dependencies: 4 1232
-- Name: gin_ts_consistent(internal, internal, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gin_ts_consistent(internal, internal, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'gin_ts_consistent'
    LANGUAGE c STRICT;


--
-- TOC entry 306 (class 1255 OID 16787)
-- Dependencies: 4
-- Name: ginint4_consistent(internal, smallint, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ginint4_consistent(internal, smallint, internal) RETURNS internal
    AS '$libdir/_int', 'ginint4_consistent'
    LANGUAGE c;


--
-- TOC entry 305 (class 1255 OID 16786)
-- Dependencies: 4
-- Name: ginint4_queryextract(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ginint4_queryextract(internal, internal, smallint) RETURNS internal
    AS '$libdir/_int', 'ginint4_queryextract'
    LANGUAGE c;


--
-- TOC entry 719 (class 1255 OID 17538)
-- Dependencies: 4
-- Name: gseg_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gseg_compress(internal) RETURNS internal
    AS '$libdir/seg', 'gseg_compress'
    LANGUAGE c;


--
-- TOC entry 718 (class 1255 OID 17537)
-- Dependencies: 1213 4
-- Name: gseg_consistent(internal, seg, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gseg_consistent(internal, seg, integer) RETURNS boolean
    AS '$libdir/seg', 'gseg_consistent'
    LANGUAGE c;


--
-- TOC entry 720 (class 1255 OID 17539)
-- Dependencies: 4
-- Name: gseg_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gseg_decompress(internal) RETURNS internal
    AS '$libdir/seg', 'gseg_decompress'
    LANGUAGE c;


--
-- TOC entry 721 (class 1255 OID 17540)
-- Dependencies: 4
-- Name: gseg_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gseg_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/seg', 'gseg_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 722 (class 1255 OID 17541)
-- Dependencies: 4
-- Name: gseg_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gseg_picksplit(internal, internal) RETURNS internal
    AS '$libdir/seg', 'gseg_picksplit'
    LANGUAGE c;


--
-- TOC entry 724 (class 1255 OID 17543)
-- Dependencies: 1213 1213 4
-- Name: gseg_same(seg, seg, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gseg_same(seg, seg, internal) RETURNS internal
    AS '$libdir/seg', 'gseg_same'
    LANGUAGE c;


--
-- TOC entry 723 (class 1255 OID 17542)
-- Dependencies: 1213 4
-- Name: gseg_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gseg_union(internal, internal) RETURNS seg
    AS '$libdir/seg', 'gseg_union'
    LANGUAGE c;


--
-- TOC entry 651 (class 1255 OID 17442)
-- Dependencies: 4
-- Name: gtrgm_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtrgm_compress(internal) RETURNS internal
    AS '$libdir/pg_trgm', 'gtrgm_compress'
    LANGUAGE c;


--
-- TOC entry 650 (class 1255 OID 17441)
-- Dependencies: 1205 4
-- Name: gtrgm_consistent(gtrgm, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtrgm_consistent(gtrgm, internal, integer) RETURNS boolean
    AS '$libdir/pg_trgm', 'gtrgm_consistent'
    LANGUAGE c;


--
-- TOC entry 652 (class 1255 OID 17443)
-- Dependencies: 4
-- Name: gtrgm_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtrgm_decompress(internal) RETURNS internal
    AS '$libdir/pg_trgm', 'gtrgm_decompress'
    LANGUAGE c;


--
-- TOC entry 653 (class 1255 OID 17444)
-- Dependencies: 4
-- Name: gtrgm_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtrgm_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/pg_trgm', 'gtrgm_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 654 (class 1255 OID 17445)
-- Dependencies: 4
-- Name: gtrgm_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtrgm_picksplit(internal, internal) RETURNS internal
    AS '$libdir/pg_trgm', 'gtrgm_picksplit'
    LANGUAGE c;


--
-- TOC entry 656 (class 1255 OID 17447)
-- Dependencies: 1205 1205 4
-- Name: gtrgm_same(gtrgm, gtrgm, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtrgm_same(gtrgm, gtrgm, internal) RETURNS internal
    AS '$libdir/pg_trgm', 'gtrgm_same'
    LANGUAGE c;


--
-- TOC entry 655 (class 1255 OID 17446)
-- Dependencies: 4
-- Name: gtrgm_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtrgm_union(bytea, internal) RETURNS integer[]
    AS '$libdir/pg_trgm', 'gtrgm_union'
    LANGUAGE c;


--
-- TOC entry 861 (class 1255 OID 17846)
-- Dependencies: 4
-- Name: gtsq_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsq_compress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_compress'
    LANGUAGE c;


--
-- TOC entry 860 (class 1255 OID 17845)
-- Dependencies: 4 1240
-- Name: gtsq_consistent(gtsq, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsq_consistent(gtsq, internal, integer) RETURNS boolean
    AS '$libdir/tsearch2', 'gtsq_consistent'
    LANGUAGE c;


--
-- TOC entry 862 (class 1255 OID 17847)
-- Dependencies: 4
-- Name: gtsq_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsq_decompress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_decompress'
    LANGUAGE c;


--
-- TOC entry 863 (class 1255 OID 17848)
-- Dependencies: 4
-- Name: gtsq_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsq_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 864 (class 1255 OID 17849)
-- Dependencies: 4
-- Name: gtsq_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsq_picksplit(internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_picksplit'
    LANGUAGE c;


--
-- TOC entry 866 (class 1255 OID 17851)
-- Dependencies: 4 1240 1240
-- Name: gtsq_same(gtsq, gtsq, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsq_same(gtsq, gtsq, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsq_same'
    LANGUAGE c;


--
-- TOC entry 865 (class 1255 OID 17850)
-- Dependencies: 4
-- Name: gtsq_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsq_union(bytea, internal) RETURNS integer[]
    AS '$libdir/tsearch2', 'gtsq_union'
    LANGUAGE c;


--
-- TOC entry 822 (class 1255 OID 17778)
-- Dependencies: 4
-- Name: gtsvector_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsvector_compress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_compress'
    LANGUAGE c;


--
-- TOC entry 821 (class 1255 OID 17777)
-- Dependencies: 4 1235
-- Name: gtsvector_consistent(gtsvector, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsvector_consistent(gtsvector, internal, integer) RETURNS boolean
    AS '$libdir/tsearch2', 'gtsvector_consistent'
    LANGUAGE c;


--
-- TOC entry 823 (class 1255 OID 17779)
-- Dependencies: 4
-- Name: gtsvector_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsvector_decompress(internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_decompress'
    LANGUAGE c;


--
-- TOC entry 824 (class 1255 OID 17780)
-- Dependencies: 4
-- Name: gtsvector_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsvector_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 825 (class 1255 OID 17781)
-- Dependencies: 4
-- Name: gtsvector_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsvector_picksplit(internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_picksplit'
    LANGUAGE c;


--
-- TOC entry 827 (class 1255 OID 17783)
-- Dependencies: 1235 1235 4
-- Name: gtsvector_same(gtsvector, gtsvector, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsvector_same(gtsvector, gtsvector, internal) RETURNS internal
    AS '$libdir/tsearch2', 'gtsvector_same'
    LANGUAGE c;


--
-- TOC entry 826 (class 1255 OID 17782)
-- Dependencies: 4
-- Name: gtsvector_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gtsvector_union(internal, internal) RETURNS integer[]
    AS '$libdir/tsearch2', 'gtsvector_union'
    LANGUAGE c;


--
-- TOC entry 499 (class 1255 OID 17166)
-- Dependencies: 1165 4
-- Name: hashean13(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hashean13(ean13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 507 (class 1255 OID 17178)
-- Dependencies: 1177 4
-- Name: hashisbn(isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hashisbn(isbn) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 503 (class 1255 OID 17172)
-- Dependencies: 4 1168
-- Name: hashisbn13(isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hashisbn13(isbn13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 515 (class 1255 OID 17190)
-- Dependencies: 4 1180
-- Name: hashismn(ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hashismn(ismn) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 511 (class 1255 OID 17184)
-- Dependencies: 4 1171
-- Name: hashismn13(ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hashismn13(ismn13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 523 (class 1255 OID 17202)
-- Dependencies: 4 1183
-- Name: hashissn(issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hashissn(issn) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 519 (class 1255 OID 17196)
-- Dependencies: 4 1174
-- Name: hashissn13(issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hashissn13(issn13) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 526 (class 1255 OID 17207)
-- Dependencies: 4 1186
-- Name: hashupc(upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hashupc(upc) RETURNS integer
    AS $$hashint8$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 813 (class 1255 OID 17767)
-- Dependencies: 4 1232
-- Name: headline(oid, text, tsquery, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION headline(oid, text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 814 (class 1255 OID 17768)
-- Dependencies: 1232 4
-- Name: headline(oid, text, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION headline(oid, text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 815 (class 1255 OID 17769)
-- Dependencies: 4 1232
-- Name: headline(text, text, tsquery, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION headline(text, text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline_byname'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 816 (class 1255 OID 17770)
-- Dependencies: 4 1232
-- Name: headline(text, text, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION headline(text, text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline_byname'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 817 (class 1255 OID 17771)
-- Dependencies: 4 1232
-- Name: headline(text, tsquery, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION headline(text, tsquery, text) RETURNS text
    AS '$libdir/tsearch2', 'headline_current'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 818 (class 1255 OID 17772)
-- Dependencies: 4 1232
-- Name: headline(text, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION headline(text, tsquery) RETURNS text
    AS '$libdir/tsearch2', 'headline_current'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 659 (class 1255 OID 17451)
-- Dependencies: 4
-- Name: hmac(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hmac(text, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_hmac'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 660 (class 1255 OID 17452)
-- Dependencies: 4
-- Name: hmac(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hmac(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pg_hmac'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 241 (class 1255 OID 16688)
-- Dependencies: 4 1152 1152 1152
-- Name: hs_concat(hstore, hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hs_concat(hstore, hstore) RETURNS hstore
    AS '$libdir/hstore', 'hs_concat'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 243 (class 1255 OID 16691)
-- Dependencies: 4 1152 1152
-- Name: hs_contained(hstore, hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hs_contained(hstore, hstore) RETURNS boolean
    AS '$libdir/hstore', 'hs_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 242 (class 1255 OID 16690)
-- Dependencies: 4 1152 1152
-- Name: hs_contains(hstore, hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hs_contains(hstore, hstore) RETURNS boolean
    AS '$libdir/hstore', 'hs_contains'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 275 (class 1255 OID 16743)
-- Dependencies: 4
-- Name: icount(integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION icount(integer[]) RETURNS integer
    AS '$libdir/_int', 'icount'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 281 (class 1255 OID 16750)
-- Dependencies: 4
-- Name: idx(integer[], integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION idx(integer[], integer) RETURNS integer
    AS '$libdir/_int', 'idx'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 582 (class 1255 OID 17309)
-- Dependencies: 1190 4 1190
-- Name: index(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "index"(ltree, ltree) RETURNS integer
    AS '$libdir/ltree', 'ltree_index'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 583 (class 1255 OID 17310)
-- Dependencies: 1190 4 1190
-- Name: index(ltree, ltree, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "index"(ltree, ltree, integer) RETURNS integer
    AS '$libdir/ltree', 'ltree_index'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 726 (class 1255 OID 17547)
-- Dependencies: 4
-- Name: insert_username(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION insert_username() RETURNS "trigger"
    AS '$libdir/insert_username', 'insert_username'
    LANGUAGE c;


--
-- TOC entry 260 (class 1255 OID 16718)
-- Dependencies: 4
-- Name: int_agg_final_array(integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION int_agg_final_array(integer[]) RETURNS integer[]
    AS '$libdir/int_aggregate', 'int_agg_final_array'
    LANGUAGE c;


--
-- TOC entry 259 (class 1255 OID 16717)
-- Dependencies: 4
-- Name: int_agg_state(integer[], integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION int_agg_state(integer[], integer) RETURNS integer[]
    AS '$libdir/int_aggregate', 'int_agg_state'
    LANGUAGE c;


--
-- TOC entry 261 (class 1255 OID 16720)
-- Dependencies: 4
-- Name: int_array_enum(integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION int_array_enum(integer[]) RETURNS SETOF integer
    AS '$libdir/int_aggregate', 'int_enum'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 286 (class 1255 OID 16758)
-- Dependencies: 4
-- Name: intarray_del_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intarray_del_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intarray_del_elem'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 285 (class 1255 OID 16756)
-- Dependencies: 4
-- Name: intarray_push_array(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intarray_push_array(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', 'intarray_push_array'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 284 (class 1255 OID 16754)
-- Dependencies: 4
-- Name: intarray_push_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intarray_push_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intarray_push_elem'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 274 (class 1255 OID 16742)
-- Dependencies: 4
-- Name: intset(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intset(integer) RETURNS integer[]
    AS '$libdir/_int', 'intset'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 288 (class 1255 OID 16763)
-- Dependencies: 4
-- Name: intset_subtract(integer[], integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intset_subtract(integer[], integer[]) RETURNS integer[]
    AS '$libdir/_int', 'intset_subtract'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 287 (class 1255 OID 16760)
-- Dependencies: 4
-- Name: intset_union_elem(integer[], integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intset_union_elem(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'intset_union_elem'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 558 (class 1255 OID 17276)
-- Dependencies: 1165 4
-- Name: is_valid(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION is_valid(ean13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 559 (class 1255 OID 17277)
-- Dependencies: 4 1168
-- Name: is_valid(isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION is_valid(isbn13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 560 (class 1255 OID 17278)
-- Dependencies: 4 1171
-- Name: is_valid(ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION is_valid(ismn13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 561 (class 1255 OID 17279)
-- Dependencies: 4 1174
-- Name: is_valid(issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION is_valid(issn13) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 562 (class 1255 OID 17280)
-- Dependencies: 4 1177
-- Name: is_valid(isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION is_valid(isbn) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 563 (class 1255 OID 17281)
-- Dependencies: 4 1180
-- Name: is_valid(ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION is_valid(ismn) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 564 (class 1255 OID 17282)
-- Dependencies: 4 1183
-- Name: is_valid(issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION is_valid(issn) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 565 (class 1255 OID 17283)
-- Dependencies: 4 1186
-- Name: is_valid(upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION is_valid(upc) RETURNS boolean
    AS '$libdir/isn', 'is_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 530 (class 1255 OID 17212)
-- Dependencies: 4 1177 1165
-- Name: isbn(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isbn(ean13) RETURNS isbn
    AS '$libdir/isn', 'isbn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 538 (class 1255 OID 17220)
-- Dependencies: 4 1177
-- Name: isbn(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isbn(text) RETURNS isbn
    AS '$libdir/isn', 'isbn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 527 (class 1255 OID 17209)
-- Dependencies: 4 1168 1165
-- Name: isbn13(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isbn13(ean13) RETURNS isbn13
    AS '$libdir/isn', 'isbn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 535 (class 1255 OID 17217)
-- Dependencies: 4 1168
-- Name: isbn13(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isbn13(text) RETURNS isbn13
    AS '$libdir/isn', 'isbn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 238 (class 1255 OID 16685)
-- Dependencies: 4 1152
-- Name: isdefined(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isdefined(hstore, text) RETURNS boolean
    AS '$libdir/hstore', 'defined'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 236 (class 1255 OID 16683)
-- Dependencies: 4 1152
-- Name: isexists(hstore, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isexists(hstore, text) RETURNS boolean
    AS '$libdir/hstore', 'exists'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 531 (class 1255 OID 17213)
-- Dependencies: 4 1180 1165
-- Name: ismn(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ismn(ean13) RETURNS ismn
    AS '$libdir/isn', 'ismn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 539 (class 1255 OID 17221)
-- Dependencies: 4 1180
-- Name: ismn(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ismn(text) RETURNS ismn
    AS '$libdir/isn', 'ismn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 528 (class 1255 OID 17210)
-- Dependencies: 4 1171 1165
-- Name: ismn13(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ismn13(ean13) RETURNS ismn13
    AS '$libdir/isn', 'ismn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 536 (class 1255 OID 17218)
-- Dependencies: 4 1171
-- Name: ismn13(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ismn13(text) RETURNS ismn13
    AS '$libdir/isn', 'ismn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 566 (class 1255 OID 17284)
-- Dependencies: 4
-- Name: isn_weak(boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isn_weak(boolean) RETURNS boolean
    AS '$libdir/isn', 'accept_weak_input'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 567 (class 1255 OID 17285)
-- Dependencies: 4
-- Name: isn_weak(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isn_weak() RETURNS boolean
    AS '$libdir/isn', 'weak_input_status'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 325 (class 1255 OID 16823)
-- Dependencies: 4 1165 1165
-- Name: isneq(ean13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ean13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 331 (class 1255 OID 16829)
-- Dependencies: 4 1165 1168
-- Name: isneq(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ean13, isbn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 337 (class 1255 OID 16835)
-- Dependencies: 4 1165 1171
-- Name: isneq(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ean13, ismn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 343 (class 1255 OID 16841)
-- Dependencies: 4 1165 1174
-- Name: isneq(ean13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ean13, issn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 349 (class 1255 OID 16847)
-- Dependencies: 4 1165 1177
-- Name: isneq(ean13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ean13, isbn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 355 (class 1255 OID 16853)
-- Dependencies: 4 1165 1180
-- Name: isneq(ean13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ean13, ismn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 361 (class 1255 OID 16859)
-- Dependencies: 4 1165 1183
-- Name: isneq(ean13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ean13, issn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 367 (class 1255 OID 16865)
-- Dependencies: 4 1165 1186
-- Name: isneq(ean13, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ean13, upc) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 373 (class 1255 OID 16871)
-- Dependencies: 4 1168 1168
-- Name: isneq(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(isbn13, isbn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 379 (class 1255 OID 16877)
-- Dependencies: 4 1168 1177
-- Name: isneq(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(isbn13, isbn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 385 (class 1255 OID 16883)
-- Dependencies: 4 1168 1165
-- Name: isneq(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(isbn13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 391 (class 1255 OID 16889)
-- Dependencies: 4 1177 1177
-- Name: isneq(isbn, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(isbn, isbn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 397 (class 1255 OID 16895)
-- Dependencies: 4 1177 1168
-- Name: isneq(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(isbn, isbn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 403 (class 1255 OID 16901)
-- Dependencies: 1177 4 1165
-- Name: isneq(isbn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(isbn, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 409 (class 1255 OID 16907)
-- Dependencies: 4 1171 1171
-- Name: isneq(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ismn13, ismn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 415 (class 1255 OID 16913)
-- Dependencies: 1171 4 1180
-- Name: isneq(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ismn13, ismn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 421 (class 1255 OID 16919)
-- Dependencies: 1165 4 1171
-- Name: isneq(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ismn13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 427 (class 1255 OID 16925)
-- Dependencies: 4 1180 1180
-- Name: isneq(ismn, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ismn, ismn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 433 (class 1255 OID 16931)
-- Dependencies: 4 1171 1180
-- Name: isneq(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ismn, ismn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 439 (class 1255 OID 16937)
-- Dependencies: 1180 1165 4
-- Name: isneq(ismn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(ismn, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 445 (class 1255 OID 16943)
-- Dependencies: 4 1174 1174
-- Name: isneq(issn13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(issn13, issn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 451 (class 1255 OID 16949)
-- Dependencies: 4 1174 1183
-- Name: isneq(issn13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(issn13, issn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 457 (class 1255 OID 16955)
-- Dependencies: 4 1174 1165
-- Name: isneq(issn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(issn13, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 463 (class 1255 OID 16961)
-- Dependencies: 4 1183 1183
-- Name: isneq(issn, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(issn, issn) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 469 (class 1255 OID 16967)
-- Dependencies: 4 1183 1174
-- Name: isneq(issn, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(issn, issn13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 475 (class 1255 OID 16973)
-- Dependencies: 1183 4 1165
-- Name: isneq(issn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(issn, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 481 (class 1255 OID 16979)
-- Dependencies: 1186 4 1186
-- Name: isneq(upc, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(upc, upc) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 487 (class 1255 OID 16985)
-- Dependencies: 1186 1165 4
-- Name: isneq(upc, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isneq(upc, ean13) RETURNS boolean
    AS $$int8eq$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 326 (class 1255 OID 16824)
-- Dependencies: 4 1165 1165
-- Name: isnge(ean13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ean13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 332 (class 1255 OID 16830)
-- Dependencies: 4 1165 1168
-- Name: isnge(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ean13, isbn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 338 (class 1255 OID 16836)
-- Dependencies: 4 1165 1171
-- Name: isnge(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ean13, ismn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 344 (class 1255 OID 16842)
-- Dependencies: 4 1165 1174
-- Name: isnge(ean13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ean13, issn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 350 (class 1255 OID 16848)
-- Dependencies: 4 1165 1177
-- Name: isnge(ean13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ean13, isbn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 356 (class 1255 OID 16854)
-- Dependencies: 4 1165 1180
-- Name: isnge(ean13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ean13, ismn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 362 (class 1255 OID 16860)
-- Dependencies: 4 1165 1183
-- Name: isnge(ean13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ean13, issn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 368 (class 1255 OID 16866)
-- Dependencies: 4 1165 1186
-- Name: isnge(ean13, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ean13, upc) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 374 (class 1255 OID 16872)
-- Dependencies: 4 1168 1168
-- Name: isnge(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(isbn13, isbn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 380 (class 1255 OID 16878)
-- Dependencies: 4 1168 1177
-- Name: isnge(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(isbn13, isbn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 386 (class 1255 OID 16884)
-- Dependencies: 4 1168 1165
-- Name: isnge(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(isbn13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 392 (class 1255 OID 16890)
-- Dependencies: 4 1177 1177
-- Name: isnge(isbn, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(isbn, isbn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 398 (class 1255 OID 16896)
-- Dependencies: 4 1177 1168
-- Name: isnge(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(isbn, isbn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 404 (class 1255 OID 16902)
-- Dependencies: 1177 4 1165
-- Name: isnge(isbn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(isbn, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 410 (class 1255 OID 16908)
-- Dependencies: 1171 4 1171
-- Name: isnge(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ismn13, ismn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 416 (class 1255 OID 16914)
-- Dependencies: 1180 4 1171
-- Name: isnge(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ismn13, ismn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 422 (class 1255 OID 16920)
-- Dependencies: 4 1171 1165
-- Name: isnge(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ismn13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 428 (class 1255 OID 16926)
-- Dependencies: 1180 1180 4
-- Name: isnge(ismn, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ismn, ismn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 434 (class 1255 OID 16932)
-- Dependencies: 4 1180 1171
-- Name: isnge(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ismn, ismn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 440 (class 1255 OID 16938)
-- Dependencies: 1165 1180 4
-- Name: isnge(ismn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(ismn, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 446 (class 1255 OID 16944)
-- Dependencies: 4 1174 1174
-- Name: isnge(issn13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(issn13, issn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 452 (class 1255 OID 16950)
-- Dependencies: 4 1174 1183
-- Name: isnge(issn13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(issn13, issn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 458 (class 1255 OID 16956)
-- Dependencies: 4 1174 1165
-- Name: isnge(issn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(issn13, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 464 (class 1255 OID 16962)
-- Dependencies: 4 1183 1183
-- Name: isnge(issn, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(issn, issn) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 470 (class 1255 OID 16968)
-- Dependencies: 4 1183 1174
-- Name: isnge(issn, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(issn, issn13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 476 (class 1255 OID 16974)
-- Dependencies: 4 1183 1165
-- Name: isnge(issn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(issn, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 482 (class 1255 OID 16980)
-- Dependencies: 1186 4 1186
-- Name: isnge(upc, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(upc, upc) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 488 (class 1255 OID 16986)
-- Dependencies: 1186 4 1165
-- Name: isnge(upc, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnge(upc, ean13) RETURNS boolean
    AS $$int8ge$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 327 (class 1255 OID 16825)
-- Dependencies: 4 1165 1165
-- Name: isngt(ean13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ean13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 333 (class 1255 OID 16831)
-- Dependencies: 4 1165 1168
-- Name: isngt(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ean13, isbn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 339 (class 1255 OID 16837)
-- Dependencies: 4 1165 1171
-- Name: isngt(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ean13, ismn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 345 (class 1255 OID 16843)
-- Dependencies: 4 1165 1174
-- Name: isngt(ean13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ean13, issn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 351 (class 1255 OID 16849)
-- Dependencies: 4 1165 1177
-- Name: isngt(ean13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ean13, isbn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 357 (class 1255 OID 16855)
-- Dependencies: 4 1165 1180
-- Name: isngt(ean13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ean13, ismn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 363 (class 1255 OID 16861)
-- Dependencies: 4 1165 1183
-- Name: isngt(ean13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ean13, issn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 369 (class 1255 OID 16867)
-- Dependencies: 4 1165 1186
-- Name: isngt(ean13, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ean13, upc) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 375 (class 1255 OID 16873)
-- Dependencies: 4 1168 1168
-- Name: isngt(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(isbn13, isbn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 381 (class 1255 OID 16879)
-- Dependencies: 4 1168 1177
-- Name: isngt(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(isbn13, isbn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 387 (class 1255 OID 16885)
-- Dependencies: 4 1168 1165
-- Name: isngt(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(isbn13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 393 (class 1255 OID 16891)
-- Dependencies: 4 1177 1177
-- Name: isngt(isbn, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(isbn, isbn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 399 (class 1255 OID 16897)
-- Dependencies: 4 1177 1168
-- Name: isngt(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(isbn, isbn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 405 (class 1255 OID 16903)
-- Dependencies: 4 1177 1165
-- Name: isngt(isbn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(isbn, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 411 (class 1255 OID 16909)
-- Dependencies: 1171 1171 4
-- Name: isngt(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ismn13, ismn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 417 (class 1255 OID 16915)
-- Dependencies: 4 1171 1180
-- Name: isngt(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ismn13, ismn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 423 (class 1255 OID 16921)
-- Dependencies: 4 1171 1165
-- Name: isngt(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ismn13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 429 (class 1255 OID 16927)
-- Dependencies: 4 1180 1180
-- Name: isngt(ismn, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ismn, ismn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 435 (class 1255 OID 16933)
-- Dependencies: 1171 4 1180
-- Name: isngt(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ismn, ismn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 441 (class 1255 OID 16939)
-- Dependencies: 4 1165 1180
-- Name: isngt(ismn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(ismn, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 447 (class 1255 OID 16945)
-- Dependencies: 4 1174 1174
-- Name: isngt(issn13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(issn13, issn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 453 (class 1255 OID 16951)
-- Dependencies: 4 1174 1183
-- Name: isngt(issn13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(issn13, issn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 459 (class 1255 OID 16957)
-- Dependencies: 4 1174 1165
-- Name: isngt(issn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(issn13, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 465 (class 1255 OID 16963)
-- Dependencies: 4 1183 1183
-- Name: isngt(issn, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(issn, issn) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 471 (class 1255 OID 16969)
-- Dependencies: 4 1183 1174
-- Name: isngt(issn, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(issn, issn13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 477 (class 1255 OID 16975)
-- Dependencies: 1165 4 1183
-- Name: isngt(issn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(issn, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 483 (class 1255 OID 16981)
-- Dependencies: 4 1186 1186
-- Name: isngt(upc, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(upc, upc) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 489 (class 1255 OID 16987)
-- Dependencies: 4 1186 1165
-- Name: isngt(upc, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isngt(upc, ean13) RETURNS boolean
    AS $$int8gt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 324 (class 1255 OID 16822)
-- Dependencies: 4 1165 1165
-- Name: isnle(ean13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ean13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 330 (class 1255 OID 16828)
-- Dependencies: 4 1165 1168
-- Name: isnle(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ean13, isbn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 336 (class 1255 OID 16834)
-- Dependencies: 4 1165 1171
-- Name: isnle(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ean13, ismn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 342 (class 1255 OID 16840)
-- Dependencies: 4 1165 1174
-- Name: isnle(ean13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ean13, issn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 348 (class 1255 OID 16846)
-- Dependencies: 4 1165 1177
-- Name: isnle(ean13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ean13, isbn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 354 (class 1255 OID 16852)
-- Dependencies: 4 1165 1180
-- Name: isnle(ean13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ean13, ismn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 360 (class 1255 OID 16858)
-- Dependencies: 4 1165 1183
-- Name: isnle(ean13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ean13, issn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 366 (class 1255 OID 16864)
-- Dependencies: 4 1165 1186
-- Name: isnle(ean13, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ean13, upc) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 372 (class 1255 OID 16870)
-- Dependencies: 4 1168 1168
-- Name: isnle(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(isbn13, isbn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 378 (class 1255 OID 16876)
-- Dependencies: 4 1168 1177
-- Name: isnle(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(isbn13, isbn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 384 (class 1255 OID 16882)
-- Dependencies: 4 1168 1165
-- Name: isnle(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(isbn13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 390 (class 1255 OID 16888)
-- Dependencies: 4 1177 1177
-- Name: isnle(isbn, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(isbn, isbn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 396 (class 1255 OID 16894)
-- Dependencies: 4 1177 1168
-- Name: isnle(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(isbn, isbn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 402 (class 1255 OID 16900)
-- Dependencies: 1165 4 1177
-- Name: isnle(isbn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(isbn, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 408 (class 1255 OID 16906)
-- Dependencies: 1171 4 1171
-- Name: isnle(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ismn13, ismn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 414 (class 1255 OID 16912)
-- Dependencies: 4 1180 1171
-- Name: isnle(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ismn13, ismn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 420 (class 1255 OID 16918)
-- Dependencies: 1171 4 1165
-- Name: isnle(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ismn13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 426 (class 1255 OID 16924)
-- Dependencies: 4 1180 1180
-- Name: isnle(ismn, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ismn, ismn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 432 (class 1255 OID 16930)
-- Dependencies: 1171 4 1180
-- Name: isnle(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ismn, ismn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 438 (class 1255 OID 16936)
-- Dependencies: 1165 1180 4
-- Name: isnle(ismn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(ismn, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 444 (class 1255 OID 16942)
-- Dependencies: 4 1174 1174
-- Name: isnle(issn13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(issn13, issn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 450 (class 1255 OID 16948)
-- Dependencies: 4 1174 1183
-- Name: isnle(issn13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(issn13, issn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 456 (class 1255 OID 16954)
-- Dependencies: 4 1174 1165
-- Name: isnle(issn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(issn13, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 462 (class 1255 OID 16960)
-- Dependencies: 4 1183 1183
-- Name: isnle(issn, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(issn, issn) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 468 (class 1255 OID 16966)
-- Dependencies: 4 1183 1174
-- Name: isnle(issn, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(issn, issn13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 474 (class 1255 OID 16972)
-- Dependencies: 4 1183 1165
-- Name: isnle(issn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(issn, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 480 (class 1255 OID 16978)
-- Dependencies: 1186 4 1186
-- Name: isnle(upc, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(upc, upc) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 486 (class 1255 OID 16984)
-- Dependencies: 1165 4 1186
-- Name: isnle(upc, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnle(upc, ean13) RETURNS boolean
    AS $$int8le$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 323 (class 1255 OID 16821)
-- Dependencies: 4 1165 1165
-- Name: isnlt(ean13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ean13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 329 (class 1255 OID 16827)
-- Dependencies: 4 1165 1168
-- Name: isnlt(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ean13, isbn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 335 (class 1255 OID 16833)
-- Dependencies: 4 1165 1171
-- Name: isnlt(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ean13, ismn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 341 (class 1255 OID 16839)
-- Dependencies: 4 1165 1174
-- Name: isnlt(ean13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ean13, issn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 347 (class 1255 OID 16845)
-- Dependencies: 4 1165 1177
-- Name: isnlt(ean13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ean13, isbn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 353 (class 1255 OID 16851)
-- Dependencies: 4 1165 1180
-- Name: isnlt(ean13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ean13, ismn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 359 (class 1255 OID 16857)
-- Dependencies: 4 1165 1183
-- Name: isnlt(ean13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ean13, issn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 365 (class 1255 OID 16863)
-- Dependencies: 4 1165 1186
-- Name: isnlt(ean13, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ean13, upc) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 371 (class 1255 OID 16869)
-- Dependencies: 4 1168 1168
-- Name: isnlt(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(isbn13, isbn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 377 (class 1255 OID 16875)
-- Dependencies: 4 1168 1177
-- Name: isnlt(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(isbn13, isbn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 383 (class 1255 OID 16881)
-- Dependencies: 4 1168 1165
-- Name: isnlt(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(isbn13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 389 (class 1255 OID 16887)
-- Dependencies: 4 1177 1177
-- Name: isnlt(isbn, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(isbn, isbn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 395 (class 1255 OID 16893)
-- Dependencies: 4 1177 1168
-- Name: isnlt(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(isbn, isbn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 401 (class 1255 OID 16899)
-- Dependencies: 4 1177 1165
-- Name: isnlt(isbn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(isbn, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 407 (class 1255 OID 16905)
-- Dependencies: 1171 1171 4
-- Name: isnlt(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ismn13, ismn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 413 (class 1255 OID 16911)
-- Dependencies: 1171 4 1180
-- Name: isnlt(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ismn13, ismn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 419 (class 1255 OID 16917)
-- Dependencies: 1165 4 1171
-- Name: isnlt(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ismn13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 425 (class 1255 OID 16923)
-- Dependencies: 4 1180 1180
-- Name: isnlt(ismn, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ismn, ismn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 431 (class 1255 OID 16929)
-- Dependencies: 1180 4 1171
-- Name: isnlt(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ismn, ismn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 437 (class 1255 OID 16935)
-- Dependencies: 4 1180 1165
-- Name: isnlt(ismn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(ismn, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 443 (class 1255 OID 16941)
-- Dependencies: 4 1174 1174
-- Name: isnlt(issn13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(issn13, issn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 449 (class 1255 OID 16947)
-- Dependencies: 4 1174 1183
-- Name: isnlt(issn13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(issn13, issn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 455 (class 1255 OID 16953)
-- Dependencies: 4 1174 1165
-- Name: isnlt(issn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(issn13, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 461 (class 1255 OID 16959)
-- Dependencies: 4 1183 1183
-- Name: isnlt(issn, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(issn, issn) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 467 (class 1255 OID 16965)
-- Dependencies: 4 1183 1174
-- Name: isnlt(issn, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(issn, issn13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 473 (class 1255 OID 16971)
-- Dependencies: 4 1183 1165
-- Name: isnlt(issn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(issn, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 479 (class 1255 OID 16977)
-- Dependencies: 1186 4 1186
-- Name: isnlt(upc, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(upc, upc) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 485 (class 1255 OID 16983)
-- Dependencies: 1186 4 1165
-- Name: isnlt(upc, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnlt(upc, ean13) RETURNS boolean
    AS $$int8lt$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 328 (class 1255 OID 16826)
-- Dependencies: 4 1165 1165
-- Name: isnne(ean13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ean13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 334 (class 1255 OID 16832)
-- Dependencies: 4 1165 1168
-- Name: isnne(ean13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ean13, isbn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 340 (class 1255 OID 16838)
-- Dependencies: 4 1165 1171
-- Name: isnne(ean13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ean13, ismn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 346 (class 1255 OID 16844)
-- Dependencies: 4 1165 1174
-- Name: isnne(ean13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ean13, issn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 352 (class 1255 OID 16850)
-- Dependencies: 4 1165 1177
-- Name: isnne(ean13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ean13, isbn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 358 (class 1255 OID 16856)
-- Dependencies: 4 1165 1180
-- Name: isnne(ean13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ean13, ismn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 364 (class 1255 OID 16862)
-- Dependencies: 4 1165 1183
-- Name: isnne(ean13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ean13, issn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 370 (class 1255 OID 16868)
-- Dependencies: 4 1165 1186
-- Name: isnne(ean13, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ean13, upc) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 376 (class 1255 OID 16874)
-- Dependencies: 4 1168 1168
-- Name: isnne(isbn13, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(isbn13, isbn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 382 (class 1255 OID 16880)
-- Dependencies: 4 1168 1177
-- Name: isnne(isbn13, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(isbn13, isbn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 388 (class 1255 OID 16886)
-- Dependencies: 4 1168 1165
-- Name: isnne(isbn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(isbn13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 394 (class 1255 OID 16892)
-- Dependencies: 4 1177 1177
-- Name: isnne(isbn, isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(isbn, isbn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 400 (class 1255 OID 16898)
-- Dependencies: 4 1177 1168
-- Name: isnne(isbn, isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(isbn, isbn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 406 (class 1255 OID 16904)
-- Dependencies: 1177 1165 4
-- Name: isnne(isbn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(isbn, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 412 (class 1255 OID 16910)
-- Dependencies: 1171 1171 4
-- Name: isnne(ismn13, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ismn13, ismn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 418 (class 1255 OID 16916)
-- Dependencies: 1171 4 1180
-- Name: isnne(ismn13, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ismn13, ismn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 424 (class 1255 OID 16922)
-- Dependencies: 4 1171 1165
-- Name: isnne(ismn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ismn13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 430 (class 1255 OID 16928)
-- Dependencies: 1180 4 1180
-- Name: isnne(ismn, ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ismn, ismn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 436 (class 1255 OID 16934)
-- Dependencies: 4 1180 1171
-- Name: isnne(ismn, ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ismn, ismn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 442 (class 1255 OID 16940)
-- Dependencies: 4 1165 1180
-- Name: isnne(ismn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(ismn, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 448 (class 1255 OID 16946)
-- Dependencies: 4 1174 1174
-- Name: isnne(issn13, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(issn13, issn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 454 (class 1255 OID 16952)
-- Dependencies: 4 1174 1183
-- Name: isnne(issn13, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(issn13, issn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 460 (class 1255 OID 16958)
-- Dependencies: 4 1174 1165
-- Name: isnne(issn13, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(issn13, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 466 (class 1255 OID 16964)
-- Dependencies: 4 1183 1183
-- Name: isnne(issn, issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(issn, issn) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 472 (class 1255 OID 16970)
-- Dependencies: 4 1183 1174
-- Name: isnne(issn, issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(issn, issn13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 478 (class 1255 OID 16976)
-- Dependencies: 1183 4 1165
-- Name: isnne(issn, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(issn, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 484 (class 1255 OID 16982)
-- Dependencies: 4 1186 1186
-- Name: isnne(upc, upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(upc, upc) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 490 (class 1255 OID 16988)
-- Dependencies: 1165 1186 4
-- Name: isnne(upc, ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isnne(upc, ean13) RETURNS boolean
    AS $$int8ne$$
    LANGUAGE internal IMMUTABLE STRICT;


--
-- TOC entry 532 (class 1255 OID 17214)
-- Dependencies: 4 1183 1165
-- Name: issn(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION issn(ean13) RETURNS issn
    AS '$libdir/isn', 'issn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 540 (class 1255 OID 17222)
-- Dependencies: 4 1183
-- Name: issn(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION issn(text) RETURNS issn
    AS '$libdir/isn', 'issn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 529 (class 1255 OID 17211)
-- Dependencies: 4 1174 1165
-- Name: issn13(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION issn13(ean13) RETURNS issn13
    AS '$libdir/isn', 'issn_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 537 (class 1255 OID 17219)
-- Dependencies: 4 1174
-- Name: issn13(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION issn13(text) RETURNS issn13
    AS '$libdir/isn', 'issn_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 221 (class 1255 OID 16664)
-- Dependencies: 4 1148
-- Name: latitude(earth); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION latitude(earth) RETURNS double precision
    AS $_$SELECT CASE WHEN cube_ll_coord($1, 3)/earth() < -1 THEN -90::float8 WHEN cube_ll_coord($1, 3)/earth() > 1 THEN 90::float8 ELSE degrees(asin(cube_ll_coord($1, 3)/earth())) END$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 587 (class 1255 OID 17314)
-- Dependencies: 1190 4 1192
-- Name: lca(ltree[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree[]) RETURNS ltree
    AS '$libdir/ltree', '_lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 588 (class 1255 OID 17315)
-- Dependencies: 1190 4 1190 1190
-- Name: lca(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 589 (class 1255 OID 17316)
-- Dependencies: 1190 4 1190 1190 1190
-- Name: lca(ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 590 (class 1255 OID 17317)
-- Dependencies: 1190 4 1190 1190 1190 1190
-- Name: lca(ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 591 (class 1255 OID 17318)
-- Dependencies: 1190 4 1190 1190 1190 1190 1190
-- Name: lca(ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 592 (class 1255 OID 17319)
-- Dependencies: 1190 1190 1190 1190 1190 1190 1190 4
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 593 (class 1255 OID 17320)
-- Dependencies: 1190 1190 1190 1190 4 1190 1190 1190 1190
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 594 (class 1255 OID 17321)
-- Dependencies: 1190 1190 4 1190 1190 1190 1190 1190 1190 1190
-- Name: lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lca(ltree, ltree, ltree, ltree, ltree, ltree, ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'lca'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 786 (class 1255 OID 17735)
-- Dependencies: 1229 4
-- Name: length(tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length(tsvector) RETURNS integer
    AS '$libdir/tsearch2', 'tsvector_length'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 226 (class 1255 OID 16670)
-- Dependencies: 4
-- Name: levenshtein(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION levenshtein(text, text) RETURNS integer
    AS '$libdir/fuzzystrmatch', 'levenshtein'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 751 (class 1255 OID 17585)
-- Dependencies: 4
-- Name: lexize(oid, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lexize(oid, text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize'
    LANGUAGE c STRICT;


--
-- TOC entry 752 (class 1255 OID 17586)
-- Dependencies: 4
-- Name: lexize(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lexize(text, text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize_byname'
    LANGUAGE c STRICT;


--
-- TOC entry 753 (class 1255 OID 17587)
-- Dependencies: 4
-- Name: lexize(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lexize(text) RETURNS text[]
    AS '$libdir/tsearch2', 'lexize_bycurrent'
    LANGUAGE c STRICT;


--
-- TOC entry 220 (class 1255 OID 16663)
-- Dependencies: 4 1148
-- Name: ll_to_earth(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ll_to_earth(double precision, double precision) RETURNS earth
    AS $_$SELECT cube(cube(cube(earth()*cos(radians($1))*cos(radians($2))),earth()*cos(radians($1))*sin(radians($2))),earth()*sin(radians($1)))::earth$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 569 (class 1255 OID 17288)
-- Dependencies: 4
-- Name: lo_manage(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lo_manage() RETURNS "trigger"
    AS '$libdir/lo', 'lo_manage'
    LANGUAGE c;


--
-- TOC entry 568 (class 1255 OID 17287)
-- Dependencies: 4 1189
-- Name: lo_oid(lo); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lo_oid(lo) RETURNS oid
    AS $_$SELECT $1::pg_catalog.oid$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 222 (class 1255 OID 16665)
-- Dependencies: 4 1148
-- Name: longitude(earth); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION longitude(earth) RETURNS double precision
    AS $_$SELECT degrees(atan2(cube_ll_coord($1, 2), cube_ll_coord($1, 1)))$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 605 (class 1255 OID 17346)
-- Dependencies: 4 1195 1190
-- Name: lt_q_regex(ltree, lquery[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lt_q_regex(ltree, lquery[]) RETURNS boolean
    AS '$libdir/ltree', 'lt_q_regex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 606 (class 1255 OID 17347)
-- Dependencies: 4 1190 1195
-- Name: lt_q_rregex(lquery[], ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lt_q_rregex(lquery[], ltree) RETURNS boolean
    AS '$libdir/ltree', 'lt_q_rregex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 603 (class 1255 OID 17340)
-- Dependencies: 1190 1193 4
-- Name: ltq_regex(ltree, lquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltq_regex(ltree, lquery) RETURNS boolean
    AS '$libdir/ltree', 'ltq_regex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 604 (class 1255 OID 17341)
-- Dependencies: 1193 4 1190
-- Name: ltq_rregex(lquery, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltq_rregex(lquery, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltq_rregex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 585 (class 1255 OID 17312)
-- Dependencies: 4 1190
-- Name: ltree2text(ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree2text(ltree) RETURNS text
    AS '$libdir/ltree', 'ltree2text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 597 (class 1255 OID 17324)
-- Dependencies: 1190 4 1190 1190
-- Name: ltree_addltree(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_addltree(ltree, ltree) RETURNS ltree
    AS '$libdir/ltree', 'ltree_addltree'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 598 (class 1255 OID 17325)
-- Dependencies: 4 1190 1190
-- Name: ltree_addtext(ltree, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_addtext(ltree, text) RETURNS ltree
    AS '$libdir/ltree', 'ltree_addtext'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 572 (class 1255 OID 17293)
-- Dependencies: 1190 4 1190
-- Name: ltree_cmp(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_cmp(ltree, ltree) RETURNS integer
    AS '$libdir/ltree', 'ltree_cmp'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 614 (class 1255 OID 17367)
-- Dependencies: 4
-- Name: ltree_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_compress(internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_compress'
    LANGUAGE c;


--
-- TOC entry 613 (class 1255 OID 17366)
-- Dependencies: 4
-- Name: ltree_consistent(internal, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_consistent(internal, internal, smallint) RETURNS boolean
    AS '$libdir/ltree', 'ltree_consistent'
    LANGUAGE c;


--
-- TOC entry 615 (class 1255 OID 17368)
-- Dependencies: 4
-- Name: ltree_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_decompress(internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_decompress'
    LANGUAGE c;


--
-- TOC entry 575 (class 1255 OID 17296)
-- Dependencies: 1190 4 1190
-- Name: ltree_eq(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_eq(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_eq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 576 (class 1255 OID 17297)
-- Dependencies: 1190 4 1190
-- Name: ltree_ge(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_ge(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_ge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 577 (class 1255 OID 17298)
-- Dependencies: 4 1190 1190
-- Name: ltree_gt(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_gt(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_gt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 595 (class 1255 OID 17322)
-- Dependencies: 1190 4 1190
-- Name: ltree_isparent(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_isparent(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_isparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 574 (class 1255 OID 17295)
-- Dependencies: 4 1190 1190
-- Name: ltree_le(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_le(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_le'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 573 (class 1255 OID 17294)
-- Dependencies: 4 1190 1190
-- Name: ltree_lt(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_lt(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_lt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 578 (class 1255 OID 17299)
-- Dependencies: 1190 1190 4
-- Name: ltree_ne(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_ne(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_ne'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 616 (class 1255 OID 17369)
-- Dependencies: 4
-- Name: ltree_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_penalty'
    LANGUAGE c STRICT;


--
-- TOC entry 617 (class 1255 OID 17370)
-- Dependencies: 4
-- Name: ltree_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_picksplit(internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_picksplit'
    LANGUAGE c;


--
-- TOC entry 596 (class 1255 OID 17323)
-- Dependencies: 1190 4 1190
-- Name: ltree_risparent(ltree, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_risparent(ltree, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltree_risparent'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 619 (class 1255 OID 17372)
-- Dependencies: 4
-- Name: ltree_same(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_same(internal, internal, internal) RETURNS internal
    AS '$libdir/ltree', 'ltree_same'
    LANGUAGE c;


--
-- TOC entry 599 (class 1255 OID 17326)
-- Dependencies: 1190 4 1190
-- Name: ltree_textadd(text, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_textadd(text, ltree) RETURNS ltree
    AS '$libdir/ltree', 'ltree_textadd'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 618 (class 1255 OID 17371)
-- Dependencies: 4
-- Name: ltree_union(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltree_union(internal, internal) RETURNS integer
    AS '$libdir/ltree', 'ltree_union'
    LANGUAGE c;


--
-- TOC entry 600 (class 1255 OID 17327)
-- Dependencies: 4
-- Name: ltreeparentsel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltreeparentsel(internal, oid, internal, integer) RETURNS double precision
    AS '$libdir/ltree', 'ltreeparentsel'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 609 (class 1255 OID 17356)
-- Dependencies: 1196 4 1190
-- Name: ltxtq_exec(ltree, ltxtquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltxtq_exec(ltree, ltxtquery) RETURNS boolean
    AS '$libdir/ltree', 'ltxtq_exec'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 610 (class 1255 OID 17357)
-- Dependencies: 1190 1196 4
-- Name: ltxtq_rexec(ltxtquery, ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ltxtq_rexec(ltxtquery, ltree) RETURNS boolean
    AS '$libdir/ltree', 'ltxtq_rexec'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 550 (class 1255 OID 17268)
-- Dependencies: 4 1165 1165
-- Name: make_valid(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION make_valid(ean13) RETURNS ean13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 551 (class 1255 OID 17269)
-- Dependencies: 4 1168 1168
-- Name: make_valid(isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION make_valid(isbn13) RETURNS isbn13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 552 (class 1255 OID 17270)
-- Dependencies: 4 1171 1171
-- Name: make_valid(ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION make_valid(ismn13) RETURNS ismn13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 553 (class 1255 OID 17271)
-- Dependencies: 1174 1174 4
-- Name: make_valid(issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION make_valid(issn13) RETURNS issn13
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 554 (class 1255 OID 17272)
-- Dependencies: 1177 4 1177
-- Name: make_valid(isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION make_valid(isbn) RETURNS isbn
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 555 (class 1255 OID 17273)
-- Dependencies: 4 1180 1180
-- Name: make_valid(ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION make_valid(ismn) RETURNS ismn
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 556 (class 1255 OID 17274)
-- Dependencies: 4 1183 1183
-- Name: make_valid(issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION make_valid(issn) RETURNS issn
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 557 (class 1255 OID 17275)
-- Dependencies: 4 1186 1186
-- Name: make_valid(upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION make_valid(upc) RETURNS upc
    AS '$libdir/isn', 'make_valid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 227 (class 1255 OID 16671)
-- Dependencies: 4
-- Name: metaphone(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION metaphone(text, integer) RETURNS text
    AS '$libdir/fuzzystrmatch', 'metaphone'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 727 (class 1255 OID 17548)
-- Dependencies: 4
-- Name: moddatetime(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION moddatetime() RETURNS "trigger"
    AS '$libdir/moddatetime', 'moddatetime'
    LANGUAGE c;


--
-- TOC entry 144 (class 1255 OID 16562)
-- Dependencies: 1141 4
-- Name: ne(chkpass, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ne(chkpass, text) RETURNS boolean
    AS '$libdir/chkpass', 'chkpass_ne'
    LANGUAGE c STRICT;


--
-- TOC entry 584 (class 1255 OID 17311)
-- Dependencies: 4 1190
-- Name: nlevel(ltree); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nlevel(ltree) RETURNS integer
    AS '$libdir/ltree', 'nlevel'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 740 (class 1255 OID 17561)
-- Dependencies: 4
-- Name: normal_rand(integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION normal_rand(integer, double precision, double precision) RETURNS SETOF double precision
    AS '$libdir/tablefunc', 'normal_rand'
    LANGUAGE c STRICT;


--
-- TOC entry 848 (class 1255 OID 17823)
-- Dependencies: 4 1232
-- Name: numnode(tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numnode(tsquery) RETURNS integer
    AS '$libdir/tsearch2', 'tsquery_numnode'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 773 (class 1255 OID 17625)
-- Dependencies: 1224 4
-- Name: parse(oid, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION parse(oid, text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse'
    LANGUAGE c STRICT;


--
-- TOC entry 774 (class 1255 OID 17626)
-- Dependencies: 4 1224
-- Name: parse(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION parse(text, text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse_byname'
    LANGUAGE c STRICT;


--
-- TOC entry 775 (class 1255 OID 17627)
-- Dependencies: 4 1224
-- Name: parse(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION parse(text) RETURNS SETOF tokenout
    AS '$libdir/tsearch2', 'parse_current'
    LANGUAGE c STRICT;


--
-- TOC entry 640 (class 1255 OID 17419)
-- Dependencies: 4
-- Name: pg_buffercache_pages(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pg_buffercache_pages() RETURNS SETOF record
    AS '$libdir/pg_buffercache', 'pg_buffercache_pages'
    LANGUAGE c;


--
-- TOC entry 641 (class 1255 OID 17423)
-- Dependencies: 4
-- Name: pg_freespacemap_pages(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pg_freespacemap_pages() RETURNS SETOF record
    AS '$libdir/pg_freespacemap', 'pg_freespacemap_pages'
    LANGUAGE c;


--
-- TOC entry 642 (class 1255 OID 17424)
-- Dependencies: 4
-- Name: pg_freespacemap_relations(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pg_freespacemap_relations() RETURNS SETOF record
    AS '$libdir/pg_freespacemap', 'pg_freespacemap_relations'
    LANGUAGE c;


--
-- TOC entry 696 (class 1255 OID 17498)
-- Dependencies: 4
-- Name: pg_relpages(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pg_relpages(text) RETURNS integer
    AS '$libdir/pgstattuple', 'pg_relpages'
    LANGUAGE c STRICT;


--
-- TOC entry 687 (class 1255 OID 17479)
-- Dependencies: 4
-- Name: pgp_key_id(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_key_id(bytea) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_key_id_w'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 681 (class 1255 OID 17473)
-- Dependencies: 4
-- Name: pgp_pub_decrypt(bytea, bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_pub_decrypt(bytea, bytea) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 683 (class 1255 OID 17475)
-- Dependencies: 4
-- Name: pgp_pub_decrypt(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_pub_decrypt(bytea, bytea, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 685 (class 1255 OID 17477)
-- Dependencies: 4
-- Name: pgp_pub_decrypt(bytea, bytea, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_pub_decrypt(bytea, bytea, text, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 682 (class 1255 OID 17474)
-- Dependencies: 4
-- Name: pgp_pub_decrypt_bytea(bytea, bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_pub_decrypt_bytea(bytea, bytea) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 684 (class 1255 OID 17476)
-- Dependencies: 4
-- Name: pgp_pub_decrypt_bytea(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 686 (class 1255 OID 17478)
-- Dependencies: 4
-- Name: pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 677 (class 1255 OID 17469)
-- Dependencies: 4
-- Name: pgp_pub_encrypt(text, bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_pub_encrypt(text, bytea) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_text'
    LANGUAGE c STRICT;


--
-- TOC entry 679 (class 1255 OID 17471)
-- Dependencies: 4
-- Name: pgp_pub_encrypt(text, bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_pub_encrypt(text, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_text'
    LANGUAGE c STRICT;


--
-- TOC entry 678 (class 1255 OID 17470)
-- Dependencies: 4
-- Name: pgp_pub_encrypt_bytea(bytea, bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_pub_encrypt_bytea(bytea, bytea) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_bytea'
    LANGUAGE c STRICT;


--
-- TOC entry 680 (class 1255 OID 17472)
-- Dependencies: 4
-- Name: pgp_pub_encrypt_bytea(bytea, bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_pub_encrypt_bytea'
    LANGUAGE c STRICT;


--
-- TOC entry 673 (class 1255 OID 17465)
-- Dependencies: 4
-- Name: pgp_sym_decrypt(bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_sym_decrypt(bytea, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 675 (class 1255 OID 17467)
-- Dependencies: 4
-- Name: pgp_sym_decrypt(bytea, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_sym_decrypt(bytea, text, text) RETURNS text
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 674 (class 1255 OID 17466)
-- Dependencies: 4
-- Name: pgp_sym_decrypt_bytea(bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_sym_decrypt_bytea(bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 676 (class 1255 OID 17468)
-- Dependencies: 4
-- Name: pgp_sym_decrypt_bytea(bytea, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_sym_decrypt_bytea(bytea, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_decrypt_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 669 (class 1255 OID 17461)
-- Dependencies: 4
-- Name: pgp_sym_encrypt(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_sym_encrypt(text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_text'
    LANGUAGE c STRICT;


--
-- TOC entry 671 (class 1255 OID 17463)
-- Dependencies: 4
-- Name: pgp_sym_encrypt(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_sym_encrypt(text, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_text'
    LANGUAGE c STRICT;


--
-- TOC entry 670 (class 1255 OID 17462)
-- Dependencies: 4
-- Name: pgp_sym_encrypt_bytea(bytea, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_sym_encrypt_bytea(bytea, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_bytea'
    LANGUAGE c STRICT;


--
-- TOC entry 672 (class 1255 OID 17464)
-- Dependencies: 4
-- Name: pgp_sym_encrypt_bytea(bytea, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgp_sym_encrypt_bytea(bytea, text, text) RETURNS bytea
    AS '$libdir/pgcrypto', 'pgp_sym_encrypt_bytea'
    LANGUAGE c STRICT;


--
-- TOC entry 692 (class 1255 OID 17488)
-- Dependencies: 4 1209
-- Name: pgstatindex(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgstatindex(text) RETURNS pgstatindex_type
    AS '$libdir/pgstattuple', 'pgstatindex'
    LANGUAGE c STRICT;


--
-- TOC entry 690 (class 1255 OID 17484)
-- Dependencies: 4 1208
-- Name: pgstattuple(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgstattuple(text) RETURNS pgstattuple_type
    AS '$libdir/pgstattuple', 'pgstattuple'
    LANGUAGE c STRICT;


--
-- TOC entry 691 (class 1255 OID 17485)
-- Dependencies: 1208 4
-- Name: pgstattuple(oid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgstattuple(oid) RETURNS pgstattuple_type
    AS '$libdir/pgstattuple', 'pgstattuplebyid'
    LANGUAGE c STRICT;


--
-- TOC entry 799 (class 1255 OID 17751)
-- Dependencies: 4 1232
-- Name: plainto_tsquery(oid, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION plainto_tsquery(oid, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 800 (class 1255 OID 17752)
-- Dependencies: 1232 4
-- Name: plainto_tsquery(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION plainto_tsquery(text, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery_name'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 801 (class 1255 OID 17753)
-- Dependencies: 1232 4
-- Name: plainto_tsquery(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION plainto_tsquery(text) RETURNS tsquery
    AS '$libdir/tsearch2', 'plainto_tsquery_current'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 778 (class 1255 OID 17630)
-- Dependencies: 4
-- Name: prsd_end(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION prsd_end(internal) RETURNS void
    AS '$libdir/tsearch2', 'prsd_end'
    LANGUAGE c;


--
-- TOC entry 777 (class 1255 OID 17629)
-- Dependencies: 4
-- Name: prsd_getlexeme(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION prsd_getlexeme(internal, internal, internal) RETURNS integer
    AS '$libdir/tsearch2', 'prsd_getlexeme'
    LANGUAGE c;


--
-- TOC entry 780 (class 1255 OID 17632)
-- Dependencies: 4
-- Name: prsd_headline(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION prsd_headline(internal, internal, internal) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_headline'
    LANGUAGE c;


--
-- TOC entry 779 (class 1255 OID 17631)
-- Dependencies: 4
-- Name: prsd_lextype(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION prsd_lextype(internal) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_lextype'
    LANGUAGE c;


--
-- TOC entry 776 (class 1255 OID 17628)
-- Dependencies: 4
-- Name: prsd_start(internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION prsd_start(internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'prsd_start'
    LANGUAGE c;


--
-- TOC entry 264 (class 1255 OID 16725)
-- Dependencies: 4 1159
-- Name: querytree(query_int); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION querytree(query_int) RETURNS text
    AS '$libdir/_int', 'querytree'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 795 (class 1255 OID 17747)
-- Dependencies: 4 1232
-- Name: querytree(tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION querytree(tsquery) RETURNS text
    AS '$libdir/tsearch2', 'tsquerytree'
    LANGUAGE c STRICT;


--
-- TOC entry 805 (class 1255 OID 17759)
-- Dependencies: 1229 1232 4
-- Name: rank(real[], tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rank(real[], tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 806 (class 1255 OID 17760)
-- Dependencies: 4 1229 1232
-- Name: rank(real[], tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rank(real[], tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 807 (class 1255 OID 17761)
-- Dependencies: 4 1229 1232
-- Name: rank(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rank(tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_def'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 808 (class 1255 OID 17762)
-- Dependencies: 1229 1232 4
-- Name: rank(tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rank(tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_def'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 809 (class 1255 OID 17763)
-- Dependencies: 1229 1232 4
-- Name: rank_cd(real[], tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rank_cd(real[], tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 810 (class 1255 OID 17764)
-- Dependencies: 1229 4 1232
-- Name: rank_cd(real[], tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rank_cd(real[], tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 811 (class 1255 OID 17765)
-- Dependencies: 4 1232 1229
-- Name: rank_cd(tsvector, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rank_cd(tsvector, tsquery) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd_def'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 812 (class 1255 OID 17766)
-- Dependencies: 1232 1229 4
-- Name: rank_cd(tsvector, tsquery, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rank_cd(tsvector, tsquery, integer) RETURNS real
    AS '$libdir/tsearch2', 'rank_cd_def'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 142 (class 1255 OID 16560)
-- Dependencies: 4 1141
-- Name: raw(chkpass); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION raw(chkpass) RETURNS text
    AS '$libdir/chkpass', 'chkpass_rout'
    LANGUAGE c STRICT;


--
-- TOC entry 266 (class 1255 OID 16727)
-- Dependencies: 4 1159
-- Name: rboolop(query_int, integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rboolop(query_int, integer[]) RETURNS boolean
    AS '$libdir/_int', 'rboolop'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 266
-- Name: FUNCTION rboolop(query_int, integer[]); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION rboolop(query_int, integer[]) IS 'boolean operation with array';


--
-- TOC entry 830 (class 1255 OID 17789)
-- Dependencies: 4
-- Name: reset_tsearch(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION reset_tsearch() RETURNS void
    AS '$libdir/tsearch2', 'reset_tsearch'
    LANGUAGE c STRICT;


--
-- TOC entry 852 (class 1255 OID 17830)
-- Dependencies: 1232 4 1232
-- Name: rewrite(tsquery, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rewrite(tsquery, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_rewrite'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 853 (class 1255 OID 17831)
-- Dependencies: 1232 4 1232 1232 1232
-- Name: rewrite(tsquery, tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rewrite(tsquery, tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_rewrite_query'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 854 (class 1255 OID 17832)
-- Dependencies: 1232 4 1232 1234
-- Name: rewrite_accum(tsquery, tsquery[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rewrite_accum(tsquery, tsquery[]) RETURNS tsquery
    AS '$libdir/tsearch2', 'rewrite_accum'
    LANGUAGE c;


--
-- TOC entry 855 (class 1255 OID 17833)
-- Dependencies: 1232 4 1232
-- Name: rewrite_finish(tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rewrite_finish(tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'rewrite_finish'
    LANGUAGE c;


--
-- TOC entry 803 (class 1255 OID 17755)
-- Dependencies: 1229 4 1232
-- Name: rexectsq(tsquery, tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rexectsq(tsquery, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'rexectsq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 803
-- Name: FUNCTION rexectsq(tsquery, tsvector); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION rexectsq(tsquery, tsvector) IS 'boolean operation with text index';


--
-- TOC entry 218 (class 1255 OID 16661)
-- Dependencies: 4
-- Name: sec_to_gc(double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sec_to_gc(double precision) RETURNS double precision
    AS $_$SELECT CASE WHEN $1 < 0 THEN 0::float8 WHEN $1/(2*earth()) > 1 THEN pi()*earth() ELSE 2*earth()*asin($1/(2*earth())) END$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 712 (class 1255 OID 17516)
-- Dependencies: 4 1213 1213
-- Name: seg_cmp(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_cmp(seg, seg) RETURNS integer
    AS '$libdir/seg', 'seg_cmp'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 712
-- Name: FUNCTION seg_cmp(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_cmp(seg, seg) IS 'btree comparison function';


--
-- TOC entry 708 (class 1255 OID 17512)
-- Dependencies: 1213 4 1213
-- Name: seg_contained(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_contained(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 708
-- Name: FUNCTION seg_contained(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_contained(seg, seg) IS 'contained in';


--
-- TOC entry 707 (class 1255 OID 17511)
-- Dependencies: 1213 1213 4
-- Name: seg_contains(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_contains(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_contains'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 707
-- Name: FUNCTION seg_contains(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_contains(seg, seg) IS 'contains';


--
-- TOC entry 711 (class 1255 OID 17515)
-- Dependencies: 4 1213 1213
-- Name: seg_different(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_different(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_different'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 711
-- Name: FUNCTION seg_different(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_different(seg, seg) IS 'different';


--
-- TOC entry 706 (class 1255 OID 17510)
-- Dependencies: 1213 4 1213
-- Name: seg_ge(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_ge(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_ge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 706
-- Name: FUNCTION seg_ge(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_ge(seg, seg) IS 'greater than or equal';


--
-- TOC entry 705 (class 1255 OID 17509)
-- Dependencies: 1213 1213 4
-- Name: seg_gt(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_gt(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_gt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 705
-- Name: FUNCTION seg_gt(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_gt(seg, seg) IS 'greater than';


--
-- TOC entry 714 (class 1255 OID 17518)
-- Dependencies: 4 1213 1213 1213
-- Name: seg_inter(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_inter(seg, seg) RETURNS seg
    AS '$libdir/seg', 'seg_inter'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 704 (class 1255 OID 17508)
-- Dependencies: 1213 4 1213
-- Name: seg_le(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_le(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_le'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 704
-- Name: FUNCTION seg_le(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_le(seg, seg) IS 'less than or equal';


--
-- TOC entry 701 (class 1255 OID 17505)
-- Dependencies: 1213 4 1213
-- Name: seg_left(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_left(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_left'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 701
-- Name: FUNCTION seg_left(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_left(seg, seg) IS 'is left of';


--
-- TOC entry 717 (class 1255 OID 17521)
-- Dependencies: 4 1213
-- Name: seg_lower(seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_lower(seg) RETURNS real
    AS '$libdir/seg', 'seg_lower'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 703 (class 1255 OID 17507)
-- Dependencies: 1213 4 1213
-- Name: seg_lt(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_lt(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_lt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 703
-- Name: FUNCTION seg_lt(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_lt(seg, seg) IS 'less than';


--
-- TOC entry 699 (class 1255 OID 17503)
-- Dependencies: 4 1213 1213
-- Name: seg_over_left(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_over_left(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_over_left'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 699
-- Name: FUNCTION seg_over_left(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_over_left(seg, seg) IS 'overlaps or is left of';


--
-- TOC entry 700 (class 1255 OID 17504)
-- Dependencies: 1213 4 1213
-- Name: seg_over_right(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_over_right(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_over_right'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 700
-- Name: FUNCTION seg_over_right(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_over_right(seg, seg) IS 'overlaps or is right of';


--
-- TOC entry 709 (class 1255 OID 17513)
-- Dependencies: 1213 4 1213
-- Name: seg_overlap(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_overlap(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_overlap'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 709
-- Name: FUNCTION seg_overlap(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_overlap(seg, seg) IS 'overlaps';


--
-- TOC entry 702 (class 1255 OID 17506)
-- Dependencies: 4 1213 1213
-- Name: seg_right(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_right(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_right'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 702
-- Name: FUNCTION seg_right(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_right(seg, seg) IS 'is right of';


--
-- TOC entry 710 (class 1255 OID 17514)
-- Dependencies: 4 1213 1213
-- Name: seg_same(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_same(seg, seg) RETURNS boolean
    AS '$libdir/seg', 'seg_same'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 710
-- Name: FUNCTION seg_same(seg, seg); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION seg_same(seg, seg) IS 'same as';


--
-- TOC entry 715 (class 1255 OID 17519)
-- Dependencies: 1213 4
-- Name: seg_size(seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_size(seg) RETURNS real
    AS '$libdir/seg', 'seg_size'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 713 (class 1255 OID 17517)
-- Dependencies: 1213 4 1213 1213
-- Name: seg_union(seg, seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_union(seg, seg) RETURNS seg
    AS '$libdir/seg', 'seg_union'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 716 (class 1255 OID 17520)
-- Dependencies: 4 1213
-- Name: seg_upper(seg); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION seg_upper(seg) RETURNS real
    AS '$libdir/seg', 'seg_upper'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 781 (class 1255 OID 17648)
-- Dependencies: 4
-- Name: set_curcfg(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_curcfg(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curcfg'
    LANGUAGE c STRICT;


--
-- TOC entry 782 (class 1255 OID 17649)
-- Dependencies: 4
-- Name: set_curcfg(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_curcfg(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curcfg_byname'
    LANGUAGE c STRICT;


--
-- TOC entry 754 (class 1255 OID 17588)
-- Dependencies: 4
-- Name: set_curdict(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_curdict(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curdict'
    LANGUAGE c STRICT;


--
-- TOC entry 755 (class 1255 OID 17589)
-- Dependencies: 4
-- Name: set_curdict(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_curdict(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curdict_byname'
    LANGUAGE c STRICT;


--
-- TOC entry 771 (class 1255 OID 17621)
-- Dependencies: 4
-- Name: set_curprs(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_curprs(integer) RETURNS void
    AS '$libdir/tsearch2', 'set_curprs'
    LANGUAGE c STRICT;


--
-- TOC entry 772 (class 1255 OID 17622)
-- Dependencies: 4
-- Name: set_curprs(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_curprs(text) RETURNS void
    AS '$libdir/tsearch2', 'set_curprs_byname'
    LANGUAGE c STRICT;


--
-- TOC entry 643 (class 1255 OID 17431)
-- Dependencies: 4
-- Name: set_limit(real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_limit(real) RETURNS real
    AS '$libdir/pg_trgm', 'set_limit'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 731 (class 1255 OID 17552)
-- Dependencies: 4
-- Name: set_timetravel(name, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION set_timetravel(name, integer) RETURNS integer
    AS '$libdir/timetravel', 'set_timetravel'
    LANGUAGE c STRICT;


--
-- TOC entry 791 (class 1255 OID 17740)
-- Dependencies: 4 1229 1229
-- Name: setweight(tsvector, "char"); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setweight(tsvector, "char") RETURNS tsvector
    AS '$libdir/tsearch2', 'setweight'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 783 (class 1255 OID 17650)
-- Dependencies: 4
-- Name: show_curcfg(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION show_curcfg() RETURNS oid
    AS '$libdir/tsearch2', 'show_curcfg'
    LANGUAGE c STRICT;


--
-- TOC entry 644 (class 1255 OID 17432)
-- Dependencies: 4
-- Name: show_limit(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION show_limit() RETURNS real
    AS '$libdir/pg_trgm', 'show_limit'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 645 (class 1255 OID 17433)
-- Dependencies: 4
-- Name: show_trgm(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION show_trgm(text) RETURNS text[]
    AS '$libdir/pg_trgm', 'show_trgm'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 646 (class 1255 OID 17434)
-- Dependencies: 4
-- Name: similarity(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION similarity(text, text) RETURNS real
    AS '$libdir/pg_trgm', 'similarity'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 647 (class 1255 OID 17435)
-- Dependencies: 4
-- Name: similarity_op(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION similarity_op(text, text) RETURNS boolean
    AS '$libdir/pg_trgm', 'similarity_op'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 247 (class 1255 OID 16700)
-- Dependencies: 4 1152
-- Name: skeys(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION skeys(hstore) RETURNS SETOF text
    AS '$libdir/hstore', 'skeys'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 758 (class 1255 OID 17593)
-- Dependencies: 4
-- Name: snb_en_init(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snb_en_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_en_init'
    LANGUAGE c;


--
-- TOC entry 759 (class 1255 OID 17594)
-- Dependencies: 4
-- Name: snb_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snb_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'snb_lexize'
    LANGUAGE c STRICT;


--
-- TOC entry 760 (class 1255 OID 17596)
-- Dependencies: 4
-- Name: snb_ru_init_koi8(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snb_ru_init_koi8(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_ru_init_koi8'
    LANGUAGE c;


--
-- TOC entry 761 (class 1255 OID 17598)
-- Dependencies: 4
-- Name: snb_ru_init_utf8(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snb_ru_init_utf8(internal) RETURNS internal
    AS '$libdir/tsearch2', 'snb_ru_init_utf8'
    LANGUAGE c;


--
-- TOC entry 276 (class 1255 OID 16745)
-- Dependencies: 4
-- Name: sort(integer[], text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sort(integer[], text) RETURNS integer[]
    AS '$libdir/_int', 'sort'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 277 (class 1255 OID 16746)
-- Dependencies: 4
-- Name: sort(integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sort(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 278 (class 1255 OID 16747)
-- Dependencies: 4
-- Name: sort_asc(integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sort_asc(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort_asc'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 279 (class 1255 OID 16748)
-- Dependencies: 4
-- Name: sort_desc(integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sort_desc(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'sort_desc'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 228 (class 1255 OID 16672)
-- Dependencies: 4
-- Name: soundex(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION soundex(text) RETURNS text
    AS '$libdir/fuzzystrmatch', 'soundex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 762 (class 1255 OID 17600)
-- Dependencies: 4
-- Name: spell_init(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spell_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'spell_init'
    LANGUAGE c;


--
-- TOC entry 763 (class 1255 OID 17601)
-- Dependencies: 4
-- Name: spell_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spell_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'spell_lexize'
    LANGUAGE c STRICT;


--
-- TOC entry 735 (class 1255 OID 17556)
-- Dependencies: 4
-- Name: ssl_client_cert_present(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ssl_client_cert_present() RETURNS boolean
    AS '$libdir/sslinfo', 'ssl_client_cert_present'
    LANGUAGE c STRICT;


--
-- TOC entry 738 (class 1255 OID 17559)
-- Dependencies: 4
-- Name: ssl_client_dn(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ssl_client_dn() RETURNS text
    AS '$libdir/sslinfo', 'ssl_client_dn'
    LANGUAGE c STRICT;


--
-- TOC entry 736 (class 1255 OID 17557)
-- Dependencies: 4
-- Name: ssl_client_dn_field(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ssl_client_dn_field(text) RETURNS text
    AS '$libdir/sslinfo', 'ssl_client_dn_field'
    LANGUAGE c STRICT;


--
-- TOC entry 733 (class 1255 OID 17554)
-- Dependencies: 4
-- Name: ssl_client_serial(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ssl_client_serial() RETURNS numeric
    AS '$libdir/sslinfo', 'ssl_client_serial'
    LANGUAGE c STRICT;


--
-- TOC entry 734 (class 1255 OID 17555)
-- Dependencies: 4
-- Name: ssl_is_used(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ssl_is_used() RETURNS boolean
    AS '$libdir/sslinfo', 'ssl_is_used'
    LANGUAGE c STRICT;


--
-- TOC entry 739 (class 1255 OID 17560)
-- Dependencies: 4
-- Name: ssl_issuer_dn(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ssl_issuer_dn() RETURNS text
    AS '$libdir/sslinfo', 'ssl_issuer_dn'
    LANGUAGE c STRICT;


--
-- TOC entry 737 (class 1255 OID 17558)
-- Dependencies: 4
-- Name: ssl_issuer_field(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ssl_issuer_field(text) RETURNS text
    AS '$libdir/sslinfo', 'ssl_issuer_field'
    LANGUAGE c STRICT;


--
-- TOC entry 828 (class 1255 OID 17787)
-- Dependencies: 4 1238
-- Name: stat(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION stat(text) RETURNS SETOF statinfo
    AS '$libdir/tsearch2', 'ts_stat'
    LANGUAGE c STRICT;


--
-- TOC entry 829 (class 1255 OID 17788)
-- Dependencies: 4 1238
-- Name: stat(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION stat(text, text) RETURNS SETOF statinfo
    AS '$libdir/tsearch2', 'ts_stat'
    LANGUAGE c STRICT;


--
-- TOC entry 790 (class 1255 OID 17739)
-- Dependencies: 1229 4 1229
-- Name: strip(tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION strip(tsvector) RETURNS tsvector
    AS '$libdir/tsearch2', 'strip'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 282 (class 1255 OID 16752)
-- Dependencies: 4
-- Name: subarray(integer[], integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION subarray(integer[], integer, integer) RETURNS integer[]
    AS '$libdir/_int', 'subarray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 283 (class 1255 OID 16753)
-- Dependencies: 4
-- Name: subarray(integer[], integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION subarray(integer[], integer) RETURNS integer[]
    AS '$libdir/_int', 'subarray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 579 (class 1255 OID 17306)
-- Dependencies: 4 1190 1190
-- Name: subltree(ltree, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION subltree(ltree, integer, integer) RETURNS ltree
    AS '$libdir/ltree', 'subltree'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 580 (class 1255 OID 17307)
-- Dependencies: 1190 4 1190
-- Name: subpath(ltree, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION subpath(ltree, integer, integer) RETURNS ltree
    AS '$libdir/ltree', 'subpath'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 581 (class 1255 OID 17308)
-- Dependencies: 4 1190 1190
-- Name: subpath(ltree, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION subpath(ltree, integer) RETURNS ltree
    AS '$libdir/ltree', 'subpath'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 248 (class 1255 OID 16701)
-- Dependencies: 4 1152
-- Name: svals(hstore); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION svals(hstore) RETURNS SETOF text
    AS '$libdir/hstore', 'svals'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 764 (class 1255 OID 17603)
-- Dependencies: 4
-- Name: syn_init(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION syn_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'syn_init'
    LANGUAGE c;


--
-- TOC entry 765 (class 1255 OID 17604)
-- Dependencies: 4
-- Name: syn_lexize(internal, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION syn_lexize(internal, internal, integer) RETURNS internal
    AS '$libdir/tsearch2', 'syn_lexize'
    LANGUAGE c STRICT;


--
-- TOC entry 244 (class 1255 OID 16696)
-- Dependencies: 4 1152
-- Name: tconvert(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tconvert(text, text) RETURNS hstore
    AS '$libdir/hstore', 'tconvert'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 542 (class 1255 OID 17224)
-- Dependencies: 1165 4
-- Name: text(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(ean13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 543 (class 1255 OID 17225)
-- Dependencies: 4 1168
-- Name: text(isbn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(isbn13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 544 (class 1255 OID 17226)
-- Dependencies: 4 1171
-- Name: text(ismn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(ismn13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 545 (class 1255 OID 17227)
-- Dependencies: 4 1174
-- Name: text(issn13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(issn13) RETURNS text
    AS '$libdir/isn', 'ean13_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 546 (class 1255 OID 17228)
-- Dependencies: 4 1177
-- Name: text(isbn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(isbn) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 547 (class 1255 OID 17229)
-- Dependencies: 4 1180
-- Name: text(ismn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(ismn) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 548 (class 1255 OID 17230)
-- Dependencies: 4 1183
-- Name: text(issn); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(issn) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 549 (class 1255 OID 17231)
-- Dependencies: 4 1186
-- Name: text(upc); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(upc) RETURNS text
    AS '$libdir/isn', 'isn_cast_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 586 (class 1255 OID 17313)
-- Dependencies: 4 1190
-- Name: text2ltree(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text2ltree(text) RETURNS ltree
    AS '$libdir/ltree', 'text2ltree'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 229 (class 1255 OID 16673)
-- Dependencies: 4
-- Name: text_soundex(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text_soundex(text) RETURNS text
    AS '$libdir/fuzzystrmatch', 'soundex'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 766 (class 1255 OID 17606)
-- Dependencies: 4
-- Name: thesaurus_init(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION thesaurus_init(internal) RETURNS internal
    AS '$libdir/tsearch2', 'thesaurus_init'
    LANGUAGE c;


--
-- TOC entry 767 (class 1255 OID 17607)
-- Dependencies: 4
-- Name: thesaurus_lexize(internal, internal, integer, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION thesaurus_lexize(internal, internal, integer, internal) RETURNS internal
    AS '$libdir/tsearch2', 'thesaurus_lexize'
    LANGUAGE c STRICT;


--
-- TOC entry 730 (class 1255 OID 17551)
-- Dependencies: 4
-- Name: timetravel(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION timetravel() RETURNS "trigger"
    AS '$libdir/timetravel', 'timetravel'
    LANGUAGE c;


--
-- TOC entry 796 (class 1255 OID 17748)
-- Dependencies: 4 1232
-- Name: to_tsquery(oid, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION to_tsquery(oid, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 797 (class 1255 OID 17749)
-- Dependencies: 1232 4
-- Name: to_tsquery(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION to_tsquery(text, text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery_name'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 798 (class 1255 OID 17750)
-- Dependencies: 4 1232
-- Name: to_tsquery(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION to_tsquery(text) RETURNS tsquery
    AS '$libdir/tsearch2', 'to_tsquery_current'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 787 (class 1255 OID 17736)
-- Dependencies: 1229 4
-- Name: to_tsvector(oid, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION to_tsvector(oid, text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 788 (class 1255 OID 17737)
-- Dependencies: 1229 4
-- Name: to_tsvector(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION to_tsvector(text, text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector_name'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 789 (class 1255 OID 17738)
-- Dependencies: 1229 4
-- Name: to_tsvector(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION to_tsvector(text) RETURNS tsvector
    AS '$libdir/tsearch2', 'to_tsvector_current'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 768 (class 1255 OID 17618)
-- Dependencies: 1223 4
-- Name: token_type(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION token_type(integer) RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type'
    LANGUAGE c STRICT;


--
-- TOC entry 769 (class 1255 OID 17619)
-- Dependencies: 1223 4
-- Name: token_type(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION token_type(text) RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type_byname'
    LANGUAGE c STRICT;


--
-- TOC entry 770 (class 1255 OID 17620)
-- Dependencies: 1223 4
-- Name: token_type(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION token_type() RETURNS SETOF tokentype
    AS '$libdir/tsearch2', 'token_type_current'
    LANGUAGE c STRICT;


--
-- TOC entry 833 (class 1255 OID 17794)
-- Dependencies: 4 1239
-- Name: ts_debug(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ts_debug(text) RETURNS SETOF tsdebug
    AS $_$
select 
        m.ts_name,
        t.alias as tok_type,
        t.descr as description,
        p.token,
        m.dict_name,
        strip(to_tsvector(p.token)) as tsvector
from
        parse( _get_parser_from_curcfg(), $1 ) as p,
        token_type() as t,
        pg_ts_cfgmap as m,
        pg_ts_cfg as c
where
        t.tokid=p.tokid and
        t.alias = m.tok_alias and 
        m.ts_name=c.ts_name and 
        c.oid=show_curcfg() 
$_$
    LANGUAGE sql STRICT;


--
-- TOC entry 804 (class 1255 OID 17758)
-- Dependencies: 4
-- Name: tsearch2(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsearch2() RETURNS "trigger"
    AS '$libdir/tsearch2', 'tsearch2'
    LANGUAGE c;


--
-- TOC entry 857 (class 1255 OID 17836)
-- Dependencies: 4 1232 1232
-- Name: tsq_mcontained(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsq_mcontained(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsq_mcontained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 856 (class 1255 OID 17835)
-- Dependencies: 4 1232 1232
-- Name: tsq_mcontains(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsq_mcontains(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsq_mcontains'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 849 (class 1255 OID 17824)
-- Dependencies: 1232 4 1232 1232
-- Name: tsquery_and(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_and(tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_and'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 841 (class 1255 OID 17809)
-- Dependencies: 1232 1232 4
-- Name: tsquery_cmp(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_cmp(tsquery, tsquery) RETURNS integer
    AS '$libdir/tsearch2', 'tsquery_cmp'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 844 (class 1255 OID 17812)
-- Dependencies: 1232 4 1232
-- Name: tsquery_eq(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_eq(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_eq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 845 (class 1255 OID 17813)
-- Dependencies: 1232 4 1232
-- Name: tsquery_ge(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_ge(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_ge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 846 (class 1255 OID 17814)
-- Dependencies: 1232 4 1232
-- Name: tsquery_gt(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_gt(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_gt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 843 (class 1255 OID 17811)
-- Dependencies: 4 1232 1232
-- Name: tsquery_le(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_le(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_le'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 842 (class 1255 OID 17810)
-- Dependencies: 4 1232 1232
-- Name: tsquery_lt(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_lt(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_lt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 847 (class 1255 OID 17815)
-- Dependencies: 1232 4 1232
-- Name: tsquery_ne(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_ne(tsquery, tsquery) RETURNS boolean
    AS '$libdir/tsearch2', 'tsquery_ne'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 851 (class 1255 OID 17828)
-- Dependencies: 4 1232 1232
-- Name: tsquery_not(tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_not(tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_not'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 850 (class 1255 OID 17826)
-- Dependencies: 1232 4 1232 1232
-- Name: tsquery_or(tsquery, tsquery); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsquery_or(tsquery, tsquery) RETURNS tsquery
    AS '$libdir/tsearch2', 'tsquery_or'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 834 (class 1255 OID 17795)
-- Dependencies: 4 1229 1229
-- Name: tsvector_cmp(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsvector_cmp(tsvector, tsvector) RETURNS integer
    AS '$libdir/tsearch2', 'tsvector_cmp'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 837 (class 1255 OID 17798)
-- Dependencies: 1229 4 1229
-- Name: tsvector_eq(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsvector_eq(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_eq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 838 (class 1255 OID 17799)
-- Dependencies: 1229 1229 4
-- Name: tsvector_ge(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsvector_ge(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_ge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 839 (class 1255 OID 17800)
-- Dependencies: 1229 1229 4
-- Name: tsvector_gt(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsvector_gt(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_gt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 836 (class 1255 OID 17797)
-- Dependencies: 1229 1229 4
-- Name: tsvector_le(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsvector_le(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_le'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 835 (class 1255 OID 17796)
-- Dependencies: 1229 4 1229
-- Name: tsvector_lt(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsvector_lt(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_lt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 840 (class 1255 OID 17801)
-- Dependencies: 1229 1229 4
-- Name: tsvector_ne(tsvector, tsvector); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION tsvector_ne(tsvector, tsvector) RETURNS boolean
    AS '$libdir/tsearch2', 'tsvector_ne'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 280 (class 1255 OID 16749)
-- Dependencies: 4
-- Name: uniq(integer[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION uniq(integer[]) RETURNS integer[]
    AS '$libdir/_int', 'uniq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 533 (class 1255 OID 17215)
-- Dependencies: 4 1186 1165
-- Name: upc(ean13); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION upc(ean13) RETURNS upc
    AS '$libdir/isn', 'upc_cast_from_ean13'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 541 (class 1255 OID 17223)
-- Dependencies: 1186 4
-- Name: upc(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION upc(text) RETURNS upc
    AS '$libdir/isn', 'upc_cast_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 872 (class 1255 OID 17861)
-- Dependencies: 4
-- Name: xml_encode_special_chars(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xml_encode_special_chars(text) RETURNS text
    AS '$libdir/pgxml', 'xml_encode_special_chars'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 870 (class 1255 OID 17859)
-- Dependencies: 4
-- Name: xml_is_well_formed(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xml_is_well_formed(text) RETURNS boolean
    AS '$libdir/pgxml', 'xml_is_well_formed'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 871 (class 1255 OID 17860)
-- Dependencies: 4
-- Name: xml_valid(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xml_valid(text) RETURNS boolean
    AS '$libdir/pgxml', 'xml_is_well_formed'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 876 (class 1255 OID 17865)
-- Dependencies: 4
-- Name: xpath_bool(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xpath_bool(text, text) RETURNS boolean
    AS '$libdir/pgxml', 'xpath_bool'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 877 (class 1255 OID 17866)
-- Dependencies: 4
-- Name: xpath_list(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xpath_list(text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_list'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 878 (class 1255 OID 17867)
-- Dependencies: 4
-- Name: xpath_list(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xpath_list(text, text) RETURNS text
    AS $_$SELECT xpath_list($1,$2,',')$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 874 (class 1255 OID 17863)
-- Dependencies: 4
-- Name: xpath_nodeset(text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xpath_nodeset(text, text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_nodeset'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 879 (class 1255 OID 17868)
-- Dependencies: 4
-- Name: xpath_nodeset(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xpath_nodeset(text, text) RETURNS text
    AS $_$SELECT xpath_nodeset($1,$2,'','')$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 880 (class 1255 OID 17869)
-- Dependencies: 4
-- Name: xpath_nodeset(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xpath_nodeset(text, text, text) RETURNS text
    AS $_$SELECT xpath_nodeset($1,$2,'',$3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- TOC entry 875 (class 1255 OID 17864)
-- Dependencies: 4
-- Name: xpath_number(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xpath_number(text, text) RETURNS real
    AS '$libdir/pgxml', 'xpath_number'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 873 (class 1255 OID 17862)
-- Dependencies: 4
-- Name: xpath_string(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xpath_string(text, text) RETURNS text
    AS '$libdir/pgxml', 'xpath_string'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 881 (class 1255 OID 17870)
-- Dependencies: 4
-- Name: xpath_table(text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xpath_table(text, text, text, text, text) RETURNS SETOF record
    AS '$libdir/pgxml', 'xpath_table'
    LANGUAGE c STABLE STRICT;


--
-- TOC entry 882 (class 1255 OID 17871)
-- Dependencies: 4
-- Name: xslt_process(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xslt_process(text, text, text) RETURNS text
    AS '$libdir/pgxml', 'xslt_process'
    LANGUAGE c STRICT;


--
-- TOC entry 883 (class 1255 OID 17872)
-- Dependencies: 4
-- Name: xslt_process(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xslt_process(text, text) RETURNS text
    AS '$libdir/pgxml', 'xslt_process'
    LANGUAGE c IMMUTABLE STRICT;


--
-- TOC entry 1253 (class 1255 OID 16719)
-- Dependencies: 4 259 260
-- Name: int_array_aggregate(integer); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE int_array_aggregate(integer) (
    SFUNC = int_agg_state,
    STYPE = integer[],
    FINALFUNC = int_agg_final_array
);


--
-- TOC entry 1254 (class 1255 OID 17834)
-- Dependencies: 855 4 1232 1234 854
-- Name: rewrite(tsquery[]); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE rewrite(tsquery[]) (
    SFUNC = rewrite_accum,
    STYPE = tsquery,
    FINALFUNC = rewrite_finish
);


--
-- TOC entry 2209 (class 2617 OID 17829)
-- Dependencies: 851 1232 1232 4
-- Name: !!; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR !! (
    PROCEDURE = tsquery_not,
    RIGHTARG = tsquery
);


--
-- TOC entry 1950 (class 2617 OID 16744)
-- Dependencies: 275 4
-- Name: #; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR # (
    PROCEDURE = icount,
    RIGHTARG = integer[]
);


--
-- TOC entry 1951 (class 2617 OID 16751)
-- Dependencies: 281 4
-- Name: #; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR # (
    PROCEDURE = idx,
    LEFTARG = integer[],
    RIGHTARG = integer
);


--
-- TOC entry 2176 (class 2617 OID 17436)
-- Dependencies: 4 647
-- Name: %; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR % (
    PROCEDURE = similarity_op,
    LEFTARG = text,
    RIGHTARG = text,
    COMMUTATOR = %,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1958 (class 2617 OID 16765)
-- Dependencies: 4 273
-- Name: &; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR & (
    PROCEDURE = _int_inter,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = &
);


--
-- TOC entry 1928 (class 2617 OID 16602)
-- Dependencies: 1144 159 4 1144
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
    PROCEDURE = cube_overlap,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = &&,
    RESTRICT = areasel,
    JOIN = areajoinsel
);


--
-- TOC entry 1945 (class 2617 OID 16737)
-- Dependencies: 4 269
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
    PROCEDURE = _int_overlap,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = &&,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2183 (class 2617 OID 17529)
-- Dependencies: 4 709 1213 1213
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
    PROCEDURE = seg_overlap,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = &&,
    RESTRICT = areasel,
    JOIN = areajoinsel
);


--
-- TOC entry 2207 (class 2617 OID 17825)
-- Dependencies: 1232 1232 1232 849 4
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
    PROCEDURE = tsquery_and,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = &&,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2182 (class 2617 OID 17528)
-- Dependencies: 1213 4 1213 699
-- Name: &<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &< (
    PROCEDURE = seg_over_left,
    LEFTARG = seg,
    RIGHTARG = seg,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 2184 (class 2617 OID 17530)
-- Dependencies: 700 1213 1213 4
-- Name: &>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &> (
    PROCEDURE = seg_over_right,
    LEFTARG = seg,
    RIGHTARG = seg,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 1952 (class 2617 OID 16755)
-- Dependencies: 284 4
-- Name: +; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR + (
    PROCEDURE = intarray_push_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


--
-- TOC entry 1953 (class 2617 OID 16757)
-- Dependencies: 4 285
-- Name: +; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR + (
    PROCEDURE = intarray_push_array,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = +
);


--
-- TOC entry 1954 (class 2617 OID 16759)
-- Dependencies: 4 286
-- Name: -; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR - (
    PROCEDURE = intarray_del_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


--
-- TOC entry 1957 (class 2617 OID 16764)
-- Dependencies: 4 288
-- Name: -; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR - (
    PROCEDURE = intset_subtract,
    LEFTARG = integer[],
    RIGHTARG = integer[]
);


--
-- TOC entry 1936 (class 2617 OID 16682)
-- Dependencies: 4 1152 235
-- Name: ->; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR -> (
    PROCEDURE = fetchval,
    LEFTARG = hstore,
    RIGHTARG = text
);


--
-- TOC entry 1924 (class 2617 OID 16600)
-- Dependencies: 1144 4 152 1144
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = cube_lt,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1959 (class 2617 OID 16991)
-- Dependencies: 1165 1165 323 4
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1965 (class 2617 OID 16997)
-- Dependencies: 1168 4 329 1165
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1971 (class 2617 OID 17005)
-- Dependencies: 1168 383 1165 4
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1977 (class 2617 OID 17009)
-- Dependencies: 4 335 1171 1165
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1983 (class 2617 OID 17017)
-- Dependencies: 4 419 1165 1171
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1989 (class 2617 OID 17021)
-- Dependencies: 4 1165 1174 341
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2091 (class 2617 OID 17029)
-- Dependencies: 4 455 1165 1174
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1995 (class 2617 OID 17033)
-- Dependencies: 4 347 1177 1165
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2043 (class 2617 OID 17041)
-- Dependencies: 4 401 1165 1177
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2001 (class 2617 OID 17045)
-- Dependencies: 4 353 1180 1165
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2073 (class 2617 OID 17053)
-- Dependencies: 4 1180 1165 437
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2007 (class 2617 OID 17057)
-- Dependencies: 359 1183 1165 4
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2109 (class 2617 OID 17065)
-- Dependencies: 1183 473 1165 4
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2013 (class 2617 OID 17069)
-- Dependencies: 1186 1165 4 365
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2121 (class 2617 OID 17077)
-- Dependencies: 1165 1186 4 485
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2019 (class 2617 OID 17081)
-- Dependencies: 1168 1168 371 4
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2025 (class 2617 OID 17087)
-- Dependencies: 1177 4 377 1168
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2037 (class 2617 OID 17095)
-- Dependencies: 4 1168 395 1177
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2031 (class 2617 OID 17099)
-- Dependencies: 1177 4 389 1177
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2049 (class 2617 OID 17105)
-- Dependencies: 1171 407 1171 4
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2055 (class 2617 OID 17111)
-- Dependencies: 413 1171 4 1180
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2067 (class 2617 OID 17119)
-- Dependencies: 1180 1171 431 4
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2061 (class 2617 OID 17123)
-- Dependencies: 1180 1180 425 4
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2079 (class 2617 OID 17129)
-- Dependencies: 443 4 1174 1174
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2085 (class 2617 OID 17135)
-- Dependencies: 1174 4 449 1183
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2103 (class 2617 OID 17143)
-- Dependencies: 4 467 1174 1183
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2097 (class 2617 OID 17147)
-- Dependencies: 461 4 1183 1183
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2115 (class 2617 OID 17153)
-- Dependencies: 4 479 1186 1186
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = isnlt,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2127 (class 2617 OID 17302)
-- Dependencies: 4 573 1190 1190
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = ltree_lt,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2177 (class 2617 OID 17524)
-- Dependencies: 4 703 1213 1213
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = seg_lt,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2195 (class 2617 OID 17804)
-- Dependencies: 835 1229 4 1229
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = tsvector_lt,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2201 (class 2617 OID 17818)
-- Dependencies: 4 1232 842 1232
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = tsquery_lt,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2181 (class 2617 OID 17527)
-- Dependencies: 1213 701 1213 4
-- Name: <<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR << (
    PROCEDURE = seg_left,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 1926 (class 2617 OID 16601)
-- Dependencies: 1144 154 4 1144
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = cube_le,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1960 (class 2617 OID 16992)
-- Dependencies: 324 1165 4 1165
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1966 (class 2617 OID 17000)
-- Dependencies: 4 330 1168 1165
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1972 (class 2617 OID 17004)
-- Dependencies: 4 1165 1168 384
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1978 (class 2617 OID 17012)
-- Dependencies: 336 4 1165 1171
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1984 (class 2617 OID 17016)
-- Dependencies: 1165 4 1171 420
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1990 (class 2617 OID 17024)
-- Dependencies: 4 342 1174 1165
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2092 (class 2617 OID 17028)
-- Dependencies: 1165 456 1174 4
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 1996 (class 2617 OID 17036)
-- Dependencies: 1177 4 1165 348
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2044 (class 2617 OID 17040)
-- Dependencies: 4 402 1165 1177
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2002 (class 2617 OID 17048)
-- Dependencies: 4 354 1180 1165
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2074 (class 2617 OID 17052)
-- Dependencies: 4 1180 1165 438
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2008 (class 2617 OID 17060)
-- Dependencies: 360 1183 1165 4
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2110 (class 2617 OID 17064)
-- Dependencies: 474 1165 4 1183
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2014 (class 2617 OID 17072)
-- Dependencies: 1165 4 366 1186
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2122 (class 2617 OID 17076)
-- Dependencies: 486 4 1186 1165
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2020 (class 2617 OID 17082)
-- Dependencies: 4 372 1168 1168
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2026 (class 2617 OID 17090)
-- Dependencies: 1177 4 1168 378
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2038 (class 2617 OID 17094)
-- Dependencies: 1177 4 396 1168
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2032 (class 2617 OID 17100)
-- Dependencies: 390 4 1177 1177
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2050 (class 2617 OID 17106)
-- Dependencies: 1171 408 4 1171
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2056 (class 2617 OID 17114)
-- Dependencies: 1171 1180 4 414
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2068 (class 2617 OID 17118)
-- Dependencies: 1171 4 1180 432
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2062 (class 2617 OID 17124)
-- Dependencies: 4 1180 1180 426
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2080 (class 2617 OID 17130)
-- Dependencies: 4 444 1174 1174
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2086 (class 2617 OID 17138)
-- Dependencies: 4 1174 1183 450
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2104 (class 2617 OID 17142)
-- Dependencies: 1183 468 1174 4
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2098 (class 2617 OID 17148)
-- Dependencies: 1183 4 462 1183
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2116 (class 2617 OID 17154)
-- Dependencies: 480 1186 1186 4
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = isnle,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2128 (class 2617 OID 17303)
-- Dependencies: 574 1190 1190 4
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = ltree_le,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2178 (class 2617 OID 17525)
-- Dependencies: 704 4 1213 1213
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = seg_le,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = scalarltsel,
    JOIN = scalarltjoinsel
);


--
-- TOC entry 2196 (class 2617 OID 17805)
-- Dependencies: 836 4 1229 1229
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = tsvector_le,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2202 (class 2617 OID 17819)
-- Dependencies: 4 843 1232 1232
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = tsquery_le,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1922 (class 2617 OID 16565)
-- Dependencies: 144 1141 4
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = ne,
    LEFTARG = chkpass,
    RIGHTARG = text,
    NEGATOR = =
);


--
-- TOC entry 1930 (class 2617 OID 16603)
-- Dependencies: 1144 4 1144 151
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = cube_ne,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 1964 (class 2617 OID 16993)
-- Dependencies: 4 1165 1165 328
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 1970 (class 2617 OID 17002)
-- Dependencies: 4 334 1168 1165
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 1976 (class 2617 OID 17006)
-- Dependencies: 388 4 1168 1165
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 1982 (class 2617 OID 17014)
-- Dependencies: 1171 4 1165 340
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 1988 (class 2617 OID 17018)
-- Dependencies: 4 424 1165 1171
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 1994 (class 2617 OID 17026)
-- Dependencies: 1165 4 346 1174
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2096 (class 2617 OID 17030)
-- Dependencies: 4 460 1165 1174
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2000 (class 2617 OID 17038)
-- Dependencies: 1165 352 4 1177
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2048 (class 2617 OID 17042)
-- Dependencies: 406 1165 1177 4
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2006 (class 2617 OID 17050)
-- Dependencies: 4 358 1180 1165
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2078 (class 2617 OID 17054)
-- Dependencies: 4 442 1165 1180
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2012 (class 2617 OID 17062)
-- Dependencies: 364 1183 4 1165
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2114 (class 2617 OID 17066)
-- Dependencies: 478 4 1165 1183
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2018 (class 2617 OID 17074)
-- Dependencies: 1186 4 370 1165
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2126 (class 2617 OID 17078)
-- Dependencies: 1186 4 1165 490
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2024 (class 2617 OID 17083)
-- Dependencies: 1168 4 1168 376
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2030 (class 2617 OID 17092)
-- Dependencies: 4 1168 1177 382
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2042 (class 2617 OID 17096)
-- Dependencies: 400 4 1177 1168
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2036 (class 2617 OID 17101)
-- Dependencies: 1177 1177 394 4
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2054 (class 2617 OID 17107)
-- Dependencies: 1171 412 1171 4
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2060 (class 2617 OID 17116)
-- Dependencies: 1171 418 1180 4
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2072 (class 2617 OID 17120)
-- Dependencies: 1171 436 1180 4
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2066 (class 2617 OID 17125)
-- Dependencies: 1180 4 430 1180
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2084 (class 2617 OID 17131)
-- Dependencies: 1174 4 448 1174
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2090 (class 2617 OID 17140)
-- Dependencies: 1174 4 454 1183
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2108 (class 2617 OID 17144)
-- Dependencies: 4 1183 1174 472
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2102 (class 2617 OID 17149)
-- Dependencies: 4 466 1183 1183
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2120 (class 2617 OID 17155)
-- Dependencies: 1186 4 1186 484
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = isnne,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2132 (class 2617 OID 17304)
-- Dependencies: 4 578 1190 1190
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = ltree_ne,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2187 (class 2617 OID 17531)
-- Dependencies: 4 1213 1213 711
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = seg_different,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2200 (class 2617 OID 17806)
-- Dependencies: 1229 1229 4 840
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = tsvector_ne,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 2206 (class 2617 OID 17820)
-- Dependencies: 4 847 1232 1232
-- Name: <>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <> (
    PROCEDURE = tsquery_ne,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <>,
    NEGATOR = =,
    RESTRICT = neqsel,
    JOIN = neqjoinsel
);


--
-- TOC entry 1932 (class 2617 OID 16605)
-- Dependencies: 158 4 1144 1144
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = cube_contained,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1939 (class 2617 OID 16692)
-- Dependencies: 4 1152 243 1152
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = hs_contained,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1947 (class 2617 OID 16738)
-- Dependencies: 268 4
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = _int_contained,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2135 (class 2617 OID 17328)
-- Dependencies: 596 1190 600 4 1190
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = ltree_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = @>,
    RESTRICT = ltreeparentsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2153 (class 2617 OID 17384)
-- Dependencies: 1190 1192 621 4
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = _ltree_r_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2154 (class 2617 OID 17387)
-- Dependencies: 1192 622 4 1190
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = _ltree_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2189 (class 2617 OID 17533)
-- Dependencies: 708 4 1213 1213
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = seg_contained,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2211 (class 2617 OID 17837)
-- Dependencies: 1232 1232 857 4
-- Name: <@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@ (
    PROCEDURE = tsq_mcontained,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = @>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1935 (class 2617 OID 16669)
-- Dependencies: 4 225
-- Name: <@>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <@> (
    PROCEDURE = geo_distance,
    LEFTARG = point,
    RIGHTARG = point,
    COMMUTATOR = <@>
);


--
-- TOC entry 1923 (class 2617 OID 16564)
-- Dependencies: 143 1141 4
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = eq,
    LEFTARG = chkpass,
    RIGHTARG = text,
    COMMUTATOR = =,
    NEGATOR = <>
);


--
-- TOC entry 1929 (class 2617 OID 16604)
-- Dependencies: 150 1144 1144 4
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = cube_eq,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


--
-- TOC entry 1961 (class 2617 OID 16994)
-- Dependencies: 4 1165 1165 325
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 1973 (class 2617 OID 17001)
-- Dependencies: 385 1165 1168 4
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 1967 (class 2617 OID 17003)
-- Dependencies: 331 1168 1165 4
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 1985 (class 2617 OID 17013)
-- Dependencies: 1171 4 421 1165
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 1979 (class 2617 OID 17015)
-- Dependencies: 337 4 1171 1165
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2093 (class 2617 OID 17025)
-- Dependencies: 4 1174 457 1165
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 1991 (class 2617 OID 17027)
-- Dependencies: 343 1165 1174 4
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2045 (class 2617 OID 17037)
-- Dependencies: 1177 4 1165 403
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 1997 (class 2617 OID 17039)
-- Dependencies: 349 4 1165 1177
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2075 (class 2617 OID 17049)
-- Dependencies: 1180 439 1165 4
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2003 (class 2617 OID 17051)
-- Dependencies: 4 355 1180 1165
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2111 (class 2617 OID 17061)
-- Dependencies: 475 1165 1183 4
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2009 (class 2617 OID 17063)
-- Dependencies: 361 4 1165 1183
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2123 (class 2617 OID 17073)
-- Dependencies: 4 1186 1165 487
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2015 (class 2617 OID 17075)
-- Dependencies: 1186 4 1165 367
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2021 (class 2617 OID 17084)
-- Dependencies: 373 4 1168 1168
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2039 (class 2617 OID 17091)
-- Dependencies: 4 1168 397 1177
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2027 (class 2617 OID 17093)
-- Dependencies: 1177 1168 4 379
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2033 (class 2617 OID 17102)
-- Dependencies: 1177 4 391 1177
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2051 (class 2617 OID 17108)
-- Dependencies: 4 409 1171 1171
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2069 (class 2617 OID 17115)
-- Dependencies: 433 1171 1180 4
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2057 (class 2617 OID 17117)
-- Dependencies: 415 1171 1180 4
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2063 (class 2617 OID 17126)
-- Dependencies: 1180 4 1180 427
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2081 (class 2617 OID 17132)
-- Dependencies: 1174 4 1174 445
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2105 (class 2617 OID 17139)
-- Dependencies: 1183 4 469 1174
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2087 (class 2617 OID 17141)
-- Dependencies: 451 4 1174 1183
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2099 (class 2617 OID 17150)
-- Dependencies: 463 1183 4 1183
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2117 (class 2617 OID 17156)
-- Dependencies: 1186 4 1186 481
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = isneq,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = =,
    NEGATOR = <>,
    HASHES,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- TOC entry 2131 (class 2617 OID 17305)
-- Dependencies: 575 4 1190 1190
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = ltree_eq,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


--
-- TOC entry 2186 (class 2617 OID 17532)
-- Dependencies: 1213 1213 4 710
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = seg_same,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


--
-- TOC entry 2199 (class 2617 OID 17807)
-- Dependencies: 1229 837 4 1229
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = tsvector_eq,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


--
-- TOC entry 2205 (class 2617 OID 17821)
-- Dependencies: 844 1232 4 1232
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = tsquery_eq,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = =,
    NEGATOR = <>,
    RESTRICT = eqsel,
    JOIN = eqjoinsel,
    SORT1 = <,
    SORT2 = <,
    LTCMP = <,
    GTCMP = >
);


--
-- TOC entry 1942 (class 2617 OID 16697)
-- Dependencies: 4 244 1152
-- Name: =>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR => (
    PROCEDURE = tconvert,
    LEFTARG = text,
    RIGHTARG = text
);


--
-- TOC entry 1925 (class 2617 OID 16598)
-- Dependencies: 153 1144 1144 4
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = cube_gt,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1963 (class 2617 OID 16989)
-- Dependencies: 1165 1165 4 327
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1975 (class 2617 OID 16995)
-- Dependencies: 4 387 1165 1168
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1969 (class 2617 OID 16999)
-- Dependencies: 1168 4 1165 333
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1987 (class 2617 OID 17007)
-- Dependencies: 4 1171 1165 423
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1981 (class 2617 OID 17011)
-- Dependencies: 339 1165 1171 4
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2095 (class 2617 OID 17019)
-- Dependencies: 459 1165 1174 4
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1993 (class 2617 OID 17023)
-- Dependencies: 345 4 1165 1174
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2047 (class 2617 OID 17031)
-- Dependencies: 4 1177 1165 405
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1999 (class 2617 OID 17035)
-- Dependencies: 4 351 1177 1165
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2077 (class 2617 OID 17043)
-- Dependencies: 4 1180 1165 441
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2005 (class 2617 OID 17047)
-- Dependencies: 357 4 1165 1180
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2113 (class 2617 OID 17055)
-- Dependencies: 4 477 1165 1183
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2011 (class 2617 OID 17059)
-- Dependencies: 363 1165 4 1183
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2125 (class 2617 OID 17067)
-- Dependencies: 1165 4 489 1186
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2017 (class 2617 OID 17071)
-- Dependencies: 4 1165 369 1186
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2023 (class 2617 OID 17079)
-- Dependencies: 1168 4 1168 375
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2041 (class 2617 OID 17085)
-- Dependencies: 4 399 1168 1177
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2029 (class 2617 OID 17089)
-- Dependencies: 1177 4 1168 381
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2035 (class 2617 OID 17097)
-- Dependencies: 1177 4 1177 393
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2053 (class 2617 OID 17103)
-- Dependencies: 411 4 1171 1171
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2071 (class 2617 OID 17109)
-- Dependencies: 1180 1171 435 4
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2059 (class 2617 OID 17113)
-- Dependencies: 1171 1180 417 4
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2065 (class 2617 OID 17121)
-- Dependencies: 1180 4 429 1180
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2083 (class 2617 OID 17127)
-- Dependencies: 447 4 1174 1174
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2107 (class 2617 OID 17133)
-- Dependencies: 4 471 1174 1183
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2089 (class 2617 OID 17137)
-- Dependencies: 453 4 1174 1183
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2101 (class 2617 OID 17145)
-- Dependencies: 465 1183 4 1183
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2119 (class 2617 OID 17151)
-- Dependencies: 483 4 1186 1186
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = isngt,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2130 (class 2617 OID 17300)
-- Dependencies: 577 4 1190 1190
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = ltree_gt,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2179 (class 2617 OID 17522)
-- Dependencies: 705 4 1213 1213
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = seg_gt,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2198 (class 2617 OID 17802)
-- Dependencies: 1229 4 839 1229
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = tsvector_gt,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2204 (class 2617 OID 17816)
-- Dependencies: 846 1232 1232 4
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = tsquery_gt,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1927 (class 2617 OID 16599)
-- Dependencies: 4 1144 1144 155
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = cube_ge,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1962 (class 2617 OID 16990)
-- Dependencies: 1165 1165 4 326
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1968 (class 2617 OID 16996)
-- Dependencies: 332 1168 1165 4
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = isbn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1974 (class 2617 OID 16998)
-- Dependencies: 1165 386 1168 4
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn13,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1980 (class 2617 OID 17008)
-- Dependencies: 1171 4 338 1165
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = ismn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1986 (class 2617 OID 17010)
-- Dependencies: 422 1165 1171 4
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn13,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1992 (class 2617 OID 17020)
-- Dependencies: 1165 344 1174 4
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = issn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2094 (class 2617 OID 17022)
-- Dependencies: 1165 1174 4 458
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn13,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 1998 (class 2617 OID 17032)
-- Dependencies: 350 4 1165 1177
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = isbn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2046 (class 2617 OID 17034)
-- Dependencies: 4 404 1165 1177
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2004 (class 2617 OID 17044)
-- Dependencies: 356 4 1165 1180
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = ismn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2076 (class 2617 OID 17046)
-- Dependencies: 4 440 1165 1180
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2010 (class 2617 OID 17056)
-- Dependencies: 4 1183 362 1165
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = issn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2112 (class 2617 OID 17058)
-- Dependencies: 476 4 1165 1183
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2016 (class 2617 OID 17068)
-- Dependencies: 4 1165 1186 368
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ean13,
    RIGHTARG = upc,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2124 (class 2617 OID 17070)
-- Dependencies: 1186 1165 488 4
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = upc,
    RIGHTARG = ean13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2022 (class 2617 OID 17080)
-- Dependencies: 4 374 1168 1168
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn13,
    RIGHTARG = isbn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2028 (class 2617 OID 17086)
-- Dependencies: 1168 4 380 1177
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn13,
    RIGHTARG = isbn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2040 (class 2617 OID 17088)
-- Dependencies: 4 398 1177 1168
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn,
    RIGHTARG = isbn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2034 (class 2617 OID 17098)
-- Dependencies: 392 4 1177 1177
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = isbn,
    RIGHTARG = isbn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2052 (class 2617 OID 17104)
-- Dependencies: 1171 410 4 1171
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn13,
    RIGHTARG = ismn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2058 (class 2617 OID 17110)
-- Dependencies: 4 1180 416 1171
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn13,
    RIGHTARG = ismn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2070 (class 2617 OID 17112)
-- Dependencies: 1171 4 434 1180
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn,
    RIGHTARG = ismn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2064 (class 2617 OID 17122)
-- Dependencies: 1180 428 4 1180
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = ismn,
    RIGHTARG = ismn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2082 (class 2617 OID 17128)
-- Dependencies: 4 446 1174 1174
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn13,
    RIGHTARG = issn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2088 (class 2617 OID 17134)
-- Dependencies: 452 4 1174 1183
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn13,
    RIGHTARG = issn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2106 (class 2617 OID 17136)
-- Dependencies: 4 470 1174 1183
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn,
    RIGHTARG = issn13,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2100 (class 2617 OID 17146)
-- Dependencies: 4 464 1183 1183
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = issn,
    RIGHTARG = issn,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2118 (class 2617 OID 17152)
-- Dependencies: 4 482 1186 1186
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = isnge,
    LEFTARG = upc,
    RIGHTARG = upc,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2129 (class 2617 OID 17301)
-- Dependencies: 576 4 1190 1190
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = ltree_ge,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2180 (class 2617 OID 17523)
-- Dependencies: 706 4 1213 1213
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = seg_ge,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = scalargtsel,
    JOIN = scalargtjoinsel
);


--
-- TOC entry 2197 (class 2617 OID 17803)
-- Dependencies: 1229 4 838 1229
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = tsvector_ge,
    LEFTARG = tsvector,
    RIGHTARG = tsvector,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2203 (class 2617 OID 17817)
-- Dependencies: 4 1232 1232 845
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = tsquery_ge,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2185 (class 2617 OID 17526)
-- Dependencies: 4 702 1213 1213
-- Name: >>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >> (
    PROCEDURE = seg_right,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- TOC entry 2145 (class 2617 OID 17348)
-- Dependencies: 1190 606 1195 4
-- Name: ?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ? (
    PROCEDURE = lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree,
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2144 (class 2617 OID 17349)
-- Dependencies: 1195 605 4 1190
-- Name: ?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ? (
    PROCEDURE = lt_q_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2159 (class 2617 OID 17390)
-- Dependencies: 1192 4 1195 627
-- Name: ?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ? (
    PROCEDURE = _lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2158 (class 2617 OID 17391)
-- Dependencies: 1195 626 1192 4
-- Name: ?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ? (
    PROCEDURE = _lt_q_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery[],
    COMMUTATOR = ?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2173 (class 2617 OID 17407)
-- Dependencies: 1190 1192 4 631 1190
-- Name: ?<@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ?<@ (
    PROCEDURE = _ltree_extract_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree
);


--
-- TOC entry 2175 (class 2617 OID 17411)
-- Dependencies: 1196 4 1192 633 1190
-- Name: ?@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ?@ (
    PROCEDURE = _ltxtq_extract_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery
);


--
-- TOC entry 2172 (class 2617 OID 17405)
-- Dependencies: 4 1190 1190 630 1192
-- Name: ?@>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ?@> (
    PROCEDURE = _ltree_extract_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree
);


--
-- TOC entry 2174 (class 2617 OID 17409)
-- Dependencies: 1193 1190 632 4 1192
-- Name: ?~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ?~ (
    PROCEDURE = _ltq_extract_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery
);


--
-- TOC entry 1933 (class 2617 OID 16608)
-- Dependencies: 157 1144 4 1144
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = cube_contains,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1940 (class 2617 OID 16695)
-- Dependencies: 1152 4 242 1152
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = hs_contains,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1948 (class 2617 OID 16741)
-- Dependencies: 4 267
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = _int_contains,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2149 (class 2617 OID 17358)
-- Dependencies: 610 4 1196 1190
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2148 (class 2617 OID 17359)
-- Dependencies: 609 4 1190 1196
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = ltxtq_exec,
    LEFTARG = ltree,
    RIGHTARG = ltxtquery,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2161 (class 2617 OID 17392)
-- Dependencies: 4 1196 1192 629
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = _ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree[],
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2160 (class 2617 OID 17393)
-- Dependencies: 628 1196 1192 4
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = _ltxtq_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2190 (class 2617 OID 17536)
-- Dependencies: 4 1213 707 1213
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = seg_contains,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2212 (class 2617 OID 17840)
-- Dependencies: 856 1232 1232 4
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = tsq_mcontains,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1931 (class 2617 OID 16606)
-- Dependencies: 4 1144 1144 157
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = cube_contains,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1938 (class 2617 OID 16693)
-- Dependencies: 242 1152 4 1152
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = hs_contains,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1946 (class 2617 OID 16739)
-- Dependencies: 4 267
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = _int_contains,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2133 (class 2617 OID 17329)
-- Dependencies: 1190 600 595 1190 4
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = ltree_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = <@,
    RESTRICT = ltreeparentsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2152 (class 2617 OID 17385)
-- Dependencies: 1192 620 1190 4
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = _ltree_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2155 (class 2617 OID 17386)
-- Dependencies: 1192 623 4 1190
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = _ltree_r_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2188 (class 2617 OID 17534)
-- Dependencies: 1213 707 4 1213
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = seg_contains,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2210 (class 2617 OID 17838)
-- Dependencies: 1232 1232 856 4
-- Name: @>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @> (
    PROCEDURE = tsq_mcontains,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = <@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1943 (class 2617 OID 16729)
-- Dependencies: 1159 4 265
-- Name: @@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @@ (
    PROCEDURE = boolop,
    LEFTARG = integer[],
    RIGHTARG = query_int,
    COMMUTATOR = ~~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2194 (class 2617 OID 17756)
-- Dependencies: 803 1229 4 1232
-- Name: @@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @@ (
    PROCEDURE = rexectsq,
    LEFTARG = tsquery,
    RIGHTARG = tsvector,
    COMMUTATOR = @@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2193 (class 2617 OID 17757)
-- Dependencies: 1232 802 4 1229
-- Name: @@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @@ (
    PROCEDURE = exectsq,
    LEFTARG = tsvector,
    RIGHTARG = tsquery,
    COMMUTATOR = @@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2215 (class 2617 OID 17856)
-- Dependencies: 1229 1232 4 803
-- Name: @@@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @@@ (
    PROCEDURE = rexectsq,
    LEFTARG = tsquery,
    RIGHTARG = tsvector,
    COMMUTATOR = @@@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2214 (class 2617 OID 17857)
-- Dependencies: 4 802 1232 1229
-- Name: @@@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @@@ (
    PROCEDURE = exectsq,
    LEFTARG = tsvector,
    RIGHTARG = tsquery,
    COMMUTATOR = @@@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2136 (class 2617 OID 17330)
-- Dependencies: 1190 596 1190 4
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^<@ (
    PROCEDURE = ltree_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2163 (class 2617 OID 17394)
-- Dependencies: 4 1192 621 1190
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^<@ (
    PROCEDURE = _ltree_r_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2164 (class 2617 OID 17397)
-- Dependencies: 4 1192 1190 622
-- Name: ^<@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^<@ (
    PROCEDURE = _ltree_risparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = ^@>,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2147 (class 2617 OID 17350)
-- Dependencies: 1195 4 1190 606
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^? (
    PROCEDURE = lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree,
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2146 (class 2617 OID 17351)
-- Dependencies: 1190 1195 605 4
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^? (
    PROCEDURE = lt_q_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2169 (class 2617 OID 17400)
-- Dependencies: 4 627 1192 1195
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^? (
    PROCEDURE = _lt_q_rregex,
    LEFTARG = lquery[],
    RIGHTARG = ltree[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2168 (class 2617 OID 17401)
-- Dependencies: 1195 4 1192 626
-- Name: ^?; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^? (
    PROCEDURE = _lt_q_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery[],
    COMMUTATOR = ^?,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2151 (class 2617 OID 17360)
-- Dependencies: 1196 610 1190 4
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@ (
    PROCEDURE = ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2150 (class 2617 OID 17361)
-- Dependencies: 1196 4 1190 609
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@ (
    PROCEDURE = ltxtq_exec,
    LEFTARG = ltree,
    RIGHTARG = ltxtquery,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2171 (class 2617 OID 17402)
-- Dependencies: 4 629 1192 1196
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@ (
    PROCEDURE = _ltxtq_rexec,
    LEFTARG = ltxtquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2170 (class 2617 OID 17403)
-- Dependencies: 628 1192 4 1196
-- Name: ^@; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@ (
    PROCEDURE = _ltxtq_exec,
    LEFTARG = ltree[],
    RIGHTARG = ltxtquery,
    COMMUTATOR = ^@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2134 (class 2617 OID 17331)
-- Dependencies: 595 4 1190 1190
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@> (
    PROCEDURE = ltree_isparent,
    LEFTARG = ltree,
    RIGHTARG = ltree,
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2162 (class 2617 OID 17395)
-- Dependencies: 4 1190 1192 620
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@> (
    PROCEDURE = _ltree_isparent,
    LEFTARG = ltree[],
    RIGHTARG = ltree,
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2165 (class 2617 OID 17396)
-- Dependencies: 4 1190 1192 623
-- Name: ^@>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^@> (
    PROCEDURE = _ltree_r_risparent,
    LEFTARG = ltree,
    RIGHTARG = ltree[],
    COMMUTATOR = ^<@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2143 (class 2617 OID 17344)
-- Dependencies: 1190 604 4 1193
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^~ (
    PROCEDURE = ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2142 (class 2617 OID 17345)
-- Dependencies: 1193 603 4 1190
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^~ (
    PROCEDURE = ltq_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2167 (class 2617 OID 17398)
-- Dependencies: 4 1193 1192 625
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^~ (
    PROCEDURE = _ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2166 (class 2617 OID 17399)
-- Dependencies: 624 1193 1192 4
-- Name: ^~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ^~ (
    PROCEDURE = _ltq_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery,
    COMMUTATOR = ^~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1955 (class 2617 OID 16761)
-- Dependencies: 287 4
-- Name: |; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR | (
    PROCEDURE = intset_union_elem,
    LEFTARG = integer[],
    RIGHTARG = integer
);


--
-- TOC entry 1956 (class 2617 OID 16762)
-- Dependencies: 4 272
-- Name: |; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR | (
    PROCEDURE = _int_union,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = |
);


--
-- TOC entry 1937 (class 2617 OID 16689)
-- Dependencies: 1152 1152 241 1152 4
-- Name: ||; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR || (
    PROCEDURE = hs_concat,
    LEFTARG = hstore,
    RIGHTARG = hstore
);


--
-- TOC entry 2137 (class 2617 OID 17332)
-- Dependencies: 597 1190 1190 4 1190
-- Name: ||; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR || (
    PROCEDURE = ltree_addltree,
    LEFTARG = ltree,
    RIGHTARG = ltree
);


--
-- TOC entry 2138 (class 2617 OID 17333)
-- Dependencies: 1190 598 1190 4
-- Name: ||; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR || (
    PROCEDURE = ltree_addtext,
    LEFTARG = ltree,
    RIGHTARG = text
);


--
-- TOC entry 2139 (class 2617 OID 17334)
-- Dependencies: 4 1190 1190 599
-- Name: ||; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR || (
    PROCEDURE = ltree_textadd,
    LEFTARG = text,
    RIGHTARG = ltree
);


--
-- TOC entry 2192 (class 2617 OID 17742)
-- Dependencies: 792 4 1229 1229 1229
-- Name: ||; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR || (
    PROCEDURE = concat,
    LEFTARG = tsvector,
    RIGHTARG = tsvector
);


--
-- TOC entry 2208 (class 2617 OID 17827)
-- Dependencies: 1232 1232 850 4 1232
-- Name: ||; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR || (
    PROCEDURE = tsquery_or,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = ||,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1934 (class 2617 OID 16607)
-- Dependencies: 1144 158 4 1144
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = cube_contained,
    LEFTARG = cube,
    RIGHTARG = cube,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1941 (class 2617 OID 16694)
-- Dependencies: 1152 4 1152 243
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = hs_contained,
    LEFTARG = hstore,
    RIGHTARG = hstore,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1949 (class 2617 OID 16740)
-- Dependencies: 4 268
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = _int_contained,
    LEFTARG = integer[],
    RIGHTARG = integer[],
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2141 (class 2617 OID 17342)
-- Dependencies: 1190 604 1193 4
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2140 (class 2617 OID 17343)
-- Dependencies: 4 1190 1193 603
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = ltq_regex,
    LEFTARG = ltree,
    RIGHTARG = lquery,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2157 (class 2617 OID 17388)
-- Dependencies: 1192 625 1193 4
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = _ltq_rregex,
    LEFTARG = lquery,
    RIGHTARG = ltree[],
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2156 (class 2617 OID 17389)
-- Dependencies: 624 1193 1192 4
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = _ltq_regex,
    LEFTARG = ltree[],
    RIGHTARG = lquery,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2191 (class 2617 OID 17535)
-- Dependencies: 4 708 1213 1213
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = seg_contained,
    LEFTARG = seg,
    RIGHTARG = seg,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2213 (class 2617 OID 17839)
-- Dependencies: 857 1232 1232 4
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = tsq_mcontained,
    LEFTARG = tsquery,
    RIGHTARG = tsquery,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 1944 (class 2617 OID 16728)
-- Dependencies: 1159 4 266
-- Name: ~~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~~ (
    PROCEDURE = rboolop,
    LEFTARG = query_int,
    RIGHTARG = integer[],
    COMMUTATOR = @@,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- TOC entry 2339 (class 2616 OID 16616)
-- Dependencies: 1927 1929 1926 1924 1144 4 156 1925
-- Name: cube_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS cube_ops
    DEFAULT FOR TYPE cube USING btree AS
    OPERATOR 1 <(cube,cube) ,
    OPERATOR 2 <=(cube,cube) ,
    OPERATOR 3 =(cube,cube) ,
    OPERATOR 4 >=(cube,cube) ,
    OPERATOR 5 >(cube,cube) ,
    FUNCTION 1 cube_cmp(cube,cube);


--
-- TOC entry 2346 (class 2616 OID 17165)
-- Dependencies: 1990 1978 1966 1959 2013 2007 2001 1995 1989 1977 1965 4 1165 491 498 497 496 495 494 493 492 1963 2017 2011 2005 1999 1993 1981 1969 1962 2016 2010 2004 1998 1992 1980 1968 1961 2015 2009 2003 1997 1991 1979 1967 1960 2014 2008 2002 1996
-- Name: ean13_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS ean13_ops
    DEFAULT FOR TYPE ean13 USING btree AS
    OPERATOR 1 <(ean13,isbn13) ,
    OPERATOR 1 <(ean13,ismn13) ,
    OPERATOR 1 <(ean13,issn13) ,
    OPERATOR 1 <(ean13,isbn) ,
    OPERATOR 1 <(ean13,ismn) ,
    OPERATOR 1 <(ean13,issn) ,
    OPERATOR 1 <(ean13,upc) ,
    OPERATOR 1 <(ean13,ean13) ,
    OPERATOR 2 <=(ean13,isbn13) ,
    OPERATOR 2 <=(ean13,ismn13) ,
    OPERATOR 2 <=(ean13,issn13) ,
    OPERATOR 2 <=(ean13,isbn) ,
    OPERATOR 2 <=(ean13,ismn) ,
    OPERATOR 2 <=(ean13,issn) ,
    OPERATOR 2 <=(ean13,upc) ,
    OPERATOR 2 <=(ean13,ean13) ,
    OPERATOR 3 =(ean13,isbn13) ,
    OPERATOR 3 =(ean13,ismn13) ,
    OPERATOR 3 =(ean13,issn13) ,
    OPERATOR 3 =(ean13,isbn) ,
    OPERATOR 3 =(ean13,ismn) ,
    OPERATOR 3 =(ean13,issn) ,
    OPERATOR 3 =(ean13,upc) ,
    OPERATOR 3 =(ean13,ean13) ,
    OPERATOR 4 >=(ean13,isbn13) ,
    OPERATOR 4 >=(ean13,ismn13) ,
    OPERATOR 4 >=(ean13,issn13) ,
    OPERATOR 4 >=(ean13,isbn) ,
    OPERATOR 4 >=(ean13,ismn) ,
    OPERATOR 4 >=(ean13,issn) ,
    OPERATOR 4 >=(ean13,upc) ,
    OPERATOR 4 >=(ean13,ean13) ,
    OPERATOR 5 >(ean13,isbn13) ,
    OPERATOR 5 >(ean13,ismn13) ,
    OPERATOR 5 >(ean13,issn13) ,
    OPERATOR 5 >(ean13,isbn) ,
    OPERATOR 5 >(ean13,ismn) ,
    OPERATOR 5 >(ean13,issn) ,
    OPERATOR 5 >(ean13,upc) ,
    OPERATOR 5 >(ean13,ean13) ,
    FUNCTION 1 btean13cmp(ean13,isbn13) ,
    FUNCTION 1 btean13cmp(ean13,ismn13) ,
    FUNCTION 1 btean13cmp(ean13,issn13) ,
    FUNCTION 1 btean13cmp(ean13,isbn) ,
    FUNCTION 1 btean13cmp(ean13,ismn) ,
    FUNCTION 1 btean13cmp(ean13,issn) ,
    FUNCTION 1 btean13cmp(ean13,upc) ,
    FUNCTION 1 btean13cmp(ean13,ean13);


--
-- TOC entry 2347 (class 2616 OID 17167)
-- Dependencies: 4 499 1961 1165
-- Name: ean13_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS ean13_ops
    DEFAULT FOR TYPE ean13 USING hash AS
    OPERATOR 1 =(ean13,ean13) ,
    FUNCTION 1 hashean13(ean13);


--
-- TOC entry 2345 (class 2616 OID 16788)
-- Dependencies: 1943 1949 305 306 1948 1947 1946 1945 4
-- Name: gin__int_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gin__int_ops
    DEFAULT FOR TYPE integer[] USING gin AS
    STORAGE integer ,
    OPERATOR 3 &&(integer[],integer[]) ,
    OPERATOR 6 =(anyarray,anyarray) RECHECK ,
    OPERATOR 7 @>(integer[],integer[]) ,
    OPERATOR 8 <@(integer[],integer[]) RECHECK ,
    OPERATOR 13 @(integer[],integer[]) ,
    OPERATOR 14 ~(integer[],integer[]) RECHECK ,
    OPERATOR 20 @@(integer[],query_int) ,
    FUNCTION 1 btint4cmp(integer,integer) ,
    FUNCTION 2 ginarrayextract(anyarray,internal) ,
    FUNCTION 3 ginint4_queryextract(internal,internal,smallint) ,
    FUNCTION 4 ginint4_consistent(internal,smallint,internal);


--
-- TOC entry 2372 (class 2616 OID 17858)
-- Dependencies: 867 868 2193 1229 4 2214 869
-- Name: gin_tsvector_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gin_tsvector_ops
    DEFAULT FOR TYPE tsvector USING gin AS
    STORAGE text ,
    OPERATOR 1 @@(tsvector,tsquery) ,
    OPERATOR 2 @@@(tsvector,tsquery) RECHECK ,
    FUNCTION 1 bttextcmp(text,text) ,
    FUNCTION 2 gin_extract_tsvector(tsvector,internal) ,
    FUNCTION 3 gin_extract_tsquery(tsquery,internal,internal) ,
    FUNCTION 4 gin_ts_consistent(internal,internal,tsquery);


--
-- TOC entry 2342 (class 2616 OID 16773)
-- Dependencies: 4 1945 291 290 294 289 1943 1949 1948 1947 1946 295 292 293
-- Name: gist__int_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist__int_ops
    DEFAULT FOR TYPE integer[] USING gist AS
    OPERATOR 3 &&(integer[],integer[]) ,
    OPERATOR 6 =(anyarray,anyarray) RECHECK ,
    OPERATOR 7 @>(integer[],integer[]) ,
    OPERATOR 8 <@(integer[],integer[]) ,
    OPERATOR 13 @(integer[],integer[]) ,
    OPERATOR 14 ~(integer[],integer[]) ,
    OPERATOR 20 @@(integer[],query_int) ,
    FUNCTION 1 g_int_consistent(internal,integer[],integer) ,
    FUNCTION 2 g_int_union(internal,internal) ,
    FUNCTION 3 g_int_compress(internal) ,
    FUNCTION 4 g_int_decompress(internal) ,
    FUNCTION 5 g_int_penalty(internal,internal,internal) ,
    FUNCTION 6 g_int_picksplit(internal,internal) ,
    FUNCTION 7 g_int_same(integer[],integer[],internal);


--
-- TOC entry 2343 (class 2616 OID 16785)
-- Dependencies: 1945 4 299 303 298 1943 1949 1948 1947 1946 1162 304 302 301 300
-- Name: gist__intbig_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist__intbig_ops
    FOR TYPE integer[] USING gist AS
    STORAGE intbig_gkey ,
    OPERATOR 3 &&(integer[],integer[]) RECHECK ,
    OPERATOR 6 =(anyarray,anyarray) RECHECK ,
    OPERATOR 7 @>(integer[],integer[]) RECHECK ,
    OPERATOR 8 <@(integer[],integer[]) RECHECK ,
    OPERATOR 13 @(integer[],integer[]) RECHECK ,
    OPERATOR 14 ~(integer[],integer[]) RECHECK ,
    OPERATOR 20 @@(integer[],query_int) RECHECK ,
    FUNCTION 1 g_intbig_consistent(internal,internal,integer) ,
    FUNCTION 2 g_intbig_union(internal,internal) ,
    FUNCTION 3 g_intbig_compress(internal) ,
    FUNCTION 4 g_intbig_decompress(internal) ,
    FUNCTION 5 g_intbig_penalty(internal,internal,internal) ,
    FUNCTION 6 g_intbig_picksplit(internal,internal) ,
    FUNCTION 7 g_intbig_same(internal,internal,internal);


--
-- TOC entry 2364 (class 2616 OID 17418)
-- Dependencies: 2155 2156 2157 639 2160 2161 2158 2159 638 634 637 635 615 1199 636 4 1192 2154
-- Name: gist__ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist__ltree_ops
    DEFAULT FOR TYPE ltree[] USING gist AS
    STORAGE ltree_gist ,
    OPERATOR 10 <@(ltree[],ltree) RECHECK ,
    OPERATOR 11 @>(ltree,ltree[]) RECHECK ,
    OPERATOR 12 ~(ltree[],lquery) RECHECK ,
    OPERATOR 13 ~(lquery,ltree[]) RECHECK ,
    OPERATOR 14 @(ltree[],ltxtquery) RECHECK ,
    OPERATOR 15 @(ltxtquery,ltree[]) RECHECK ,
    OPERATOR 16 ?(ltree[],lquery[]) RECHECK ,
    OPERATOR 17 ?(lquery[],ltree[]) RECHECK ,
    FUNCTION 1 _ltree_consistent(internal,internal,smallint) ,
    FUNCTION 2 _ltree_union(internal,internal) ,
    FUNCTION 3 _ltree_compress(internal) ,
    FUNCTION 4 ltree_decompress(internal) ,
    FUNCTION 5 _ltree_penalty(internal,internal,internal) ,
    FUNCTION 6 _ltree_picksplit(internal,internal) ,
    FUNCTION 7 _ltree_same(internal,internal,internal);


--
-- TOC entry 2335 (class 2616 OID 16546)
-- Dependencies: 133 132 4 1138 128 129 32 130 131
-- Name: gist_bit_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_bit_ops
    DEFAULT FOR TYPE bit USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(bit,bit) ,
    OPERATOR 2 <=(bit,bit) ,
    OPERATOR 3 =(bit,bit) ,
    OPERATOR 4 >=(bit,bit) ,
    OPERATOR 5 >(bit,bit) ,
    FUNCTION 1 gbt_bit_consistent(internal,bit,smallint) ,
    FUNCTION 2 gbt_bit_union(bytea,internal) ,
    FUNCTION 3 gbt_bit_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_bit_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_bit_picksplit(internal,internal) ,
    FUNCTION 7 gbt_bit_same(internal,internal,internal);


--
-- TOC entry 2332 (class 2616 OID 16525)
-- Dependencies: 114 4 1138 109 111 32 112 113 115
-- Name: gist_bpchar_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_bpchar_ops
    DEFAULT FOR TYPE character USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(character,character) ,
    OPERATOR 2 <=(character,character) ,
    OPERATOR 3 =(character,character) ,
    OPERATOR 4 >=(character,character) ,
    OPERATOR 5 >(character,character) ,
    FUNCTION 1 gbt_bpchar_consistent(internal,character,smallint) ,
    FUNCTION 2 gbt_text_union(bytea,internal) ,
    FUNCTION 3 gbt_bpchar_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_text_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_text_picksplit(internal,internal) ,
    FUNCTION 7 gbt_text_same(internal,internal,internal);


--
-- TOC entry 2333 (class 2616 OID 16532)
-- Dependencies: 118 1138 116 4 120 32 117 121 119
-- Name: gist_bytea_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_bytea_ops
    DEFAULT FOR TYPE bytea USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(bytea,bytea) ,
    OPERATOR 2 <=(bytea,bytea) ,
    OPERATOR 3 =(bytea,bytea) ,
    OPERATOR 4 >=(bytea,bytea) ,
    OPERATOR 5 >(bytea,bytea) ,
    FUNCTION 1 gbt_bytea_consistent(internal,bytea,smallint) ,
    FUNCTION 2 gbt_bytea_union(bytea,internal) ,
    FUNCTION 3 gbt_bytea_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_bytea_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_bytea_picksplit(internal,internal) ,
    FUNCTION 7 gbt_bytea_same(internal,internal,internal);


--
-- TOC entry 2329 (class 2616 OID 16508)
-- Dependencies: 30 98 4 99 101 96 1129 97 100
-- Name: gist_cash_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_cash_ops
    DEFAULT FOR TYPE money USING gist AS
    STORAGE gbtreekey8 ,
    OPERATOR 1 <(money,money) ,
    OPERATOR 2 <=(money,money) ,
    OPERATOR 3 =(money,money) ,
    OPERATOR 4 >=(money,money) ,
    OPERATOR 5 >(money,money) ,
    FUNCTION 1 gbt_cash_consistent(internal,money,smallint) ,
    FUNCTION 2 gbt_cash_union(bytea,internal) ,
    FUNCTION 3 gbt_cash_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_cash_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_cash_picksplit(internal,internal) ,
    FUNCTION 7 gbt_cash_same(internal,internal,internal);


--
-- TOC entry 2338 (class 2616 OID 16555)
-- Dependencies: 139 4 1132 134 138 135 30 136 137
-- Name: gist_cidr_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_cidr_ops
    DEFAULT FOR TYPE cidr USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(inet,inet) RECHECK ,
    OPERATOR 2 <=(inet,inet) RECHECK ,
    OPERATOR 3 =(inet,inet) RECHECK ,
    OPERATOR 4 >=(inet,inet) RECHECK ,
    OPERATOR 5 >(inet,inet) RECHECK ,
    FUNCTION 1 gbt_inet_consistent(internal,inet,smallint) ,
    FUNCTION 2 gbt_inet_union(bytea,internal) ,
    FUNCTION 3 gbt_inet_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_inet_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_inet_picksplit(internal,internal) ,
    FUNCTION 7 gbt_inet_same(internal,internal,internal);


--
-- TOC entry 2340 (class 2616 OID 16617)
-- Dependencies: 1934 174 179 175 176 177 180 178 4 1144 1928 1929 1931 1932 1933
-- Name: gist_cube_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_cube_ops
    DEFAULT FOR TYPE cube USING gist AS
    OPERATOR 3 &&(cube,cube) ,
    OPERATOR 6 =(cube,cube) ,
    OPERATOR 7 @>(cube,cube) ,
    OPERATOR 8 <@(cube,cube) ,
    OPERATOR 13 @(cube,cube) ,
    OPERATOR 14 ~(cube,cube) ,
    FUNCTION 1 g_cube_consistent(internal,cube,integer) ,
    FUNCTION 2 g_cube_union(internal,internal) ,
    FUNCTION 3 g_cube_compress(internal) ,
    FUNCTION 4 g_cube_decompress(internal) ,
    FUNCTION 5 g_cube_penalty(internal,internal,internal) ,
    FUNCTION 6 g_cube_picksplit(internal,internal) ,
    FUNCTION 7 g_cube_same(cube,cube,internal);


--
-- TOC entry 2327 (class 2616 OID 16493)
-- Dependencies: 1129 85 86 88 84 87 30 83 4
-- Name: gist_date_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_date_ops
    DEFAULT FOR TYPE date USING gist AS
    STORAGE gbtreekey8 ,
    OPERATOR 1 <(date,date) ,
    OPERATOR 2 <=(date,date) ,
    OPERATOR 3 =(date,date) ,
    OPERATOR 4 >=(date,date) ,
    OPERATOR 5 >(date,date) ,
    FUNCTION 1 gbt_date_consistent(internal,date,smallint) ,
    FUNCTION 2 gbt_date_union(bytea,internal) ,
    FUNCTION 3 gbt_date_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_date_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_date_picksplit(internal,internal) ,
    FUNCTION 7 gbt_date_same(internal,internal,internal);


--
-- TOC entry 2321 (class 2616 OID 16459)
-- Dependencies: 60 58 57 30 56 59 4 1129 55
-- Name: gist_float4_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_float4_ops
    DEFAULT FOR TYPE real USING gist AS
    STORAGE gbtreekey8 ,
    OPERATOR 1 <(real,real) ,
    OPERATOR 2 <=(real,real) ,
    OPERATOR 3 =(real,real) ,
    OPERATOR 4 >=(real,real) ,
    OPERATOR 5 >(real,real) ,
    FUNCTION 1 gbt_float4_consistent(internal,real,smallint) ,
    FUNCTION 2 gbt_float4_union(bytea,internal) ,
    FUNCTION 3 gbt_float4_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_float4_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_float4_picksplit(internal,internal) ,
    FUNCTION 7 gbt_float4_same(internal,internal,internal);


--
-- TOC entry 2322 (class 2616 OID 16466)
-- Dependencies: 66 64 63 30 4 1132 61 65 62
-- Name: gist_float8_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_float8_ops
    DEFAULT FOR TYPE double precision USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(double precision,double precision) ,
    OPERATOR 2 <=(double precision,double precision) ,
    OPERATOR 3 =(double precision,double precision) ,
    OPERATOR 4 >=(double precision,double precision) ,
    OPERATOR 5 >(double precision,double precision) ,
    FUNCTION 1 gbt_float8_consistent(internal,double precision,smallint) ,
    FUNCTION 2 gbt_float8_union(bytea,internal) ,
    FUNCTION 3 gbt_float8_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_float8_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_float8_picksplit(internal,internal) ,
    FUNCTION 7 gbt_float8_same(internal,internal,internal);


--
-- TOC entry 2341 (class 2616 OID 16716)
-- Dependencies: 253 4 1152 1156 1938 1940 258 256 252 254 255 257
-- Name: gist_hstore_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_hstore_ops
    DEFAULT FOR TYPE hstore USING gist AS
    STORAGE ghstore ,
    OPERATOR 7 @>(hstore,hstore) RECHECK ,
    OPERATOR 13 @(hstore,hstore) RECHECK ,
    FUNCTION 1 ghstore_consistent(internal,internal,integer) ,
    FUNCTION 2 ghstore_union(internal,internal) ,
    FUNCTION 3 ghstore_compress(internal) ,
    FUNCTION 4 ghstore_decompress(internal) ,
    FUNCTION 5 ghstore_penalty(internal,internal,internal) ,
    FUNCTION 6 ghstore_picksplit(internal,internal) ,
    FUNCTION 7 ghstore_same(internal,internal,internal);


--
-- TOC entry 2337 (class 2616 OID 16554)
-- Dependencies: 137 4 1132 134 138 135 30 136 139
-- Name: gist_inet_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_inet_ops
    DEFAULT FOR TYPE inet USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(inet,inet) RECHECK ,
    OPERATOR 2 <=(inet,inet) RECHECK ,
    OPERATOR 3 =(inet,inet) RECHECK ,
    OPERATOR 4 >=(inet,inet) RECHECK ,
    OPERATOR 5 >(inet,inet) RECHECK ,
    FUNCTION 1 gbt_inet_consistent(internal,inet,smallint) ,
    FUNCTION 2 gbt_inet_union(bytea,internal) ,
    FUNCTION 3 gbt_inet_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_inet_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_inet_picksplit(internal,internal) ,
    FUNCTION 7 gbt_inet_same(internal,internal,internal);


--
-- TOC entry 2318 (class 2616 OID 16438)
-- Dependencies: 42 40 39 30 38 41 37 1117 4
-- Name: gist_int2_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_int2_ops
    DEFAULT FOR TYPE smallint USING gist AS
    STORAGE gbtreekey4 ,
    OPERATOR 1 <(smallint,smallint) ,
    OPERATOR 2 <=(smallint,smallint) ,
    OPERATOR 3 =(smallint,smallint) ,
    OPERATOR 4 >=(smallint,smallint) ,
    OPERATOR 5 >(smallint,smallint) ,
    FUNCTION 1 gbt_int2_consistent(internal,smallint,smallint) ,
    FUNCTION 2 gbt_int2_union(bytea,internal) ,
    FUNCTION 3 gbt_int2_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_int2_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_int2_picksplit(internal,internal) ,
    FUNCTION 7 gbt_int2_same(internal,internal,internal);


--
-- TOC entry 2319 (class 2616 OID 16445)
-- Dependencies: 43 4 1129 47 44 30 45 46 48
-- Name: gist_int4_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_int4_ops
    DEFAULT FOR TYPE integer USING gist AS
    STORAGE gbtreekey8 ,
    OPERATOR 1 <(integer,integer) ,
    OPERATOR 2 <=(integer,integer) ,
    OPERATOR 3 =(integer,integer) ,
    OPERATOR 4 >=(integer,integer) ,
    OPERATOR 5 >(integer,integer) ,
    FUNCTION 1 gbt_int4_consistent(internal,integer,smallint) ,
    FUNCTION 2 gbt_int4_union(bytea,internal) ,
    FUNCTION 3 gbt_int4_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_int4_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_int4_picksplit(internal,internal) ,
    FUNCTION 7 gbt_int4_same(internal,internal,internal);


--
-- TOC entry 2320 (class 2616 OID 16452)
-- Dependencies: 53 50 30 51 52 54 4 1132 49
-- Name: gist_int8_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_int8_ops
    DEFAULT FOR TYPE bigint USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(bigint,bigint) ,
    OPERATOR 2 <=(bigint,bigint) ,
    OPERATOR 3 =(bigint,bigint) ,
    OPERATOR 4 >=(bigint,bigint) ,
    OPERATOR 5 >(bigint,bigint) ,
    FUNCTION 1 gbt_int8_consistent(internal,bigint,smallint) ,
    FUNCTION 2 gbt_int8_union(bytea,internal) ,
    FUNCTION 3 gbt_int8_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_int8_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_int8_picksplit(internal,internal) ,
    FUNCTION 7 gbt_int8_same(internal,internal,internal);


--
-- TOC entry 2328 (class 2616 OID 16501)
-- Dependencies: 91 4 1135 89 94 90 92 93 95
-- Name: gist_interval_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_interval_ops
    DEFAULT FOR TYPE interval USING gist AS
    STORAGE gbtreekey32 ,
    OPERATOR 1 <(interval,interval) ,
    OPERATOR 2 <=(interval,interval) ,
    OPERATOR 3 =(interval,interval) ,
    OPERATOR 4 >=(interval,interval) ,
    OPERATOR 5 >(interval,interval) ,
    FUNCTION 1 gbt_intv_consistent(internal,interval,smallint) ,
    FUNCTION 2 gbt_intv_union(bytea,internal) ,
    FUNCTION 3 gbt_intv_compress(internal) ,
    FUNCTION 4 gbt_intv_decompress(internal) ,
    FUNCTION 5 gbt_intv_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_intv_picksplit(internal,internal) ,
    FUNCTION 7 gbt_intv_same(internal,internal,internal);


--
-- TOC entry 2363 (class 2616 OID 17373)
-- Dependencies: 619 2129 2130 2131 2133 2135 2140 2141 2148 2149 4 1190 1199 2127 2128 2144 2145 613 618 614 615 616 617
-- Name: gist_ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_ltree_ops
    DEFAULT FOR TYPE ltree USING gist AS
    STORAGE ltree_gist ,
    OPERATOR 1 <(ltree,ltree) ,
    OPERATOR 2 <=(ltree,ltree) ,
    OPERATOR 3 =(ltree,ltree) ,
    OPERATOR 4 >=(ltree,ltree) ,
    OPERATOR 5 >(ltree,ltree) ,
    OPERATOR 10 @>(ltree,ltree) ,
    OPERATOR 11 <@(ltree,ltree) ,
    OPERATOR 12 ~(ltree,lquery) ,
    OPERATOR 13 ~(lquery,ltree) ,
    OPERATOR 14 @(ltree,ltxtquery) ,
    OPERATOR 15 @(ltxtquery,ltree) ,
    OPERATOR 16 ?(ltree,lquery[]) ,
    OPERATOR 17 ?(lquery[],ltree) ,
    FUNCTION 1 ltree_consistent(internal,internal,smallint) ,
    FUNCTION 2 ltree_union(internal,internal) ,
    FUNCTION 3 ltree_compress(internal) ,
    FUNCTION 4 ltree_decompress(internal) ,
    FUNCTION 5 ltree_penalty(internal,internal,internal) ,
    FUNCTION 6 ltree_picksplit(internal,internal) ,
    FUNCTION 7 ltree_same(internal,internal,internal);


--
-- TOC entry 2330 (class 2616 OID 16515)
-- Dependencies: 102 103 30 104 105 107 4 1132 106
-- Name: gist_macaddr_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_macaddr_ops
    DEFAULT FOR TYPE macaddr USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(macaddr,macaddr) ,
    OPERATOR 2 <=(macaddr,macaddr) ,
    OPERATOR 3 =(macaddr,macaddr) ,
    OPERATOR 4 >=(macaddr,macaddr) ,
    OPERATOR 5 >(macaddr,macaddr) ,
    FUNCTION 1 gbt_macad_consistent(internal,macaddr,smallint) ,
    FUNCTION 2 gbt_macad_union(bytea,internal) ,
    FUNCTION 3 gbt_macad_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_macad_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_macad_picksplit(internal,internal) ,
    FUNCTION 7 gbt_macad_same(internal,internal,internal);


--
-- TOC entry 2334 (class 2616 OID 16539)
-- Dependencies: 1138 124 126 122 4 32 123 125 127
-- Name: gist_numeric_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_numeric_ops
    DEFAULT FOR TYPE numeric USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(numeric,numeric) ,
    OPERATOR 2 <=(numeric,numeric) ,
    OPERATOR 3 =(numeric,numeric) ,
    OPERATOR 4 >=(numeric,numeric) ,
    OPERATOR 5 >(numeric,numeric) ,
    FUNCTION 1 gbt_numeric_consistent(internal,numeric,smallint) ,
    FUNCTION 2 gbt_numeric_union(bytea,internal) ,
    FUNCTION 3 gbt_numeric_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_numeric_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_numeric_picksplit(internal,internal) ,
    FUNCTION 7 gbt_numeric_same(internal,internal,internal);


--
-- TOC entry 2317 (class 2616 OID 16431)
-- Dependencies: 35 4 28 1129 29 30 33 34 36
-- Name: gist_oid_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_oid_ops
    DEFAULT FOR TYPE oid USING gist AS
    STORAGE gbtreekey8 ,
    OPERATOR 1 <(oid,oid) ,
    OPERATOR 2 <=(oid,oid) ,
    OPERATOR 3 =(oid,oid) ,
    OPERATOR 4 >=(oid,oid) ,
    OPERATOR 5 >(oid,oid) ,
    FUNCTION 1 gbt_oid_consistent(internal,oid,smallint) ,
    FUNCTION 2 gbt_oid_union(bytea,internal) ,
    FUNCTION 3 gbt_oid_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_oid_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_oid_picksplit(internal,internal) ,
    FUNCTION 7 gbt_oid_same(internal,internal,internal);


--
-- TOC entry 2367 (class 2616 OID 17545)
-- Dependencies: 718 723 2185 2181 1213 4 719 720 721 722 724 2182 2186 2188 2189 2184 2183 2190 2191
-- Name: gist_seg_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_seg_ops
    DEFAULT FOR TYPE seg USING gist AS
    OPERATOR 1 <<(seg,seg) ,
    OPERATOR 2 &<(seg,seg) ,
    OPERATOR 3 &&(seg,seg) ,
    OPERATOR 4 &>(seg,seg) ,
    OPERATOR 5 >>(seg,seg) ,
    OPERATOR 6 =(seg,seg) ,
    OPERATOR 7 @>(seg,seg) ,
    OPERATOR 8 <@(seg,seg) ,
    OPERATOR 13 @(seg,seg) ,
    OPERATOR 14 ~(seg,seg) ,
    FUNCTION 1 gseg_consistent(internal,seg,integer) ,
    FUNCTION 2 gseg_union(internal,internal) ,
    FUNCTION 3 gseg_compress(internal) ,
    FUNCTION 4 gseg_decompress(internal) ,
    FUNCTION 5 gseg_penalty(internal,internal,internal) ,
    FUNCTION 6 gseg_picksplit(internal,internal) ,
    FUNCTION 7 gseg_same(seg,seg,internal);


--
-- TOC entry 2331 (class 2616 OID 16524)
-- Dependencies: 1138 115 113 112 4 32 110 114 108
-- Name: gist_text_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_text_ops
    DEFAULT FOR TYPE text USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(text,text) ,
    OPERATOR 2 <=(text,text) ,
    OPERATOR 3 =(text,text) ,
    OPERATOR 4 >=(text,text) ,
    OPERATOR 5 >(text,text) ,
    FUNCTION 1 gbt_text_consistent(internal,text,smallint) ,
    FUNCTION 2 gbt_text_union(bytea,internal) ,
    FUNCTION 3 gbt_text_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_text_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_text_picksplit(internal,internal) ,
    FUNCTION 7 gbt_text_same(internal,internal,internal);


--
-- TOC entry 2325 (class 2616 OID 16485)
-- Dependencies: 82 4 1132 80 79 30 77 81 75
-- Name: gist_time_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_time_ops
    DEFAULT FOR TYPE time without time zone USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(time without time zone,time without time zone) ,
    OPERATOR 2 <=(time without time zone,time without time zone) ,
    OPERATOR 3 =(time without time zone,time without time zone) ,
    OPERATOR 4 >=(time without time zone,time without time zone) ,
    OPERATOR 5 >(time without time zone,time without time zone) ,
    FUNCTION 1 gbt_time_consistent(internal,time without time zone,smallint) ,
    FUNCTION 2 gbt_time_union(bytea,internal) ,
    FUNCTION 3 gbt_time_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_time_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_time_picksplit(internal,internal) ,
    FUNCTION 7 gbt_time_same(internal,internal,internal);


--
-- TOC entry 2323 (class 2616 OID 16475)
-- Dependencies: 73 69 30 71 72 74 67 1132 4
-- Name: gist_timestamp_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_timestamp_ops
    DEFAULT FOR TYPE timestamp without time zone USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(timestamp without time zone,timestamp without time zone) ,
    OPERATOR 2 <=(timestamp without time zone,timestamp without time zone) ,
    OPERATOR 3 =(timestamp without time zone,timestamp without time zone) ,
    OPERATOR 4 >=(timestamp without time zone,timestamp without time zone) ,
    OPERATOR 5 >(timestamp without time zone,timestamp without time zone) ,
    FUNCTION 1 gbt_ts_consistent(internal,timestamp without time zone,smallint) ,
    FUNCTION 2 gbt_ts_union(bytea,internal) ,
    FUNCTION 3 gbt_ts_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_ts_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_ts_picksplit(internal,internal) ,
    FUNCTION 7 gbt_ts_same(internal,internal,internal);


--
-- TOC entry 2324 (class 2616 OID 16476)
-- Dependencies: 73 70 30 71 72 74 68 1132 4
-- Name: gist_timestamptz_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_timestamptz_ops
    DEFAULT FOR TYPE timestamp with time zone USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(timestamp with time zone,timestamp with time zone) ,
    OPERATOR 2 <=(timestamp with time zone,timestamp with time zone) ,
    OPERATOR 3 =(timestamp with time zone,timestamp with time zone) ,
    OPERATOR 4 >=(timestamp with time zone,timestamp with time zone) ,
    OPERATOR 5 >(timestamp with time zone,timestamp with time zone) ,
    FUNCTION 1 gbt_tstz_consistent(internal,timestamp with time zone,smallint) ,
    FUNCTION 2 gbt_ts_union(bytea,internal) ,
    FUNCTION 3 gbt_tstz_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_ts_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_ts_picksplit(internal,internal) ,
    FUNCTION 7 gbt_ts_same(internal,internal,internal);


--
-- TOC entry 2326 (class 2616 OID 16486)
-- Dependencies: 30 81 76 1132 4 82 80 79 78
-- Name: gist_timetz_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_timetz_ops
    DEFAULT FOR TYPE time with time zone USING gist AS
    STORAGE gbtreekey16 ,
    OPERATOR 1 <(time with time zone,time with time zone) RECHECK ,
    OPERATOR 2 <=(time with time zone,time with time zone) RECHECK ,
    OPERATOR 3 =(time with time zone,time with time zone) RECHECK ,
    OPERATOR 4 >=(time with time zone,time with time zone) RECHECK ,
    OPERATOR 5 >(time with time zone,time with time zone) RECHECK ,
    FUNCTION 1 gbt_timetz_consistent(internal,time with time zone,smallint) ,
    FUNCTION 2 gbt_time_union(bytea,internal) ,
    FUNCTION 3 gbt_timetz_compress(internal) ,
    FUNCTION 4 gbt_decompress(internal) ,
    FUNCTION 5 gbt_time_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_time_picksplit(internal,internal) ,
    FUNCTION 7 gbt_time_same(internal,internal,internal);


--
-- TOC entry 2371 (class 2616 OID 17852)
-- Dependencies: 861 862 863 866 864 4 1232 1240 2210 2211 2212 2213 860 865
-- Name: gist_tp_tsquery_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_tp_tsquery_ops
    DEFAULT FOR TYPE tsquery USING gist AS
    STORAGE gtsq ,
    OPERATOR 7 @>(tsquery,tsquery) RECHECK ,
    OPERATOR 8 <@(tsquery,tsquery) RECHECK ,
    OPERATOR 13 @(tsquery,tsquery) RECHECK ,
    OPERATOR 14 ~(tsquery,tsquery) RECHECK ,
    FUNCTION 1 gtsq_consistent(gtsq,internal,integer) ,
    FUNCTION 2 gtsq_union(bytea,internal) ,
    FUNCTION 3 gtsq_compress(internal) ,
    FUNCTION 4 gtsq_decompress(internal) ,
    FUNCTION 5 gtsq_penalty(internal,internal,internal) ,
    FUNCTION 6 gtsq_picksplit(internal,internal) ,
    FUNCTION 7 gtsq_same(gtsq,gtsq,internal);


--
-- TOC entry 2365 (class 2616 OID 17448)
-- Dependencies: 651 4 1205 2176 650 655 652 653 654 656
-- Name: gist_trgm_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_trgm_ops
    FOR TYPE text USING gist AS
    STORAGE gtrgm ,
    OPERATOR 1 %(text,text) ,
    FUNCTION 1 gtrgm_consistent(gtrgm,internal,integer) ,
    FUNCTION 2 gtrgm_union(bytea,internal) ,
    FUNCTION 3 gtrgm_compress(internal) ,
    FUNCTION 4 gtrgm_decompress(internal) ,
    FUNCTION 5 gtrgm_penalty(internal,internal,internal) ,
    FUNCTION 6 gtrgm_picksplit(internal,internal) ,
    FUNCTION 7 gtrgm_same(gtrgm,gtrgm,internal);


--
-- TOC entry 2368 (class 2616 OID 17784)
-- Dependencies: 1229 824 823 822 826 821 2193 4 1235 827 825
-- Name: gist_tsvector_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_tsvector_ops
    DEFAULT FOR TYPE tsvector USING gist AS
    STORAGE gtsvector ,
    OPERATOR 1 @@(tsvector,tsquery) RECHECK ,
    FUNCTION 1 gtsvector_consistent(gtsvector,internal,integer) ,
    FUNCTION 2 gtsvector_union(internal,internal) ,
    FUNCTION 3 gtsvector_compress(internal) ,
    FUNCTION 4 gtsvector_decompress(internal) ,
    FUNCTION 5 gtsvector_penalty(internal,internal,internal) ,
    FUNCTION 6 gtsvector_picksplit(internal,internal) ,
    FUNCTION 7 gtsvector_same(gtsvector,gtsvector,internal);


--
-- TOC entry 2336 (class 2616 OID 16547)
-- Dependencies: 133 4 1138 128 132 129 32 130 131
-- Name: gist_vbit_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_vbit_ops
    DEFAULT FOR TYPE bit varying USING gist AS
    STORAGE gbtreekey_var ,
    OPERATOR 1 <(bit varying,bit varying) ,
    OPERATOR 2 <=(bit varying,bit varying) ,
    OPERATOR 3 =(bit varying,bit varying) ,
    OPERATOR 4 >=(bit varying,bit varying) ,
    OPERATOR 5 >(bit varying,bit varying) ,
    FUNCTION 1 gbt_bit_consistent(internal,bit,smallint) ,
    FUNCTION 2 gbt_bit_union(bytea,internal) ,
    FUNCTION 3 gbt_bit_compress(internal) ,
    FUNCTION 4 gbt_var_decompress(internal) ,
    FUNCTION 5 gbt_bit_penalty(internal,internal,internal) ,
    FUNCTION 6 gbt_bit_picksplit(internal,internal) ,
    FUNCTION 7 gbt_bit_same(internal,internal,internal);


--
-- TOC entry 2348 (class 2616 OID 17171)
-- Dependencies: 501 2029 1975 2022 2028 1974 2021 2027 1973 2020 2026 1972 2019 2025 1971 1168 4 502 500 2023
-- Name: isbn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS isbn13_ops
    DEFAULT FOR TYPE isbn13 USING btree AS
    OPERATOR 1 <(isbn13,ean13) ,
    OPERATOR 1 <(isbn13,isbn) ,
    OPERATOR 1 <(isbn13,isbn13) ,
    OPERATOR 2 <=(isbn13,ean13) ,
    OPERATOR 2 <=(isbn13,isbn) ,
    OPERATOR 2 <=(isbn13,isbn13) ,
    OPERATOR 3 =(isbn13,ean13) ,
    OPERATOR 3 =(isbn13,isbn) ,
    OPERATOR 3 =(isbn13,isbn13) ,
    OPERATOR 4 >=(isbn13,ean13) ,
    OPERATOR 4 >=(isbn13,isbn) ,
    OPERATOR 4 >=(isbn13,isbn13) ,
    OPERATOR 5 >(isbn13,ean13) ,
    OPERATOR 5 >(isbn13,isbn) ,
    OPERATOR 5 >(isbn13,isbn13) ,
    FUNCTION 1 btisbn13cmp(isbn13,ean13) ,
    FUNCTION 1 btisbn13cmp(isbn13,isbn) ,
    FUNCTION 1 btisbn13cmp(isbn13,isbn13);


--
-- TOC entry 2349 (class 2616 OID 17173)
-- Dependencies: 4 1168 2021 503
-- Name: isbn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS isbn13_ops
    DEFAULT FOR TYPE isbn13 USING hash AS
    OPERATOR 1 =(isbn13,isbn13) ,
    FUNCTION 1 hashisbn13(isbn13);


--
-- TOC entry 2350 (class 2616 OID 17177)
-- Dependencies: 1177 504 506 505 2035 2041 2047 2034 2040 2046 2033 2039 2045 2032 2038 2044 2031 2037 2043 4
-- Name: isbn_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS isbn_ops
    DEFAULT FOR TYPE isbn USING btree AS
    OPERATOR 1 <(isbn,ean13) ,
    OPERATOR 1 <(isbn,isbn13) ,
    OPERATOR 1 <(isbn,isbn) ,
    OPERATOR 2 <=(isbn,ean13) ,
    OPERATOR 2 <=(isbn,isbn13) ,
    OPERATOR 2 <=(isbn,isbn) ,
    OPERATOR 3 =(isbn,ean13) ,
    OPERATOR 3 =(isbn,isbn13) ,
    OPERATOR 3 =(isbn,isbn) ,
    OPERATOR 4 >=(isbn,ean13) ,
    OPERATOR 4 >=(isbn,isbn13) ,
    OPERATOR 4 >=(isbn,isbn) ,
    OPERATOR 5 >(isbn,ean13) ,
    OPERATOR 5 >(isbn,isbn13) ,
    OPERATOR 5 >(isbn,isbn) ,
    FUNCTION 1 btisbncmp(isbn,ean13) ,
    FUNCTION 1 btisbncmp(isbn,isbn13) ,
    FUNCTION 1 btisbncmp(isbn,isbn);


--
-- TOC entry 2351 (class 2616 OID 17179)
-- Dependencies: 4 1177 2033 507
-- Name: isbn_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS isbn_ops
    DEFAULT FOR TYPE isbn USING hash AS
    OPERATOR 1 =(isbn,isbn) ,
    FUNCTION 1 hashisbn(isbn);


--
-- TOC entry 2352 (class 2616 OID 17183)
-- Dependencies: 2055 509 2053 2059 1987 2052 2058 1986 2051 2057 1985 2050 2056 1984 2049 510 1983 1171 4 508
-- Name: ismn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS ismn13_ops
    DEFAULT FOR TYPE ismn13 USING btree AS
    OPERATOR 1 <(ismn13,ean13) ,
    OPERATOR 1 <(ismn13,ismn) ,
    OPERATOR 1 <(ismn13,ismn13) ,
    OPERATOR 2 <=(ismn13,ean13) ,
    OPERATOR 2 <=(ismn13,ismn) ,
    OPERATOR 2 <=(ismn13,ismn13) ,
    OPERATOR 3 =(ismn13,ean13) ,
    OPERATOR 3 =(ismn13,ismn) ,
    OPERATOR 3 =(ismn13,ismn13) ,
    OPERATOR 4 >=(ismn13,ean13) ,
    OPERATOR 4 >=(ismn13,ismn) ,
    OPERATOR 4 >=(ismn13,ismn13) ,
    OPERATOR 5 >(ismn13,ean13) ,
    OPERATOR 5 >(ismn13,ismn) ,
    OPERATOR 5 >(ismn13,ismn13) ,
    FUNCTION 1 btismn13cmp(ismn13,ean13) ,
    FUNCTION 1 btismn13cmp(ismn13,ismn) ,
    FUNCTION 1 btismn13cmp(ismn13,ismn13);


--
-- TOC entry 2353 (class 2616 OID 17185)
-- Dependencies: 4 2051 1171 511
-- Name: ismn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS ismn13_ops
    DEFAULT FOR TYPE ismn13 USING hash AS
    OPERATOR 1 =(ismn13,ismn13) ,
    FUNCTION 1 hashismn13(ismn13);


--
-- TOC entry 2354 (class 2616 OID 17189)
-- Dependencies: 4 1180 2073 2067 2061 2074 2068 2062 2075 2069 2063 2076 2070 2064 2077 2071 2065 513 514 512
-- Name: ismn_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS ismn_ops
    DEFAULT FOR TYPE ismn USING btree AS
    OPERATOR 1 <(ismn,ean13) ,
    OPERATOR 1 <(ismn,ismn13) ,
    OPERATOR 1 <(ismn,ismn) ,
    OPERATOR 2 <=(ismn,ean13) ,
    OPERATOR 2 <=(ismn,ismn13) ,
    OPERATOR 2 <=(ismn,ismn) ,
    OPERATOR 3 =(ismn,ean13) ,
    OPERATOR 3 =(ismn,ismn13) ,
    OPERATOR 3 =(ismn,ismn) ,
    OPERATOR 4 >=(ismn,ean13) ,
    OPERATOR 4 >=(ismn,ismn13) ,
    OPERATOR 4 >=(ismn,ismn) ,
    OPERATOR 5 >(ismn,ean13) ,
    OPERATOR 5 >(ismn,ismn13) ,
    OPERATOR 5 >(ismn,ismn) ,
    FUNCTION 1 btismncmp(ismn,ean13) ,
    FUNCTION 1 btismncmp(ismn,ismn13) ,
    FUNCTION 1 btismncmp(ismn,ismn);


--
-- TOC entry 2355 (class 2616 OID 17191)
-- Dependencies: 2063 4 1180 515
-- Name: ismn_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS ismn_ops
    DEFAULT FOR TYPE ismn USING hash AS
    OPERATOR 1 =(ismn,ismn) ,
    FUNCTION 1 hashismn(ismn);


--
-- TOC entry 2356 (class 2616 OID 17195)
-- Dependencies: 4 1174 2091 2085 2079 2092 2086 2080 2093 2087 2081 2094 2088 2082 2095 2089 2083 517 518 516
-- Name: issn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS issn13_ops
    DEFAULT FOR TYPE issn13 USING btree AS
    OPERATOR 1 <(issn13,ean13) ,
    OPERATOR 1 <(issn13,issn) ,
    OPERATOR 1 <(issn13,issn13) ,
    OPERATOR 2 <=(issn13,ean13) ,
    OPERATOR 2 <=(issn13,issn) ,
    OPERATOR 2 <=(issn13,issn13) ,
    OPERATOR 3 =(issn13,ean13) ,
    OPERATOR 3 =(issn13,issn) ,
    OPERATOR 3 =(issn13,issn13) ,
    OPERATOR 4 >=(issn13,ean13) ,
    OPERATOR 4 >=(issn13,issn) ,
    OPERATOR 4 >=(issn13,issn13) ,
    OPERATOR 5 >(issn13,ean13) ,
    OPERATOR 5 >(issn13,issn) ,
    OPERATOR 5 >(issn13,issn13) ,
    FUNCTION 1 btissn13cmp(issn13,ean13) ,
    FUNCTION 1 btissn13cmp(issn13,issn) ,
    FUNCTION 1 btissn13cmp(issn13,issn13);


--
-- TOC entry 2357 (class 2616 OID 17197)
-- Dependencies: 4 2081 519 1174
-- Name: issn13_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS issn13_ops
    DEFAULT FOR TYPE issn13 USING hash AS
    OPERATOR 1 =(issn13,issn13) ,
    FUNCTION 1 hashissn13(issn13);


--
-- TOC entry 2358 (class 2616 OID 17201)
-- Dependencies: 2099 4 1183 2109 2103 2097 2110 2104 2098 2111 2105 2112 2106 2100 2113 2107 2101 521 522 520
-- Name: issn_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS issn_ops
    DEFAULT FOR TYPE issn USING btree AS
    OPERATOR 1 <(issn,ean13) ,
    OPERATOR 1 <(issn,issn13) ,
    OPERATOR 1 <(issn,issn) ,
    OPERATOR 2 <=(issn,ean13) ,
    OPERATOR 2 <=(issn,issn13) ,
    OPERATOR 2 <=(issn,issn) ,
    OPERATOR 3 =(issn,ean13) ,
    OPERATOR 3 =(issn,issn13) ,
    OPERATOR 3 =(issn,issn) ,
    OPERATOR 4 >=(issn,ean13) ,
    OPERATOR 4 >=(issn,issn13) ,
    OPERATOR 4 >=(issn,issn) ,
    OPERATOR 5 >(issn,ean13) ,
    OPERATOR 5 >(issn,issn13) ,
    OPERATOR 5 >(issn,issn) ,
    FUNCTION 1 btissncmp(issn,ean13) ,
    FUNCTION 1 btissncmp(issn,issn13) ,
    FUNCTION 1 btissncmp(issn,issn);


--
-- TOC entry 2359 (class 2616 OID 17203)
-- Dependencies: 523 2099 1183 4
-- Name: issn_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS issn_ops
    DEFAULT FOR TYPE issn USING hash AS
    OPERATOR 1 =(issn,issn) ,
    FUNCTION 1 hashissn(issn);


--
-- TOC entry 2362 (class 2616 OID 17335)
-- Dependencies: 2129 1190 2127 2131 4 2130 572 2128
-- Name: ltree_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS ltree_ops
    DEFAULT FOR TYPE ltree USING btree AS
    OPERATOR 1 <(ltree,ltree) ,
    OPERATOR 2 <=(ltree,ltree) ,
    OPERATOR 3 =(ltree,ltree) ,
    OPERATOR 4 >=(ltree,ltree) ,
    OPERATOR 5 >(ltree,ltree) ,
    FUNCTION 1 ltree_cmp(ltree,ltree);


--
-- TOC entry 2366 (class 2616 OID 17544)
-- Dependencies: 712 2179 2180 2186 2178 2177 1213 4
-- Name: seg_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS seg_ops
    DEFAULT FOR TYPE seg USING btree AS
    OPERATOR 1 <(seg,seg) ,
    OPERATOR 2 <=(seg,seg) ,
    OPERATOR 3 =(seg,seg) ,
    OPERATOR 4 >=(seg,seg) ,
    OPERATOR 5 >(seg,seg) ,
    FUNCTION 1 seg_cmp(seg,seg);


--
-- TOC entry 2370 (class 2616 OID 17822)
-- Dependencies: 2204 4 1232 2201 2202 2205 2203 841
-- Name: tsquery_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS tsquery_ops
    DEFAULT FOR TYPE tsquery USING btree AS
    OPERATOR 1 <(tsquery,tsquery) ,
    OPERATOR 2 <=(tsquery,tsquery) ,
    OPERATOR 3 =(tsquery,tsquery) ,
    OPERATOR 4 >=(tsquery,tsquery) ,
    OPERATOR 5 >(tsquery,tsquery) ,
    FUNCTION 1 tsquery_cmp(tsquery,tsquery);


--
-- TOC entry 2369 (class 2616 OID 17808)
-- Dependencies: 834 2198 2197 2199 2196 2195 1229 4
-- Name: tsvector_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS tsvector_ops
    DEFAULT FOR TYPE tsvector USING btree AS
    OPERATOR 1 <(tsvector,tsvector) ,
    OPERATOR 2 <=(tsvector,tsvector) ,
    OPERATOR 3 =(tsvector,tsvector) ,
    OPERATOR 4 >=(tsvector,tsvector) ,
    OPERATOR 5 >(tsvector,tsvector) ,
    FUNCTION 1 tsvector_cmp(tsvector,tsvector);


--
-- TOC entry 2360 (class 2616 OID 17206)
-- Dependencies: 2117 4 524 2125 2118 525 2124 2119 1186 2123 2121 2116 2122 2115
-- Name: upc_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS upc_ops
    DEFAULT FOR TYPE upc USING btree AS
    OPERATOR 1 <(upc,ean13) ,
    OPERATOR 1 <(upc,upc) ,
    OPERATOR 2 <=(upc,ean13) ,
    OPERATOR 2 <=(upc,upc) ,
    OPERATOR 3 =(upc,ean13) ,
    OPERATOR 3 =(upc,upc) ,
    OPERATOR 4 >=(upc,ean13) ,
    OPERATOR 4 >=(upc,upc) ,
    OPERATOR 5 >(upc,ean13) ,
    OPERATOR 5 >(upc,upc) ,
    FUNCTION 1 btupccmp(upc,ean13) ,
    FUNCTION 1 btupccmp(upc,upc);


--
-- TOC entry 2361 (class 2616 OID 17208)
-- Dependencies: 526 4 1186 2117
-- Name: upc_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS upc_ops
    DEFAULT FOR TYPE upc USING hash AS
    OPERATOR 1 =(upc,upc) ,
    FUNCTION 1 hashupc(upc);


SET search_path = pg_catalog;

--
-- TOC entry 2981 (class 2605 OID 17233)
-- Dependencies: 530 1177 530 1165
-- Name: CAST (public.ean13 AS public.isbn); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ean13 AS public.isbn) WITH FUNCTION public.isbn(public.ean13);


--
-- TOC entry 2978 (class 2605 OID 17232)
-- Dependencies: 527 527 1168 1165
-- Name: CAST (public.ean13 AS public.isbn13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ean13 AS public.isbn13) WITH FUNCTION public.isbn13(public.ean13);


--
-- TOC entry 2982 (class 2605 OID 17235)
-- Dependencies: 531 1165 531 1180
-- Name: CAST (public.ean13 AS public.ismn); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ean13 AS public.ismn) WITH FUNCTION public.ismn(public.ean13);


--
-- TOC entry 2979 (class 2605 OID 17234)
-- Dependencies: 528 1165 1171 528
-- Name: CAST (public.ean13 AS public.ismn13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ean13 AS public.ismn13) WITH FUNCTION public.ismn13(public.ean13);


--
-- TOC entry 2983 (class 2605 OID 17237)
-- Dependencies: 532 532 1165 1183
-- Name: CAST (public.ean13 AS public.issn); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ean13 AS public.issn) WITH FUNCTION public.issn(public.ean13);


--
-- TOC entry 2980 (class 2605 OID 17236)
-- Dependencies: 529 1165 529 1174
-- Name: CAST (public.ean13 AS public.issn13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ean13 AS public.issn13) WITH FUNCTION public.issn13(public.ean13);


--
-- TOC entry 2977 (class 2605 OID 17260)
-- Dependencies: 542 542 1165
-- Name: CAST (public.ean13 AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ean13 AS text) WITH FUNCTION public.text(public.ean13);


--
-- TOC entry 2984 (class 2605 OID 17238)
-- Dependencies: 533 533 1165 1186
-- Name: CAST (public.ean13 AS public.upc); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ean13 AS public.upc) WITH FUNCTION public.upc(public.ean13);


--
-- TOC entry 2995 (class 2605 OID 17240)
-- Dependencies: 1165 1177
-- Name: CAST (public.isbn AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.isbn AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2996 (class 2605 OID 17246)
-- Dependencies: 1168 1177
-- Name: CAST (public.isbn AS public.isbn13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.isbn AS public.isbn13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2994 (class 2605 OID 17264)
-- Dependencies: 546 1177 546
-- Name: CAST (public.isbn AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.isbn AS text) WITH FUNCTION public.text(public.isbn);


--
-- TOC entry 2986 (class 2605 OID 17239)
-- Dependencies: 1168 1165
-- Name: CAST (public.isbn13 AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.isbn13 AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2987 (class 2605 OID 17247)
-- Dependencies: 1168 1177
-- Name: CAST (public.isbn13 AS public.isbn); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.isbn13 AS public.isbn) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2985 (class 2605 OID 17261)
-- Dependencies: 543 543 1168
-- Name: CAST (public.isbn13 AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.isbn13 AS text) WITH FUNCTION public.text(public.isbn13);


--
-- TOC entry 2998 (class 2605 OID 17242)
-- Dependencies: 1165 1180
-- Name: CAST (public.ismn AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ismn AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2999 (class 2605 OID 17248)
-- Dependencies: 1180 1171
-- Name: CAST (public.ismn AS public.ismn13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ismn AS public.ismn13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2997 (class 2605 OID 17265)
-- Dependencies: 547 547 1180
-- Name: CAST (public.ismn AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ismn AS text) WITH FUNCTION public.text(public.ismn);


--
-- TOC entry 2989 (class 2605 OID 17241)
-- Dependencies: 1171 1165
-- Name: CAST (public.ismn13 AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ismn13 AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2990 (class 2605 OID 17249)
-- Dependencies: 1180 1171
-- Name: CAST (public.ismn13 AS public.ismn); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ismn13 AS public.ismn) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2988 (class 2605 OID 17262)
-- Dependencies: 544 1171 544
-- Name: CAST (public.ismn13 AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.ismn13 AS text) WITH FUNCTION public.text(public.ismn13);


--
-- TOC entry 3001 (class 2605 OID 17244)
-- Dependencies: 1165 1183
-- Name: CAST (public.issn AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.issn AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 3002 (class 2605 OID 17250)
-- Dependencies: 1183 1174
-- Name: CAST (public.issn AS public.issn13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.issn AS public.issn13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 3000 (class 2605 OID 17266)
-- Dependencies: 548 548 1183
-- Name: CAST (public.issn AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.issn AS text) WITH FUNCTION public.text(public.issn);


--
-- TOC entry 2992 (class 2605 OID 17243)
-- Dependencies: 1174 1165
-- Name: CAST (public.issn13 AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.issn13 AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2993 (class 2605 OID 17251)
-- Dependencies: 1174 1183
-- Name: CAST (public.issn13 AS public.issn); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.issn13 AS public.issn) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 2991 (class 2605 OID 17263)
-- Dependencies: 545 545 1174
-- Name: CAST (public.issn13 AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.issn13 AS text) WITH FUNCTION public.text(public.issn13);


--
-- TOC entry 2796 (class 2605 OID 16573)
-- Dependencies: 149 1144 149
-- Name: CAST (text AS public.cube); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.cube) WITH FUNCTION public.cube(text) AS ASSIGNMENT;


--
-- TOC entry 2797 (class 2605 OID 17252)
-- Dependencies: 534 534 1165
-- Name: CAST (text AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.ean13) WITH FUNCTION public.ean13(text);


--
-- TOC entry 2801 (class 2605 OID 17256)
-- Dependencies: 538 538 1177
-- Name: CAST (text AS public.isbn); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.isbn) WITH FUNCTION public.isbn(text);


--
-- TOC entry 2798 (class 2605 OID 17253)
-- Dependencies: 535 535 1168
-- Name: CAST (text AS public.isbn13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.isbn13) WITH FUNCTION public.isbn13(text);


--
-- TOC entry 2802 (class 2605 OID 17257)
-- Dependencies: 539 539 1180
-- Name: CAST (text AS public.ismn); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.ismn) WITH FUNCTION public.ismn(text);


--
-- TOC entry 2799 (class 2605 OID 17254)
-- Dependencies: 536 536 1171
-- Name: CAST (text AS public.ismn13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.ismn13) WITH FUNCTION public.ismn13(text);


--
-- TOC entry 2803 (class 2605 OID 17258)
-- Dependencies: 540 1183 540
-- Name: CAST (text AS public.issn); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.issn) WITH FUNCTION public.issn(text);


--
-- TOC entry 2800 (class 2605 OID 17255)
-- Dependencies: 537 537 1174
-- Name: CAST (text AS public.issn13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.issn13) WITH FUNCTION public.issn13(text);


--
-- TOC entry 2804 (class 2605 OID 17259)
-- Dependencies: 541 541 1186
-- Name: CAST (text AS public.upc); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.upc) WITH FUNCTION public.upc(text);


--
-- TOC entry 3004 (class 2605 OID 17245)
-- Dependencies: 1165 1186
-- Name: CAST (public.upc AS public.ean13); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.upc AS public.ean13) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- TOC entry 3003 (class 2605 OID 17267)
-- Dependencies: 549 1186 549
-- Name: CAST (public.upc AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.upc AS text) WITH FUNCTION public.text(public.upc);


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 2631 (class 1259 OID 18309)
-- Dependencies: 4
-- Name: kategorie; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE kategorie (
    id integer NOT NULL,
    name character varying,
    symbol integer
);


--
-- TOC entry 2611 (class 1259 OID 17420)
-- Dependencies: 2709 4
-- Name: pg_buffercache; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW pg_buffercache AS
    SELECT p.bufferid, p.relfilenode, p.reltablespace, p.reldatabase, p.relblocknumber, p.isdirty FROM pg_buffercache_pages() p(bufferid integer, relfilenode oid, reltablespace oid, reldatabase oid, relblocknumber bigint, isdirty boolean);


--
-- TOC entry 2612 (class 1259 OID 17425)
-- Dependencies: 2710 4
-- Name: pg_freespacemap_pages; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW pg_freespacemap_pages AS
    SELECT p.reltablespace, p.reldatabase, p.relfilenode, p.relblocknumber, p.bytes FROM pg_freespacemap_pages() p(reltablespace oid, reldatabase oid, relfilenode oid, relblocknumber bigint, bytes integer);


--
-- TOC entry 2613 (class 1259 OID 17428)
-- Dependencies: 2711 4
-- Name: pg_freespacemap_relations; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW pg_freespacemap_relations AS
    SELECT p.reltablespace, p.reldatabase, p.relfilenode, p.avgrequest, p.interestingpages, p.storedpages, p.nextpage FROM pg_freespacemap_relations() p(reltablespace oid, reldatabase oid, relfilenode oid, avgrequest integer, interestingpages integer, storedpages integer, nextpage integer);


SET default_with_oids = true;

--
-- TOC entry 2626 (class 1259 OID 17634)
-- Dependencies: 4
-- Name: pg_ts_cfg; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pg_ts_cfg (
    ts_name text NOT NULL,
    prs_name text NOT NULL,
    locale text
);


--
-- TOC entry 2627 (class 1259 OID 17641)
-- Dependencies: 4
-- Name: pg_ts_cfgmap; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pg_ts_cfgmap (
    ts_name text NOT NULL,
    tok_alias text NOT NULL,
    dict_name text[]
);


--
-- TOC entry 2622 (class 1259 OID 17578)
-- Dependencies: 4
-- Name: pg_ts_dict; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pg_ts_dict (
    dict_name text NOT NULL,
    dict_init regprocedure,
    dict_initoption text,
    dict_lexize regprocedure NOT NULL,
    dict_comment text
);


--
-- TOC entry 2623 (class 1259 OID 17609)
-- Dependencies: 4
-- Name: pg_ts_parser; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pg_ts_parser (
    prs_name text NOT NULL,
    prs_start regprocedure NOT NULL,
    prs_nexttoken regprocedure NOT NULL,
    prs_end regprocedure NOT NULL,
    prs_headline regprocedure NOT NULL,
    prs_lextype regprocedure NOT NULL,
    prs_comment text
);


SET default_with_oids = false;

--
-- TOC entry 2630 (class 1259 OID 18304)
-- Dependencies: 4
-- Name: poi; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE poi (
    id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    elevation double precision,
    name character varying,
    description character varying,
    "comment" character varying,
    source character varying,
    link character varying,
    symbol integer,
    "type" integer,
    category integer
);


--
-- TOC entry 2633 (class 1259 OID 18316)
-- Dependencies: 4
-- Name: symbol; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE symbol (
    id integer NOT NULL,
    "type" character varying,
    img character varying
);


--
-- TOC entry 2632 (class 1259 OID 18314)
-- Dependencies: 4
-- Name: typ; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE typ (
    id integer
);


--
-- TOC entry 2634 (class 1259 OID 18321)
-- Dependencies: 4
-- Name: wpt; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wpt (
    id integer,
    "time" timestamp without time zone,
    fix character varying,
    sat integer,
    hdop integer,
    vdop integer,
    pdop integer,
    ageofdgpsdata integer,
    dgpsid integer
);


--
-- TOC entry 3010 (class 2606 OID 17640)
-- Dependencies: 2626 2626
-- Name: pg_ts_cfg_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pg_ts_cfg
    ADD CONSTRAINT pg_ts_cfg_pkey PRIMARY KEY (ts_name);


--
-- TOC entry 3012 (class 2606 OID 17647)
-- Dependencies: 2627 2627 2627
-- Name: pg_ts_cfgmap_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pg_ts_cfgmap
    ADD CONSTRAINT pg_ts_cfgmap_pkey PRIMARY KEY (ts_name, tok_alias);


--
-- TOC entry 3006 (class 2606 OID 17584)
-- Dependencies: 2622 2622
-- Name: pg_ts_dict_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pg_ts_dict
    ADD CONSTRAINT pg_ts_dict_pkey PRIMARY KEY (dict_name);


--
-- TOC entry 3008 (class 2606 OID 17615)
-- Dependencies: 2623 2623
-- Name: pg_ts_parser_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pg_ts_parser
    ADD CONSTRAINT pg_ts_parser_pkey PRIMARY KEY (prs_name);


--
-- TOC entry 3016 (class 2606 OID 18335)
-- Dependencies: 2631 2631
-- Name: pk_karegorie_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY kategorie
    ADD CONSTRAINT pk_karegorie_id PRIMARY KEY (id);


--
-- TOC entry 3014 (class 2606 OID 18337)
-- Dependencies: 2630 2630
-- Name: pk_poi_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY poi
    ADD CONSTRAINT pk_poi_id PRIMARY KEY (id);


--
-- TOC entry 3018 (class 2606 OID 18333)
-- Dependencies: 2633 2633
-- Name: pk_symbol_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY symbol
    ADD CONSTRAINT pk_symbol_id PRIMARY KEY (id);


--
-- TOC entry 3019 (class 2606 OID 18338)
-- Dependencies: 3017 2633 2630
-- Name: fk_poi_symbol_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY poi
    ADD CONSTRAINT fk_poi_symbol_id FOREIGN KEY (symbol) REFERENCES symbol(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 4
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM psqladmin;
GRANT ALL ON SCHEMA public TO psqladmin;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 640
-- Name: pg_buffercache_pages(); Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON FUNCTION pg_buffercache_pages() FROM PUBLIC;
REVOKE ALL ON FUNCTION pg_buffercache_pages() FROM psqladmin;
GRANT ALL ON FUNCTION pg_buffercache_pages() TO psqladmin;


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 641
-- Name: pg_freespacemap_pages(); Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON FUNCTION pg_freespacemap_pages() FROM PUBLIC;
REVOKE ALL ON FUNCTION pg_freespacemap_pages() FROM psqladmin;
GRANT ALL ON FUNCTION pg_freespacemap_pages() TO psqladmin;


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 642
-- Name: pg_freespacemap_relations(); Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON FUNCTION pg_freespacemap_relations() FROM PUBLIC;
REVOKE ALL ON FUNCTION pg_freespacemap_relations() FROM psqladmin;
GRANT ALL ON FUNCTION pg_freespacemap_relations() TO psqladmin;


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 2611
-- Name: pg_buffercache; Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON TABLE pg_buffercache FROM PUBLIC;
REVOKE ALL ON TABLE pg_buffercache FROM psqladmin;
GRANT ALL ON TABLE pg_buffercache TO psqladmin;


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 2612
-- Name: pg_freespacemap_pages; Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON TABLE pg_freespacemap_pages FROM PUBLIC;
REVOKE ALL ON TABLE pg_freespacemap_pages FROM psqladmin;
GRANT ALL ON TABLE pg_freespacemap_pages TO psqladmin;


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 2613
-- Name: pg_freespacemap_relations; Type: ACL; Schema: public; Owner: -
--

REVOKE ALL ON TABLE pg_freespacemap_relations FROM PUBLIC;
REVOKE ALL ON TABLE pg_freespacemap_relations FROM psqladmin;
GRANT ALL ON TABLE pg_freespacemap_relations TO psqladmin;


-- Completed on 2007-09-05 14:48:23

--
-- PostgreSQL database dump complete
--

