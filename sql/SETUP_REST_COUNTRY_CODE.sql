/*
   This will setup a REST Webservice with the following type of URI
   http://<node>:portno/ords/[<dbname>]/<rest_schema_name>/testmodule/country/[<code>]

   Parameters witin [] are optional depending on setup....

   Example with a single database and no alias for dbname the uri looks like

   http://localhost:8888/ords/rest_data/testmodule/country/

   or for a specific country

   http://localhost:8888/ords/rest_data/testmodule/country/SWE

   To get the codes and names for all countries in the database use

   http://localhost:8888/ords/rest_data/testmodule/countrynames/
*/

BEGIN

  ORDS.define_module(
    p_module_name    => 'testmodule',
    p_base_path      => 'testmodule/',
    p_items_per_page => 0);

  ORDS.define_template(
   p_module_name    => 'testmodule',
   p_pattern        => 'country/');

  ORDS.define_handler(
    p_module_name    => 'testmodule',
    p_pattern        => 'country/',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_plsql,
    p_source         => 'BEGIN country_stats_pkg.country_data; END;',
    p_items_per_page => 0);

  ORDS.define_template(
   p_module_name    => 'testmodule',
   p_pattern        => 'country/:code');

  ORDS.define_handler(
    p_module_name    => 'testmodule',
    p_pattern        => 'country/:code',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_plsql,
    p_source         => 'BEGIN country_stats_pkg.country_data(:code); END;',
    p_items_per_page => 0);

    ORDS.define_template(
     p_module_name    => 'testmodule',
     p_pattern        => 'countrynames/');

    ORDS.define_handler(
      p_module_name    => 'testmodule',
      p_pattern        => 'countrynames/',
      p_method         => 'GET',
      p_source_type    => ORDS.source_type_plsql,
      p_source         => 'BEGIN country_stats_pkg.country_codes; END;',
      p_items_per_page => 0);

    ORDS.define_template(
      p_module_name   => 'testmodule',
      p_pattern       => 'graph/:code'
    );

    ORDS.define_handler(
      p_module_name   => 'testmodule',
      p_pattern       => 'graph/:code',
      p_method        => 'GET',
      p_source_type   => ords.source_type_query,
      p_source        => 'SELECT country_graph_pkg.plotly_bar_graph(:code) FROM DUAL',
      p_items_per_page => 0);

  COMMIT;

end;
/
