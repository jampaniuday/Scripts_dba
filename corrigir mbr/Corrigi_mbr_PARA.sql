update sde.layers t set t.minx=-729188.960788507, t.miny=-643408.748179189, t.maxx=776637.294630274, t.maxy=698306.840227826
 where t.owner='&USER';
commit;
update sde.spatial_references t set t.falsex=-729188.960788507,t.falsey=-643408.748179189,t.xyunits=250
 where t.srid in (select srid from sde.layers where owner='&USER');
commit;
