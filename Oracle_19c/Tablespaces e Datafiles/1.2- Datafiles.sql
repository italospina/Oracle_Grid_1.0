--datafiles
col file_name for a100
col tablespace_name for a40 
set lines 200
select tablespace_name, file_name from dba_data_files;
--via asmcmd
[grid@Estudos ~]$ asmcmd
Creating diag directory /u01/app/diag
ASMCMD> ls
ARCH/
DATA/
ASMCMD> cd DATA/AL1/DATAFILE
ASMCMD> cd DATA
ASMCMD> cd PROD
ASMCMD> cd DATAFILE
ASMCMD> ls
SYSAUX.258.1143932365
SYSTEM.257.1143932331
UNDOTBS1.259.1143932381
USERS.260.1143932381


--ver datafiles de uma so tablespace
set pagesize 1000
set linesize 1000
col megas format 9999990.00
COL FILE_NAME FORMAT A110
SELECT d.bytes/1024/1024 megas,v.CREATION_TIME, d.autoextensible,maxbytes/1024/1024, 
chr(39)||d.file_name||chr(39) file_name
FROM dba_data_files D,v$datafile v WHERE d.file_id=v.file#
and d.tablespace_name in ('&TBS')
ORDER BY v.CREATION_TIME;

--alterar datafiles
alter database datafile '+DATA/PROD/DATAFILE/users.260.1143932381' resize 10m;
alter tablespace USERS add datafile '+DATA' size 5m;

--alterar tempfiles
select tablespace_name,file_name,bytes/1024/1024  from dba_temp_files;
alter database tempfile '+DATA/PROD/TEMPFILE/temp.265.1143932505' resize 33m;
alter tablespace TEMP add tempfile '+DATA' size 5m;