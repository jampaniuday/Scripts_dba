--ALTERA MBR RONDONIA

update sde.layers t set t.minx=-913388.205920595, t.miny=7258713.28030222, t.maxx=1925011.25841717, t.maxy=10186611.8268488
 where t.owner='&user' AND T.TABLE_NAME NOT IN ('BRASIL_ESTADOS','CAPITAL','BRASIL_BUFFER');
commit;
update sde.spatial_references t set t.falsex=-913388.205920595,t.falsey=7258713.28030222,t.xyunits=140
 where t.srid in (select srid from sde.layers where owner='&user' and table_name not in ('BRASIL_ESTADOS','CAPITAL','BRASIL_BUFFER'));
commit;