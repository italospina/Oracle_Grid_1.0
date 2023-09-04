/*
Passo 1 - Entrar na pasta ssh
*/
cd /root/.ssh

/*
Passo 2 - Entrar na pasta ssh
*/
ssh-keygen -t rsa -b 2048

/*
Passo 3 - Colocar novo nome
*/
/root/.ssh/teste

/*
Passo 4 - Colocar senha
*/
!ItaloLindo$

/*
Passo 5 - Entrar no arquivo
*/
cd /root/.ssh
ls -la
cat teste.pub

/*
criar vm cloud simples para acessar
*/
ssh -i teste ubuntu@3.133.113.50

/*
regras para seguir no ambiente
*/
sudo nano /etc/default/ufw
ipv6=yes

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
sudo ufw disable
sudo ufw reset

sudo ufw allow from 3.133.113.50
sudo ufw allow from 172.31.10.149
sudo ufw deny from 3.133.113.50

/*
ver regras ufw
*/
sudo ufw status numbered