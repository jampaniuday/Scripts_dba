create or replace view dbacontrol.Relatorio_backup as
select s.host,s.instancia,s.ip,s.versao,c.data,st.descricao Status,c.obs
     from dbacontrol.controle_backup c, dbacontrol.servidores s, dbacontrol.tab_status st
where
     s.id_server=c.servidor and
     c.status=st.id_status     

order by c.data desc    
