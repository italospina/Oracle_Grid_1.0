# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

export ORACLE_SID=+ASM
export ORACLE_BASE=/u01/app
export ORACLE_HOME=$ORACLE_BASE/12.2.0/grid
export PATH=$ORACLE_HOME/bin:$PATH:$HOME/bin
