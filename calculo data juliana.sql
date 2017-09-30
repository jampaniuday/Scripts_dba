select to_char(to_date('24/03/2014', 'dd/mm/yyyy'), 'yyyyddd') - 1900000
  from dual;
select to_date(1900000 + 113323, 'yyyyddd') from dual;


