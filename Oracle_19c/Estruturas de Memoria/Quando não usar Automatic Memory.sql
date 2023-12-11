/*
Hugepages - 
Quando um processo usa RAM, a CPU o marca como usado por esse processo. 
Para eficiência, a CPU aloca RAM em partes — 4K bytes é o valor padrão em muitas plataformas. 
Esses pedaços são páginas nomeadas. As páginas podem ser trocadas para disco, etc.

Como o espaço de endereço do processo é virtual, 
a CPU e o sistema operacional precisam lembrar quais páginas 
pertencem a qual processo e onde cada página é armazenada. 
Quanto mais páginas você tiver, mais tempo levará para encontrar onde a memória é mapeada. 
Quando um processo usa 1 GB de memória, são 262144 entradas para procurar (1 GB / 4K). 
Se uma entrada de tabela de página consumir 8 bytes, serão 2 MB (262144 * 8) para pesquisar.

A maioria das arquiteturas de CPU atuais oferece suporte a páginas maiores do que o padrão, 
o que dá à CPU/OS menos entradas para pesquisa. 
O sistema operacional tem nomes diferentes para eles — Páginas enormes no Linux, 
Super Páginas no BSD ou Páginas Grandes no Windows — mas são todos a mesma coisa.

Esse Recurso hugepages ajuda o sga do oracle processar paginas de 2mega a 2 giga ao inves de 4k.
Uso menos recurso de cpu.
Essas paginas nao são feitas swap
-melhorias de performance do banco
*/

--VER SE ESTA CONFIGURADA
grep Huge /proc/meminfo
[oracle@Estudos ~]$ grep Huge /proc/meminfo
Hugepagesize:       2048 kB  --2mega


