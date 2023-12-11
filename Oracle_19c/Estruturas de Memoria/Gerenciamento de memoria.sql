/*
Gerenciamento de memória

*/
O gerenciamento de memória envolve a manutenção de tamanhos ideais para as estruturas de memória da instância Oracle conforme as demandas do banco de dados mudam. 
As configurações de parâmetro de inicialização determinam como a memória SGA e PGA da instância é gerenciada.

--Gerenciamento automático de memória
No gerenciamento automático de memória, o Oracle Database gerencia a memória SGA e a PGA da instância de forma completamente automática. E
ste método é o mais simples e é fortemente recomendado pela Oracle.

Os únicos controles especificados pelo usuário são o parâmetro de inicialização do tamanho da memória de destino () e o parâmetro opcional de inicialização do tamanho máximo da memória (). 
O Oracle Database ajusta o tamanho da memória de destino, redistribuindo a memória conforme necessário entre o SGA e o PGA da instância.MEMORY_TARGETMEMORY_MAX_TARGET

A partir do Oracle Database 12c Release 1 (12.1.0.2), o SGA contém uma área de memória opcional conhecida como In-Memory Column Store (armazenamento de colunas IM). 
Não importa qual método de gerenciamento de memória você use, você deve dimensionar o armazenamento de colunas de IM separadamente com o parâmetro de inicialização. 
O tamanho do armazenamento de coluna de IM é contabilizado no destino de memória, mas não faz parte do algoritmo de redimensionamento automático de área. 
Assim, se você definir como 5 GB e 1 GB, o destino de memória geral é 5 GB (não 6 GB), e o é sempre 1 GB. INMEMORY_SIZEMEMORY_TARGETINMEMORY_SIZEINMEMORY_SIZE

--Gerenciamento de memória compartilhada do SGA
Se o gerenciamento automático de memória não estiver habilitado, o sistema deverá usar o gerenciamento de memória compartilhada do SGA. 
O gerenciamento de memória compartilhada é possível de uma das seguintes formas:

    --Gerenciamento automático de memória compartilhada
    Esse modo permite que você exerça um controle mais direto sobre o tamanho do SGA e é o padrão quando o gerenciamento automático de memória está desabilitado. 
    O banco de dados ajusta o SGA total para o tamanho de destino e ajusta dinamicamente os tamanhos dos componentes do SGA. Se você estiver usando um arquivo de parâmetro de servidor, 
    o Oracle Database lembrará os tamanhos dos componentes ajustados automaticamente nos desligamentos da instância do banco de dados.

    --Gerenciamento manual de memória compartilhada
    Nesse modo, você define os tamanhos de vários componentes individuais do SGA e ajusta manualmente os componentes individuais do SGA continuamente. 
    Você tem controle total dos tamanhos individuais dos componentes SGA. O banco de dados usa como padrão esse modo quando o gerenciamento automático de memória e o 
    gerenciamento automático de memória compartilhada estão desabilitados.

--Gerenciamento de memória do PGA da instância
Se o gerenciamento automático de memória não estiver habilitado, o Oracle Database usará o gerenciamento de memória PGA automático ou manual.

Os seguintes modos são possíveis para o gerenciamento de memória PGA:

--Gerenciamento automático de memória PGA

Quando o gerenciamento automático de memória () está desabilitado e é definido como um valor diferente de zero, 
o banco de dados usa o gerenciamento automático de memória PGA. Nesse modo, especifica um tamanho de destino "suave" para o PGA da instância. 
O destino é flexível porque só se aplica a tipos específicos de alocações de memória que podem optar por usar espaço temporário em vez do PGA. 
O banco de dados ajusta o tamanho do PGA da instância para esse destino e ajusta dinamicamente os tamanhos de PGAs individuais. 
Se você não definir explicitamente um tamanho de destino, o banco de dados configurará automaticamente um padrão razoável. MEMORY_TARGETPGA_AGGREGATE_TARGETPGA_AGGREGATE_TARGET

O parâmetro de inicialização define dinamicamente um limite rígido de toda a instância para memória PGA. 
Como o parâmetro responde à alteração das condições de memória, não é necessário definir o valor do parâmetro explicitamente. 
Por padrão, é definido como o maior dos seguintes:PGA_AGGREGATE_LIMITPGA_AGGREGATE_LIMIT

    -2 GB

    -200% da configuração do parâmetro de inicializaçãoPGA_AGGREGATE_TARGET

    -(Valor da configuração do parâmetro de inicialização) * 3 MBPROCESSES

O valor de não deve exceder 120% do tamanho da memória física menos o tamanho total do SGA.PGA_AGGREGATE_LIMIT

Um processo em segundo plano compara periodicamente o tamanho do PGA com o limite definido pelo . 
Se o limite for atingido ou excedido, esse processo encerrará as chamadas para as sessões usando a memória PGA mais ajustável. 
Se essas sessões ainda não liberarem memória suficiente, elas também serão encerradas.PGA_AGGREGATE_LIMIT

--Gerenciamento manual de memória PGA

Quando o gerenciamento automático de memória é desabilitado e definido como , o banco de dados assume como padrão o gerenciamento manual de PGA.
As versões anteriores do Oracle Database exigiam que o DBA especificasse manualmente o tamanho máximo da área de trabalho para cada tipo de operador SQL 
(como uma junção de classificação ou hash). Essa técnica mostrou-se muito difícil, pois a carga de trabalho está sempre mudando. 
Embora o Oracle Database ofereça suporte ao método manual de gerenciamento de memória PGA, a Oracle recomenda enfaticamente o gerenciamento automático de memória.PGA_AGGREGATE_TARGET0