/*
Passo 1- Caso der erro
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
Passo 2- entrar como root
*/
mount -t tmpfs shmfs -o size=2500m /dev/shm
vi /etc/fstab ---alterar o valor 
/*
Passo 3- entrar como oracle
*/
startup