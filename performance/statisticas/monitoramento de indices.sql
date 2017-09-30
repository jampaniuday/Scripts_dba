select 'alter index ADM_SGV_TRN.' || t.index_name || ' monitoring usage;'
  from dba_indexes t
 where t.table_name = 'TRANSACAO_VALORADA'
   and t.index_name <> 'PK_TRANSACAO_VALORADA_M'
