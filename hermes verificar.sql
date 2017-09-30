select
sdo_cs.transform(
  sdo_cs.transform(
    mdsys.sdo_geometry(2001,4170,null, mdsys.sdo_elem_info_array(1,1,1), mdsys.sdo_ordinate_array(-52.1681, -3.4795))
  ,0.01001,1000205)
  ,0.01001,4170)

from dual
