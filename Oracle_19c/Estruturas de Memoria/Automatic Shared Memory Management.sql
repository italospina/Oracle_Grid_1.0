/*
Permite voce controlar a area de SGA
Quando voce estiver usando o memory_max_target, voce tem que resetar esses parametros de memoria
*/
--resetar o parametro
alter system reset memory_max_target;
alter system reset memory_target;

--definir valor de sga
alter system set sga_max_size=1088m SCOPE=SPFILE;

--fazer stop start para pegar o valor da sga_max_size
shutdown immediate
startup

--verificar os parametros
show parameter memory
show parameter sga