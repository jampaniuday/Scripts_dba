delete lote l where l.cod_lote  like '291%';

delete tab_arquivos_lote p where p.id_lote in(select t.id from tab_lote t where t.cod_lote like '291%');

delete tab_proprietarios_lote  p where p.id_lote in(select t.id from tab_lote t where t.cod_lote like '291%');

delete tab_lote t where t.cod_lote like '291%';


