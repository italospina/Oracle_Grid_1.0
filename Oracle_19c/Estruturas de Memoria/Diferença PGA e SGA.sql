
/*
SGA - AREA GLOBAL SYSTEM
Memoria compartilhada por diversos processos

*/
O SGA é uma área de memória de leitura/gravação que, juntamente com os processos em segundo plano do Oracle, 
formam uma instância de banco de dados. Todos os processos de servidor executados em nome dos usuários podem ler informações no SGA da instância. 
Vários processos gravam no SGA durante a operação do banco de dados.
Cada instância de banco de dados tem seu próprio SGA. O Oracle Database aloca automaticamente memória para um SGA na inicialização da instância 
e recupera a memória no desligamento da instância. Quando você inicia uma instância com SQL*Plus ou Oracle Enterprise Manager, 
o tamanho do SGA é mostrado como no exemplo a seguir:

SQL> STARTUP
ORACLE instance started.
 
Total System Global Area  368283648 bytes
Fixed Size                  1300440 bytes
Variable Size             343935016 bytes
Database Buffers           16777216 bytes
Redo Buffers                6270976 bytes
Database mounted.
Database opened.

Como mostrado na Figura 14-1, o SGA consiste em vários componentes de memória, 
que são pools de memória usados para satisfazer uma classe específica de solicitações de alocação de memória. 
Todos os componentes do SGA, exceto o buffer de log redo, alocam e desalocam espaço em unidades de memória contíguas chamadas grânulos. 
O tamanho do grânulo é específico da plataforma e é determinado pelo tamanho total da SGA.
Você pode consultar a exibição para obter informações sobre os componentes do SGA.V$SGASTAT

Os componentes SGA mais importantes são os seguintes:
    Cache de buffer de banco de dados
    Armazenamento de colunas na memória
    Refazer buffer de log
    Piscina Compartilhada
    Piscina Grande
    Java Pool
    Piscina de Córregos
    SGA fixo

------------------------------------------------------------------------
------------------------------------------------------------------------
-------------------------------------------------------------------------
/*
PGA - PROGRAM GLOBAL AREA 

Informações de controle de sessão e cada processo oracle
*/
O PGA é a memória específica de um processo operacional ou thread que não é compartilhado por outros processos ou threads no sistema.
Como o PGA é específico do processo, ele nunca é alocado no SGA.

O PGA é um heap de memória que contém variáveis dependentes de sessão exigidas por um processo de servidor dedicado ou compartilhado. 
O processo do servidor aloca estruturas de memória que ele requer no PGA.

Uma analogia para um PGA é um espaço de trabalho de bancada temporário usado por um funcionário de arquivos. Nessa analogia, 
o atendente de arquivos é o processo do servidor que faz o trabalho em nome do cliente (processo do cliente). 
O atendente limpa uma seção da bancada, usa o espaço de trabalho para armazenar detalhes sobre a solicitação do cliente e 
para classificar as pastas solicitadas pelo cliente e, em seguida, abre mão do espaço quando o trabalho é concluído.

--Área SQL Privada
Uma área SQL privada contém informações sobre uma instrução SQL analisada e outras informações específicas da sessão para processamento.

Quando um processo de servidor executa código SQL ou PL/SQL, o processo usa a área SQL privada para armazenar valores de variáveis de ligação, 
informações de estado de execução de consulta e áreas de trabalho de execução de consulta.

Não confunda uma área SQL privada, que está no PGA, com a área SQL compartilhada, 
que armazena planos de execução no SGA. Várias áreas SQL privadas nas mesmas sessões ou em sessões diferentes podem apontar para um único plano de execução no SGA. 
Por exemplo, 20 execuções de em uma sessão e 10 execuções da mesma consulta em uma sessão diferente podem compartilhar o mesmo plano. 
As áreas SQL privadas para cada execução não são compartilhadas e podem conter valores e dados diferentes. SELECT * FROM sales

