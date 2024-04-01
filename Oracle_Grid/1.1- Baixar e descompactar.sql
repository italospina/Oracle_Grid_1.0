/*
============================================================================================
==== Passo 1 - Baixar o Oracle GRID Infrastructure- Oracle Database 21c Linux Download =====
====== https://www.oracle.com/database/technologies/oracle21c-linux-downloads.html =========
============================================================================================
*/

/*
===================================================
== Passo 2 - Entrar como grid, Jogar ele no /tmp ==
===================================================
*/

/*
===================================================
== Passo 3 - Descompactar e mandar pro home grid ==
=========== /u01/app/21.0.0.0/grid ================
===================================================
*/

[grid@Estudos ~]$ cd /tmp
[grid@Estudos tmp]$ unzip LINUX.X64_213000_grid_home.zip -d /u01/app/21.0.0.0/grid

/*
=====================================
== Passo 4 - Executar gridSetup.sh ==
=====================================
*/
./gridSetup.sh

/*
Passo 4.1 - Plano 
*/
2 opção standalone

mudar discovery path
/dev/oracleasm/disks*
marcar os 4 discos

/*
==============================================================================
== Passo 4.1.1 - Senha                                                      ==
==                                                                          ==
== SYS é o usuario de systemas                                              ==
== ASMSNMP é o usuario que o Oracle Enterprise Manager usa para se conectar ==
== a instancia ASM do seu banco para coleta de informacoes de performance   ==
==                                                                          ==
== acesar com sys/senha as sysdba                                           ==
==            sys/senha as sysasm                                           ==
==            /as sysasm                                                    ==
==            sys/senha@ASM as sysasm - remotamente                         ==
==============================================================================
*/
colocar uma senha para conexão sys e asm
SENHA: estudosoracle

/*
Passo 4.1.2 - Privilegios
*/

Oracle ASM Administrator (OSASM)- asmadmin
Oracle ASM DBA (OSDBA) - asmdba
Oracle ASM Operator (OSOPER for ASM) - asmoper

/*
Passo 4.1.3 - Create Inventory
*/
Oracle base: /u01/app/grid
Inventory: /u01/app/oraInventory

Executar manualmente

Mandar instalar


/*
Passo 4.1.3 - Scripts como root depois clicar em ok
*/
/u01/app/oraInventory/orainstRoot.sh
/u01/app/21.0.0.0/grid/root.sh


/*
Passo 4.1.4- Adicionar mais discos
*/