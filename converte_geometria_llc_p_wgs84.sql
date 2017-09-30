--criar tabela convertendo campo espacial

create table &Table_name as select id, codigo, tecnogeo.Transformar(g.geometry, 1000205, 8307) nom from geo_lote g

--calcula area baseado no campo espacial

UPDATE lotesiterpa l SET l.area_calculada = ROUND(SDO_GEOM.sdo_area(l.geometry,1,'unit = HECTARE'),4) || ' HA'

