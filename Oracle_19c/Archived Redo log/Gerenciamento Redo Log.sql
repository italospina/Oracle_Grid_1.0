


/* 
Qual o padrão de nome
Quanto espaço necessario
Politica de remoção de archives (rman backup)
onde colocar archived redo log, se vou usar a fast recovery area
para os archives
-db_recovery_file_dest_size
-db_recovery_file_dest
*/

--analisar dados do archive log list
SQL> archive log list
Database log mode              No Archive Mode
Automatic archival             Disabled
Archive destination            USE_DB_RECOVERY_FILE_DEST
Oldest online log sequence     8
Current log sequence           10

--ver recovery file dest size
SQL> show parameter db_recovery_file_dest_size
NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
db_recovery_file_dest_size           big integer 8256M

SQL> show parameter db_recovery
NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
db_recovery_file_dest                string      +ARCH
db_recovery_file_dest_size           big integer 8256M

--habilitar o modo archive
--1.0 restart no banco (banco mount)
[oracle@Estudos ~]$ srvctl stop database -d PROD
[oracle@Estudos ~]$ srvctl start database -d PROD -o mount
--1.1 habilitar archive
SQL> alter database archivelog;
Database altered.
--1.2 habilitar banco
SQL> alter database open;
Database altered.
--1.3 ver area de archive
SQL> archive log list
Database log mode              Archive Mode
Automatic archival             Enabled
Archive destination            USE_DB_RECOVERY_FILE_DEST
Oldest online log sequence     8
Next log sequence to archive   10
Current log sequence           10

--ver se tem archive gerado
select name, completion_time, status from v$archived_log;

/*
Aqui estão as diferenças importantes entre ALTER SYSTEM SWITCH LOGFILE e ALTER SYSTEM ARCHIVE LOG CURRENT:

    RAC: Se você estiver executando o RAC, o ALTER SYSTEM ARCHIVE LOG CURRENT
    ativará os logs todos os nós RAC (instâncias), enquanto ALTER SYSTEM SWITCH LOGFILE alternará 
    apenas o arquivo de log na instância em que você emite o comando switch. 
    Portanto, ALTER SYSTEM ARCHIVE LOG CURRENT é uma prática recomendada para Sistemas RAC.

    ALTER SYSTEM SWITCH LOGFILE é assíncrono: Este comando é rápido para retornar à chamada porque a 
    gravação do log de refazer para o sistema de arquivos do sistema operacional é feito em segundo plano. 
    Há um risco muito pequeno nos casos onde o processo ARCH não pode concluir a gravação do log de refazer, 
    como casos em que o diretório do arquivo archivelog do sistema operacional está fora de espaço. 
    Também é arriscado porque o script de chamada pode seguir em frente para uma etapa subsequente, 
    supondo que o refazer tenha sido escrito. Alguns scripts colocarão um comando SLEEP 60 em seu backup 
    script para dar tempo para o refazer para completar a escrita, mas isso não é uma boa prática.

    ALTER SYSTEM ARCHIVE LOG CURRENT é síncrono: Isso é mais rápido de retornar porque este comando aguarda até 
    que o log de refazer on-line tenha concluído a gravação do Refaça o arquivo de log para o sistema de arquivos. 
    Este comando é mais seguro porque ele aguarda que o sistema operacional reconheça (ACK) que o log de refazer tem 
    foi escrito com sucesso. Portanto, ALTER SYSTEM ARCHIVE LOG CURRENT é a melhor prática para scripts d
    e backup de produção com RMAN.

    Argumento necessário: O ALTER SYSTEM ARCHIVE LOG CURRENT permite que você especifique o thread para arquivar enquanto o 
    ALTER SYSTEM SWITCH LOGFILE arquiva apenas o atual fio. Se você não passar o parâmetro thread, o Oracle arquivar todos os 
    logs de refazer on-line completos.
*/
alter system switch logfile;