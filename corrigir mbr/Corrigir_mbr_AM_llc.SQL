update sde.layers t set t.minx= -2000000, t.miny=-1300000, t.maxx=2000000, t.maxy=1300000
 where t.owner='&USER';
commit;
update sde.spatial_references t set t.falsex=-2000000,t.falsey=-1300000,t.xyunits=10
 where t.srid in (select srid from sde.layers where owner='&USER');
commit;






