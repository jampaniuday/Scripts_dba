/*select sdo_geom.validate_geometry_with_context(a.geometry1,0.01) from ads a where 
sdo_geom.validate_geometry_with_context(a.geometry1,0.01) <> 'TRUE'
SDO_GEOM.sdo_arc_densify(*/

--delete teste
--insert into teste (select a.ID_ADS, A.Geometry1 from ads a)
--select sdo_geom.validate_geometry_with_context(t.geo,0.00005) from teste t where sdo_geom.validate_geometry_with_context(t.geo,0.00005)<>'TRUE'
select t.id_arl,sdo_geom.validate_geometry_with_context(t.geometry1,0.0100001) 
from arl t where sdo_geom.validate_geometry_with_context(t.geometry1,0.01000001)<>'TRUE'


--update teste t set t.geo=sdo_geom.sdo_arc_densify(t.geo, 0.011, 'arc_tolerance=0,00005')
--update teste t set t.geo=sdo_util.remove_duplicate_vertices(t.geo, 0.02)

select * from arl a where existe_arco(a.geometry1) is not null
