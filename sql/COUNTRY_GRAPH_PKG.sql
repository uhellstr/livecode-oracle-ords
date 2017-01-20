create or replace package country_graph_pkg as

  /* TODO enter package declarations (types, exceptions, methods etc) here */

  function plotly_bar_graph
    (
       p_in_country_name in varchar2
    ) return clob;

end country_graph_pkg;
/

create or replace package body country_graph_pkg as


  function plotly_bar_graph
    (
       p_in_country_name in varchar2
    ) return clob
  as

    cursor c_get_country_data ( p_in_country_name in varchar2) is
    select year,
           val
    from v_rest_country_data
    where countryname = p_in_country_name;

    lv_x_val clob;
    lv_y_val clob;
    lv_retval clob;
    lb_first_row boolean := true;

  begin

    lv_x_val := '{ x: [';
    lv_y_val := 'y: [';

    for rec in c_get_country_data(p_in_country_name) loop
       if lb_first_row then
         lv_x_val := lv_x_val||''''||rec.year||'''';
         lv_y_val := lv_y_val||rec.val;
          lb_first_row := false;
       else
         lv_x_val := lv_x_val||', '||''''||rec.year||'''';
         lv_y_val := lv_y_val||', '||rec.val;
       end if;
    end loop;

    lv_x_val := lv_x_val||'],';
    lv_y_val := lv_y_val||'],type: '||''''||'bar'||''''||'}';
    lv_retval := lv_x_val||lv_y_val;

    return lv_retval;

  end plotly_bar_graph;

end country_graph_pkg;
/
