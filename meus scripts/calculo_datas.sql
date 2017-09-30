select sum(d)
  from (select (to_date('04/01/2007') - to_date('23/11/2012')) / 365 d
          from dual
        union
        select (to_date('23/05/2005') - to_date('03/01/2007')) / 365 d
          from dual
        union
        select (to_date('03/05/2004') - to_date('03/12/2004')) / 365 d
          from dual
        union
        select (to_date('17/03/2005') - to_date('16/05/2005')) / 365 d
          from dual
        union
        select (to_date('02/05/2003') - to_date('30/06/2003')) / 365 d
          from dual
        union
        select (to_date('21/02/2001') - to_date('02/03/2001')) / 365 d
          from dual
        union
        select (to_date('14/06/2013') - to_date('01/03/2013')) / 365 d
          from dual
        union
        select (to_date('16/06/2013') - to_date('02/07/2015')) / 365 d
          from dual) 
