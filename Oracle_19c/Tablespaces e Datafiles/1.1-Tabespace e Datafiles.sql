/*
Datafiles: São arquivos fisicos nos discos que consomeme espaços.
Podem ser vistos via ASM ou ls

Tablespaces: Usadas para criar diferentes tipos de objetos como por exemplo tabelas, indices e etc
Dentro da tablespaces ficam os datafiles para armazenar esses objetos
So podem ser vistos com banco open
*/

/*
SYSTEM - ARMAZENA OBJETOS AO USUARIO SYS, NAO COLOCAR NADA QUE NAO SEJA DO USER SYS
SYSAUX - UTILIZADA PARA REPOSITORIO DE FERRAMENTAS DO BD
UNDOTBS1 - DESFAZER EFEITOS DE TRANSAÇOES DE UPDATE, INSERT, DELETE E MERGE. 
           PARA FAZER ROLLBACK E FAZER RECOVER DE CRASH DE INSTANCIAS
TEMP - FICA NA DBA_TEMPFILES. USADA PARA ARMAZENAR POR EXEMPLO INSTUÇÕES DE AGRUPAMENTO
       ELE USA UMA AREA DE MEMORIA E CASO A MEMORIA NAOS EJA SUFICIENTE ELE USA A TABLESPACE TEMPORARIA
       RECONSTRUÇÃO DE INDICE TAMBEM OCUPA ESPAÇO
       NAO SAO OBJETOS PERMANENTES
USERS - TABLESPACE PARA USUARIOS       
*/
--VERIFICAR tablespace
select tablespace_name, file_name from dba_tablespaces;

--CRIAR TABLESPACES com e sem padrao ofa
create tablespace TBS2
datafile '+DATA/TBS2.DBF'
size 100m
extent management local
uniform size 128k --quando precisa de so objetos pequenos pode fazer tamanho menor pra economizar espaço
segment space management auto --oracle organiza automaticamente os objetos no bloco

create tablespace TBS1
datafile '+DATA'
size 100m
extent management local
uniform size 128k 
segment space management auto 

--renomear tablespace
alter tablespace TBS2 rename to TBS3;

--remover/drop tablespace
--deixa os datafiles no ambiente
drop tablespace TBS3 including contents keep datafiles cascade constraints;

--alterar tamanho tablespace
aumentar o datafile

--alterar tablespaces temporarias
aumentar tempfile

--ver parametros de blocos
show parameter block

