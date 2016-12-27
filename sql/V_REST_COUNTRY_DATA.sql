create or replace view rest_data.V_REST_COUNTRY_DATA as
select a.countryname,
       b.year,
       b.val,
       b.diff
from  s_country_codes a
inner join v_s_country_stats b
  on a.countrycode = b.countrycode
order by a.countryname,b.year;
