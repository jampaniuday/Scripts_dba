
update ceproft_pa.lov_municipio t set t.codigo='1100015'
where t.texto='Alta Floresta d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Alta Floresta d Oeste' and z.uf='RO');	  
        
update ceproft_pa.lov_municipio t  set t.codigo='1100098'
where t.texto='Espig�o d Oeste'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Espig�o d Oeste' and z.uf='RO');
               	
update ceproft_pa.lov_municipio t  set t.codigo='1100130' 
where t.texto='Machadinho d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Machadinho d Oeste' and z.uf='RO');            	

update ceproft_pa.lov_municipio t  set t.codigo='1100148' 
where t.texto='Nova Brasil�ndia d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Nova Brasil�ndia d Oeste' and z.uf='RO');
             
update ceproft_pa.lov_municipio t  set t.codigo='1100296'
where t.texto='Santa Luzia d Oeste'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santa Luzia d Oeste' and z.uf='RO');
                     	
update ceproft_pa.lov_municipio t  set t.codigo='1100346'
where t.texto='Alvorada d Oeste'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Alvorada d Oeste' and z.uf='RO');
                       
update ceproft_pa.lov_municipio t  set t.codigo='1100379' 
where t.texto='Alto Alegre do Parecis' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Alto Alegre do Parecis' and z.uf='RO');        	

insert into ceproft_pa.lov_municipio t (texto,id_estado,codigo) values ('Itapu� d Oeste', 22,'1101104'); 
                     
update ceproft_pa.lov_municipio t  set t.codigo='1101484'
where t.texto='S�o Felipe d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='S�o Felipe d Oeste' and z.uf='RO');
                   
update ceproft_pa.lov_municipio t  set t.codigo='1505551' 
where t.texto='Pau d Arco'	and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Pau d Arco' and z.uf='PA');            

update ceproft_pa.lov_municipio t  set t.codigo='1706001' 
where t.texto='Couto de Magalh�es' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Couto de Magalh�es' and z.uf='TO');             	

update ceproft_pa.lov_municipio t  set t.codigo='1716307' 
where t.texto='Pau d Arco' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Pau d Arco' and z.uf='TO');                    	

update ceproft_pa.lov_municipio t  set t.codigo='2102358' 
where t.texto='Buritirama' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Buritirama' and z.uf='MA');                     

update ceproft_pa.lov_municipio t  set t.codigo='2105948' 
where t.texto='Lagoa dos Rodrigues' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Lagoa dos Rodrigues' and z.uf='MA');            	

update ceproft_pa.lov_municipio t  set t.codigo='2107407' 
where t.texto='Olho d �gua das Cunh�s'	and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d �gua das Cunh�s' and z.uf='MA');
         
update ceproft_pa.lov_municipio t  set t.codigo='2108504' 
where t.texto='Pindar� Mirim' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Pindar� Mirim' and z.uf='MA');
                 	
update ceproft_pa.lov_municipio t  set t.codigo='2201176' 
where t.texto='Barra d Alc�ntara' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Barra d Alc�ntara' and z.uf='PI');            	

update ceproft_pa.lov_municipio t  set t.codigo='2207108' 
where t.texto='Olho d �gua do Piau�' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d �gua do Piau�' and z.uf='PI');           	

update ceproft_pa.lov_municipio t  set t.codigo='2406205' 
where t.texto='Lagoa d Anta'	and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Lagoa d Anta' and z.uf='RN');                   

update ceproft_pa.lov_municipio t  set t.codigo='2408409' 
where t.texto='Olho-d �gua do Borges'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho-d �gua do Borges' and z.uf='RN');         	

update ceproft_pa.lov_municipio t  set t.codigo='2503308' 
where t.texto='Cachoeira dos �ndios' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Cachoeira dos �ndios' and z.uf='PB');          	

update ceproft_pa.lov_municipio t  set t.codigo='2508703' 
where t.texto='M�e d �gua' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='M�e d �gua' and z.uf='PB');                     	

update ceproft_pa.lov_municipio t  set t.codigo='2510402' 
where t.texto='Olho d �gua'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d �gua' and z.uf='PB');                   	

update ceproft_pa.lov_municipio t  set t.codigo='2513158' 
where t.texto='Santa Cec�lia de Umbuzeiro' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santa Cec�lia de Umbuzeiro' and z.uf='PB');     	

update ceproft_pa.lov_municipio t  set t.codigo='2513968'
where t.texto='S�o Domingos de Pombal' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='S�o Domingos de Pombal' and z.uf='PB');        	

update ceproft_pa.lov_municipio t  set t.codigo='2605459' 
where t.texto='Fernando de Noronha (Distrito Estadual)' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Fernando de Noronha (Distrito Estadual)' and z.uf='PE');	

update ceproft_pa.lov_municipio t  set t.codigo='2607604' 
where t.texto='Itamarac�'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Itamarac�' and z.uf='PE');                     	

update ceproft_pa.lov_municipio t  set t.codigo='2705705' 
where t.texto='Olho d �gua das Flores' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d �gua das Flores' and z.uf='AL');         	

update ceproft_pa.lov_municipio t  set t.codigo='2705804' 
where t.texto='Olho d �gua do Casado' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d �gua do Casado' and z.uf='AL');          	

update ceproft_pa.lov_municipio t  set t.codigo='2705903' 
where t.texto='Olho d �gua Grande' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d �gua Grande' and z.uf='AL');             	

update ceproft_pa.lov_municipio t  set t.codigo='2706307' 
where t.texto='Palmeira dos �ndios'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Palmeira dos �ndios' and z.uf='AL');            	        

update ceproft_pa.lov_municipio t  set t.codigo='2709004' 
where t.texto='Tanque d Arca' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Tanque d Arca' and z.uf='AL');                 	

update ceproft_pa.lov_municipio t  set t.codigo='2803203' 
where t.texto='Itaporanga d Ajuda' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Itaporanga d Ajuda' and z.uf='SE');             	

update ceproft_pa.lov_municipio t  set t.codigo='2900504' 
where t.texto='Livramento do Brumado'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Livramento do Brumado' and z.uf='BA');          	

update ceproft_pa.lov_municipio t  set t.codigo='2910057' 
where t.texto='Dias d �vila' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Dias d �vila' and z.uf='BA');                  	

insert into ceproft_pa.lov_municipio (texto,id_estado,codigo) values ('Desembargador Otoni',13,'3121615');

insert into ceproft_pa.lov_municipio (texto,id_estado,codigo) values ('Senador Mour�o',13,'3121650'); 

update ceproft_pa.lov_municipio t  set t.codigo='3122900' 
where t.texto='Dona Euz�bia' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Dona Euz�bia' and z.uf='MG');                   	

update ceproft_pa.lov_municipio t  set t.codigo='3127602' 
where t.texto='Gouv�a'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Gouv�a' and z.uf='MG');                        	

update ceproft_pa.lov_municipio t  set t.codigo='3131802' 
where t.texto='Itabirinha de Mantena' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Itabirinha de Mantena' and z.uf='MG');         	

update ceproft_pa.lov_municipio t  set t.codigo='3145455' 
where t.texto='Olhos-d �gua' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olhos-d �gua' and z.uf='MG');                  	

update ceproft_pa.lov_municipio t  set t.codigo='3147808' 
where t.texto='Passa Vinte' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Passa Vinte' and z.uf='MG');                   	

update ceproft_pa.lov_municipio t  set t.codigo='3150539' 
where t.texto='Pingo d �gua' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Pingo d �gua' and z.uf='MG');                  	

update ceproft_pa.lov_municipio t  set t.codigo='3151503' 
where t.texto='Piu�' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Piu�' and z.uf='MG');                           	

update ceproft_pa.lov_municipio t  set t.codigo='3153806' 
where t.texto='Queluzita'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Queluzita' and z.uf='MG');                     	

insert into ceproft_pa.lov_municipio (texto,id_estado,codigo) values ('Governador Lindeberg',8,'3202256' 

update ceproft_pa.lov_municipio t  set t.codigo='3300233' 
where t.texto='Arma��o de B�zios' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Arma��o de B�zios' and z.uf='RJ');             	

update ceproft_pa.lov_municipio t  set t.codigo='3305901' 
where t.texto='Trajano de Morais' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Trajano de Morais' and z.uf='RJ');             	

update ceproft_pa.lov_municipio t  set t.codigo='3502606' 
where t.texto='Aparecida d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Aparecida d Oeste' and z.uf='SP');              	

update ceproft_pa.lov_municipio t  set t.codigo='3507803' 
where t.texto='Brod�squi' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Brod�squi' and z.uf='SP');                     	

insert into ceproft_pa.lov_municipio  (texto,id_estado,codigo) values ('Estrela d Oeste',25,'3515202');                	

update ceproft_pa.lov_municipio t  set t.codigo='3518008' 
where t.texto='Guarani d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Guarani d Oeste' and z.uf='SP');               	

update ceproft_pa.lov_municipio t  set t.codigo='3520905' 
where t.texto='Ipau�u' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Ipau�u' and z.uf='SP');                        	

update ceproft_pa.lov_municipio t  set t.codigo='3530607' 
where t.texto='Moji das Cruzes' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Moji das Cruzes' and z.uf='SP');                	

update ceproft_pa.lov_municipio t  set t.codigo='3530805' 
where t.texto='Moji-Mirim'	and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Moji-Mirim' and z.uf='SP');                     

update ceproft_pa.lov_municipio t  set t.codigo='3535200' 
where t.texto='Palmeira d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Palmeira d Oeste' and z.uf='SP');              	

update ceproft_pa.lov_municipio t  set t.codigo='3545803' 
where t.texto='Santa B�rbara d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santa B�rbara d Oeste' and z.uf='SP');          	

update ceproft_pa.lov_municipio t  set t.codigo='3546108' 
where t.texto='Santa Clara d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santa Clara d Oeste' and z.uf='SP');            	

update ceproft_pa.lov_municipio t  set t.codigo='3547403' 
where t.texto='Santa Rita d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santa Rita d Oeste' and z.uf='SP');            	

update ceproft_pa.lov_municipio t  set t.codigo='3549300' 
where t.texto='S�o Jo�o do Pau d Alho' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='S�o Jo�o do Pau d Alho' and z.uf='SP');        	

update ceproft_pa.lov_municipio t  set t.codigo='4107157' 
where t.texto='Diamante d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Diamante d Oeste' and z.uf='PR');               	

update ceproft_pa.lov_municipio t  set t.codigo='4111209' 
where t.texto='Itapejara d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Itapejara d Oeste' and z.uf='PR');             	

update ceproft_pa.lov_municipio t  set t.codigo='4119004' 
where t.texto='P�rola d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='P�rola d Oeste' and z.uf='PR');                	

update ceproft_pa.lov_municipio t  set t.codigo='4121356'
where t.texto='Rancho Alegre d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Rancho Alegre d Oeste' and z.uf='PR');         	

update ceproft_pa.lov_municipio t  set t.codigo='4125209' 
where t.texto='S�o Jorge d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='S�o Jorge d Oeste' and z.uf='PR');             	

update ceproft_pa.lov_municipio t  set t.codigo='4125555' 
where t.texto='S�o Manuel do Paran�' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='S�o Manuel do Paran�' and z.uf='PR');          	

update ceproft_pa.lov_municipio t  set t.codigo='4206702' 
where t.texto='Herval d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Herval d Oeste' and z.uf='SC');                	

update ceproft_pa.lov_municipio t  set t.codigo='4212809' 
where t.texto='Pi�arras' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Pi�arras' and z.uf='SC');                      	

update ceproft_pa.lov_municipio t  set t.codigo='4213906' 
where t.texto='Presidente Castelo Branco' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Presidente Castelo Branco' and z.uf='SC');     	

update ceproft_pa.lov_municipio t  set t.codigo='4214607' 
where t.texto='Rio d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Rio d Oeste' and z.uf='SC');                   	

update ceproft_pa.lov_municipio t  set t.codigo='4216909' 
where t.texto='S�o Louren�o d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='S�o Louren�o d Oeste' and z.uf='SC');          	

update ceproft_pa.lov_municipio t  set t.codigo='4217204' 
where t.texto='S�o Miguel d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='S�o Miguel d Oeste' and z.uf='SC');            	

update ceproft_pa.lov_municipio t  set t.codigo='4305405' 
where t.texto='Chiapeta' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Chiapeta' and z.uf='RS');                        

update ceproft_pa.lov_municipio t  set t.codigo='4306379' 
where t.texto='Dilermano de Aguiar'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Dilermano de Aguiar' and z.uf='RS');           	

update ceproft_pa.lov_municipio t  set t.codigo='4315552' 
where t.texto='Rio dos �ndios' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Rio dos �ndios' and z.uf='RS');                	

update ceproft_pa.lov_municipio t  set t.codigo='4317103'
where t.texto='Santana do Livramento' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santana do Livramento' and z.uf='RS');         	

update ceproft_pa.lov_municipio t  set t.codigo='5002001' 
where t.texto='Bataipor�' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Bataipor�' and z.uf='MS');                      	

update ceproft_pa.lov_municipio t  set t.codigo='5103361' 
where t.texto='Conquista Do Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Conquista Do Oeste' and z.uf='MT');            	

update ceproft_pa.lov_municipio t  set t.codigo='5103809' 
where t.texto='Figueir�polis d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Figueir�polis d Oeste' and z.uf='MT');         	

update ceproft_pa.lov_municipio t  set t.codigo='5103957' 
where t.texto='Gl�ria d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Gl�ria d Oeste' and z.uf='MT');                	

update ceproft_pa.lov_municipio t  set t.codigo='5105234' 
where t.texto='Lambari d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Lambari d Oeste' and z.uf='MT');               	

update ceproft_pa.lov_municipio t  set t.codigo='5105622' 
where t.texto='Mirassol d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Mirassol d Oeste' and z.uf='MT');              	

update ceproft_pa.lov_municipio t  set t.codigo='5107910' 
where t.texto='Boa Esperan�a do Norte' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Boa Esperan�a do Norte' and z.uf='MT');        	

update ceproft_pa.lov_municipio t  set t.codigo='5220009' 
where t.texto='S�o Jo�o d Alian�a'   and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='S�o Jo�o d Alian�a' and z.uf='GO');
             	
update ceproft_pa.lov_municipio t  set t.codigo='5220702' 
where t.texto='S�tio d Abadia' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='S�tio d Abadia' and z.uf='GO');                 	


