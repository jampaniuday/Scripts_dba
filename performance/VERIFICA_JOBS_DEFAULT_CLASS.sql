select owner, job_name, job_subname, job_style, job_creator, client_id, global_uid, program_owner, program_name, job_type, 
job_action, number_of_arguments, schedule_owner, schedule_name, schedule_type, job_class, state,  
schedule_limit, max_run_duration, logging_level, stop_on_window_close, instance_stickiness, raise_events, system, job_weight, 
nls_env, source, number_of_destinations, destination_owner, destination, credential_owner, credential_name, instance_id, 
deferred_drop, allow_runs_in_restricted_mode, comments, flags
 from dba_scheduler_jobs where job_class='DEFAULT_JOB_CLASS' AND OWNER NOT IN('SYS','EXFSYS','ORACLE_OCM')
