

#### 1) Les variables d'hôte

Comme décrit ci-dessus, les variables peuvent êtres définies pour chaque hôte comme suit:

*fichier .INI*
```
[atlanta]
host1 http_port=80 maxRequestsPerChild=808
host2 http_port=303 maxRequestsPerChild=909
```

#### 2) Les variables du groupe
Les variables peuvent également être appliquées à un groupe entier à la fois. Dans l'exemple ci-dessous les variables sont communes à l'host1 et host2.

*fichier .yml*
```
atlanta:
  hosts:
    host1:
    host2:
  vars:
    ntp_server: ntp.atlanta.example.com
    proxy: proxy.atlanta.example.com
```

#### 3) Le groupe par défaut

Il existe deux groupes par défaut:

- all: contient tout les hôtes
- ungrouped:  contient tous les hôtes qui n’ont pas d’autre groupe en dehors de tous

#### 4) Organisation des inventaires

Les variables d’hôte et de groupe peuvent être définies dans le fichier d’inventaire, mais il est recommandé de les externaliser dans des fichiers séparés.  

Ces fichiers de variables sont au format YAML. Les extensions de fichier, valides, incluent «.yml», «.yaml», «.json» ou aucune extension de fichier. (de préference spécifier l'extention).

Chaque groupe et hôte aura son propre fichier. Pour cela il faut d’abord créer deux répertoires

- group_vars : pour les variables de groupe,
- host_vars : pour les variables d’hôte.

Ces 2 répertoires peuvent se situer :
-	soit au même endroit que le fichier d’inventaire 
-	soit à l’intérieur du répertoire contenant le Playbook (qu'on verra plus tard).

La mise en page pourrait ressembler à cette arborescence :

```
inventories/
   production/
      inventory.yml       # fichier d'inventaire pour les serveurs de production 
      group_vars/
         group1.yml       # Ici, nous affectons des variables à des groupes particuliers
         group2.yml
      host_vars/
         hostname1.yml    # Ici, nous affectons des variables à des hotes particuliers
         hostname2.yml
       	 hostname3.yml

   staging/
      inventory.yml       # fichier d'inventaire pour les serveurs de hors production
      group_vars/
         group1.yml       # Ici, nous affectons des variables à des groupes particuliers
         group2.yml
      host_vars/
         stagehost1.yml   # Ici, nous affectons des variables à des hotes particuliers
         stagehost2.yml
```

Exemple du contenu d’un fichier d’inventaire avec les variables host_vars et group_vars

Inventory.yml
```
all:
  children:
    group1:
      hosts:
        hostname1:
        hostname2:                                
    group2:
      hosts:
        hostname3:
```

hostname1.yml                                 
```
ansible_ssh_host: s00vlhostname
ansible_ssh_port: 1044
```

group1.yml
```
Path_env: /opt/app_name
```

##### _Remarque:_
- Utilisez des noms descriptifs de variables, uniques et significatifs.
- L’arborescence proposée ci-dessus est particulièrement adaptée aux environnements ayant un grand nombre de nœuds. D'autres arborescences sont detaillées sur le site officiel d'Ansible. Vous trouvez tous les liens à la fin de cette formation.
