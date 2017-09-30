begin
  for i in (select * from vias_interurbanas) loop
      begin
        i.geometry:= testeconvert(i.geometry,82279);
      exception
        when others then
             dbms_output.put_line(i.id_vias||',');
      end;
  end loop;

end;

