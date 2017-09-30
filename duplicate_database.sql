#!/bin/sh
# Programa   : Duplicate Database
#
#Versão        Data                    Analista                        Alteracoes
#1.0                            Andrey Schulz                   23/08/2016
###############################################################################
Variaveis ()
{
        . /home/oratst/.bash_profile
        set ORACLE_SID
        export ORACLE_SID="${DBNAME}"
        export AUX_DBNAME="$( echo ${DBNAME} | tr 'a-z' 'A-Z')"
        DirBase=/home/oratst/atualiza_banco
        DirScripts="${DirBase}/${DBNAME}"
        DirLog=${DirBase}/log
        DirTmp=${DirBase}/tmp
        ArqTmp=${DirTmp}/arqlog_${programa}_$$.tmp
        ArqParametro=${DirTmp}/${programa}_parametro_$$.log
        ArqAux=${DirTmp}/${programa}_Aux_$$.log
        ArqLogErros=${DirTmp}/${programa}_erros_$$.log
        StepCount=0
        ArqLogProcesso="${DirLog}/${AUX_DBNAME}_${programa}_`date '+%Y%m%d'`.log"
        export ArqLogProcesso="${DirLog}/${ORACLE_SID}_${programa}_`date '+%Y%m%d%H'`.log"
        ArqLogTemp=${DirTmp}/${DBNAME}_temp.log
        ORACLE_HOME=/u01/app/oracle/product/11.2.0/dbhome_2

        ########
        #STATUS#
        ########
        STATUS_DROP=ERRO
        STATUS_INI=ERRO
        STATUS_DUP=ERRO
        STATUS_ARC=ERRO
        STATUS_PASS=ERRO
        STATUS_DBL=ERRO
        STATUS_JOBS=ERRO

        ######################
        #VAR DUPLICATE ACTIVE#
        ######################
        userprd=sys
        passprd=or4cl3Ielusk
        TNS_PRD=ORCL_PRD
        useraux=sys
        passaux=or4cl3Ielusk
        TNS_AUX=TEST_AUX

}

Display ()
{
        StepCount="`expr $StepCount + 1`"

        echo "[ $StepCount ] `date '+%d/%m/%Y %T'` $*" >> $ArqLogProcesso
}
DropDatabase ()
{
        Display "Iniciando check para exclusao da base $ORACLE_SID"
        VERBASE=`$ORACLE_HOME/bin/sqlplus -s "/ as sysdba" <<EOF
        SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
        whenever sqlerror exit sql.sqlcode;
        SELECT instance_name FROM v\\$instance;
        EXIT;
EOF`
        if [ "$?" -ne "0" ]
        then
        STATUS_DROP=ERRO
        Display "Nao foi possivel verificar o banco que será dropado"
        cat $ArqLogTemp >> $ArqLogProcesso
        else
        if [ "$VERBASE" = "$ORACLE_SID" ];
        then
        cat /dev/null > ${ArqTmp}
        Display "Iniciando a exclusão do banco de dados"
        $ORACLE_HOME/bin/sqlplus -s "/ as sysdba" > ${ArqLogTemp} 2>&1 <<EOF
        --whenever sqlerror exit sql.sqlcode;
        shutdown abort;
        startup mount exclusive restrict;
        drop database;
        quit;
EOF
                if [ "$?" -ne "0" ]
                then
                STATUS_DROP=ERRO
                Display "Remoção do Banco - ERRO"
                cat $ArqLogTemp >> $ArqLogProcesso
                Display "Concluido Remoção do banco de dados"
                else
                STATUS_DROP=OK
                Display "Remoção do Banco - OK"
                cat $ArqLogTemp >> $ArqLogProcesso
                Display "Concluido Remoção do banco de dados"
                fi
        else
        STATUS_DROP=ERRO
        echo "BASE NAO SERA EXCLUIDA, CONFIRME AS VARIAVEIS ESTAO SETADAS CORRETAMENTE!!!"
        fi
    fi
}

StartupNomount ()
{
        cat /dev/null > ${ArqTmp}
        Display "Inciando a instancia para duplicate"
        $ORACLE_HOME/bin/sqlplus -s "/ as sysdba" > ${ArqLogTemp} 2>&1 <<EOF
        whenever sqlerror exit sql.sqlcode;
        shutdown abort;
        startup nomount;
        exit;
EOF
        if [ "$?" -ne "0" ]
        then
                STATUS_INI=ERRO
                Display "ERRO - ERRO no comando de startup da instancia"
                cat $ArqLogTemp >> $ArqLogProcesso
        else
                Display "Startup - OK"
                STATUS_INI=OK
                cat $ArqLogTemp >> $ArqLogProcesso
                Display "Concluido Startup da instancia"
        fi
}
DuplicateDisk ()
{
        cat /dev/null > ${ArqTmp}
        Display "Inciando duplicate"
        $ORACLE_HOME/bin/rman auxiliary $useraux/$passaux cmdfile="${DirScripts}/DuplicateDisk_$ORACLE_SID.rman" msglog=${ArqTmp} 2>&1

        if [ "$?" != "0" ]
        then
                STATUS_DUP=ERRO
                Display "ERRO - Duplicate Database"
                cat $ArqTmp >> $ArqLogProcesso
                echo "`date '+%d/%m/%Y %T'` -> Erro no processo de duplicate" >> $ArqLogErros
                return 1
        else
                Display "OK - ${programa}"
                STATUS_DUP=OK
        fi

        cat $ArqTmp >> $ArqLogProcesso

        Display "Concluido Duplicate Database"

}

DuplicateActive ()
{
        cat /dev/null > ${ArqTmp}
        Display "Inciando duplicate"
        $ORACLE_HOME/bin/rman target $userprd/$passprd@$TNS_PRD auxiliary $useraux/$passaux@$TNS_AUX cmdfile="${DirScripts}/DuplicateActive_$ORACLE_SID.rman" msglog=${ArqTmp} 2>&1

        if [ "$?" != "0" ]
        then
                STATUS_DUP=ERRO
                Display "ERRO - Duplicate Database"
                cat $ArqTmp >> $ArqLogProcesso
                echo "`date '+%d/%m/%Y %T'` -> Erro no processo de duplicate" >> $ArqLogErros
                return 1
        else
                Display "OK - ${programa}"
                STATUS_DUP=OK
        fi

        cat $ArqTmp >> $ArqLogProcesso

        Display "Concluido Duplicate Database"

}

DuplicateTape ()
{
        cat /dev/null > ${ArqTmp}
        Display "Inciando duplicate"
        $ORACLE_HOME/bin/rman target $userprd/$passprd@$TNS_PRD auxiliary $useraux/$passaux@$TNS_AUX cmdfile="${DirScripts}/DuplicateTape_$ORACLE_SID.rman" msglog=${ArqTmp} 2>&1

        if [ "$?" != "0" ]
        then
                STATUS_DUP=ERRO
                Display "ERRO - Duplicate Database"
                cat $ArqTmp >> $ArqLogProcesso
                echo "`date '+%d/%m/%Y %T'` -> Erro no processo de duplicate" >> $ArqLogErros
                return 1
        else
                Display "OK - ${programa}"
                STATUS_DUP=OK
        fi

        cat $ArqTmp >> $ArqLogProcesso

        Display "Concluido Duplicate Database"

}

RemoveArchivelog ()
{
        cat /dev/null > ${ArqTmp}
        Display "Removendo base de archivelog"
        $ORACLE_HOME/bin/sqlplus -s "/ as sysdba" > ${ArqLogTemp} 2>&1 <<EOF
        shutdown immediate;
        startup mount;
        alter database noarchivelog;
        alter database open;
        quit;
EOF
if [ "$?" -ne "0" ]
        then
                STATUS_ARC=ERRO
                Display "ERRO - Erro na remoção da base de archivelog"
                cat $ArqLogTemp >> $ArqLogProcesso
        else
                Display "Remoçao da base de Archivelog - OK"

                cat $ArqLogTemp >> $ArqLogProcesso
                STATUS_ARC=OK

                Display "Concluido remoção da base de archivelog"
fi
}

AjustaDblinks ()
{
        cat /dev/null > ${ArqTmp}
        Display "Iniciando ajuste dos dblinks"
        $ORACLE_HOME/bin/sqlplus -s "/ as sysdba" @${DirScripts}/database_link_$ORACLE_SID.sql > ${ArqLogTemp} 2>&1
       if [ "$?" -ne "0" ]
        then
                STATUS_DBL=ERRO
                Display "ERRO  - Erro no ajustes dos DBLINKS"
                cat $ArqLogTemp >> $ArqLogProcesso
        else
                Display "OK - DBLINKS Alterados "
                cat $ArqLogTemp >> $ArqLogProcesso
                STATUS_DBL=OK
                Display "Concluido DBLINKS"
        fi
}

AjustaSenhas ()
{
        cat /dev/null > ${ArqTmp}
        Display "Iniciando ajuste das senhas dos usuarios"
        $ORACLE_HOME/bin/sqlplus -s "/ as sysdba" @${DirScripts}/altera_senha_$ORACLE_SID.sql > ${ArqLogTemp} 2>&1
        if [ "$?" -ne "0" ]
        then
                STATUS_PASS=ERRO
                Display "ERRO - Erro no ajuste das senhas "
                cat $ArqLogTemp >> $ArqLogProcesso
        else
                Display "OK - Senhas alteradas com sucesso"
                cat $ArqLogTemp >> $ArqLogProcesso
                STATUS_PASS=OK
                Display "Concluido alteraçao das senhas"
        fi

}

Monitoracao ()
{
        Display "Gravando arquivo de monitoracao"
        cat /dev/null > ${ArqTmp}
        $ORACLE_HOME/bin/sqlplus -s "/ as sysdba" > ${DirLog}/DataRefresh_$ORACLE_SID.log 2>&1 <<EOF
        whenever sqlerror exit sql.sqlcode;
        set tab off
        set pagesize 0
        set linesize 80
        set feedback off
        set termout off
        select (RESETLOGS_TIME - cast('01-JAN-1970' as date)) * 24 * 60 * 60 from v\$database;
        quit;
EOF

}


DesabilitaJobs ()
{
        cat /dev/null > ${ArqTmp}
        Display "Iniciando processo para desabilitar jobs"
        $ORACLE_HOME/bin/sqlplus -s "/ as sysdba" @${DirScripts}/desabilita_jobs_$ORACLE_SID.sql > ${ArqLogTemp} 2>&1
        if [ "$?" -ne "0" ]
        then
                STATUS_JOBS=ERRO
                Display "ERRO - Erro no processo para desabilitar jobs "
                cat $ArqLogTemp >> $ArqLogProcesso
        else
                Display "OK - Jobs desabilitadas com sucesso"
                cat $ArqLogTemp >> $ArqLogProcesso
                STATUS_JOBS=OK
                Display "Concluido alteraçao das jobs "
        fi

}

if [ "$#" -eq "2" ]
then
        export DBNAME="$1"

        case $2 in

                'ACTIVE')

                        programa=DuplicateActive

                        Variaveis
                        Display  "Iniciando processo de duplicate"
                        Display  "Iniciando remoção do banco"
                        DropDatabase

                        Display  "Iniciando Instancia"
                        if [ "$STATUS_DROP" = "OK" ]
                        then
                        StartupNomount
                        fi

                        Display  "Inicio do duplicate"
                        if [ "$STATUS_INI" = "OK" ]
                        then
                        DuplicateActive
                        fi
                        Display  "Fim do duplicate"

                        # (5) Remove Archivelog
                        if [ "$STATUS_DUP" = "OK" ]
                        then
                                RemoveArchivelog
                        else
                                Display  "Modo ARCHIVELOG não removido - $STATUS_DUP"
                        fi

                        if [ "$STATUS_ARC" = "OK" ]
                        then
                                Monitoracao
                        else
                                Display  "Arquivo de monitoramento não gravado - $STATUS_ARC"
                        fi
                        Display  "Fim Process de duplicate"

                ;;

               'DISK')

                        programa=DuplicateDisk

                        Variaveis
                        Display  "Iniciando processo de duplicate"
                        Display  "Iniciando remoção do banco"
                        DropDatabase

                        Display  "Iniciando Instancia"
                        if [ "$STATUS_DROP" = "OK" ]
                        then
                        StartupNomount
                        fi

                        Display  "Inicio do duplicate"
                        if [ "$STATUS_INI" = "OK" ]
                        then
                        DuplicateDisk
                        fi
                        Display  "Fim do duplicate"

                        # (5) Remove Archivelog
                        if [ "$STATUS_DUP" = "OK" ]
                        then
                                RemoveArchivelog
                        else
                                Display  "Modo ARCHIVELOG não removido - $STATUS_DUP"
                        fi

                        if [ "$STATUS_ARC" = "OK" ]
                        then
                                Monitoracao
                        else
                                Display  "Arquivo de monitoramento não gravado - $STATUS_ARC"
                        fi

                        Display  "Fim Process de duplicate"

                ;;

              'TAPE')

                        programa=DuplicateTape
                        Variaveis
                        Display  "Iniciando processo de duplicate"
                        Display  "Iniciando remoção do banco"
                        DropDatabase

                        Display  "Iniciando Instancia"
                        if [ "$STATUS_DROP" = "OK" ]
                        then
                        StartupNomount
                        fi

                        Display  "Inicio do duplicate"
                        if [ "$STATUS_INI" = "OK" ]
                        then
                        DuplicateTape
                        fi
                        Display  "Fim do duplicate"

                        if [ "$STATUS_DUP" = "OK" ]
                        then
                                RemoveArchivelog
                        else
                                Display  "Modo ARCHIVELOG não removido - $STATUS_DUP"
                        fi

                        if [ "$STATUS_ARC" = "OK" ]
                        then
                                Monitoracao
                        else
                                Display  "Arquivo de monitoramento não gravado - $STATUS_ARC"
                        fi

                        Display  "Fim Process de duplicate"

                ;;

               'STANDBY')

                        programa=DuplicateStandby

                        # (0) Inicializa variaveis de ambiente
                        Variaveis

                        Display  "Inicio do duplicate"
                        DuplicateActive
                        Display  "Fim do duplicate"

                        # (5) Remove Archivelog
                        RemoveArchivelog

                        # (6) Executa export da base de RMAN
                        AjustaDblinks

                        # (7) Finaliza controle da monitoracao
                        AjustaSenhas

                        Display  "Fim Process de duplicate"

                ;;

                *)
                        echo "OPCOES DISPONIVEIS: $0 ORACLE_SID {ACTIVE | DISK  | TAPE | STANDBY}"
                        exit 0
                ;;

           esac
fi
