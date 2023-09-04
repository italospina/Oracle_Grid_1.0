oracleasm configure -i

Default user to own the driver interface []: grid
Default group to own the driver interface []: dba
Start Oracle ASM library driver on boot (y/n) [n]: y
Scan for Oracle ASM disks on boot (y/n) [y]: y
Writing Oracle ASM library driver configuration: done

--ver status
[root@Estudos tmp]# oracleasm status
Checking if ASM is loaded: yes
Checking if /dev/oracleasm is mounted: yes


[root@Estudos tmp]# oracleasm-discover
Using ASMLib from /opt/oracle/extapi/64/asm/orcl/1/libasm.so
[ASM Library - Generic Linux, version 2.0.17 (KABI_V2)]
