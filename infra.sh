#!/bin/bash

echo '###############################################'
echo "#### Inicio - criação grupos de usuários...####"
echo '###############################################'

groupadd GRP_NEG
groupadd GRP_PROJ
groupadd GRP_SEC
groupadd GRP_SUST

echo '###############################################'
echo "####  Fim - criação grupos de usuários...  ####"
echo '###############################################'

echo ''
echo ''
echo ''

echo '###########################################'
echo "#### Inicio - criação dos diretorios...####"
echo '###########################################'

mkdir /negocio
mkdir /projetos
mkdir /seguranca
mkdir /sustentacao

echo '###########################################'
echo "####  Fim - criação dos diretorios...  ####"
echo '###########################################'

echo ''
echo ''
echo ''

echo '###############################################'
echo "#### Inicio - criação dos usuários...      ####"
echo '###############################################'

# -c "Nome ou mensagem"
# -m criar a pasta do usuário
# -s informar qual o shell será usado ( padrão => /bin/bash)
# -p $(openssl passwd -crypt Senha123) (senha criptografada)
# -g Grupo1, Grupo2

useradd maicon -c "Maicon Campbell" -m -s /bin/bash  -p $(openssl passwd -crypt Senha321) -G GRP_NEG,GRP_PROJ,GRP_SEC,GRP_SUST 

useradd daniel -c "Daniel de Almeida" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -g GRP_PROJ

useradd gabriel -c "Gabriel Paula" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -g GRP_PROJ

useradd aline -c "Aline Silva" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -g GRP_NEG

useradd maria -c "Maria Jose" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -g GRP_NEG

useradd francisco -c "Francisco Almeida" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

useradd ricardo -c "Ricardo Teixeira" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -g GRP_SEC

echo '###############################################'
echo "#### FIM - criação dos usuários...         ####"
echo '###############################################'

echo ''
echo ''
echo ''

echo '###############################################'
echo "#### Inicio - criação das permissões...    ####"
echo '###############################################'

chown root:GRP_NEG /negocio
chown root:GRP_PROJ /projetos
chown root:GRP_SEC /seguranca
chown root:GRP_SUS /sustentacao

chmod 770 /sustentacao
chmod 770 /projetos
chmod 777 /seguranca
chmod 770 /negocio

echo '###############################################'
echo "#### FIM - criação das permissões...       ####"
echo '###############################################'
