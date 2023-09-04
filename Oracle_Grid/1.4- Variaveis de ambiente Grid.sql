/*
User Profiles - arquivo.txt

variaveis de ambiente - diretorio home do grid

se mudou o caminho de instalação precisa alterar no arquivo de variaveis de ambiente tambem
*/
cd /home/grid

ls -la 

--editar o .bash_profile abaixo de #user specific..

vi .bash_profile


export ORACLE_SID=+ASM
export ORACLE_BASE=/u01/app
export ORACLE_HOME=$ORACLE_BASE/21.0.0.0/grid
export PATH=$ORACLE_HOME/bin:$PATH:$HOME/bin