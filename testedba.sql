1) select * from scott.emp t
select t.ename from scott.emp t where t.empno > 7566 and t.empno < 7788 order by 1 

2) select * from scott.emp t

select (sum(t.sal)  - sum(t.comm))/14 c from scott.emp t

3) select * from scott.emp t

select 'O Sr. ' || t.ename || ' é o melhor  ' || t.job || ' da empresa e foi admitido em ' ||
t.hiredate || ' e ganha R$' ||  t.sal from scott.emp t


4) select t.ename, t.job,t.hiredate,t.sal, d.dname from scott.emp t , scott.dept d where t.comm


 9)select  t.job Cargo,count(t.job) Quant from scott.emp t group by t.job
 
 
  
 
10 )select t.dname, r.deptno, sum(r.sal) salario
  from scott.emp r, scott.dept t
 where t.deptno = r.deptno
 group by t.dname, r.deptno
 order by 2 desc --nulls last
