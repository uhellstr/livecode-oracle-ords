--------------------------------------------------------
--  File created - fredag-maj-26-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table S_COUNTRY_FLAGS
--------------------------------------------------------

  CREATE TABLE "REST_DATA"."S_COUNTRY_FLAGS" 
   (	"ALPHA2CODE" VARCHAR2(2 BYTE), 
	"PNGIMAGE" BLOB
   ) ;
--------------------------------------------------------
--  Constraints for Table S_COUNTRY_FLAGS
--------------------------------------------------------

  ALTER TABLE "REST_DATA"."S_COUNTRY_FLAGS" MODIFY ("ALPHA2CODE" NOT NULL ENABLE);
