--Criação de grupos
groupadd -g 54321 oinstall
groupadd -g 54322 dba
groupadd -g 54327 asmdba
groupadd -g 54328 asmoper
groupadd -g 54329 asmadmin
groupadd -g 54330 racdba
groupadd -g 54331 backupdba
groupadd -g 54332 dgdba

-- alguns grupos ja estavam criados por conta
-- do install oracle-database-preinstall-21c
/*
groupadd -g 54321 oinstall
groupadd -g 54322 dba
groupadd -g 54330 racdba
groupadd -g 54331 backupdba
groupadd -g 54332 dgdba
*/
history|grep dnf

--adicionar usuario grid 
/*
owner do grid infrastructure
grupo principal oinstall
grupo secundario dba,oper,asmdba,asmoper,asmadmin
*/
useradd -u 54331 -g oinstall -G dba,oper,asmdba,asmoper,asmadmin grid

--adicionar usuario oracle
/*
Usuario ja é criado, precisa adicionar grupos
*/
usermod -G oinstall,dba,racdba,oper,backupdba,dgdba,kmdba,asmdba,asmadmin oracle -c "Database"

--definir senha para usuario oracle e grid
/*
oracle: oracle
grid: grid
*/
passwd oracle
passwd grid