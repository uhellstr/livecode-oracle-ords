create or replace package country_stats_pkg as

  procedure country_data
     (
       p_in_countryname in varchar2 default null,
       p_debug in char default 'N'
     );

  procedure country_codes
     (
       p_debug in char default 'N'
     );
     
  procedure encoded_flag_data
     (
        p_in_country_name in varchar2 default null,
        p_debug in char default 'N'
     );

end country_stats_pkg;
/

create or replace package body country_stats_pkg as

  procedure country_data
     (
       p_in_countryname in varchar2 default null,
       p_debug in char default 'N'
     ) is

   l_cursor sys_refcursor;

  begin

   open l_cursor for
   select
     c.countryname,
     c.year,
     c.val,
     c.diff
   from v_rest_country_data c
   where c.countryname = decode(p_in_countryname,null,c.countryname,p_in_countryname)
     and c.year < 2015;

   -- use p_debug if testing directly in sqlcl,sqlplus or sqldeveloper
   if p_debug = 'Y' then
     apex_json.initialize_clob_output;
   end if;

   apex_json.open_object;
   apex_json.write('countrydata', l_cursor);
   apex_json.close_object;

   if p_debug = 'Y' then
    dbms_output.put_line(apex_json.get_clob_output);
    apex_json.free_output;
   end if;
   
  end country_data;

  procedure country_codes
     (
       p_debug in char default 'N'
     ) is

    l_cursor sys_refcursor;

  begin

    open l_cursor for
    select countrycode,
           countryname
    from s_country_codes
    order by countryname asc;

    -- use p_debug if testing directly in sqlcl,sqlplus or sqldeveloper
    if p_debug = 'Y' then
      apex_json.initialize_clob_output;
    end if;

    apex_json.open_object;
    apex_json.write('countryname', l_cursor);
    apex_json.close_object;

    if p_debug = 'Y' then
     dbms_output.put_line(apex_json.get_clob_output);
     apex_json.free_output;
    end if;
    
  end country_codes;
  
  procedure encoded_flag_data
     (
        p_in_country_name in varchar2 default null,
        p_debug in char default 'N'
     ) is
     
    l_cursor sys_refcursor;
    lv_country_code varchar2(3);
    
    function get_country_code
              (
                p_in_country_name in varchar2
              ) return varchar2 
    is
    
      lv_retval varchar2(32767);
      
    begin
    
      select countrycode into lv_retval
      from s_country_codes
      where countryname = p_in_country_name;
      
      return lv_retval;
      
    exception 
       when no_data_found then
         return null;
         
    end get_country_code;
    
    
  begin
  
    lv_country_code := get_country_code(p_in_country_name);
    
    open l_cursor for
    select flag_base64
    from v_rest_encoded_flagdata
    where alpha3code = lv_country_code;

    -- use p_debug if testing directly in sqlcl,sqlplus or sqldeveloper
    if p_debug = 'Y' then
      apex_json.initialize_clob_output;
    end if;

    apex_json.open_object;
    apex_json.write('countryname', l_cursor);
    apex_json.close_object;

    if p_debug = 'Y' then
     dbms_output.put_line(apex_json.get_clob_output);
     apex_json.free_output;
    end if;   
    
  end encoded_flag_data;

end country_stats_pkg;
/
