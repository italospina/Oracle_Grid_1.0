/*
Passo 1. Parar a camada do OMS- camada WEB
*/
/u01/app/oracle/product/19.0.0/EM135c/middleware/bin
./emctl stop oms -all -force

/*
Passo 2. Parar agente oracle
*/

/u01/app/oracle/agent/bin
./emctl stop agent

/*
Passo 3. Parar banco
*/
entrar no banco sqlplus / as sysdba
shutdown immediate
lsnrctl stop

/*
Passo 4. start agente
*/
/u01/app/oracle/agent/bin
./emctl start agent

/*
Passo 5. start banco de dados
*/
entrar no banco sqlplus / as sysdba
startup
lsnrctl start 

/*
Passo 6. start oms
*/
/u01/app/oracle/product/19.0.0/EM135c/middleware/bin
./emctl start oms