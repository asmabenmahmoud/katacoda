
L'objectif est d'installer et de configurer un serveur apache, puis de **redémarer** le service apache **si seulement si la configuration a été changé**

Vous avez déja vus et traité un exercice sur l'installation du package apache dans la formation "Ansible pour le DEVOPS: partie 4" "exercice 4 de step7".

En tant que utilisateur "toto" : 

> Créer un fichier playbook_ex01.yml dans votre espace de travail /work_dir de la machine Ansible

> Caractéristiques du playbook "playbook_ex01.yml":

> -Le groupe sur lequel s'exécuteront les tâches: web

> -Tâche 1: Permet d'installer le package Apache Server (le nom du package est apache2)

> -Tâche 2: Permet de copier le fichier de configuration apache2.conf depuis le serveur source ansible(/work_dir/training-files) vers le serveur cible managed_node1 (/etc/apache2/apache2.conf)

> -Tâche 3: Permet de copier le fichier de configuration index.html depuis le serveur source Ansible (/work_dir/training-files) vers le serveur cible managed_node1 (/var/www/html)

> -Tâche 4: Permet de démarrer le service apache2
