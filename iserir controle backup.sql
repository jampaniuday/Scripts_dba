/*ID_SERVER  INSTANCIA
    1        ora7
    2        orahades
    3        oraermes
    4	       oraares
    5	       orahera
    6	       oradev1
    7	       tdiserver4
    8	       orartemi
    9	       orapabd2
    10	     orarobd3
    11	     orarobd4
    12	     orapabd1

  ID_STATUS	 DESCRIÇÃO
     1	     ok
     2	     falha
     3	     falha na copia
     4	     copiando
*/

insert into controle_backup t (servidor, status, obs) values
('&servidor','&status','&obs');
commit;
