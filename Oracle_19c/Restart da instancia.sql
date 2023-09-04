/*
Passo 1- Stop e start o database no modo nomount
*/
srvctl stop database -d PROD --fora do banco
srvctl start database -d PROD -o nomount