/*Dropa usuarios iter1,1ter2,iter3*/

drop user iter1 cascade;
drop user iter2 cascade;
drop user iter3 cascade;


CREATE USER visualiza_iterpa IDENTIFIED BY pa1iter25
DEFAULT TABLESPACE base_iterpa_DATA TEMPORARY TABLESPACE base_iterpa_TEMP
QUOTA UNLIMITED ON base_iterpa_DATA
QUOTA UNLIMITED ON base_iterpa_INDEX;
GRANT CONNECT TO visualiza_iterpa;


CREATE USER tecnico_iterpa IDENTIFIED BY pa2iter22
DEFAULT TABLESPACE base_iterpa_DATA TEMPORARY TABLESPACE base_iterpa_TEMP
QUOTA UNLIMITED ON base_iterpa_DATA
QUOTA UNLIMITED ON base_iterpa_INDEX;
GRANT resource TO tecnico_iterpa;
GRANT CONNECT TO tecnico_iterpa;


CREATE USER gerente_iterpa IDENTIFIED BY pa3iter24
DEFAULT TABLESPACE base_iterpa_DATA TEMPORARY TABLESPACE base_iterpa_TEMP
QUOTA UNLIMITED ON base_iterpa_DATA
QUOTA UNLIMITED ON base_iterpa_INDEX;
GRANT resource TO gerente_iterpa;
GRANT CONNECT TO gerente_iterpa;

CREATE USER gerente_base IDENTIFIED BY pa4iter42
DEFAULT TABLESPACE base_iterpa_DATA TEMPORARY TABLESPACE base_iterpa_TEMP
QUOTA UNLIMITED ON base_iterpa_DATA
QUOTA UNLIMITED ON base_iterpa_INDEX;
GRANT resource TO gerente_base;
GRANT CONNECT TO gerente_base;

