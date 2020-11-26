> Utiliser l'utilisateur "toto" pour créer et lancer le playbook

> Créer un fichier playbook_ex01.yml dans votre espace de travail /work_dir de la machine Ansible

> Caractéristiques du playbook "playbook_ex01.yml:

> Le groupe sur lequel s'exécuteront les têches est : [db]

> Le playbook fait appel au rôle "ntp"

> Créer un rôle "ntp" avec l'arborescence suivante:

```
 /work_dir/
    ├── playbook_ex07.yml
    ├── hosts.ini
    └── roles
        └── ntp 
            ├── defaults
            │   └── main.yaml  
            ├── handlers
            │   └── main.yaml  
            ├── tasks
            │   └── main.yaml  
            └── templates
               └── ntp.conf.j2
```

> Caractéristiques du rôle "ntp":

> tâche1: Installation du service ntp

> tâche2: Création du fichier de configuration ntp.conf à partir d'un template et affectation les droits suivants: (owner: root, group: root, mode: '0644'). Utiliser le template présent dans /work_dir/training-files/ntp.conf.j2 et copier le dans le bon endroit.

> tache2: redémarrage du service ntp si seulement le fichier de configuration a été changé.

> Déclarer les valeurs par defaut de la variable "ntp_servers" au niveau du rôle "ntp". 

> Voici les valeurs:
> ntp_servers:
>  - '0.debian.pool.ntp.org'
>  - '1.debian.pool.ntp.org'
>  - '2.debian.pool.ntp.org'

> tache3: S'assurer que le service ntp est bien démarré


