--acessar o rman
[oracle@Estudos ~]$ rman target bkpuser/BKPUSER

--ver configurações do rman
RMAN> show all;

using target database control file instead of recovery catalog
RMAN configuration parameters for database with db_unique_name PROD are:
CONFIGURE RETENTION POLICY TO REDUNDANCY 1; # default -- politica de retenção no disco por redundancia ou por janela de backup e limpa backups que nao são mais necessarios com crosscheck
CONFIGURE BACKUP OPTIMIZATION OFF; # default --usa copias duplicadas de backup que nao sao criadas noa rquivo original
CONFIGURE DEFAULT DEVICE TYPE TO DISK; # default --não temos library key integrada, então tem que ser type to disk
CONFIGURE CONTROLFILE AUTOBACKUP ON; # default
CONFIGURE CONTROLFILE AUTOBACKUP FORMAT FOR DEVICE TYPE DISK TO '%F'; -- mudar backup de controlfile quanto do formato do backup de dados
CONFIGURE DEVICE TYPE DISK PARALLELISM 1 BACKUP TYPE TO BACKUPSET; # default
CONFIGURE DATAFILE BACKUP COPIES FOR DEVICE TYPE DISK TO 1; # default
CONFIGURE ARCHIVELOG BACKUP COPIES FOR DEVICE TYPE DISK TO 1; # default
CONFIGURE CHANNEL DEVICE TYPE DISK FORMAT   '/u01/app/oracle/backup/%BACKUP_PROD'; --QUANDO EXECUTARMOS UM BACKUP ELE VIRÁ PARA ESSE DIRETORIO
CONFIGURE MAXSETSIZE TO UNLIMITED; # default
CONFIGURE ENCRYPTION FOR DATABASE OFF; # default
CONFIGURE ENCRYPTION ALGORITHM 'AES128'; # default
CONFIGURE COMPRESSION ALGORITHM 'BASIC' AS OF RELEASE 'DEFAULT' OPTIMIZE FOR LOAD TRUE ; # default
CONFIGURE RMAN OUTPUT TO KEEP FOR 7 DAYS; # default
CONFIGURE ARCHIVELOG DELETION POLICY TO NONE; # default
CONFIGURE SNAPSHOT CONTROLFILE NAME TO '/u01/app/oracle/product/19.0.0/PROD/dbs/snapcf_PROD.f'; # default

--definir otimização on
/*
Usa copia duplicadas de backups que não vão ser criadas se no arquivo original nada mudou no ultimo backup.

Se estiver desativado você irá criar muitas copias sobre o mesmo local mesmo que não haja alteração feita.
*/
CONFIGURE BACKUP OPTIMIZATION ON;

--DENIFE LOCAL DO BACKUP
/*
%U = Combinações aleatorias
%T = timestemp
%S = set number
%p = piece
*/
CONFIGURE CHANNEL DEVICE TYPE DISK FORMAT '/u01/app/oracle/backup/BACKUP_PROD_%t_s%t_s%p';


--FAZER BACKUP
BACKUP DATABASE;

run
{
    allocate channel c1 device type disk format '/u01/app/oracle/backup/BACKUP_PROD_%u';
    backup database tag BKP_FOR_DEV;
}