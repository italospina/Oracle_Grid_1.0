--v$parameter
desc v$parameter
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 NUM                                                NUMBER
 NAME                                               VARCHAR2(80)
 TYPE                                               NUMBER
 VALUE                                              VARCHAR2(4000)
 DISPLAY_VALUE                                      VARCHAR2(4000)
 DEFAULT_VALUE                                      VARCHAR2(255)
 ISDEFAULT                                          VARCHAR2(9)
 ISSES_MODIFIABLE                                   VARCHAR2(5)
 ISSYS_MODIFIABLE                                   VARCHAR2(9)
 ISPDB_MODIFIABLE                                   VARCHAR2(5)
 ISINSTANCE_MODIFIABLE                              VARCHAR2(5)
 ISMODIFIED                                         VARCHAR2(10)
 ISADJUSTED                                         VARCHAR2(5)
 ISDEPRECATED                                       VARCHAR2(5)
 ISBASIC                                            VARCHAR2(5)
 DESCRIPTION                                        VARCHAR2(255)
 UPDATE_COMMENT                                     VARCHAR2(255)
 HASH                                               NUMBER
 CON_ID                                             NUMBER

set lines 1200
set pages 1200
col NAME for a30
col VALUE for a20
select NAME,VALUE,ISSES_MODIFIABLE,ISSYS_MODIFIABLE from v$parameter
where name like '%sga%';
