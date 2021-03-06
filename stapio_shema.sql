-- Table: ershkus_search_addr

-- DROP TABLE ershkus_search_addr;

CREATE TABLE ershkus_search_addr
(
id bigserial NOT NULL,
id_link_n BIGINT[],
id_link_w BIGINT[],
id_link_r BIGINT[],
full_name text,
region text,
region_id BIGINT,
district text,
district_id BIGINT,
city text,
city_id BIGINT,
village text,
village_id BIGINT,
street text,
housenumber text,
member_role text,
addr_type text,
index_name text,
addr_type_id INTEGER,
geom geometry,
c_geom geometry,
MODIFY BOOLEAN NOT NULL DEFAULT FALSE,
osm_id text[],
postcode text,
country text,
country_id BIGINT,
street_id BIGINT,
name text,
CONSTRAINT pk_ershkus_search_addr PRIMARY KEY (id ),
CONSTRAINT enforce_dims_c_geom CHECK (st_ndims(c_geom) = 2),
CONSTRAINT enforce_dims_geom CHECK (st_ndims(geom) = 2),
CONSTRAINT enforce_geotype_c_geom CHECK (geometrytype(c_geom) = 'POINT'::text OR c_geom IS NULL),
CONSTRAINT enforce_srid_c_geom CHECK (st_srid(c_geom) = 4326),
CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 4326)
)
WITH (
OIDS=FALSE
);
ALTER TABLE ershkus_search_addr
OWNER TO openstreetmap;
GRANT ALL ON TABLE ershkus_search_addr TO openstreetmap;
GRANT SELECT, UPDATE ON TABLE ershkus_search_addr TO openstreetmap;

-- Index: addr_type_id_idx

-- DROP INDEX addr_type_id_idx;

CREATE INDEX addr_type_id_idx
ON ershkus_search_addr
USING btree
(addr_type_id );

-- Index: ershkus_search_addr_geom_idx

-- DROP INDEX ershkus_search_addr_geom_idx;

CREATE INDEX ershkus_search_addr_geom_idx
ON ershkus_search_addr
USING gist
(geom );

-- Index: ershkus_search_addr_osm_id_idx

-- DROP INDEX ershkus_search_addr_osm_id_idx;

CREATE INDEX ershkus_search_addr_osm_id_idx
ON ershkus_search_addr
USING gin
(osm_id COLLATE pg_catalog."default" );

-- Table: ershkus_search_addr_p

-- DROP TABLE ershkus_search_addr_p;

CREATE TABLE ershkus_search_addr_p
(
id BIGINT NOT NULL DEFAULT NEXTVAL('ershkus_search_addr_id_seq'::regclass),
id_link_n BIGINT[],
id_link_w BIGINT[],
id_link_r BIGINT[],
full_name text,
region text,
region_id BIGINT,
district text,
district_id BIGINT,
city text,
city_id BIGINT,
village text,
village_id BIGINT,
street text,
housenumber text,
member_role text,
addr_type text,
addr_type_id INTEGER,
index_name text,
geom geometry,
c_geom geometry,
osm_id text[],
postcode text,
country text,
country_id BIGINT,
name text,
CONSTRAINT ershkus_search_addr_p_pk_ershkus_search_addr PRIMARY KEY (id ),
CONSTRAINT enforce_dims_c_geom CHECK (st_ndims(c_geom) = 2),
CONSTRAINT enforce_dims_geom CHECK (st_ndims(geom) = 2),
CONSTRAINT enforce_geotype_c_geom CHECK (geometrytype(c_geom) = 'POINT'::text OR c_geom IS NULL),
CONSTRAINT enforce_srid_c_geom CHECK (st_srid(c_geom) = 4326),
CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 4326)
)
WITH (
OIDS=FALSE
);
ALTER TABLE ershkus_search_addr_p
OWNER TO openstreetmap;
GRANT ALL ON TABLE ershkus_search_addr_p TO openstreetmap;
GRANT SELECT ON TABLE ershkus_search_addr_p TO openstreetmap;

-- Index: ershkus_search_addr_p_addr_type_id_idx

-- DROP INDEX ershkus_search_addr_p_addr_type_id_idx;

CREATE INDEX ershkus_search_addr_p_addr_type_id_idx
ON ershkus_search_addr_p
USING btree
(addr_type_id );

-- Index: ershkus_search_addr_p_geom_idx

-- DROP INDEX ershkus_search_addr_p_geom_idx;

CREATE INDEX ershkus_search_addr_p_geom_idx
ON ershkus_search_addr_p
USING gist
(geom );

-- Table: ershkus_poi

-- DROP TABLE ershkus_poi;

CREATE TABLE ershkus_poi
(
id bigserial NOT NULL,
class text NOT NULL,
tags hstore,
name_ru text DEFAULT ''::text,
operator text,
tags_ru hstore,
opening_hours text,
class_ru text,
addr_region text,
addr_district text,
addr_city text,
addr_full_name text,
index_name text,
addr_region_id BIGINT,
addr_district_id BIGINT,
addr_city_id BIGINT,
addr_house_id BIGINT,
addr_in_id BIGINT,
addr_in_type INTEGER,
brand text,
phone text,
fax text,
website text,
addr_village text,
addr_street text,
addr_house text,
c_geom geometry,
addr_country text,
email text,
description text,
wikipedia text,
osm_id text,
CONSTRAINT ershkus_poi_pkey PRIMARY KEY (id ),
CONSTRAINT enforce_dims_c_geom CHECK (st_ndims(c_geom) = 2),
CONSTRAINT enforce_geotype_c_geom CHECK (geometrytype(c_geom) = 'POINT'::text OR c_geom IS NULL),
CONSTRAINT enforce_srid_c_geom CHECK (st_srid(c_geom) = 4326)
)
WITH (
OIDS=FALSE
);
ALTER TABLE ershkus_poi
OWNER TO openstreetmap;
GRANT ALL ON TABLE ershkus_poi TO openstreetmap;
GRANT SELECT ON TABLE ershkus_poi TO openstreetmap;

-- Index: ershkus_poi_addr_in_id_idx

-- DROP INDEX ershkus_poi_addr_in_id_idx;

CREATE INDEX ershkus_poi_addr_in_id_idx
ON ershkus_poi
USING btree
(addr_in_type );

-- Index: ershkus_poi_osm_id_idx

-- DROP INDEX ershkus_poi_osm_id_idx;

CREATE INDEX ershkus_poi_osm_id_idx
ON ershkus_poi
USING btree
(osm_id COLLATE pg_catalog."default" , id );

-- Table: ershkus_addr_street_upd

-- DROP TABLE ershkus_addr_street_upd;

CREATE TABLE ershkus_addr_street_upd
(
id bigserial NOT NULL,
osm_id text,
street_name text,
country text,
country_id BIGINT,
region text,
region_id BIGINT,
district text,
district_id BIGINT,
city text,
city_id BIGINT,
village text,
village_id BIGINT,
street text,
postcode text,
geom geometry,
CONSTRAINT ershkus_addr_street_upd_pkey PRIMARY KEY (id ),
CONSTRAINT enforce_dims_geom CHECK (st_ndims(geom) = 2),
CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 4326)
)
WITH (
OIDS=FALSE
);
ALTER TABLE ershkus_addr_street_upd
OWNER TO openstreetmap;




-- Table: deleted_entries

-- DROP TABLE deleted_entries;

CREATE TABLE deleted_entries
(
id bigserial NOT NULL,
TYPE CHARACTER(1) NOT NULL,
osm_id BIGINT NOT NULL,
deleted_at TIMESTAMP WITHOUT TIME zone DEFAULT now(),
CONSTRAINT deleted_entries_pkey PRIMARY KEY (id )
)
WITH (
OIDS=FALSE
);
ALTER TABLE deleted_entries
OWNER TO openstreetmap;

-- Index: idx_deleted_entries_updated_at

-- DROP INDEX idx_deleted_entries_updated_at;

CREATE INDEX idx_deleted_entries_updated_at
ON deleted_entries
USING btree
(deleted_at , id );

-- Table: ershkus_addr_save

-- DROP TABLE ershkus_addr_save;

CREATE TABLE ershkus_addr_save
(
id bigserial NOT NULL,
osm_id text[],
addr_type text,
addr_type_id INTEGER,
full_name text,
country text,
country_id BIGINT,
region text,
region_id BIGINT,
geom geometry,
name text,
CONSTRAINT pk_ershkus_addr_save PRIMARY KEY (id),
CONSTRAINT enforce_dims_geom CHECK (st_ndims(geom) = 2),
CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 4326)
)
WITH (
OIDS=FALSE
);
ALTER TABLE ershkus_addr_save
OWNER TO openstreetmap;
GRANT ALL ON TABLE ershkus_addr_save TO openstreetmap;
GRANT SELECT, UPDATE ON TABLE ershkus_addr_save TO openstreetmap;

-- Function: ershkus_fn_geompoly(geometry[])

-- DROP FUNCTION ershkus_fn_geompoly(geometry[]);

CREATE OR REPLACE FUNCTION ershkus_fn_geompoly(geometry[])
RETURNS geometry AS
$BODY$
BEGIN
-- RETURN (SELECT ST_Polygonize(c2) FROM (SELECT ST_GeomFromText(astext(ST_Collect(c1)),4326) as c2 FROM (SELECT unnest($1) as c1) as t1) as t2);
RETURN (SELECT ST_BuildArea(ST_GeomFromText(astext(ST_Collect(c1)),4326)) AS c2 FROM (SELECT unnest($1) AS c1) AS t1);

EXCEPTION
WHEN SQLSTATE 'XX000' THEN
RETURN NULL;
WHEN SQLSTATE '21000' THEN
RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;
ALTER FUNCTION ershkus_fn_geompoly(geometry[])
OWNER TO openstreetmap;
GRANT EXECUTE ON FUNCTION ershkus_fn_geompoly(geometry[]) TO public;
GRANT EXECUTE ON FUNCTION ershkus_fn_geompoly(geometry[]) TO openstreetmap;

-- Function: ershkus_fn_buildarea(geometry)

-- DROP FUNCTION ershkus_fn_buildarea(geometry);

CREATE OR REPLACE FUNCTION ershkus_fn_buildarea(geometry)
RETURNS geometry AS
$BODY$
BEGIN
RETURN (SELECT ST_BuildArea($1));

EXCEPTION
WHEN SQLSTATE 'XX000' THEN
RETURN NULL;
WHEN SQLSTATE '21000' THEN
RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;
ALTER FUNCTION ershkus_fn_buildarea(geometry)
OWNER TO openstreetmap;
GRANT EXECUTE ON FUNCTION ershkus_fn_buildarea(geometry) TO public;
GRANT EXECUTE ON FUNCTION ershkus_fn_buildarea(geometry) TO openstreetmap;
