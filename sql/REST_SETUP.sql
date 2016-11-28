/*
  RUN THIS SCRIPT CONNECTED AS REST_DATA SCHEMA
*/

DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

    ORDS.ENABLE_SCHEMA(p_enabled => TRUE,
                       p_schema => 'REST_DATA',
                       p_url_mapping_type => 'BASE_PATH',
                       p_url_mapping_pattern => 'rest_data',
                       p_auto_rest_auth => TRUE);
    
    commit;

end;
/