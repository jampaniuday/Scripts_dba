create or replace procedure atualiza_backup(v_servidor number,v_status number,v_observacao varchar2) is
/*1  tecno7
2  hades
3  proteus
4  ares
5  hera
6  tecnobk1
7	tdiserver4
8	geodb1
9	pabd2
10	robd3
11	robd4
12	pabd1
13	devdb5
14	devdb3
15	MYhades
16	zeus
17	devdb4*/

begin
 insert into controle_backup(servidor,status,obs)
 values
 (v_servidor,v_status,v_observacao);
end;
/
