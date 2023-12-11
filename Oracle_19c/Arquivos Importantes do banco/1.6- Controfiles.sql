/*
Arquivo importante.
-Tem informação das estruturas fisicas, onde ficam os arquivos do banco de dados
-Os arquivos de redo log
-Informaçoes de nome de banco de dados
-Sequencia de Log que é importante para recovery

-Sem o controfile o recover e o restore de um banco oracle é praticamente impossivel
-Só em algumas situações você consegue recriar o controfile se tiver todas as informações dos datafiles, mas 
sem controlfile é uma atividade muito dificil de ser realizada.

-Tambem guarda informação de checkpoint.

-Importante ter o controlfile em mais de um local

SPFILE- Pode fazer alterações dinamicas enquanto o banco esta no ar
*/

--verificar informações no controlfile
--catalogo com diversas informações dos tipos de coisas no controlfile
select distinct type from v$controlfile_record_section;

--Ver se os controlfiles estão multiplexados
Desc v$controlfile

select STATUS,NAME from v$controlfile;

--ver o parametro do controlfile
show parameter control

--ver arquivo de parametro spfile (arquivo de parametrização dinamico)
show parameter spfile

--multiplexar em outro diskgroup 
/*
Passo 1- Alterar o destino do controlfile
*/
--alterado destino do controlfile tem que restartar o banco
alter system set control_files ='+ARCH/PROD/CONTROLFILE/current.256.1143932453',
'+ARCH/PROD/CONTROLFILE/controlfile03.dbf' scope=spfile;

/*
Passo 2- Stop e start o database no modo nomount
*/
srvctl stop database -d PROD --fora do banco
srvctl start database -d PROD -o nomount

/*
Passo 3- entrar no rman
*/
rman target /

/*
Passo 4- restaurar o caminho do controlfile do original para o novo
*/
restore controlfile from '+ARCH/PROD/CONTROLFILE/current.256.1143932453';

--output file name=+ARCH/PROD/CONTROLFILE/current.256.1143932453
--output file name=+ARCH/PROD/CONTROLFILE/controlfile03.dbf

/*
Passo 5- colocar o banco como open
*/

alter database mount;
alter database open;