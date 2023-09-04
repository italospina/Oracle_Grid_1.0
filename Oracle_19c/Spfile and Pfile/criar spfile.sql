create spfile from pfile= '/tmp/initPROD.ora';

show parameter db_create_f
SQL> show parameter spfile

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
spfile                               string      +DATA/PROD/PARAMETERFILE/spfile.266.1143933057



/*
ir para o grid PARA VERIFICAR O NOVO ARQUIVO
*/
asmcmd
cd data
ls -la
spfilePROD.ora => +DATA/PROD/PARAMETERFILE/spfile.273.1145086057

/*
para que pegue a configuração precisa modificar o caminho
fazer um apontamento ao spfile
*/
--para ver antigo arquivo
srvctl config database -d PROD 

--para apontar ao novo arquivo
srvctl modify database -d PROD -spfile '+DATA/spfilePROD.ora'

--fazer restart do banco
srvctl stop database -d PROD 
srvctl start database -d PROD 

-------------------------
-------------------------
-------------------------
/*
ou editar o arquivo do /dbs
*/
cd $ORACLE_HOME/dbs

vi initPROD.ora

/*
colocar dentro do arquivo
*/
spfile='+DATA/spfilePROD.ora'