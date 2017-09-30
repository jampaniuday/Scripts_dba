begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'PLANO_TENDENCIA'
     ,cpu_mth                      => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Resource plan Tendenica');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'PLANO_TENDENCIA'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,cpu_p1                       => 10
     ,cpu_p2                       => 10
     ,cpu_p3                       => 20
     ,switch_estimate              => FALSE
     ,parallel_degree_limit_p1     => 0
     ,comment                      => 'OTHER_GROUPS day users sessions at level 1'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'PLANO_TENDENCIA'
     ,group_or_subplan             => 'SGV'
     ,cpu_p1                       => 80
     ,cpu_p2                       => 70
     ,cpu_p3                       => 60
     ,switch_estimate              => FALSE
     ,parallel_degree_limit_p1     => 0
     ,comment                      => 'Online day users sessions at level 1'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'PLANO_TENDENCIA'
     ,group_or_subplan             => 'FABRICA'
     ,cpu_p1                       => 10
     ,cpu_p2                       => 20
     ,cpu_p3                       => 20
     ,active_sess_pool_p1          => 3
     ,switch_estimate              => FALSE
     ,parallel_degree_limit_p1     => 0
     ,comment                      => 'batch day users sessions at level 1'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/

