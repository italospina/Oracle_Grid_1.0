/*
SPFILE: É UM SERVER PARAMETER FILE, UM ARQUIVO DINAMICO E BINARIO. COM ISSO PERMITE 
        QUE VOCE FAÇA ALGUMAS MODIFICAÇÕES SEM A NECESSIDADE DE FICAR FAZENDO SEMPRE STOP START
        MAIS ALTERAÇÕES DINAMICAS
PFILE: NAO É POSSIVEL ALTERAR, A NAO SER O ARQUIVO MANUALMENTE.
       TODA ALTERAÇÃO FEITA NO ARQUIVO VAI REQUER STOP START, POIS PRECISA LER O ARQUIVO PARA 
       SUBIR O PARAMETR

RECOMENDADO USAR SEMPRE SPFILE:
*/

--ver spfile
SQL> show parameter spfile
NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
spfile                               string      +DATA/PROD/PARAMETERFILE/spfil
                                                 e.266.1143933057

--ver pfile
--verificar se há o arquivo init<nome do arquivo>.ora
[oracle@Estudos ~]$ cd $ORACLE_HOME
[oracle@Estudos PROD]$ cd dbs
[oracle@Estudos dbs]$ ls -la
total 10372
drwxr-xr-x.  2 oracle oinstall       93 Aug 17 01:45 .
drwxrwxr-x. 71 oracle oinstall     4096 Aug  3 23:15 ..
-rw-rw----.  1 oracle asmadmin     1544 Aug 16 21:10 hc_PROD.dat
-rw-r--r--.  1 oracle oinstall     3079 May 14  2015 init.ora
-rw-r-----.  1 oracle asmadmin       24 Aug  3 22:58 lkPROD
-rw-r-----.  1 oracle oinstall     2048 Aug  3 23:01 orapwPROD
-rw-r-----.  1 oracle asmadmin 10600448 Aug 17 01:45 snapcf_PROD.f
