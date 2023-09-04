/*
Criação do oracle home
*/
mkdir -p /u01/app/oracle/product/19.0.0/PROD

/*
Mudar Owner
*/
chown -R oracle:oinstall /u01/app/oracle

/*
Mudar permissões
*/
chmod -R 775 /u01/app/oracle/