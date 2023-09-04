--ir nas configurações da VM
--ir em armazenamento -> controladores sata +



-- ver discos
lsblk

NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda           8:0    0   40G  0 disk
├─sda1        8:1    0    1G  0 part /boot
└─sda2        8:2    0   39G  0 part
  ├─ol-root 252:0    0   30G  0 lvm  /
  └─ol-swap 252:1    0    9G  0 lvm  [SWAP]
sdb           8:16   0    5G  0 disk
└─sdb1        8:17   0    5G  0 part
sdc           8:32   0    5G  0 disk
└─sdc1        8:33   0    5G  0 part
sdd           8:48   0    5G  0 disk
└─sdd1        8:49   0    5G  0 part
sde           8:64   0    5G  0 disk
└─sde1        8:65   0    5G  0 part
sr0          11:0    1 1024M  0 rom

--camada de abstração em cima do disco fisico sdb1
fdisk /dev/sdh
n
4x default
w

/*
Previni perda de dados, pois o asmlib identifica corretamente em um boot
*/
--listar discos
oracleasm listdisks

--criar disco
oracleasm createdisk ASMDATA01 /dev/sdb1
oracleasm createdisk ASMDATA02 /dev/sdc1
oracleasm createdisk ASMDATA03 /dev/sdd1

oracleasm createdisk ASMARCH04 /dev/sdi1

--onde ficam montados
cd /dev/oracleasm/disks

