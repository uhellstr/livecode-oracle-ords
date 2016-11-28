/*
   This will setup a REST Webservice with the following type of URI
   http://<node>:portno/ords/<dbname>/<rest_schema_name>/countrystats/codes/
   
   Example with localhost against DB pdbdemo with schema rest_data
   
   http://localhost:8080/ords/pdbdemo/rest_data/countrystats/codes/

   Example with a single database and no alias for dbname the uri looks like

   http://localhost:8080/ords/rest_data/countrystats/codes/

*/ 

BEGIN
  ords.define_service
    ( 
      p_module_name => 'countrystats', 
      p_base_path => 'countrystats/',
      p_pattern => 'codes/',
      p_method => 'GET', 
      p_source_type => ords.source_type_query, p_source => 'SELECT * FROM S_COUNTRY_CODES', 
      p_items_per_page =>0
    );
  COMMIT;
END;
/
