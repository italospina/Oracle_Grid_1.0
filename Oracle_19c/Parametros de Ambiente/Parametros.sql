--mostra todos os parametros do ambiente
show parameters

--mostrar parametros create
show parameter create

--mostrar parametros de archive
show parameter archive

archive log list

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

