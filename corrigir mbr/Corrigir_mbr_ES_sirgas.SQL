 update sde.layers t set t.minx=78014 , t.miny=7572786, t.maxx=555588, t.maxy=8070865
 where t.owner='&USER';
commit;
update sde.spatial_references t set t.falsex=78014,t.falsey=7572786,t.xyunits=1270
 where t.srid in (select srid from sde.layers where owner='&USER');
commit;






