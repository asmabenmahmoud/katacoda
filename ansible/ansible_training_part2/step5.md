
#### 1) Installation du client/serveur SSH

Installer un client SSH sur le node Ansible:
`apt-get install -y ssh-client`{{execute T1}}

Installer le serveur SSH sur les 2 hôtes managés:

Sur le managed_node1 `apt-get install -y openssh-server;service ssh start`{{execute T2}}

Sur le managed_node2 `apt-get install -y openssh-server;service ssh start`{{execute T3}}


Après avoir installé les clients SSH, nous avons besoin de définir notre méthode d'authentification via le protocole SSH.

- 1 - La méthode login/password:

Méthode standard,  la plus utilisée lors d'une connexion SSH manuelle, on saisit le login avec lequel on souhaite se connecter, puis le mot de passe

- 2 - La méthode clé:

Un échange de clé est à établir. Le serveur souhaitant se connecter doit avoir sa clé publique comme autorisée du côté du serveur sur lequel il souhaite se connecter.

> Pour une automatisation complète des tâches, nous aurons besoin d’une authentification SSH sans mot de passe afin de ne pas saisir le mot de passe à chaque fois (Cela est difficilement pensable pour plusieurs dizaines de serveurs). Pour cela nous allons utiliser la methode 2


#### 2) Configuration de la methode d'authentification

L'authentification par clés se fait donc via une paire de clés, le client (le node Ansible) va générer une paire de clés, une publique et une privée. Seule la clé publique sera envoyée aux serveurs SSH (managed_node1 et 2) et sera stockée^dans un endroit prévu cet effet.

![echange cle ssl](/devopsteam/courses/ansible/ansible_training_part1/assets/crypto-images-schemaclepublique.gif)


##### - Générer les clés publique/privée

Sur le node Ansible `ssh-keygen`{{execute T1}}

Il suffit de conserver les valeurs par défaut, de cliquer dans le terminal et d’appuyer trois fois sur la touche retour.

Cela va générer  ~/.ssh/id_rsa.pub et ~/.ssh/id_rsa dans le repertoire ~/.ssh:
 
`ls -ltr ~/.ssh`{{execute T1}}

##### - Partager la clé  publique

Nous allons copier la clé publique depuis le serveur Ansible vers les hôtes managés 

1- Afficher la clé publique sur le serveur Ansible puis **copier** le résultat:

`cat ~/.ssh/id_rsa.pub`{{execute T1}}

2- **Coller** la clé publique copiée précédemment dans le fichier ~/.ssh/authorized_keys du serveur "managed_node1":

`mkdir ~/.ssh; vim ~/.ssh/authorized_keys`{{execute T2}}

3- **Coller** la clé publique copiée précédemment dans le fichier ~/.ssh/authorized_keys du serveur "managed_node2":

`mkdir ~/.ssh; vim ~/.ssh/authorized_keys`{{execute T3}}


##### *Remarque:*

Dans cette formation, nous allons utiliser l'utilisateur root pour la connexion SSH. Dans la pratique, privilégiez plutôt un autre utilisateur qui a les droits "sudoer".
