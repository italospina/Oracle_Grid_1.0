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
