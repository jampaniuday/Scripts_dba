/*Script Conta usuarios Ceprof*/

select count(t.login),t.bloqueado  from ccsema.tab_funcionario t group by t.bloqueado


/*Script Conta usuarios  - Ceprof*/
select count(a.login),a.situacao from simlamcontrol.tab_usuario a group by a.situacao


/*Script p/ verificar tablespaces*/
select tablespace_name,
sum_bytes_alloc "ALOCADO (MB)",
sum_bytes_livre "LIVRE (MB)",
decode(trunc((sum_bytes_livre/sum_bytes_alloc)*100),'','SEM ESPACO LIVRE',
trunc((sum_bytes_livre/sum_bytes_alloc)*100)) "PCT LIVRE"
from
(select tablespace_name ,
trunc(sum(bytes)/1024/1024) as sum_bytes_alloc
from dba_data_files
group by tablespace_name) XX,
(select tablespace_name Y ,
trunc(sum(bytes)/1024/1024) as sum_bytes_livre
from dba_free_space
group by tablespace_name) XY
where XX.tablespace_name = XY.Y (+);
