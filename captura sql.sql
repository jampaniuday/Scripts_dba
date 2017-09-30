select dbms_lob.substr(sql_fulltext, 4000 , 1 ),
       sql_id,
       executions,
       first_load_time,
       elapsed_time,
       last_load_time
  from v$sqlarea t
 where t.SQL_TEXT like '% TRANSACAO %' 
   and t.SQL_TEXT not like '%SQL Analyze%'
   and t.SQL_TEXT not like '%create global temporary %'
   and t.SQL_TEXT not like '%DS_SVC%' 
   and t.SQL_TEXT not like '%TRANSACAO_VALORADA_SUMARIZADA%' 
   and t.SQL_TEXT not like '%TRANSACAO_VALORADA%'  
       
 order by 1
