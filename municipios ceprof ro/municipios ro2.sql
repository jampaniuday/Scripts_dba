
update ceproft_pa.lov_municipio t set t.codigo='1100015'
where t.texto='Alta Floresta d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Alta Floresta d Oeste' and z.uf='RO');	  
        
update ceproft_pa.lov_municipio t  set t.codigo='1100098'
where t.texto='Espigão d Oeste'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Espigão d Oeste' and z.uf='RO');
               	
update ceproft_pa.lov_municipio t  set t.codigo='1100130' 
where t.texto='Machadinho d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Machadinho d Oeste' and z.uf='RO');            	

update ceproft_pa.lov_municipio t  set t.codigo='1100148' 
where t.texto='Nova Brasilândia d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Nova Brasilândia d Oeste' and z.uf='RO');
             
update ceproft_pa.lov_municipio t  set t.codigo='1100296'
where t.texto='Santa Luzia d Oeste'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santa Luzia d Oeste' and z.uf='RO');
                     	
update ceproft_pa.lov_municipio t  set t.codigo='1100346'
where t.texto='Alvorada d Oeste'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Alvorada d Oeste' and z.uf='RO');
                       
update ceproft_pa.lov_municipio t  set t.codigo='1100379' 
where t.texto='Alto Alegre do Parecis' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Alto Alegre do Parecis' and z.uf='RO');        	

insert into ceproft_pa.lov_municipio t (texto,id_estado,codigo) values ('Itapuã d Oeste', 22,'1101104'); 
                     
update ceproft_pa.lov_municipio t  set t.codigo='1101484'
where t.texto='São Felipe d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='São Felipe d Oeste' and z.uf='RO');
                   
update ceproft_pa.lov_municipio t  set t.codigo='1505551' 
where t.texto='Pau d Arco'	and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Pau d Arco' and z.uf='PA');            

update ceproft_pa.lov_municipio t  set t.codigo='1706001' 
where t.texto='Couto de Magalhães' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Couto de Magalhães' and z.uf='TO');             	

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
where t.texto='Olho d Água das Cunhãs'	and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d Água das Cunhãs' and z.uf='MA');
         
update ceproft_pa.lov_municipio t  set t.codigo='2108504' 
where t.texto='Pindaré Mirim' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Pindaré Mirim' and z.uf='MA');
                 	
update ceproft_pa.lov_municipio t  set t.codigo='2201176' 
where t.texto='Barra d Alcântara' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Barra d Alcântara' and z.uf='PI');            	

update ceproft_pa.lov_municipio t  set t.codigo='2207108' 
where t.texto='Olho d Água do Piauí' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d Água do Piauí' and z.uf='PI');           	

update ceproft_pa.lov_municipio t  set t.codigo='2406205' 
where t.texto='Lagoa d Anta'	and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Lagoa d Anta' and z.uf='RN');                   

update ceproft_pa.lov_municipio t  set t.codigo='2408409' 
where t.texto='Olho-d Água do Borges'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho-d Água do Borges' and z.uf='RN');         	

update ceproft_pa.lov_municipio t  set t.codigo='2503308' 
where t.texto='Cachoeira dos µndios' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Cachoeira dos µndios' and z.uf='PB');          	

update ceproft_pa.lov_municipio t  set t.codigo='2508703' 
where t.texto='Mãe d Água' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Mãe d Água' and z.uf='PB');                     	

update ceproft_pa.lov_municipio t  set t.codigo='2510402' 
where t.texto='Olho d Água'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d Água' and z.uf='PB');                   	

update ceproft_pa.lov_municipio t  set t.codigo='2513158' 
where t.texto='Santa Cecília de Umbuzeiro' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santa Cecília de Umbuzeiro' and z.uf='PB');     	

update ceproft_pa.lov_municipio t  set t.codigo='2513968'
where t.texto='São Domingos de Pombal' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='São Domingos de Pombal' and z.uf='PB');        	

update ceproft_pa.lov_municipio t  set t.codigo='2605459' 
where t.texto='Fernando de Noronha (Distrito Estadual)' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Fernando de Noronha (Distrito Estadual)' and z.uf='PE');	

update ceproft_pa.lov_municipio t  set t.codigo='2607604' 
where t.texto='Itamaracá'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Itamaracá' and z.uf='PE');                     	

update ceproft_pa.lov_municipio t  set t.codigo='2705705' 
where t.texto='Olho d Água das Flores' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d Água das Flores' and z.uf='AL');         	

update ceproft_pa.lov_municipio t  set t.codigo='2705804' 
where t.texto='Olho d Água do Casado' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d Água do Casado' and z.uf='AL');          	

update ceproft_pa.lov_municipio t  set t.codigo='2705903' 
where t.texto='Olho d Água Grande' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olho d Água Grande' and z.uf='AL');             	

update ceproft_pa.lov_municipio t  set t.codigo='2706307' 
where t.texto='Palmeira dos µndios'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Palmeira dos µndios' and z.uf='AL');            	        

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
where t.texto='Dias d Ávila' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Dias d Ávila' and z.uf='BA');                  	

insert into ceproft_pa.lov_municipio (texto,id_estado,codigo) values ('Desembargador Otoni',13,'3121615');

insert into ceproft_pa.lov_municipio (texto,id_estado,codigo) values ('Senador Mourão',13,'3121650'); 

update ceproft_pa.lov_municipio t  set t.codigo='3122900' 
where t.texto='Dona Euzébia' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Dona Euzébia' and z.uf='MG');                   	

update ceproft_pa.lov_municipio t  set t.codigo='3127602' 
where t.texto='Gouvêa'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Gouvêa' and z.uf='MG');                        	

update ceproft_pa.lov_municipio t  set t.codigo='3131802' 
where t.texto='Itabirinha de Mantena' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Itabirinha de Mantena' and z.uf='MG');         	

update ceproft_pa.lov_municipio t  set t.codigo='3145455' 
where t.texto='Olhos-d Água' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Olhos-d Água' and z.uf='MG');                  	

update ceproft_pa.lov_municipio t  set t.codigo='3147808' 
where t.texto='Passa Vinte' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Passa Vinte' and z.uf='MG');                   	

update ceproft_pa.lov_municipio t  set t.codigo='3150539' 
where t.texto='Pingo d Água' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Pingo d Água' and z.uf='MG');                  	

update ceproft_pa.lov_municipio t  set t.codigo='3151503' 
where t.texto='Piuí' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Piuí' and z.uf='MG');                           	

update ceproft_pa.lov_municipio t  set t.codigo='3153806' 
where t.texto='Queluzita'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Queluzita' and z.uf='MG');                     	

insert into ceproft_pa.lov_municipio (texto,id_estado,codigo) values ('Governador Lindeberg',8,'3202256' 

update ceproft_pa.lov_municipio t  set t.codigo='3300233' 
where t.texto='Armação de Búzios' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Armação de Búzios' and z.uf='RJ');             	

update ceproft_pa.lov_municipio t  set t.codigo='3305901' 
where t.texto='Trajano de Morais' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Trajano de Morais' and z.uf='RJ');             	

update ceproft_pa.lov_municipio t  set t.codigo='3502606' 
where t.texto='Aparecida d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Aparecida d Oeste' and z.uf='SP');              	

update ceproft_pa.lov_municipio t  set t.codigo='3507803' 
where t.texto='Brodósqui' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Brodósqui' and z.uf='SP');                     	

insert into ceproft_pa.lov_municipio  (texto,id_estado,codigo) values ('Estrela d Oeste',25,'3515202');                	

update ceproft_pa.lov_municipio t  set t.codigo='3518008' 
where t.texto='Guarani d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Guarani d Oeste' and z.uf='SP');               	

update ceproft_pa.lov_municipio t  set t.codigo='3520905' 
where t.texto='Ipauçu' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Ipauçu' and z.uf='SP');                        	

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
where t.texto='Santa Bárbara d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santa Bárbara d Oeste' and z.uf='SP');          	

update ceproft_pa.lov_municipio t  set t.codigo='3546108' 
where t.texto='Santa Clara d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santa Clara d Oeste' and z.uf='SP');            	

update ceproft_pa.lov_municipio t  set t.codigo='3547403' 
where t.texto='Santa Rita d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santa Rita d Oeste' and z.uf='SP');            	

update ceproft_pa.lov_municipio t  set t.codigo='3549300' 
where t.texto='São João do Pau d Alho' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='São João do Pau d Alho' and z.uf='SP');        	

update ceproft_pa.lov_municipio t  set t.codigo='4107157' 
where t.texto='Diamante d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Diamante d Oeste' and z.uf='PR');               	

update ceproft_pa.lov_municipio t  set t.codigo='4111209' 
where t.texto='Itapejara d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Itapejara d Oeste' and z.uf='PR');             	

update ceproft_pa.lov_municipio t  set t.codigo='4119004' 
where t.texto='Pérola d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Pérola d Oeste' and z.uf='PR');                	

update ceproft_pa.lov_municipio t  set t.codigo='4121356'
where t.texto='Rancho Alegre d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Rancho Alegre d Oeste' and z.uf='PR');         	

update ceproft_pa.lov_municipio t  set t.codigo='4125209' 
where t.texto='São Jorge d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='São Jorge d Oeste' and z.uf='PR');             	

update ceproft_pa.lov_municipio t  set t.codigo='4125555' 
where t.texto='São Manuel do Paraná' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='São Manuel do Paraná' and z.uf='PR');          	

update ceproft_pa.lov_municipio t  set t.codigo='4206702' 
where t.texto='Herval d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Herval d Oeste' and z.uf='SC');                	

update ceproft_pa.lov_municipio t  set t.codigo='4212809' 
where t.texto='Piçarras' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Piçarras' and z.uf='SC');                      	

update ceproft_pa.lov_municipio t  set t.codigo='4213906' 
where t.texto='Presidente Castelo Branco' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Presidente Castelo Branco' and z.uf='SC');     	

update ceproft_pa.lov_municipio t  set t.codigo='4214607' 
where t.texto='Rio d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Rio d Oeste' and z.uf='SC');                   	

update ceproft_pa.lov_municipio t  set t.codigo='4216909' 
where t.texto='São Lourenço d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='São Lourenço d Oeste' and z.uf='SC');          	

update ceproft_pa.lov_municipio t  set t.codigo='4217204' 
where t.texto='São Miguel d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='São Miguel d Oeste' and z.uf='SC');            	

update ceproft_pa.lov_municipio t  set t.codigo='4305405' 
where t.texto='Chiapeta' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Chiapeta' and z.uf='RS');                        

update ceproft_pa.lov_municipio t  set t.codigo='4306379' 
where t.texto='Dilermano de Aguiar'  and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Dilermano de Aguiar' and z.uf='RS');           	

update ceproft_pa.lov_municipio t  set t.codigo='4315552' 
where t.texto='Rio dos µndios' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Rio dos µndios' and z.uf='RS');                	

update ceproft_pa.lov_municipio t  set t.codigo='4317103'
where t.texto='Santana do Livramento' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Santana do Livramento' and z.uf='RS');         	

update ceproft_pa.lov_municipio t  set t.codigo='5002001' 
where t.texto='Bataiporã' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Bataiporã' and z.uf='MS');                      	

update ceproft_pa.lov_municipio t  set t.codigo='5103361' 
where t.texto='Conquista Do Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Conquista Do Oeste' and z.uf='MT');            	

update ceproft_pa.lov_municipio t  set t.codigo='5103809' 
where t.texto='Figueirópolis d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Figueirópolis d Oeste' and z.uf='MT');         	

update ceproft_pa.lov_municipio t  set t.codigo='5103957' 
where t.texto='Glória d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Glória d Oeste' and z.uf='MT');                	

update ceproft_pa.lov_municipio t  set t.codigo='5105234' 
where t.texto='Lambari d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Lambari d Oeste' and z.uf='MT');               	

update ceproft_pa.lov_municipio t  set t.codigo='5105622' 
where t.texto='Mirassol d Oeste' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Mirassol d Oeste' and z.uf='MT');              	

update ceproft_pa.lov_municipio t  set t.codigo='5107910' 
where t.texto='Boa Esperança do Norte' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Boa Esperança do Norte' and z.uf='MT');        	

update ceproft_pa.lov_municipio t  set t.codigo='5220009' 
where t.texto='São João d Aliança'   and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='São João d Aliança' and z.uf='GO');
             	
update ceproft_pa.lov_municipio t  set t.codigo='5220702' 
where t.texto='Sítio d Abadia' and t.id_estado=(select z.id from ceprof_pa.lov_estado z , 
ceprof_pa.lov_municipio t where t.id_estado = z.id and t.texto='Sítio d Abadia' and z.uf='GO');                 	


