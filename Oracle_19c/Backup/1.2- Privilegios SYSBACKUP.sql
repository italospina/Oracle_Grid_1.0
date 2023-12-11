--ver usuarios
set linesize 500
set pagesize 500
col username for a20
col account_status for a16
col profile for a20
select username, 
	   profile, 
	   account_status, 
	   LOCK_DATE,
	   expiry_date  
  from dba_users
order by username;

USERNAME             PROFILE              ACCOUNT_STATUS   LOCK_DATE EXPIRY_DA
-------------------- -------------------- ---------------- --------- ---------
SYSBACKUP            DEFAULT              LOCKED           03-AUG-23

--criar um usuario novo de backup
create user BKPUSER identified by BKPUSER;

--ver se o arquivo de senhas está criado

cd $ORACLE_HOME
ls -la

/*arquivo:*/  orapwPROD

--caso nao existir o arquivo, tem que criar
orapwd file=orapwPROD password=oracle  force=Y format=12

--Aplicar o grant
grant sysbackup to BKPUSER;

--entrar no rman
rman target bkpuser/BKPUSER

--ver configurações
RMAN> SHOW ALL;

using target database control file instead of recovery catalog
RMAN configuration parameters for database with db_unique_name PROD are:
CONFIGURE RETENTION POLICY TO REDUNDANCY 1; # default
CONFIGURE BACKUP OPTIMIZATION OFF; # default
CONFIGURE DEFAULT DEVICE TYPE TO DISK; # default
CONFIGURE CONTROLFILE AUTOBACKUP ON; # default
CONFIGURE CONTROLFILE AUTOBACKUP FORMAT FOR DEVICE TYPE DISK TO '%F'; # default
CONFIGURE DEVICE TYPE DISK PARALLELISM 1 BACKUP TYPE TO BACKUPSET; # default
CONFIGURE DATAFILE BACKUP COPIES FOR DEVICE TYPE DISK TO 1; # default
CONFIGURE ARCHIVELOG BACKUP COPIES FOR DEVICE TYPE DISK TO 1; # default
CONFIGURE MAXSETSIZE TO UNLIMITED; # default
CONFIGURE ENCRYPTION FOR DATABASE OFF; # default
CONFIGURE ENCRYPTION ALGORITHM 'AES128'; # default
CONFIGURE COMPRESSION ALGORITHM 'BASIC' AS OF RELEASE 'DEFAULT' OPTIMIZE FOR LOAD TRUE ; # default
CONFIGURE RMAN OUTPUT TO KEEP FOR 7 DAYS; # default
CONFIGURE ARCHIVELOG DELETION POLICY TO NONE; # default
CONFIGURE SNAPSHOT CONTROLFILE NAME TO '/u01/app/oracle/product/19.0.0/PROD/dbs/snapcf_PROD.f'; # default

