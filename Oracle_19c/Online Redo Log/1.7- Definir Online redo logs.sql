/*
Os online redo logs eles formecem mecanismos possiveis de gravar alterações
feitas no banco de dados

Se houver uma falha tem que usar os online redo logs para realizar a recuperação das informações

Pelo menos 2 grupos de redo logs, para que caso ocorra um erro terá o espelho

Gravar transações feitas no banco de dados antes de gravar nos datafiles

--inactive: nao é necessario para um crash recovery
--current: ele está sendo escrito nesse momento
--unused: esse grupo nunca foi escrito
--clearing: esta sendo limpo por um alter database clear logfile

colunas
--mem_status
    --null: esta sendo usado
    --invalid: está inacessivel ou foi criado recentemente
    --deleted: foi deletado
    --staled: os conteudos nao estao completos
*/

set lines 1200
set pages 1200
col member format a60
select a.GROUP#, 
       a.THREAD#, 
       a.status, 
       member, 
       b.status mem_status,
       a.BYTES/1024/1024
  from v$log a, v$logfile b
 where a.GROUP#=b.GROUP# 
 order by a.GROUP#,member;

 
 --Adicionar grupos de redo log (mesmo tamanho dos grupos ja existentes)
 alter database add logfile group 4
 ('+DATA','+ARCH') SIZE 200M;

--mudar grupo do redo log(caso precisar mudar)
alter system switch logfile;

--caso o grupo ficar active
-- escrever nos cabeçalhos dos datafiles, pois esses arquivos são 
--necessarios para um recover
alter system checkpoint;

--deletar grupo redo (so consegue dropar se staus inativo)
alter database droplogfile group 1;