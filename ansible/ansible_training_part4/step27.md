
Maintenant que vous avez compris l'utilisation des rôles, les playbook,les variables,...vous allez réaliser un playbook avec 2 rôles afin d'installer un serveur web avec une base de donnée.

Lors des exercices précedents, nous avons à chaque fois définis quelques variables dans le playbook. Mais la bonne pratique est de les définir dans les fichiers d'inventaire (group_var et host_vars).

Notre inventaire contient que 2 hôtes. C'est pour cela qu'on va utiliser l'organisation ci-dessous. Vous pouvez consulter d'autres architectures et les bonnes pratiques sur [le site officiel Ansible](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#content-organization) 

```
 /work_dir/
    ├── playbook_ex08.yml
    ├── group_vars
    ├── host_vars
    ├── inventories  
    └── roles
        └── webservers 
            ├── vars
            │   └── main.yaml  
            ├── handlers
            │   └── main.yaml  
            ├── tasks
            │   └── main.yaml  
            └── templates
               └── index.html.j2
        └── dbservers 
            ├── vars
            │   └── main.yaml  
            ├── handlers
            │   └── main.yaml  
            ├── tasks
            │   └── main.yaml  
            └── templates
               └── my.cnf.j2
```

> Caractéristiques du rôle webservers:

> Installation du serveur Apache (package apache2)

> Configuration du fichier de configuration /var/www/html/index.html et /etc/apache2/apache2.conf

> Démarrage du service Apache et redémarrage dans le cas d'une modification de la configuration

> Caractéristiques du rôle dbservers:

> Installation du serveur postgresql (package postgresql)

> Création de la base de donnée postgres_db01

> Création de l'utilisateur postgres avec les paramètres suivants:
>    nom: ansible_db01
>    password Ansible1!
>    privilège: All
>    expiration : Jan 31 2020

> 
