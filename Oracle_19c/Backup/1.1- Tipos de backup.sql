Tipos de backup
    Fisicos - gravar em hd, nuvem, ou fita
    Logicos - copiam metadados para uma possivel reconstrução do banco

Ferramentas para Backup e Recuperação
    -RMAN
    -DATAPUMP

Ferramentas Adicionais Poderosas
    -Flashback Database --voltar todo o banco de dados
    -Flashback Query --consulta tabelas do passado
    -Flashback Version Query --permite uma visualização historica para ver como eles mudaram durante o tempo
    -Flashback Transaction Query --buscar transações de uma query
    -Flashback Transaction --buscar transações de uma query
    -Flashback table --voltar somente a tabela
    -Flashback table drop --voltar somente a tabela dropada
    -Recycle Bin --armazena objetos dropados, como uma lixeira para ser voltada

Porque usar o RMAN?
    É muito poderoso em recursos, e, ao mesmo tempo, fácil e seguro na proteção dos backups. 
    Permite realizar diversos tipos de backups, como backup completo (banco de dados offline), 
    incremental (banco de dados online) e por backupset (cópia incremental apenas dos blocos alterados), 
    além de recursos com flashback recovery (recuperação rápida de dados), 
    duplicate auxiliary database (duplicação do banco de dados para uma máquina local ou remota), 
    recovery block (recuperação apenas do bloco de dados corrompida) e o Tablespace Point-In-Time Recovery (TSPITR),
     recuperação de um ou mais objetos em uma base auxiliar até um determinado período.