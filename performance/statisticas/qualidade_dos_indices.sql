SELECT i.table_name, i.index_name, t.num_rows, t.blocks, i.clustering_factor,
case when nvl(i.clustering_factor,0) = 0                       then 'No Stats'
     when nvl(t.num_rows,0) = 0                                then 'No Stats'
     when (round(i.clustering_factor / t.num_rows * 100)) < 6  then 'Excellent    '
     when (round(i.clustering_factor / t.num_rows * 100)) between 7 and 11 then 'Good'
     when (round(i.clustering_factor / t.num_rows * 100)) between 12 and 21 then 'Fair'
     else                                                           'Poor'
     end  Index_Quality,
i.avg_data_blocks_per_key, i.avg_leaf_blocks_per_key,
to_char(o.created,'MM/DD/YYYY HH24:MI:SSSSS') Created
from dba_indexes i, dba_objects o, dba_tables t
where i.index_name = o.object_name
  and i.table_name = t.table_name
  and i.owner='ADM_SGV_TRN'
  AND I.table_name IN('TRANSACAO','TRANSACAO_VALORADA','TRANSACAO_VALORADA_SUMARIZADA')
order by 1;
