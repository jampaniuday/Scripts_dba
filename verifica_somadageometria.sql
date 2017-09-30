--select column_value from table(select testeconvert(t.geometry,82279).sdo_ordinates from vias_interurbanas t where t.id_vias=100)
begin  
for i in (

select valor, count(valor) qtd from (
  select 
       (select count(*) from table(a.geometry.SDO_ELEM_INFO) ) valor
  from vias_interurbanas a 
)
group by valor order by 1

) loop
  dbms_output.put_line(i.valor ||'   -    '|| i.qtd);
end loop;
end;
