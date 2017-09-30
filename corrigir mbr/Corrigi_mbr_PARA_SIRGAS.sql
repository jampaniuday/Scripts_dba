update sde.layers t set t.minx=-1040000.000, t.miny=-880000.000, t.maxx=1040000.000, t.maxy=880000.000
 where t.owner='&USER' ;
commit;
update sde.spatial_references t set t.falsex=-1040000.000,t.falsey=-880000.000,t.xyunits=250
 where t.srid in (select srid from sde.layers where owner='&USER');
commit;




