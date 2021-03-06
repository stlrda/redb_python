CREATE OR REPLACE FUNCTION core.staging1_to_staging2()
RETURNS void AS $$
BEGIN

--Clear staging_2
DROP TABLE IF EXISTS "staging_2"."prcl_prcl" CASCADE;
DROP TABLE IF EXISTS "staging_2"."prcl_bldgall" CASCADE;
DROP TABLE IF EXISTS "staging_2"."prcl_bldgsect" CASCADE;

--Move data from staging_1 to staging_2
CREATE TABLE "staging_2"."prcl_prcl"
AS TABLE "staging_1"."prcl_prcl";

CREATE TABLE "staging_2"."prcl_bldgall"
AS TABLE "staging_1"."prcl_bldgall";

CREATE TABLE "staging_2"."prcl_bldgsect"
AS TABLE "staging_1"."prcl_bldgsect";

--Clear staging_1
DROP TABLE IF EXISTS "staging_1"."prcl_bldgall" CASCADE;
DROP TABLE IF EXISTS "staging_1"."prcl_bldgsect" CASCADE;
DROP TABLE IF EXISTS "staging_1"."prcl_prcl" CASCADE;

END;
$$
LANGUAGE plpgsql;
-------------------------
SELECT core.staging1_to_staging2();