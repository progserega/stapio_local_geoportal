-- Table: ershkus_search_addr

-- DROP TABLE ershkus_search_addr;

CREATE TABLE ershkus_search_addr
(
  id bigserial NOT NULL,
  id_link_n bigint[],
  id_link_w bigint[],
  id_link_r bigint[],
  full_name text,
  region text,
  region_id bigint,
  district text,
  district_id bigint,
  city text,
  city_id bigint,
  village text,
  village_id bigint,
  street text,
  housenumber text,
  member_role text,
  addr_type text,
  index_name text,
  addr_type_id integer,
  geom geometry,
  c_geom geometry,
  modify boolean NOT NULL DEFAULT false,
  osm_id text[],
  postcode text,
  country text,
  country_id bigint,
  street_id bigint,
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
  OWNER TO osm_www;
GRANT ALL ON TABLE ershkus_search_addr TO osm_www;
GRANT SELECT, UPDATE ON TABLE ershkus_search_addr TO osm_www;

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
  id bigint NOT NULL DEFAULT nextval('ershkus_search_addr_id_seq'::regclass),
  id_link_n bigint[],
  id_link_w bigint[],
  id_link_r bigint[],
  full_name text,
  region text,
  region_id bigint,
  district text,
  district_id bigint,
  city text,
  city_id bigint,
  village text,
  village_id bigint,
  street text,
  housenumber text,
  member_role text,
  addr_type text,
  addr_type_id integer,
  index_name text,
  geom geometry,
  c_geom geometry,
  osm_id text[],
  postcode text,
  country text,
  country_id bigint,
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
  OWNER TO osm_www;
GRANT ALL ON TABLE ershkus_search_addr_p TO osm_www;
GRANT SELECT ON TABLE ershkus_search_addr_p TO osm_www;

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
  addr_region_id bigint,
  addr_district_id bigint,
  addr_city_id bigint,
  addr_house_id bigint,
  addr_in_id bigint,
  addr_in_type integer,
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
  OWNER TO osm_www;
GRANT ALL ON TABLE ershkus_poi TO osm_www;
GRANT SELECT ON TABLE ershkus_poi TO osm_www;

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
  country_id bigint,
  region text,
  region_id bigint,
  district text,
  district_id bigint,
  city text,
  city_id bigint,
  village text,
  village_id bigint,
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
  OWNER TO osm_www;




-- Table: deleted_entries

-- DROP TABLE deleted_entries;

CREATE TABLE deleted_entries
(
  id bigserial NOT NULL,
  type character(1) NOT NULL,
  osm_id bigint NOT NULL,
  deleted_at timestamp without time zone DEFAULT now(),
  CONSTRAINT deleted_entries_pkey PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE deleted_entries
  OWNER TO osm_www;

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
  addr_type_id integer,
  full_name text,
  country text,
  country_id bigint,
  region text,
  region_id bigint,
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
  OWNER TO osm_www;
GRANT ALL ON TABLE ershkus_addr_save TO osm_www;
GRANT SELECT, UPDATE ON TABLE ershkus_addr_save TO osm_www;
