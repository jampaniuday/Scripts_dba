select * from lov_modalidade t where t.nome= '&tp' order by 1  'TP 37/76'
select * from lov_modalidade t  order by 1 
insert into lov_modalidade (id,nome) values (663,'OS 32/89')


select * from lov_setor t  where t.nome='&setor'  order by 1
select * from lov_setor t  order by 2
insert into lov_setor (id,nome) values (243, 'C90');
delete lov_setor where id =55

insert into lov_tipo_arquivo (id,nome) values (1 ,	'PLANTA');
insert into lov_tipo_arquivo (id,nome) values (2 ,	'PROPRIETARIO');
insert into lov_tipo_arquivo (id,nome) values (3 ,	'LOCACAO');
insert into lov_tipo_arquivo (id,nome) values (5 ,	'INFORMAÇÃO');

select distinct(t.nome) from lov_modalidade t  order by 1 


