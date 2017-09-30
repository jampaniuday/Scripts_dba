  update sde.layers t set t.minx= -1269481.103, t.miny=-916013.136, t.maxx=1399427.801, t.maxy=840737.029
 where t.owner='&USER';
commit;
update sde.spatial_references t set t.falsex=-1269481.103,t.falsey=-916013.136,t.xyunits=10
 where t.srid in (select srid from sde.layers where owner='&USER');
commit;






