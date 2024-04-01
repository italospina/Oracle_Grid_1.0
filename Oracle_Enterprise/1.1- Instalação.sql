--Sites de documentação
Link 1-https://docs.oracle.com/en/enterprise-manager/index.html
Link 2-https://docs.oracle.com/en/enterprise-manager/cloud-control/enterprise-manager-cloud-control/13.5/index.html
Link 3-https://docs.oracle.com/en/enterprise-manager/cloud-control/enterprise-manager-cloud-control/13.5/embsc/package-kernel-parameter-and-library-requirements-enterprise-manager-cloud-control.html#GUID-059D95F7-0326-4E0D-9470-6675C1891BA9
Link 4-https://docs.oracle.com/en/enterprise-manager/cloud-control/enterprise-manager-cloud-control/13.5/embsc/package-kernel-parameter-and-library-requirements-enterprise-manager-cloud-control.html#GUID-059D95F7-0326-4E0D-9470-6675C1891BA9
Link 5-https://www.oracle.com/enterprise-manager/downloads/linux-x86-64-13c-rel3-downloads.html
Link 6-https://edelivery.oracle.com

--ver informação do S.O
cat /etc/os-realease

/*
======================================================================================
=== Passo 1 Verificação de pacotes seguindo a documentacao de requisitos do Link 4 ===
======================================================================================
*/
--64-Bit Packages for 64-Bit Platform
binutils-2.30-49.0.2.el8
gcc-8.2.1-3.5.0.1.el8
gcc-c++-8.2.1-3.5.0.1.el8
glibc-2.28-42.0.1.el8.x86_64
glibc-devel-2.28-42.0.1.el8.x86_64
glibc-devel-2.17-55-i686
libaio-0.3.110-12.el8.x86_64
libaio-devel-0.3.110-12.el8.x86_64
libgcc-8.2.1-3.5.0.1.el8.x86_64
libstdc++-8.2.1-3.5.0.1.el8.x86_64
libstdc++-devel-8.2.1-3.5.0.1.el8.x86_64
libnsl.x86_64
sysstat-11.7.3-2.el8
motif-2.3.4-16.el8.x86_64
motif-devel-2.3.4-16.el8.x86_64
redhat-lsb-4.1-47.0.1.el8.x86_64
redhat-lsb-core-4.1-47.0.1.el8.x86_64
openssl-1.1.1-8.0.1.el8
make-4.2.1-9.el8

--comando
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep binutils-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep gcc-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep gcc-c++-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep glibc-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep glibc-devel-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep glibc-devel-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep libaio-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep libaio-devel-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep libgcc-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep libstdc++-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep libstdc++-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep libnsl.x86_64
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep sysstat-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep motif-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep motif-devel-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep redhat-lsb-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep redhat-lsb-core-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep openssl-
rpm -qa --queryformat "%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n" | grep make-

/*
=============================================================================================
=============================== Passo 2. Downloads ==========================================
== Todos os itens do link 5 e no link 6 Oracle Database 19c Enterprise Edition 19.3.0.0.0  ==
=============================================================================================
*/
Oracle Database 19.3.0.0.0 - Long Term Release for Linux x86-64

/*
=============================================================================================
=============================== Passo 3. Downloads ==========================================
== Todos os itens do link 5 e no link 6 Oracle Database 19c Enterprise Edition 19.3.0.0.0  ==
=============================================================================================
*/

/*
========================================================
========= Passo 4. Criar nova instancia ================
========================================================
*/
--criar home
mkdir -p /u01/app/oracle/product/19.0.0/ENTMAG
--entrar
cd /u01/app/oracle/product/19.0.0/ENTMAG
--unzip no arquivo baixado no passo 2
unzip -q /tmp/V982063-01.zip
--exporta o Distid para a verasao 7
export CV_ASSUME_DISTID='OL7'
--instalar
./runInstaller
/u01/app/oracle/product/19.0.0/ENTMAG/root.sh
--entrar no bin
/u01/app/oracle/product/19.0.0/ENTMAG/bin
--rodar 
./dbca

/*
=================================================================
========= Passo 5. Alterar parametro do processo ================
=================================================================
*/
SQL> alter system set processes=900 scope=spfile;

System altered.

/*
=================================================================
========= Passo 6. Instalar o Enterprise Manager ================
=================================================================
*/
--tirar variaveis de ambiente
unset ORACLE_HOME
unset ORACLE_SID

--criar diretorio
mkdir -p /u01/app/oracle/product/19.0.0/EM135c/bipublisher/config
mkdir -p /u01/app/oracle/product/19.0.0/EM135c/bipublisher/cluster
mkdir -p /u01/app/oracle/product/19.0.0/EM135c/middleware
mkdir -p /u01/app/oracle/agent
mkdir -p /u01/app/oracle/software

--executar
cd mkdir -p /u01/app/oracle/agent
export CV_ASSUME_DISTID='OL7'
unset ORACLE_HOME
unset ORACLE_SID
./em13300_linux64.bin


