/*
Tipo da Tabela (o mais comum é a heap table)
Padrão de Nomes
Tipos de Dados e tamanho das colunas
Constraints
Requisitos de Indexação
Espaço
Tablespace para Tabela e para os indices
*/

--criação de tabelas
create table departamento (
    dept_num number(10),
    dep_name varchar2 (20 char),
    dep_loca varchar2 (20 char),
    constraint departamento_pk primary key (dept_num)
    using index tablespace appindex
) tablespace appdados;


--criação de index
create index dept_idx02 on departamento (
    dept_num,
    dep_name,
    dep_loca
) tablespace appindex;

/*
ter um usuario com permissoes de administrador
*/
create user aluno_dba identified by aluno_dba
default tablespace USERS
temporary tablespace temp
quota unlimited on appdados;
grant create session to aluno_dba;
grant dba to aluno_dba;

/*
ter as tablespaces definidas no create table
*/
create tablespace APPDADOS
datafile '+DATA/APPDADOS01.DBF'
size 100m
extent management local
uniform size 128k 
segment space management auto 

create tablespace APPINDEX
datafile '+DATA/APPINDEX01.DBF'
size 100m
extent management local
uniform size 128k 
segment space management auto 

/*
Dar permissao para novas tablespaces ao user aluno
*/
ALTER USER aluno QUOTA 100M ON appdados;
ALTER USER aluno QUOTA 100M ON appindex;

