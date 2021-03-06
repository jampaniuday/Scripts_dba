SELECT 

  DBMS_STATS.get_prefs(ownname=>'ADM_SGV_TRN',tabname=>'TRANSACAO',pname=>'INCREMENTAL') incremental,
  DBMS_STATS.get_prefs(ownname=>'ADM_SGV_TRN',tabname=>'TRANSACAO',pname=>'GRANULARITY') granularity,
  DBMS_STATS.get_prefs(ownname=>'ADM_SGV_TRN',tabname=>'TRANSACAO',pname=>'STALE_PERCENT') stale_percent,
  DBMS_STATS.get_prefs(ownname=>'ADM_SGV_TRN',tabname=>'TRANSACAO',pname=>'ESTIMATE_PERCENT') estimate_percent,
  DBMS_STATS.get_prefs(ownname=>'ADM_SGV_TRN',tabname=>'TRANSACAO',pname=>'CASCADE') cascade,
  DBMS_STATS.get_prefs(pname=>'METHOD_OPT') method_opt
FROM DUAL 

SELECT STATTYPE_LOCKED FROM DBA_TAB_STATISTICS WHERE TABLE_NAME='FILA_PRC_TRANSACAO' and OWNER='ADM_SGV_FTR' ;
