select  
to_char(versions_starttime,'DD-MON HH:MI') "START DATE",
to_char (versions_endtime, 'DD-MON HH:MI') "END DATE",
versions_xid,
versions_operation,
codigo, nome, tipo, matricula, escala, origem, data, projeto, info, controle, geometry, id
from mario.area_es
versions between scn
minvalue and maxvalue 


