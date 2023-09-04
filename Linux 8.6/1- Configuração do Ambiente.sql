--Habilitar SSH
sudo yum install curl
sudo apt-get install ssh
yum install -y epel-release
yum install -y ufw

--ver ip
ifconfig -a

--ver discos do ambiente
lsblk

--particionar discos ambiente
fdisk /dev/sd<'letra do disco'>

--ajuste de SELINUX / impor politica de nivel de acesso a usuarios e servicos
vi /etc/selinux/config

--mudar linguagem do ambiente
export LANG=en_US.UTF-8

--Ajuste do arquivo hosts
vi /etc/hosts

[root@Estudos ~]# hostname
Estudos
[root@Estudos ~]# ifconfig
192.168.1.107 


--Instalar Oracle
dnf install oracle-database-preinstall-21c

--Patoce ambiente Grafico
yum -y install tigervnc*
yum -y install xterm
yum -y install xorg-x11*