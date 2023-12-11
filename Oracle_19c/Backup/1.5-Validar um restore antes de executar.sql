--  Validar um restore antes de executar


--1 Entrar no rman
rman target bkpuser/BKPUSER

--2 validar restore db inteiro
RESTORE DATABASE VALIDATE;

Starting restore at 11-DEC-23
using target database control file instead of recovery catalog
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=28 device type=DISK

channel ORA_DISK_1: starting validation of datafile backup set
channel ORA_DISK_1: reading from backup piece /u01/app/oracle/backup/BACKUP_PROD_042dnp8k
channel ORA_DISK_1: piece handle=/u01/app/oracle/backup/BACKUP_PROD_042dnp8k tag=BKP_FOR_DEV
channel ORA_DISK_1: restored backup piece 1
channel ORA_DISK_1: validation complete, elapsed time: 00:00:25
Finished restore at 11-DEC-23


--3 VALIDAR SOMENTE UM DATAFILE ESPECIFICO
RESTORE DATAFILE 1 VALIDATE;


Starting restore at 11-DEC-23
using target database control file instead of recovery catalog
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=28 device type=DISK

channel ORA_DISK_1: starting validation of datafile backup set
channel ORA_DISK_1: reading from backup piece /u01/app/oracle/backup/BACKUP_PROD_042dnp8k
channel ORA_DISK_1: piece handle=/u01/app/oracle/backup/BACKUP_PROD_042dnp8k tag=BKP_FOR_DEV
channel ORA_DISK_1: restored backup piece 1
channel ORA_DISK_1: validation complete, elapsed time: 00:00:15
Finished restore at 11-DEC-23


--4 VALIDAR TABLESPACE UNICA
RESTORE TABLESPACE USERS VALIDATE;

Starting restore at 11-DEC-23
using channel ORA_DISK_1

channel ORA_DISK_1: starting validation of datafile backup set
channel ORA_DISK_1: reading from backup piece /u01/app/oracle/backup/BACKUP_PROD_042dnp8k
channel ORA_DISK_1: piece handle=/u01/app/oracle/backup/BACKUP_PROD_042dnp8k tag=BKP_FOR_DEV
channel ORA_DISK_1: restored backup piece 1
channel ORA_DISK_1: validation complete, elapsed time: 00:00:15
Finished restore at 11-DEC-23

--5 VALIDAR TODOS OS ARCHIVES
RESTORE ARCHIVELOG ALL VALIDATE;

Starting restore at 11-DEC-23
using channel ORA_DISK_1

channel ORA_DISK_1: scanning archived log +ARCH/PROD/ARCHIVELOG/2023_08_16/thread_1_seq_10.259.1145049547
channel ORA_DISK_1: scanning archived log +ARCH/PROD/ARCHIVELOG/2023_09_04/thread_1_seq_11.263.1146693625
channel ORA_DISK_1: scanning archived log +ARCH/PROD/ARCHIVELOG/2023_09_07/thread_1_seq_12.264.1146942027
channel ORA_DISK_1: scanning archived log +ARCH/PROD/ARCHIVELOG/2023_09_13/thread_1_seq_13.265.1147437109
channel ORA_DISK_1: scanning archived log +ARCH/PROD/ARCHIVELOG/2023_12_02/thread_1_seq_14.266.1154561901
channel ORA_DISK_1: scanning archived log +ARCH/PROD/ARCHIVELOG/2023_12_10/thread_1_seq_15.267.1155234001
channel ORA_DISK_1: scanning archived log +ARCH/PROD/ARCHIVELOG/2023_12_11/thread_1_seq_16.268.1155257479
Finished restore at 11-DEC-23

--6 RESTORE VALIDATE COM INTERVALO DE TEMPO
RESTORE VALIDATE PREVIEW ARCHIVELOG UNTIL TIME "TO_DATE('2023-12-10 23:59:59', 'YYYY-MM-DD HH24:MI:SS')";