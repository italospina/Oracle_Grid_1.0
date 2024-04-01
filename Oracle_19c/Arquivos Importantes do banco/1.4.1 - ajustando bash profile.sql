export TMP=/tmp
export TMPDIR=$TMP
export ORACLE_BASE=/u01/app/oracle
export DB_HOME=$ORACLE_BASE/product/19c/db_1
export ORACLE_HOME=$DB_HOME
export ORACLE_SID=OR1
export ORACLE_TERM=xterm
export BASE_PATH=/usr/sbin:$PATH
export PATH=$ORACLE_HOME/bin:$BASE_PATH
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib

#Opcional se você tem usuário grid e usuário oracle
#Você poderia criar um alias que executa scripts adicionais
#para setar variáveis diferentes para o ORACLE_HOME, ORACLE_SID e PATH
#alias grid=’. /home/oracle/grid.env’
#alias db=’. /home/oracle/db.env’