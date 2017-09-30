declare
  pag    number;
  len    number;
  c      varchar2(10);
  charpp number := 8132/2;

begin
  for r in (select rowid rid, dbms_lob.getlength (TERMO_CONFISSAO_DIVIDA) len
            from   ADM_SGV_CAD.CONFIGURACAO_EMPRESA) loop
    if r.len is not null then
      for page in 0..r.len/charpp loop
        begin
          select dbms_lob.substr (TERMO_CONFISSAO_DIVIDA, 1, 1+ (page * charpp))
          into   c
          from   ADM_SGV_CAD.CONFIGURACAO_EMPRESA
          where  rowid = r.rid;
       
        exception
          when others then
            dbms_output.put_line ('Error on rowid ' ||R.rid||' page '||page);
            dbms_output.put_line (sqlerrm);
        end;
      end loop;
    end if;
  end loop;
end;
/
