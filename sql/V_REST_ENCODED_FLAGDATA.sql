CREATE OR REPLACE FORCE EDITIONABLE VIEW "REST_DATA"."V_REST_ENCODED_FLAGDATA" ("ALPHA3CODE", "FLAG_BASE64") AS 
select ss.alpha3code,base64encode(ff.pngimage) as flag_base64 
from s_country_flags ff
inner join s_iso3166_2_codes ss
on ss.alpha2code = ff.alpha2code
inner join s_country_codes cc
on cc.countrycode = ss.alpha3code
;
