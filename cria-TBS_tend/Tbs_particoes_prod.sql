alter table ADM_SGV_AUD.auditoria 
add partition
 "A16_M03" VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
 SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS NOLOGGING STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS UNLIMITED  
 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) 
 TABLESPACE "PART_AUDITORIA_A16_M03"; 
 
alter table ADM_SGV_AUD.auditoria_item 
add partition
"A16_M03" VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN')) 
SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS NOLOGGING STORAGE
(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS UNLIMITED  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 
BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "PART_AUDITORIA_ITEM_A16_M03";


alter table ADM_SGV_trn.transacao 
add PARTITION 
"A16_M03" VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
SEGMENT CREATION IMMEDIATE PCTFREE 1 INITRANS 1 MAXTRANS 255  NOCOMPRESS NOLOGGING STORAGE 
(INITIAL 8M     NEXT 1M       MINEXTENTS 1 MAXEXTENTS UNLIMITED  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 
BUFFER_POOL  DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "PART_TRN_A16_M03";


alter table ADM_SGV_trn.transacao_valorada_sumarizada 
add PARTITION 
"A16_M03" VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
SEGMENT CREATION IMMEDIATE PCTFREE 1 INITRANS 1 MAXTRANS 255  NOCOMPRESS NOLOGGING STORAGE 
(INITIAL 8M     NEXT 1M       MINEXTENTS 1 MAXEXTENTS UNLIMITED  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 
BUFFER_POOL  DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "PART_TRN_VAL_SUM_A16_M03";


alter table ADM_SGV_trn.transacao_valorada 
add PARTITION 
"A16_M03" VALUES LESS THAN (TO_DATE(' 2016-04-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))
SEGMENT CREATION IMMEDIATE PCTFREE 1 INITRANS 1 MAXTRANS 255  NOCOMPRESS NOLOGGING STORAGE 
(INITIAL 8M     NEXT 1M       MINEXTENTS 1 MAXEXTENTS UNLIMITED  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 
BUFFER_POOL  DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "PART_TRN_VALORADA_A16_M03";

