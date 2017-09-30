SELECT database_role role, name, db_unique_name, platform_id, open_mode, log_mode, flashback_on, protection_mode, protection_level FROM v$database;
SELECT force_logging, remote_archive, supplemental_log_data_pk, supplemental_log_data_ui, switchover_status, dataguard_broker  FROM v$database;  
SELECT version, modified, status FROM dba_registry WHERE comp_id = 'CATPROC';
SELECT thread#, instance, status FROM v$thread;
SELECT thread#, instance_name, host_name, version, archiver, log_switch_wait FROM gv$instance ORDER BY thread#;
SELECT thread#, group#, sequence#, bytes, archived ,status FROM v$log ORDER BY thread#, group#;
SELECT thread#, group#, sequence#, bytes, archived, status FROM v$standby_log ORDER BY thread#, group#;
SELECT thread#, dest_id, destination, target, schedule, process FROM gv$archive_dest gvad, gv$instance gvi WHERE gvad.inst_id = gvi.inst_id AND destination is NOT NULL ORDER BY thread#, dest_id;
SELECT thread#, dest_id, gvad.status, error, fail_sequence FROM gv$archive_dest gvad, gv$instance gvi WHERE gvad.inst_id = gvi.inst_id AND destination is NOT NULL ORDER BY thread#, dest_id;


SELECT value || '_' output FROM v$parameter WHERE name = 'db_unique_name';
