select plan, cpu_method, status from dba_rsrc_plans order by 1;
select consumer_group,cpu_method, status from dba_rsrc_consumer_groups order by 1;
select plan, group_or_subplan, type, cpu_p1, cpu_p2, cpu_p3, cpu_p4, status 
from dba_rsrc_plan_directives order by 1,2,3,4,5,6;


select * from dba_rsrc_consumer_group_privs;
select username, initial_rsrc_consumer_group from dba_users;
select to_char(m.begin_time, 'HH:MI') time, m.consumer_group_name, m.cpu_consumed_time / 60000 avg_running_sessions, m.cpu_wait_time / 60000 avg_waiting_sessions, d.mgmt_p1*(select value from v$parameter where name = 'cpu_count')/100 allocation from v$rsrcmgrmetric_history m, dba_rsrc_plan_directives d, v$rsrc_plan p where m.consumer_group_name = d.group_or_subplan and p.name = d.plan order by m.begin_time, m.consumer_group_name;
