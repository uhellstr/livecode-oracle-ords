/*
   This will setup a REST Webservice with the following type of URI
   http://<node>:portno/ords/<dbname>/<rest_schema_name>/countrystats/data/
   
   Example with localhost against DB pdbdemo with schema rest_data
   
   http://localhost:8080/ords/pdbdemo/rest_data/countrystats/data/

   Example with a single database and no alias for dbname the uri looks like

   http://localhost:8080/ords/rest_data/countrystats/data/

*/ 

BEGIN
  ords.define_service
    ( 
      p_module_name => 'countrystats', 
      p_base_path => 'countrystats/',
      p_pattern => 'data/',
      p_method => 'GET', 
      p_source_type => ords.source_type_query, p_source => 'SELECT * FROM V_S_COUNTRY_STATS', 
      p_items_per_page =>0
    );
  COMMIT;
END;
/
