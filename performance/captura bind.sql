select sql_id,
       t.sql_text SQL_TEXT,
       b.name BIND_NAME,
       b.DATATYPE_STRING,
       b.value_string BIND_STRING,
       anydata.accesstimestamp(value_anydata),
       t.module,
       t.first_load_time,
       t.last_load_time,
       t.last_active_time,
       b.last_captured
  from v$sqlarea t
  join v$sql_bind_capture b
 using (sql_id)
 where  sql_id='25tz9ranh0y12';   -- historico dba_hist_sqlbind
