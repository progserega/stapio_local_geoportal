-- Function: ershkus_fn_geompoly(geometry[])
 
 -- DROP FUNCTION ershkus_fn_geompoly(geometry[]);
  
  CREATE OR REPLACE FUNCTION ershkus_fn_geompoly(geometry[])
  RETURNS geometry AS
  $BODY$
  BEGIN
  -- RETURN (SELECT ST_Polygonize(c2) FROM (SELECT ST_GeomFromText(astext(ST_Collect(c1)),4326) as c2 FROM (SELECT unnest($1) as c1) as t1) as t2);
  RETURN (SELECT ST_BuildArea(ST_GeomFromText(astext(ST_Collect(c1)),4326)) as c2 FROM (SELECT unnest($1) as c1) as t1);
   
   EXCEPTION
   WHEN SQLSTATE 'XX000' THEN
   RETURN null;
   WHEN SQLSTATE '21000' THEN
   RETURN null;
   END;
   $BODY$
   LANGUAGE plpgsql VOLATILE
   COST 100;
   ALTER FUNCTION ershkus_fn_geompoly(geometry[])
   OWNER TO osm_www;
   GRANT EXECUTE ON FUNCTION ershkus_fn_geompoly(geometry[]) TO public;
   GRANT EXECUTE ON FUNCTION ershkus_fn_geompoly(geometry[]) TO osm_www;


-- Function: ershkus_fn_buildarea(geometry)
 
 -- DROP FUNCTION ershkus_fn_buildarea(geometry);
  
  CREATE OR REPLACE FUNCTION ershkus_fn_buildarea(geometry)
  RETURNS geometry AS
  $BODY$
  BEGIN
  RETURN (SELECT ST_BuildArea($1));
   
   EXCEPTION
   WHEN SQLSTATE 'XX000' THEN
   RETURN null;
   WHEN SQLSTATE '21000' THEN
   RETURN null;
   END;
   $BODY$
   LANGUAGE plpgsql VOLATILE
   COST 100;
   ALTER FUNCTION ershkus_fn_buildarea(geometry)
   OWNER TO osm_www;
   GRANT EXECUTE ON FUNCTION ershkus_fn_buildarea(geometry) TO public;
   GRANT EXECUTE ON FUNCTION ershkus_fn_buildarea(geometry) TO osm_www;
