insert into TAB_REGISTRO_FUNDIARIO_ARQUIV2 select id, registro_fundiario, descricao, nome, extensao, tipo, tamanho, null, tem_swf, entrega_id 
 from TAB_REGISTRO_FUNDIARIO_ARQUIV;
  
insert into TAB_LV_REG_ARQUIVO2 select id, livro_registro, nome, extensao, tamanho, tipo, null, descricao  from TAB_LV_REG_ARQUIVO ;

insert into DW_LV_REG_ARQUIVO2 select id, livro_registro_dw, livro_registro, nome, extensao, tamanho, tipo, null, descricao, arquivo_id from DW_LV_REG_ARQUIVO;
  
insert into DW_REGISTRO_FUNDIARIO_ARQUIV2 select id, registro_fundiario_dw, registro_fundiario, descricao, nome, extensao, tipo, tamanho, null, 
arquivo_id from DW_REGISTRO_FUNDIARIO_ARQUIV;
  
   
truncate table TAB_REGISTRO_FUNDIARIO_ARQUIV;
truncate table TAB_LV_REG_ARQUIVO;
truncate table DW_LV_REG_ARQUIVO;
truncate table DW_REGISTRO_FUNDIARIO_ARQUIV;

insert into TAB_REGISTRO_FUNDIARIO_ARQUIV select id, registro_fundiario, descricao, nome, extensao, tipo, tamanho, null, tem_swf, entrega_id 
 from TAB_REGISTRO_FUNDIARIO_ARQUIV2;
  
insert into TAB_LV_REG_ARQUIVO select id, livro_registro, nome, extensao, tamanho, tipo, null, descricao  from TAB_LV_REG_ARQUIVO2 ;

insert into DW_LV_REG_ARQUIVO select id, livro_registro_dw, livro_registro, nome, extensao, tamanho, tipo, null, descricao, arquivo_id from DW_LV_REG_ARQUIVO2;
  
insert into DW_REGISTRO_FUNDIARIO_ARQUIV select id, registro_fundiario_dw, registro_fundiario, descricao, nome, extensao, tipo, tamanho, null, 
arquivo_id from DW_REGISTRO_FUNDIARIO_ARQUIV2;

drop table TAB_REGISTRO_FUNDIARIO_ARQUIV2;
drop table TAB_LV_REG_ARQUIVO2;
drop table DW_LV_REG_ARQUIVO2;
drop table DW_REGISTRO_FUNDIARIO_ARQUIV2;
