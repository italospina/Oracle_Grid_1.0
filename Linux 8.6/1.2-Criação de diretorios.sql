--criação dos diretorios grid
mkdir -p /u01/app/21.0.0.0/grid--home do grid
mkdir -p /u01/app/grid --oracle base do grid

/*
Diretorios de home ja criados
*/

--mudar owner de diretorio de instalação
/*
*chown - mudar owner
*-R para todos os diretorios dentro dele
*usuario.grupo
*diretorio
*/
chown -R grid.oinstall /u01/app/21.0.0.0/grid --home do grid
chown -R grid.oinstall /u01/app/grid --oracle base do grid
chmod grid:oinstall /u01/app

--mudar permissoes
/*
O primeiro caractere diz qual é o tipo do objeto:
    – para arquivo comum;
    b para dispositivos de bloco (oferecem grandes quantidades de dados de cada vez).
    c para dispositivo de caracteres (oferecem dados de um caractere de cada vez);
    d para diretório;
    l para link simbólico;
    p para FIFO ou Named Pipe;
    s para socket mapeado em arquivo;
Os três caracteres seguintes mostram as permissões do dono (permissão de leitura e escrita).
O quinto, o sexto e o sétimo caracteres dizem quais as permissões do grupo (permissão de leitura e escrita).
Os três últimos caracteres especificam as permissões dos outros (permissão de leitura).


Permissão	Binário	Decimal
---	        000	    0
--x	        001	    1
-w-	        010	    2
-wx	        011	    3
r--	        100	    4
r-x	        101	    5
rw-	        110	    6
rwx	        111	    7
*/
chmod -R 775 /u01/app/21.0.0.0/grid --home do grid
chmod -R 775 /u01/app/grid --oracle base do grid
chmod 775 /u01/app

