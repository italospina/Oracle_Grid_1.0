/*
===================================
== Restauração de Banco de Dados ==
===================================
*/

--1. Parar serviços do banco
srvctl stop database -d PROD

--2. Entrar no sqlplus e start o banco como nomount

sqlplus / as sysdba

startup nomount;

--3. listar backups do db
list backup of database;


--3.1 se dizer que o database nao esta montado
sql 'alter database mount';

--3.2 ver backups do controlfile
list backup of controlfile;

--4. baixar o banco de dados e startar nomount
shutdown immediate;
startup nomount;

--5. entrar no rman
rman target bkpuser/BKPUSER

--6. pegar o piece name do backup de controlfile a sua escolha para restaurar
RESTORE CONTROLFILE FROM '+ARCH/PROD/AUTOBACKUP/2023_12_11/s_1155260959.269.1155260963';

Starting restore at 11-DEC-23
using target database control file instead of recovery catalog
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=12 device type=DISK

channel ORA_DISK_1: restoring control file
channel ORA_DISK_1: restore complete, elapsed time: 00:00:04
output file name=+ARCH/PROD/CONTROLFILE/current.256.1143932453
output file name=+ARCH/PROD/CONTROLFILE/controlfile03.dbf
Finished restore at 11-DEC-23

--7. montar o bd 
sql 'alter database mount';

--8. restarurar o banco
RESTORE DATABASE;

Starting restore at 11-DEC-23
using channel ORA_DISK_1

channel ORA_DISK_1: starting datafile backup set restore
channel ORA_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_DISK_1: restoring datafile 00001 to +DATA/PROD/DATAFILE/system.257.1143932
channel ORA_DISK_1: restoring datafile 00002 to +DATA/PROD/DATAFILE/users.269.11439887
channel ORA_DISK_1: restoring datafile 00003 to +DATA/PROD/DATAFILE/sysaux.258.1143932
channel ORA_DISK_1: restoring datafile 00004 to +DATA/PROD/DATAFILE/undotbs1.259.11439
channel ORA_DISK_1: restoring datafile 00005 to +DATA/PROD/DATAFILE/tbs1.267.114398730
channel ORA_DISK_1: restoring datafile 00007 to +DATA/PROD/DATAFILE/users.260.11439323
channel ORA_DISK_1: restoring datafile 00008 to +DATA/appdados01.dbf
channel ORA_DISK_1: restoring datafile 00009 to +DATA/appindex01.dbf
channel ORA_DISK_1: reading from backup piece /u01/app/oracle/backup/BACKUP_PROD_042dn
channel ORA_DISK_1: piece handle=/u01/app/oracle/backup/BACKUP_PROD_042dnp8k tag=BKP_F
channel ORA_DISK_1: restored backup piece 1
channel ORA_DISK_1: restore complete, elapsed time: 00:00:55
Finished restore at 11-DEC-23


--8.1 se estiver dando erro RMAN-06023:
/*
Backups disponíveis em disco/fita, mas não no repositório RMAN
Pode ser que o RMAN não consiga encontrar nenhum backup para restaurar e eles não são mostrados na saída 'LIST BACKUP',
mas os backups disponíveis em disco ou fita.
Assim, em sua configuração, os backups são removidos do repositório RMAN (arquivo de controle e/ou catálogo), mas ainda estão disponíveis em disco ou fita.
Há configurações possíveis onde esse é o comportamento pretendido.
 
Do que os backups precisam ser catalogados novamente usando o comando CATALOG
Os backups só podem ser catalogados a partir de versões 10g e posteriores.

Exemplo:
 
RMAN> catálogo começar com '<diretório onde os backups são>';
*/
catalog start with '/u01/app/oracle/backup';

--9. Procurar todos archives ate essa data partindo da restauração do backup
run
{
    allocate channel c1 device type disk;
    set until time "TO_DATE('2023-12-11 17:41:00', 'YYYY-MM-DD HH24:MI:SS')";
    recover database;
}


allocated channel: c1
channel c1: SID=263 device type=DISK

executing command: SET until clause

Starting recover at 11-DEC-23
using channel ORA_DISK_1

starting media recovery

archived log for thread 1 with sequence 17 is already on disk as file +ARCH/PROD/ONLINELOG/group_2.257.1143932471
archived log file name=+ARCH/PROD/ONLINELOG/group_2.257.1143932471 thread=1 sequence=17
media recovery complete, elapsed time: 00:00:03
Finished recover at 11-DEC-23

--10. abrir o banco como resetlogs
alter database open resetlogs; 

--10.1 verificar
select name ,open_mode from v$database;

NAME      OPEN_MODE
--------- --------------------
PROD      READ WRITE
