#!/bin/sh
echo "  +-------------------------------------------------------------------+"
echo "  | Autor: Jacenir de Freitas                                         |"
echo "  | Data Criação:  06/12/2013                                         |"
echo "  | Alteração: 10/06/2014 (Parametro para TNS)			    |"
echo "  | Procedimento de Clonagem Database                                 |"
echo "  +-------------------------------------------------------------------+"
echo "  REQUISITOS: O caminho dos backupset e archive devem ser o mesmo.      "
export ORACLE_HOME ORACLE_SID ORACLE_UNQNAME NLS_DATE_FORMAT NLS_DATE_LANG ORIG_BACKUP ORIG_BACKUP_ARC DEST_BACKUP DEST_BACKUP_ARC DEST_DATAFILES RMAN_CONNECT_STRING SCRIPTS RMAN_CMD IP
echo ORACLE_SID=$ORACLE_SID
echo ORACLE_UNQNAME=$ORACLE_SID
ORACLE_HOME=/u01/app/oracle/product/11.2.0/dbhome_1
SCRIPTS=/home/oracle/atualiza_banco/databases
cd $SCRIPTS
IP=10.200.240.13
RMAN_CMD=rman

export  J
J=`ifconfig | grep $IP | wc -l`
if [ "$J" != "1" ];
then
echo "Voce nao esta no servidor de desenvolvimento. Abort.."
exit
fi

if [ "$ORACLE_SID" == "fac01" ];
then
echo "Ajusta TNS de producao..."
TNSPRD=facmutuo_prod
fi

if [ "$ORACLE_SID" == "msafdwhmg" ];
then
echo "Ajusta TNS de producao..."
TNSPRD=msafdw_prod
fi

echo "          "
sqlplus  / as sysdba  @$SCRIPTS/mount_database.sql

echo "Digite a senha do usuaio sys"
rman target sys@$TNSPRD auxiliary / cmdfile=$SCRIPTS/duplicate_$ORACLE_SID.rman
sqlplus  / as sysdba  @$SCRIPTS/alter_archive_database.sql

echo "Alterando as senhas..."
sqlplus  / as sysdba  @$SCRIPTS/.change_password_$ORACLE_SID.sql

echo "Ajustando Tablespaces (UNDO, TEMP, USERS)..."
sqlplus / as sysdba @$SCRIPTS/ajusta_tablespace_$ORACLE_SID.sql

if [ "$ORACLE_SID" == "msafdwhmg" ];
then
echo "Limpeza Mastersaf Homologacao..."
sqlplus / as sysdba @$SCRIPTS/limpeza_msafdwhmg.sql
fi

echo "Recriando repositório EMCA..."
emca -config dbcontrol db -repos recreate -silent -respFile .input_emca_$ORACLE_SID

echo "Concluido"
