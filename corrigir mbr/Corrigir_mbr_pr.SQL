update sde.layers t set t.minx=52797.4753351775, t.miny=7029374.43925868 , t.maxx=838489.755567918 , t.maxy=7580998.44446002
where t.owner='&USER';
commit;
update sde.spatial_references t set t.falsex=52797.4753351775,t.falsey=7029374.43925868,t.xyunits=540
 where t.srid in (select srid from sde.layers where owner='&USER');
commit;






