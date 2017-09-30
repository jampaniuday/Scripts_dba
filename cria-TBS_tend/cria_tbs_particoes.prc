create or replace procedure cria_tbs_particoes as

  mes_ano varchar2(10);
  mes     varchar2(10);
  --tbs varchar2(1);

begin
  select 'A' || to_char(sysdate, 'yy') || '_M' ||
         to_char(add_months(sysdate, +1), 'mm')
    into mes_ano
    from dual;
  select 'A' || to_char(sysdate, 'yy') || '_M' ||
         to_char(add_months(sysdate, +2), 'mm')
    into mes
    from dual;

  --cria tablespaces

  execute immediate 'CREATE TABLESPACE PART_AUDITORIA_' || mes_ano ||
                    ' DATAFILE   ''+DATA/uat/datafile/part_auditoria_' ||
                    lower(mes_ano) ||
                    '.dbf''
SIZE 1M AUTOEXTEND ON NEXT 10k MAXSIZE UNLIMITED LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON';

  execute immediate 'CREATE TABLESPACE PART_AUDITORIA_ITEM_' || mes_ano ||
                    ' DATAFILE ''+DATA/uat/datafile/part_auditoria_item_' ||
                    lower(mes_ano) ||
                    '.dbf''
SIZE 1M AUTOEXTEND ON NEXT 10k MAXSIZE UNLIMITED LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON';

  execute immediate 'CREATE TABLESPACE PART_TRN_' || mes_ano ||
                    ' DATAFILE  ''+DATA/uat/datafile/part_trn_' ||
                    lower(mes_ano) ||
                    '.dbf''
SIZE 10m AUTOEXTEND ON NEXT 10k MAXSIZE UNLIMITED LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON';

  execute immediate 'CREATE TABLESPACE PART_TRN_VAL_SUM_' || mes_ano ||
                    ' DATAFILE ''+DATA/uat/datafile/part_trn_val_sum_' ||
                    lower(mes_ano) ||
                    '.dbf''
SIZE 10m AUTOEXTEND ON NEXT 32K MAXSIZE UNLIMITED LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON';

  execute immediate 'CREATE TABLESPACE PART_TRN_VALORADA_' || mes_ano ||
                    ' DATAFILE ''+DATA/uat/datafile/part_trn_valorada_' ||
                    lower(mes_ano) ||
                    '.dbf''
SIZE 10m AUTOEXTEND ON NEXT 32K MAXSIZE UNLIMITED   LOGGING   ONLINE   PERMANENT   EXTENT MANAGEMENT LOCAL AUTOALLOCATE   BLOCKSIZE 8K   SEGMENT SPACE MANAGEMENT AUTO   FLASHBACK ON';

  execute immediate 'CREATE TABLESPACE PART_LIM_SAL_TRN_' || mes_ano ||
                    ' DATAFILE  ''+DATA/uat/datafile/part_lim_sal_trn_' ||
                    lower(mes_ano) ||
                    '.dbf''
SIZE 13M AUTOEXTEND ON NEXT 8K MAXSIZE UNLIMITED LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE MANAGEMENT AUTO FLASHBACK ON';

  --cria parti��es

  execute immediate 'alter table ADM_SGV_AUD.auditoria add partition ' ||
                    mes_ano || ' VALUES LESS THAN
(TO_DATE(''20' || SUBSTR(mes_ano, 2, 2) || '-' ||
                    SUBSTR(mes, 6, 2) ||
                    '-01 00:00:00'', ''SYYYY-MM-DD HH24:MI:SS'', ''NLS_CALENDAR=GREGORIAN''))
 SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  NOCOMPRESS NOLOGGING STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS UNLIMITED
 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)  TABLESPACE "PART_AUDITORIA_' ||
                    mes_ano || '"';

  execute immediate 'alter table ADM_SGV_AUD.auditoria_item add partition ' ||
                    mes_ano || ' VALUES LESS THAN
(TO_DATE(''20' || SUBSTR(mes_ano, 2, 2) || '-' ||
                    SUBSTR(mes, 6, 2) ||
                    '-01 00:00:00'', ''SYYYY-MM-DD HH24:MI:SS'', ''NLS_CALENDAR=GREGORIAN''))
SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING STORAGE (INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS UNLIMITED
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "PART_AUDITORIA_ITEM_' ||
                    mes_ano || '"';

  execute immediate 'alter table ADM_SGV_trn.transacao add PARTITION ' ||
                    mes_ano || ' VALUES LESS THAN
(TO_DATE(''20' || SUBSTR(mes_ano, 2, 2) || '-' ||
                    SUBSTR(mes, 6, 2) ||
                    '-01 00:00:00'', ''SYYYY-MM-DD HH24:MI:SS'', ''NLS_CALENDAR=GREGORIAN''))
SEGMENT CREATION IMMEDIATE PCTFREE 1 INITRANS 1 MAXTRANS 255  NOCOMPRESS NOLOGGING STORAGE (INITIAL 8M     NEXT 1M       MINEXTENTS 1 MAXEXTENTS UNLIMITED
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL  DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "PART_TRN_' ||
                    mes_ano || '"';

  execute immediate 'alter table ADM_SGV_trn.transacao_valorada_sumarizada add PARTITION ' ||
                    mes_ano || ' VALUES LESS THAN
(TO_DATE(''20' || SUBSTR(mes_ano, 2, 2) || '-' ||
                    SUBSTR(mes, 6, 2) ||
                    '-01 00:00:00'', ''SYYYY-MM-DD HH24:MI:SS'', ''NLS_CALENDAR=GREGORIAN''))
SEGMENT CREATION IMMEDIATE PCTFREE 1 INITRANS 1 MAXTRANS 255  NOCOMPRESS NOLOGGING STORAGE (INITIAL 8M     NEXT 1M       MINEXTENTS 1 MAXEXTENTS UNLIMITED
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL  DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "PART_TRN_VAL_SUM_' ||
                    mes_ano || '"';

  execute immediate 'alter table ADM_SGV_trn.transacao_valorada add PARTITION ' ||
                    mes_ano || ' VALUES LESS THAN
(TO_DATE(''20' || SUBSTR(mes_ano, 2, 2) || '-' ||
                    SUBSTR(mes, 6, 2) ||
                    '-01 00:00:00'', ''SYYYY-MM-DD HH24:MI:SS'', ''NLS_CALENDAR=GREGORIAN''))
SEGMENT CREATION IMMEDIATE PCTFREE 1 INITRANS 1 MAXTRANS 255  NOCOMPRESS NOLOGGING STORAGE (INITIAL 8M     NEXT 1M       MINEXTENTS 1 MAXEXTENTS UNLIMITED
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL  DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "PART_TRN_VALORADA_' ||
                    mes_ano || '"';

  execute immediate 'alter table ADM_SGv_trn.limite_saldo_trn add partition ' ||
                    mes_ano || ' VALUES LESS THAN
(TO_DATE(''20' || SUBSTR(mes_ano, 2, 2) || '-' ||
                    SUBSTR(mes, 6, 2) ||
                    '-01 00:00:00'', ''SYYYY-MM-DD HH24:MI:SS'', ''NLS_CALENDAR=GREGORIAN''))
SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING STORAGE (INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS UNLIMITED
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "PART_LIM_SAL_TRN_' ||
                    mes_ano || '"';

  execute immediate 'alter table ADM_SGv_cob.limite_saldo_limite add partition ' ||
                    mes_ano || ' VALUES LESS THAN
(TO_DATE(''20' || SUBSTR(mes_ano, 2, 2) || '-' ||
                    SUBSTR(mes, 6, 2) ||
                    '-01 00:00:00'', ''SYYYY-MM-DD HH24:MI:SS'', ''NLS_CALENDAR=GREGORIAN''))
SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING STORAGE (INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS UNLIMITED
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "PART_LIM_SAL_LIM_GERAL00"';

  execute immediate 'alter table ADM_SGv_cob.limite_saldo_baixa add partition ' ||
                    mes_ano || ' VALUES LESS THAN
(TO_DATE(''20' || SUBSTR(mes_ano, 2, 2) || '-' ||
                    SUBSTR(mes, 6, 2) ||
                    '-01 00:00:00'', ''SYYYY-MM-DD HH24:MI:SS'', ''NLS_CALENDAR=GREGORIAN''))
SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING STORAGE (INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS UNLIMITED
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "PART_LIM_SAL_BAIXA_A16"';

end;
/
