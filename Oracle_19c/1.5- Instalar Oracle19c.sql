/*
Descompactar o software no oracle_home
*/
cd /tmp

unzip LINUX.X64_193000_db_home.zip -d $ORACLE_BASE/product/19.0.0/PROD

cd /u01/app/oracle/product/19.0.0/PROD
/*
Compatiblidade do software
https://docs.oracle.com/en/database/oracle/oracle-database/19/ladbi/operating-system-checklist-for-oracle-database-installation-on-linux.html
*/
--se for menor alterar o release cat /etc/os-release

--variable cv_assume
export CV_ASSUME_DISTID=OEL7.6

--se for, rodar como oracle
./runInstaller

set up software only

single instance

standard edition 2

oracle_base=/u01/app/oracle

/*
como root criar user grid
*/
usermod -g oinstall -G dba,racdba,oper,backupdba,dgdba,kmdba,asmdba,asmadmin grid


Grupo Administrador de banco de dados (OSDBA): dba
Grupo Operador de Banco de Dados (OSOPER) (Opcional): oper
Grupo de backup e recuperação de banco de dados (OSBACKUPDBA): backupdba
Grupo administrativo do Data Guard (OSDGDBA): dgdba
Grupo administrativo de gerenciamento de chave de criptografia (OSKMDBA): kmdba
Grupo administrativo Real Application Custer (OSRACDBA): racdba

/*
Executar script como root
*/
/u01/app/oracle/product/19.0.0/PROD/root.sh
Default
y
y

/*
Agora como oracle - Configurar o database
no 21c nao tem como desmarcar opcao de container, pois so tem como criar como container
*/

cd /home/oracle

dbca

create database

nome database
storage type: ASM
    -->FS tem que configurar o /u01 ou /u02
FRA: +ARCH
Senha: Cabreuva2023*

--caso faltar espaço no FRA
parar o ambiente /u01/app/21.0.0.0/grid/bin/crsctl stop has
adicionar mais um disco

--como grid rodar o asmca para adicionar os discos
asmca
--ir em DG
--add disk no ARCH



