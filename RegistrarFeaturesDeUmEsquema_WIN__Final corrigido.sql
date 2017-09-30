--- Este script gera um arquivo .BAT na pasta D:\oracle\oradata\ora8\sde do servidor ORACLE
--- OBJETIVO: Gerar linhas de comando para registrar features no ArcSDE e 
---          alterar o sistemas de coordenadas destas features. Criar TRIGGERs para cada feature.
---
--- OBS.: Através do ArcCatalog foi criado o arquivo "proj_lcc_mt" contendo o sistema de coordenadas
---      Lambert Conformal Conic de Mato Grosso.  Este arquivo está localizado no diretório D:\arcgis\ArcSDE\ora9iexe
---      do SERVIDOR.  Para utilizar este script com outros sistemas de coordenadas, proceda da seguinte forma:
---            - Crie um sistema de coordenada no ArcCatalog e exporte-o para um arquivo.
---            - Coloque este arquivo no diretório D:\arcgis\ArcSDE\ora9iexe do SERVIDOR.
---            - Altere o valor da variavel abaixo v_siscoord para o nome deste arquivo. 

declare
   v_usuario   varchar2(30):=upper('&usuario');
   v_senha     varchar2(30):='&senha';
   v_nome_id   varchar2(50);
   v_tipogeom  varchar2(25);
   v_tpgeonum  number(10);
   v_anular    varchar2(5):='';
   
   v_siscoord  varchar2(50):='proj_lcc_mt';
   
   v_file      utl_file.file_type;
   v_arq_log   varchar2(50):='LOG_'||v_usuario||'.LOG';
   v_trg_log   varchar2(50):='TRG_'||v_usuario||'.LOG';
begin
   v_file := utl_file.fopen('SDE_REGISTER','REG_'||v_usuario||'.BAT', 'w' );
   
   utl_file.put_line(v_file,'@echo off');
   for i in (select sdo_index_owner,table_name,column_name from all_sdo_index_info where sdo_index_owner=v_usuario order by table_name) loop

      begin 
        execute immediate ('select t.'||i.column_name||'.sdo_gtype from '||i.sdo_index_owner||'.'||i.table_name||' t where rownum=1') into v_tpgeonum;
      Exception When others then
        v_tpgeonum:=0;
      end;


      case v_tpgeonum
        when 2001 then v_tipogeom:='p';
        when 2002 then v_tipogeom:='l';
        when 2003 then v_tipogeom:='a';
        when 0 then
            v_tipogeom:='  XxX_TABELA_VAZIA_xXx  ';
            v_anular:='::  ';
        else 
            v_tipogeom:=' XXXXXXXXXXXXXXXXXXXXXX ';
            v_anular:='::  '; 
      end case;

      begin
        select g.column_name into v_nome_id from all_constraints r,all_cons_columns g
         where g.table_name=i.table_name and r.constraint_name=g.constraint_name
               and r.constraint_type='P' and r.owner=v_usuario and g.owner=v_usuario;
      Exception When others then
        v_nome_id:='  XxX_NAO_TEM_CHAVE_PRIMARIA_xXx  ';
        v_anular:='::  ';
      end;   
      
      utl_file.put_line(v_file,v_anular||'echo Registrando '||i.table_name||' >> '||v_arq_log);
      utl_file.put_line(v_file,v_anular||'sdelayer -o register -l '||i.table_name||','||i.column_name||' -C '||v_nome_id||' -e '||v_tipogeom||' -u '||i.sdo_index_owner||' -p '||v_senha||' >> '||v_arq_log);
      utl_file.put_line(v_file,v_anular||'sdelayer -o alter -l '||i.table_name||','||i.column_name||' -G file=%SDEHOME%'||v_siscoord||' -u '||i.sdo_index_owner||' -p '||v_senha||' >> '||v_arq_log);
      utl_file.put_line(v_file,v_anular||'echo . >> '||v_arq_log);
      utl_file.put_line(v_file,v_anular||'echo . >> '||v_arq_log);
      utl_file.put_line(v_file,v_anular||'echo . >> '||v_arq_log);
      utl_file.put_line(v_file,v_anular||'echo . >> '||v_arq_log);
      utl_file.put_line(v_file,v_anular||'echo . >> '||v_arq_log);
      utl_file.put_line(v_file,v_anular||'echo . >> '||v_arq_log);
      v_anular:='';
      
   end loop;
   
  
   utl_file.fclose( v_file );

end;