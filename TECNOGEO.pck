CREATE OR REPLACE PACKAGE "TECNOGEO" is

   spa_tolerancia  constant number := 0.01001;


   function CLOB2Geometry(bytes clob) return mdsys.sdo_geometry;
   function Extrair(geometria mdsys.sdo_geometry, gtype number default null, simplificar varchar2 default 'FALSE') return mdsys.sdo_geometry;
   function Transformar(geometria mdsys.sdo_geometry, srid_origem number, srid_destino number) return mdsys.sdo_geometry;
 function RemoverSrid(p_geo mdsys.sdo_geometry ) return mdsys.sdo_geometry ;
end;

 
/
CREATE OR REPLACE PACKAGE BODY "TECNOGEO" is

   type t_reader is record (
      pos_ini    number := 0,
      pos_fim    number := 0,
      tam_buffer number := 0,
      buffer     varchar2(32767) := '',
      tam_clob   number,
      clob_      clob
   );


   ----------------------------------------------------------------------------
   -- Pega proximo numero de uma string com numeros separados por espacos
   ----------------------------------------------------------------------------
   function pegaNumero(pos in out nocopy number, reader in out nocopy t_reader) return number is
      tam_char number;
      buf_char varchar2(50);
      tam_lido number;
      ini_leitura number;
      fim_leitura number;

   begin

      -- pega buffer
      if (reader.tam_buffer < 1) or (pos > reader.pos_fim) then
         tam_lido := reader.tam_clob - reader.pos_fim;

         if tam_lido > 32767 then
            tam_lido := dbms_lob.instr(reader.clob_, ' ', reader.pos_fim + 32767 - 50);
            tam_lido :=  tam_lido - reader.pos_fim;
         end if;
         
         dbms_lob.read(reader.clob_, tam_lido, reader.pos_fim+1, reader.buffer);
         reader.tam_buffer := tam_lido;
         reader.pos_ini := reader.pos_fim+1;
         reader.pos_fim := reader.pos_ini + tam_lido-1;
      end if;

      -- traduz posicao
      ini_leitura := pos - reader.pos_ini + 1;
      fim_leitura := instr(reader.buffer, ' ', ini_leitura);
      tam_char := fim_leitura - ini_leitura;

      buf_char := substr(reader.buffer, ini_leitura, tam_char);
      pos := pos + tam_char + 1;

      return to_number(buf_char);
   end;
   ----------------------------------------------------------------------------



   ----------------------------------------------------------------------------
   -- Converte CLOB para Geometria
   ----------------------------------------------------------------------------
   function CLOB2Geometry(bytes clob) return mdsys.sdo_geometry is 
      geo mdsys.sdo_geometry := new mdsys.sdo_geometry(null,null,null,null,null);
      pos number;
      i   number;
      tam binary_integer;
      valor_number number;

      elem_info mdsys.sdo_elem_info_array;
      ordinate mdsys.sdo_ordinate_array;
      reader t_reader;

   begin
      
      reader.tam_clob := dbms_lob.getlength(bytes);
      reader.clob_ := bytes;

      pos := 1;
      
      -- gtype
      valor_number := pegaNumero(pos, reader);
      geo.SDO_GTYPE := valor_number;

      -- srid
      valor_number := pegaNumero(pos, reader);
      if (valor_number <> -1) then
         geo.SDO_SRID := valor_number;
      end if;

      -- point
      valor_number := pegaNumero(pos, reader);

      -- tem point
      if valor_number <> 0 then
         geo.SDO_POINT := new mdsys.sdo_point_type(null,null,null);

         -- x
         valor_number := pegaNumero(pos, reader);
         geo.SDO_POINT.X := valor_number;

         -- y
         valor_number := pegaNumero(pos, reader);
         geo.SDO_POINT.Y := valor_number;

         -- z
         valor_number := pegaNumero(pos, reader);
         geo.SDO_POINT.Z := valor_number;
      end if;

      -- eleminfo
      tam := pegaNumero(pos, reader);

      if (tam >0) then
         elem_info := new mdsys.sdo_elem_info_array();
         elem_info.Extend(tam);
         i := 1;

         while i <= tam loop
            valor_number := pegaNumero(pos, reader);
            elem_info(i) := valor_number;
            i := i + 1;
         end loop;
   
         geo.SDO_ELEM_INFO := elem_info;
   
         -- ordinates
         tam := pegaNumero(pos, reader); 
   
         if (tam > 0) then    
            ordinate := new mdsys.sdo_ordinate_array();
            ordinate.extend(tam);
            i := 1;

            while i <= tam loop
               valor_number := pegaNumero(pos, reader);
               ordinate(i) := valor_number;
               i := i + 1;
            end loop;

            geo.SDO_ORDINATES := ordinate;
         end if;

      end if;

      return geo;

   exception
      when others then
         return null;
   end;
   ----------------------------------------------------------------------------


   ----------------------------------------------------------------------------
   -- Extrai apenas o que for espacialmente invalido
   ----------------------------------------------------------------------------
   function Extrair(geometria mdsys.sdo_geometry, gtype number default null, simplificar varchar2 default 'FALSE') return mdsys.sdo_geometry is
      geo mdsys.sdo_geometry:= geometria;
   begin
      if (geo is not null) then

         if (gtype is not null) then
            geo.sdo_gtype := gtype;
         end if;
         
         geo:= geometria9i.extrair(geo);
   
         if (geometria9i.validar(geo)='TRUE') then
            
            begin

               if ((simplificar = 'TRUE') and (geo.SDO_GTYPE = 2006 or geo.SDO_GTYPE = 2007)) then 
                  if (geometria9i.subElementos(geo) = 1) then 
                     geo.SDO_GTYPE := (case when geo.SDO_GTYPE = 2006 then 2002 else 2003 end);
                  end if;
               end if;
            
            exception
            when others then
               null;
            end;
         
            return geo;
         end if;

      end if;
      return null;
   end;
   ----------------------------------------------------------------------------


   ----------------------------------------------------------------------------
   -- Transformar o sistema de coordenadas da geometria
   ----------------------------------------------------------------------------
   /*
   function Transformar(geometria mdsys.sdo_geometry, srid_origem number, srid_destino number) return mdsys.sdo_geometry is
      geo mdsys.sdo_geometry:= geometria;
   begin
      if (geo is not null) then
         if (geometria9i.validar(geo)='TRUE') then
            geo.sdo_srid := srid_origem;

            if (srid_origem <> srid_destino) then
               geo := sdo_cs.transform(geo, spa_tolerancia, srid_destino);
            end if;
         else
            geo.SDO_SRID := srid_destino;
         end if;
      end if;

      return geo;
   end;
   */

   function Transformar(geometria mdsys.sdo_geometry, srid_origem number, srid_destino number) return mdsys.sdo_geometry is
      geo mdsys.sdo_geometry:= geometria;
      idx number:= 1;
      pnt datum.geographic3d_deg;
      
      a_sirgas2000 constant number:= 6378137;
      inverse_flattening_sirgas2000 constant number:= 298.257222101;

      a_sad69 constant number:= 6378160;
      inverse_flattening_sad69 constant number:= 298.25;

      /*
      -- SAD69 => WGS84
      dx number:= -66.87;
      dy number:= 4.37;
      dz number:= -38.52;
      */
      -- SAD69 => SIRGAS2000
      dx number:= -67.35;
      dy number:= 3.88;
      dz number:= -38.22;

   begin
      if (geo is not null) then
         if (geometria9i.validar(geo)='TRUE') then
            geo.sdo_srid := srid_origem;

            if (srid_origem in (82284, 82287, 82292, 82295, 82301) and srid_destino = 1000205) then
               geo := sdo_cs.transform(geo, spa_tolerancia, 8292);
               
               while (idx<geo.sdo_ordinates.count) loop
                  pnt.lon := geo.sdo_ordinates(idx);
                  pnt.lat := geo.sdo_ordinates(idx+1);
                  pnt.h := 0;

                  pnt := datum.GeocentricTranslation(pnt, a_sad69, 1/inverse_flattening_sad69, a_sirgas2000, 1/inverse_flattening_sirgas2000, dx, dy, dz);
                  
                  geo.sdo_ordinates(idx) := pnt.lon;
                  geo.sdo_ordinates(idx+1):= pnt.lat;
                  
                  idx:= idx+2;
               end loop;

               geo.sdo_srid := 4170;
               geo := sdo_cs.transform(geo, spa_tolerancia, srid_destino);


            else
               if (srid_origem <> srid_destino) then
                  geo := sdo_cs.transform(geo, spa_tolerancia, srid_destino);
               end if;
            end if;
         else
            geo.SDO_SRID := srid_destino;
         end if;
      end if;

      return geo;
   end;
   ----------------------------------------------------------------------------
   
   
   function RemoverSrid(p_geo mdsys.sdo_geometry ) return mdsys.sdo_geometry is
      geo mdsys.sdo_geometry;
   begin      
      geo := p_geo;
      geo.sdo_srid := null;
      return geo;
   end;
   

end;
/
