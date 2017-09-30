select * from DBA_AUTOTASK_WINDOW_CLIENTS;
select window_name, resource_plan from dba_scheduler_windows;
select * from dba_rsrc_plans where plan='DEFAULT_MAINTENANCE_PLAN';
select * from DBA_RSRC_PLAN_DIRECTIVES where plan='DEFAULT_MAINTENANCE_PLAN';
select CLIENT_NAME from DBA_AUTOTASK_CLIENT;

select client_name, JOB_SCHEDULER_STATUS 
 from DBA_AUTOTASK_CLIENT_JOB
 where client_name='auto optimizer stats collection';
 
 SELECT client_name, window_name, jobs_created, jobs_started, jobs_completed,window_start_time 
 FROM dba_autotask_client_history
 WHERE client_name like '%stats%';
 
SELECT job_name, state
 FROM dba_scheduler_jobs
 WHERE job_name='GATHER_STATS_JOB'; 
 
 
select * from DBA_AUTOTASK_CLIENT;
select * from DBA_AUTOTASK_CLIENT_HISTORY;
select * from DBA_AUTOTASK_CLIENT_JOB;
select * from DBA_AUTOTASK_JOB_HISTORY;
select * from DBA_AUTOTASK_OPERATION;
select * from DBA_AUTOTASK_SCHEDULE;
select * from DBA_AUTOTASK_TASK;
select * from DBA_AUTOTASK_WINDOW_CLIENTS;
select * from DBA_AUTOTASK_WINDOW_HISTORY;
