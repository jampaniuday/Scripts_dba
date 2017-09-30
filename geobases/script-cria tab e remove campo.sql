--select 'CREATE TABLE GEOBASES_ES.' || T.TABLE_NAME || ' as SELECT * FROM ALEX.' || T.TABLE_NAME || ';'
--from dba_tables t where t.owner='ALEX' AND T.TABLE_NAME NOT LIKE 'MDRT_%'


select 'ALTER TABLE GEOBASES_ES.' || T.TABLE_NAME ||  ' drop column SE_ANNO_CAD_DATA;'
from dba_tables t where t.owner='GEOBASES_ES' AND T.TABLE_NAME NOT LIKE 'MDRT_%'
