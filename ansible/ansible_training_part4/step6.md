
Ce module remplace des chaînes de caractères et des lignes dans un fichier. Il peut remplacer toutes les occurrences de plusieurs chaînes avec la même variable.

Le module peut avoir plusieurs paramètres, on peut citer 

    path: le chemin du fichier sur la cible
    regexp: expression regulière qui permet d'identifier la chaine de caractère 

*[Documentation module replace](https://docs.ansible.com/ansible/latest/modules/replace_module.html?highlight=replace)

> Créer un fichier playbook_ex03.yml dans votre espace de travail /work_dir de la machine Ansible

> Caractéristiques du playbook "playbook_ex03.yml":

> -Le groupe sur lequel s'exécuteront les taches: web

> -Tache 1: Permet de remplacer la chaine de caractères "ServerName www.example.com" par "ServerName myapp.dev.com" dans le fichier /etc/training/training.d/config.txt de la machine cible, et sauvegarder le fichier avant de faire la modification

> Lancer le playbook avec l'utilisateur toto


##### *Remarque*

Afficher d'abord le contenu du fichier /etc/training/training.d/config.txt sur le serveur cible avant de lancer votre playbook afin de visualiser la différence après l'exécution du playbook.
