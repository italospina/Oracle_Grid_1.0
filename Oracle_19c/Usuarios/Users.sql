/*
-> Username and authentication method
    -> Database ()
    -> S.O (/ as sysdba)
    -> Network
    -> Global
    -> Serviços externos

-> Basic privilages
-> Defaut permanent tablespace and space quotas
-> Default temporary tablespace
*/

--criar user database
--default tablespace USERS - todo objeto criado ira para users
--temporary tablespace temp - tablespace de ordenação
--quota unlimited on USERS - pode criar inumeras tabelas populadas sem restrição
--grant create session to aluno - permissao pra acessar o banco
--grant create table to aluno - permissao pra criar tabela
create user aluno identified by aluno
grant create session to aluno;
grant create table to aluno;
default tablespace USERS
temporary tablespace temp
quota unlimited on USERS;