
select * from sde.layers t where t.owner='TSLTGEOPA'
select * from user_sdo_geom_metadata
select * from user_objects o where o.object_name like 'IDXR__%'
select s.srtext from sde.spatial_references s where s.srid in(select t.srid from sde.layers t where t.owner='TSLTGEOPA')
