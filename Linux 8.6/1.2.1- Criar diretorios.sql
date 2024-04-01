#Setar o Password do oracle
passwd oracle

#Criando Diretorios
mkdir -p /u01/app/oracle/product/19c/db_1
mkdir -p /u02/oradata
chown -R oracle:oinstall /u01 /u02
chmod -R 775 /u01/ /u02/