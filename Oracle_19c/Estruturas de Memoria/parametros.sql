--parametros de sga e pga
SQL> show parameter sga

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
allow_group_access_to_sga            boolean     FALSE
lock_sga                             boolean     FALSE
pre_page_sga                         boolean     TRUE
sga_max_size                         big integer 1088M
sga_min_size                         big integer 0
sga_target                           big integer 1088M
unified_audit_sga_queue_size         integer     1048576
SQL>
SQL>
SQL> show parameter pga

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
pga_aggregate_limit                  big integer 2G
pga_aggregate_target                 big integer 358M
/*
---
---
---
*/
--parametros de memoria
/*
memory_target ---> vai ser a sga target + maximo usado da pga_aggregate_target ou que a pga foi alocada (usar valor mais alto)
*/
SQL> show parameter memory

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
hi_shared_memory_address             integer     0
inmemory_adg_enabled                 boolean     TRUE
inmemory_automatic_level             string      OFF
inmemory_clause_default              string
inmemory_expressions_usage           string      ENABLE
inmemory_force                       string      DEFAULT
inmemory_max_populate_servers        integer     0
inmemory_optimized_arithmetic        string      DISABLE
inmemory_prefer_xmem_memcompress     string
inmemory_prefer_xmem_priority        string
inmemory_query                       string      ENABLE

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
inmemory_size                        big integer 0
inmemory_trickle_repopulate_servers_ integer     1
percent
inmemory_virtual_columns             string      MANUAL
inmemory_xmem_size                   big integer 0
memory_max_target                    big integer 0
memory_target                        big integer 0     
optimizer_inmemory_aware             boolean     TRUE
shared_memory_address                integer     0
