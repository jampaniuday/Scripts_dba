SELECT  distinct a.sql_id ,a.inst_id,a.blocking_session,a.blocking_session_serial#,a.user_id,s.sql_text,a.module,a.SAMPLE_TIME,a.WAIT_TIME
FROM  GV$ACTIVE_SESSION_HISTORY a  ,gv$sql s
where a.sql_id=s.sql_id
and blocking_session is not null
and a.user_id in (104,108,110,106,118,163,107,105,113,109,116,164,154,111,114,115,165,117,112,151,144)
and a.sample_time > sysdate-1
