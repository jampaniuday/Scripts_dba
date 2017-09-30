select 
geometria9i.validar(b.geo) b_valida,
b.geo.sdo_gtype,

geometria9i.validar(mdsys.sdo_util.remove_duplicate_vertices(b.geo, 0.01)) validar,
mdsys.sdo_util.remove_duplicate_vertices(b.geo, 0.01).sdo_ordinates b_sdo_ordinates,
mdsys.sdo_util.remove_duplicate_vertices(b.geo, 0.01).sdo_elem_info b_sdo_elem_info,
mdsys.sdo_util.remove_duplicate_vertices(b.geo, 0.01).sdo_gtype sdo_gtype

  from    
         (select 
         geometry1 geo
          from ads          
          ) b




         
