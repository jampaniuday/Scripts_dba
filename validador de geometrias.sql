select s.id_solos, geometria9i.validar(s.geometry)"ERRO" from basefundo_Ro.Solos s
where geometria9i.validar(s.geometry)!='TRUE'