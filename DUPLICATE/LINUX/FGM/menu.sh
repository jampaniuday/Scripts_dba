#!/bin/bash
# Menu Shell
unset $a
menu ()
 {
 a="ok"

while true $a !="ok"
 do
	echo""
    	echo "MENU PRINCIPAL"
    	echo ""
	echo "1 - Atualizar o banco facmutuo"
    	echo "2 - Atualizar o banco fac01"
    	echo "3 - Atualizar o banco gstparclb1"
    	echo "4 - Atualizar o banco gstparclb2"
    	echo "5 - Atualizar o banco gstparcle"
    	echo "6 - Atualizar o banco msafdwhmg"
    	echo ""
    	echo "OBS. pressione 'ctrl+c' p/ sair"
    	echo ""
    	echo "Digite a opcao desejada: "
    	read a
    	case $a in
		1) export ORACLE_SID=facmutuo;cd /home/oracle/atualiza_banco/databases/;sh duplicate_desenv.sh;;
    		2) export ORACLE_SID=fac01;cd /home/oracle/atualiza_banco/databases/;sh duplicate_desenv.sh;;
    		3) export ORACLE_SID=gstparclb1;cd /home/oracle/atualiza_banco/databases/;sh duplicate_desenv.sh;;
		4) export ORACLE_SID=gstparclb2;cd /home/oracle/atualiza_banco/databases/;sh duplicate_desenv.sh;;
		5) export ORACLE_SID=gstparcle;cd /home/oracle/atualiza_banco/databases/;sh duplicate_desenv.sh;;
		6) export ORACLE_SID=msafdwhmg;cd /home/oracle/atualiza_banco/databases/;sh duplicate_desenv.sh;;
	esac
 done
 }

menu
