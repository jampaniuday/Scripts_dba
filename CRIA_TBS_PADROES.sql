declare

   tbsNome varchar2(30) := '&tbsp';

   dfEnd varchar2(500) := '&dfende';
   dfPermNome varchar2(600) := dfEnd||tbsNome||'_DATA.dbf';
   dfTempNome varchar2(600) := dfEnd||tbsNome||'_TEMP.dbf';
   dfIndexNome varchar2(600) := dfEnd||tbsNome||'_INDEX.dbf';

   --Tamanho das TBS...
   tbsPermMB NUMBER := '&MBP';
   tbsTempMB NUMBER := '&MBT';
   tbsIndMB NUMBER := '&MBI';
   
   --Tamanho das EXTENSOES, se existirem...
   tbsEPermMB NUMBER := '&MBEP';
   tbsETempMB NUMBER := '&MBET';
   tbsEIndMB NUMBER := '&MBEI';
   

begin

   --Criando a TBS de DATA...
   IF tbsPermMB > 0 then 
      dbms_output.put_line('CREATE TABLESPACE '|| tbsnome ||'_DATA LOGGING DATAFILE '''||dfpermnome||'''');
      dbms_output.put_line('SIZE '|| tbsPermMB ||'M');
   
      if tbsEpermmb > 0 then
         dbms_output.put_line('AUTOEXTEND ON NEXT '|| tbsEPermMB ||'M MAXSIZE UNLIMITED');
      end if;
   
      dbms_output.put_line('EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT  AUTO;');
   
      dbms_output.put_line('');
   END IF;
   
   
   --Criando a TBS de TEMP...
   IF tbsTempMB > 0 then    
      dbms_output.put_line('CREATE TEMPORARY TABLESPACE '|| tbsnome ||'_TEMP TEMPFILE '''||dfTempNome||'''');
      dbms_output.put_line('SIZE '|| tbsTempMB ||'M');
   
      if tbsETempMB > 0 then
         dbms_output.put_line('AUTOEXTEND ON NEXT '|| tbsETempMB ||'M MAXSIZE UNLIMITED');
      end if;
   
      dbms_output.put_line('EXTENT MANAGEMENT LOCAL UNIFORM SIZE '||ROUND(tbsTempMB/2) ||'M;');
   
      dbms_output.put_line('');
   END IF;
   
   --Criando a TBS de INDEX...
   IF tbsIndMB > 0 then       
      dbms_output.put_line('CREATE TABLESPACE '|| tbsnome ||'_INDEX LOGGING DATAFILE '''||dfIndexnome||'''');
      dbms_output.put_line('SIZE '|| tbsIndMB ||'M');
   
      if tbsEIndMB > 0 then
         dbms_output.put_line('AUTOEXTEND ON NEXT '|| tbsEIndMB ||'M MAXSIZE UNLIMITED');
      end if;
   
      dbms_output.put_line('EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT  AUTO;');
   END IF;
   
   
   
end;
/*


CREATE TABLESPACE "MOA_DATA" 
    LOGGING 
    DATAFILE '/opt/oracle/oradata/apisora2/alarmes/MOA_DATA.dbf' 
    SIZE 5M EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT  
    AUTO */
    
    /*
    SIZE 5M 
    AUTOEXTEND ON NEXT 220K MAXSIZE UNLIMITED 
    EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT  AUTO */