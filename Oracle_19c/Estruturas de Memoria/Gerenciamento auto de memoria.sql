/*
Passo 1- Verificar os parametros de sga(sga_target) e pga (pga_aggregate_target)
*/
--parametros de sga e pga
SQL> show parameter sga_target
NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
sga_target                           big integer 1088M

SQL> show parameter pga
NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
pga_aggregate_limit                  big integer 2G
pga_aggregate_target                 big integer 358M


/*
Passo 2 - Verificar parametros de memoria
memory_target ---> vai ser a sga target + maximo usado da pga_aggregate_target ou que a pga foi alocada (usar valor mais alto)
*/
SQL> show parameter memory

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
memory_max_target                    big integer 0
memory_target                        big integer 0     

/*
Passo 3 - Verificar valor maximo de pga usado
 e ver qual é o maior entre o maximo usado e o pga_aggregate_target
*/
select value/1024/1024 as "Valor Max. Em MB" from v$pgastat where name ='maximum PGA allocated';

Valor Max. Em MB
----------------
       434.87793

/*
Passo 4- Como pudemos ver, o valor maximo alocado é maior que o targert, com isso usamos essa formula abaixo
memory_target = sga_target + max(pga_aggregate_target,maximum PGA allocated)
*/
memory_target = sga_target(1088M) + max(pga_aggregate_target(358M) ,maximum PGA allocated(434M)
memory_target = 1088M + 434M

select 1088+434 from dual;
  1088+434
----------
      1522

memory_target= 1522M

/*
Passo 5- Alterar para o valor encontrado
*/
ALTER SYSTEM SET MEMORY_MAX_TARGET=1522M SCOPE=SPFILE;

/*
Passo 6- Stop start
*/
shutdown immediate
STARTUP
/*
Passo 6.1- Caso der erro
*/
oerr ora 00845
[oracle@Estudos ~]$ oerr agora 00845
00845, 00000, "MEMORY_TARGET não suportado neste sistema"
// *Causa: O parâmetro MEMORY_TARGET não era suportado neste sistema operacional 
ou /dev/shm não foi dimensionado corretamente no Linux.
// *Ação: Consulte a documentação para obter uma lista de sistemas operacionais suportados. 
Ou size /dev/shm deve ser pelo menos SGA_MAX_SIZE em cada instância Oracle em execução no sistema.


Filesystem           Size  Used Avail Use% Mounted on
tmpfs                1.8G  638M  1.2G  36% /dev/shm
/*
Passo 6.2- entrar como root
*/
mount -t tmpfs shmfs -o size=2500m /dev/shm
vi /etc/fstab ---alterar o valor 
/*
Passo 6.3- entrar como oracle
*/
startup

/*
Passo 7- Verificar parametro de memoria e agora a memoria vai ser distribuida dinamicamente
*/
SQL> show parameter memory

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
memory_max_target                    big integer 1536M
memory_target                        big integer 0


