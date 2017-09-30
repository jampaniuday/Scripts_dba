--Verifica As sequencias a serem aplicadas
SELECT SEQUENCE#,
       substr(name, 1, 70) AS NAME,
       APPLIED,
       to_char(FIRST_TIME, 'dd/mm/yyyy hh24:mi:ss') as FIRST_TIME,
       to_char(NEXT_TIME, 'dd/mm/yyyy hh24:mi:ss') as NEXT_TIME,
       to_char(COMPLETION_TIME, 'dd/mm/yyyy hh24:mi:ss') as COMPLETION_TIME,
       APPLIED,
       DELETED,
       STATUS
  FROM V$ARCHIVED_LOG where  applied <> 'YES'
 ORDER BY SEQUENCE#;

--
select process,status,sequence#,block# from v$managed_standby;

--Configuração dg
select * from   V$DATAGUARD_CONFIG
--lag transporte/aplicação
select * from   V$DATAGUARD_STATS
--Status de aplicação
select * from   V$DATAGUARD_STATUS
--Historico de lag
select * from   V$STANDBY_EVENT_HISTOGRAM
--
SELECT STATUS, GAP_STATUS FROM V$ARCHIVE_DEST_STATUS WHERE DEST_ID = 3;
--
select switchover_status from v$database;
--
Select To_char(START_TIME, 'Dd.Mm.Yyyy Hh24:Mi:ss') "Recover_start",
       To_char(Item) || ' = ' || To_char(Sofar) || ' ' || To_char(Units) || ' ' ||
       To_char(TIMESTAMP, 'Dd.Mm.Yyyy Hh24:Mi') "Values"
  From V$Recovery_progress
 Where Start_time = (Select Max(Start_time) From V$Recovery_progress);
