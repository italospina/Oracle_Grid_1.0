--fazer backup arquivo
cp .bash_profile .bash_profile.old 

/*
editar arquivo .bash_profile
*/
export TMP=/tmp
export TMPDIR=$TMP

export ORACLE_HOSTNAME=Estudos
export ORACLE_UNQNAME=PROD
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=$ORACLE_BASE/product/19.0.0/PROD
export ORA_INVENTORY=/u01/app/oraInventory
export ORACLE_SID=PROD

export PATH=/usr/sbin:/usr/local/bin:$PATH
export PATH=$ORACLE_HOME/bin:$PATH

export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib


