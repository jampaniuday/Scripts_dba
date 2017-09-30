update sde.layers t set t.minx=-66.8022599437761, t.miny=-19.0749915845955, t.maxx=-45.1977601094817, t.maxy=-6.42498839214675
 where t.owner='&USER' AND T.TABLE_NAME LIKE 'MT_GEO%';
commit;
update sde.spatial_references t set t.falsex=-66.8022599437761,t.falsey=-19.0749915845955,t.xyunits=280
 where t.srid in (select srid from sde.layers where owner='&USER'  AND TABLE_NAME LIKE 'MT_GEO%');
commit;






