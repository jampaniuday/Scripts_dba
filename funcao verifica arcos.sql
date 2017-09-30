create or replace function etmdmt.existe_arco(p_geo mdsys.sdo_geometry) return varchar2 is
      v_erro varchar2(10);
      i number := 3;
   begin
      v_erro := '';

      if (p_geo.sdo_elem_info is not null) then
        while ( i<= p_geo.sdo_elem_info.count) loop
          if ( (p_geo.sdo_elem_info(i) in (2,4)) and (p_geo.sdo_elem_info(i-1) in (1003,2003,2)) ) then
            v_erro:= ' ARCO ';
            exit;
          end if;
          i:= i+3;
        end loop;
      end if;

      return v_erro;
   end;