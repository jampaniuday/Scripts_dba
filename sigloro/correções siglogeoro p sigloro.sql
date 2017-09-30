select * from lotein t where t.modalidade_lic='TP 01/75' group by t.setor
update  lotein t set t.setor='AREIA BRANCA' where t.setor ='AREIA_BRANCA'
update lotein t set t.LOTE='01' where t.LOTE ='1'
update lotein t set t.propriedade='S/D' where t.propriedade is null
select distinct(t.modalidade_lic) from lotein t
select * from  LOTEIN t where t.propriedade is null

select * from tab_pdf_temp t where t.codigo  is null and t.lote not in('86_87_88')
select t.tp, t.lote,t.codigo,t.setor,t.gleba from tab_pdf_temp t 
DELETE tab_pdf_temp t where t.setor  is null  or  t.tipo='ERRO'
update tab_pdf_temp t set t.tp ='TP 40/76' where  t.tp is null
update tab_pdf_temp t set t.setor='AREIA BRANCA' where t.setor= 'AREIA_BRANCA'
select count(*) from tab_pdf_temp      
select * from tab_pdf_temp where codigo is not  null ='' where t.tp ='CP 01/83' 
update tab_pdf_temp t set t.codigo='' where t.gleba ='AGROVILA_05' and t.lote='NÚCLEO_05'
select distinct(t.TP) from TAB_PDF_TEMP t
select distinct(t.modalidade_lic) from lotein t


