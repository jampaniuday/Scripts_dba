ALTER SESSION SET CURRENT_SCHEMA=mastersaf;
/
alter table dwt_itens_merc disable constraint FK_SAF_0637;
/
alter table dwt_itens_SERV disable constraint FK_SAF_0638;
/
truncate table dwt_itens_merc;
/
truncate table dwt_itens_serv;
/
truncate table dwt_docto_fiscal;
/
alter table dwt_itens_merc ENABLE constraint FK_SAF_0637;
/
alter table dwt_itens_SERV ENABLE constraint FK_SAF_0638;
/
alter table LIB_PROC_CAB disable constraint FK_LIB_PROC_CAB;
/
alter table LIB_PROC_LOG disable constraint FK_LIB_PROC_LOG;~
/
alter table LIB_PROC_SAIDA disable constraint FK_LIB_PROC_SAIDA;
/
alter table LIB_PROC_SAIDA_COMPL disable constraint FK_LIB_PROC_SAIDA_COMPL;
/
truncate table LIB_PROC_CAB;
/
truncate table LIB_PROC_LOG;
/
truncate table LIB_PROC_SAIDA;
/
truncate table LIB_PROC_PARAM;
/
truncate table LIB_PROCESSO;
/
truncate table LIB_PROC_SAIDA_COMPL;
/
alter table LIB_PROC_CAB ENABLE constraint FK_LIB_PROC_CAB;
/
alter table LIB_PROC_LOG ENABLE constraint FK_LIB_PROC_LOG;
/
alter table LIB_PROC_SAIDA ENABLE constraint FK_LIB_PROC_SAIDA;
/
alter table LIB_PROC_SAIDA_COMPL enable constraint FK_LIB_PROC_SAIDA_COMPL;
/
truncate table INT_SAIDA_GER;
/
truncate table INT_SAIDA;
/
truncate table LOG_DET_PROC;
/
truncate table LOG_PROCESSO;
/
truncate table DET_PROC_GERACAO;
/
truncate table DET_PROC_IMP;
/
truncate table DET_PROC_IMP_C;
/
truncate table IBT_HISTORICO;
/
