SELECT f.task_name,
       f.impact,
       o.type AS object_type,
       o.attr1 AS schema,
       o.attr2 AS object_name,
       f.message,
       f.more_info
FROM   dba_advisor_findings f
       JOIN dba_advisor_objects o ON f.object_id = o.object_id AND f.task_name = o.task_name
WHERE  f.task_name like 'SEGMENTADV%' 
ORDER BY f.task_name, f.impact DESC;
