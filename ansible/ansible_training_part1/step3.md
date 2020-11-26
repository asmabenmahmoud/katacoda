- Un contrôleur Ansible pour effectuer différentes opérations sur le(s) serveur cible.
  Ansible peut être exécuté à partir de n’importe quel ordinateur sur lequel Python 2 (version 2.7) ou Python 3 (versions 3.5 et supérieures) est installé. Windows n'est pas pris en charge pour la machine de contrôle.

- Un ou plusieurs serveurs cibles (nommé "serveur managé").
  Sur ces machines, un serveur SSH est requis pour effectuer la communication avec le controleur Ansible.
  Vous avez également besoin de Python 2 (version 2.6 ou ultérieure) ou de Python 3 (version 3.5 ou ultérieure).

![ansible architecture](/devopsteam/courses/ansible/ansible_training_part1/assets/ansible_architecture.png)

#### Architecture utilisée durant la formation
Afin d'optimiser les ressources nous avons choisi d'utiliser des images Docker avec un système Ubuntu. 
Nous avons créé 3 conteneurs Docker. Chaque conteneur joue un rôle d'une VM Ubuntu.

- Conteneur "ansible_node" : Correspond au serveur Controleur Ansible
- Conteneur "managed_node1 : Correspond au serveur managé 1
- Conteneur "managed_node2 : Correspond au serveur managé 2

##### *Remarque:*
Le serveur contrôleur peut avoir aussi le role d'un serveur managé 
