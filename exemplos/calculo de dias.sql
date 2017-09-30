
select b.id,e.razao_social,e.cnpj,b.data_criacao,b.prazo, b.data_inicio_prazo, rpad (to_char(sysdate -  b.data_inicio_prazo),3)
"DIAS TRANCORRIDOS"  from tab_titulo b, tab_empreendimento e where to_char(sysdate -  b.data_inicio_prazo) > b.prazo and modelo =91 
and b.empreendimento = e.id


