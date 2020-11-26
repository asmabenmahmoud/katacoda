
Les rôles sont des fonctionnalités qui peuvent être utilisées indépendemment mais qui doivent être utilisées dans les Playbooks.
Les rôles sont une façon d’inclure des tâches Ansible au sein d’autres tâches en déclarant des dépendances. 
Cela permet de décomposer un Playbook complexe en plusieurs fichiers et faciliter sa lecture et sa réutilisation.

Chaque rôle est fondamentalement limité à une fonctionnalité particulière ou à la sortie souhaitée, avec toutes les étapes nécessaires pour fournir ce résultat dans ce rôle lui-même ou dans d'autres rôles répertoriés comme dépendances.

#### Utilisation des roles:
Plusieurs syntaxes sont possibles. Ci-dessous quelques unes: 

```
--- 
- hosts: tomcat-node 
  roles: 
    - install-tomcat
    - configure-ldap
```

```
---
- hosts: webservers
  tasks:
  - debug:
      msg: "before we run our role"
  - import_role:
      name: example
```

#### Structure du répertoire des rôles
Les rôles sont généralement définis dans un répertoire "roles" au niveau de l'arborescence des playbooks comme ci-dessous. Ainsi, lors de l'appel des rôles dans le playbook, Ansible saura les chercher sans spécifier le chemin complet. 

Ansible recherchera les rôles de la manière suivante:
- 1 - Le répertoire "/roles" relatif au fichier playbook
- 2 - "/etc/ansible/roles"

```
site.yml
webservers.yml
fooservers.yml
roles/
   common/
   install-tomcat/
   configure-ldap/
   webservers/
```   

Les rôles ont une arborescence bien spécifique comme suit:

```
├── README.md
├── defaults
│   └── main.yml
├── files
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── tasks
│   └── main.yml
├── templates
└── vars
    └── main.yml
```


Les rôles s’attendent à ce que les fichiers se trouvent dans certains noms de répertoire.
Les rôles doivent inclure au moins un de ces répertoires, mais il est parfaitement correct d’exclure ceux qui ne sont pas utilisés. Lorsqu'il est utilisé, chaque répertoire doit contenir un fichier main.yml.

- README.md: C'est un fichier pour documenter l’utilisation du rôle
  default/main.yml: Contient les valeurs par défaut des variables
  
- files: Ce dossier regroupe les éventuels fichiers qui seront utilisés dans le rôle
  
- handlers/main.yml: Si le rôle utilise des handlers, ils seront mis dans ce fichier
  
- meta/main.yml: Contient les métadonnées du rôle, créateurs, version…
  
- tasks/main.yml: Ce fichier est composé de l’ensemble des tâches qui constituent ce rôle
  
- templates: Ce répertoire est réservé aux templates

#### Ansible Galaxy
L'utilisation des rôles Ansible favorise la réutilisation et le partage. Ainsi il existe un hub qui regroupe un grand nombre de rôles appelé  [Ansible galaxy](https://galaxy.ansible.com/)

C'est un site gratuit permettant de rechercher, de télécharger, d'évaluer et de revoir toutes sortes de rôles Ansible développés par la communauté. 

Le client ansible-galaxy est inclus dans Ansible. Le client Galaxy vous permet de télécharger des rôles à partir de Ansible Galaxy et constitue également un excellent framework par défaut pour la création de vos propres rôles.

*Initier votre premier rôle "monrole" avec Ansible galaxy:*

Créer le répertoire "roles" dans votre espace de travail:
`mkdir /work_dir/roles`{{execute T1}}

Préparer l’arborescence du rôle: La commande est ansible-galaxy init <nom_du_role>
`ansible-galaxy init roles/monrole`{{execute T1}}

Afficher l'arborescence de votre rôle:
`ls -R /work_dir/roles`{{execute T1}}

#### Dépendances des rôles

Les dépendances de rôles vous permettent d’extraire automatiquement d’autres rôles lorsque vous utilisez un rôle. Les dépendances de rôle sont stockées dans le fichier meta/main.yml contenu dans le répertoire de rôle. 

Ce fichier doit contenir une liste de rôles et de paramètres à insérer avant le rôle spécifié.

*Exemple du fichier roles/myapp/meta/main.yml*

```
---
dependencies:
  - role: common
    vars:
      some_parameter: 3
  - role: postgres
    vars:
      dbname: blarg
      other_parameter: 12
```

> Les rôles dépendants sont toujours exécutés avant les rôles qui en dépendent. En outre, ils ne sont exécutés qu'une seule fois. Si deux rôles sont identiques à ceux de leur dépendance, ils ne sont exécutés que la première fois.

Nous allons faire un test et pour cela on vas creer un playbook test_role_dep.yml qui va appeler 2 roles "role1" et "role2". 

- Créer le playbook

`vim /work_dir/test_role_dep.yml`{{execute T1}}

Copier le contenu ci-dessous dans le fichier test_role_dep.yml

```
---
- name: test role dependancies
  hosts: web
  gather_facts: no
  roles:
    - role1
    - role2
```

- Créer les 3 répertoires et fichiers associés aux rôles 

`cd  /work_dir && mkdir -p roles/role1/{meta,tasks} roles/role2/{meta,tasks} roles/role3/{meta,tasks}`{{execute T1}}

- Créer les fichiers de métadonnées "meta/main.yml" pour les rôles 1 et 2  (pour déclarer les dépendances):

`vim /work_dir/roles/role1/meta/main.yml`{{execute T1}}

Copier et coller ce contenu dans le fichier ouvert:
```
dependencies:
    - role: role3
```

`vim /work_dir/roles/role2/meta/main.yml`{{execute T1}}

```
dependencies:
    - role: role3
```

- Créer les fichiers tasks/main.yml pour les 3 rôles

`vim /work_dir/roles/role1/tasks/main.yml`{{execute T1}}

Copier et coller ce contenu dans le fichier ouvert:

```
---
- name: Show message
  debug:
    msg: "hello from role 1"
```

`vim /work_dir/roles/role2/tasks/main.yml`{{execute T1}}

Copier et coller ce contenu dans le fichier ouvert:

```
---
- name: Show message
  debug:
    msg: "hello from role 2"
```

`vim /work_dir/roles/role3/tasks/main.yml`{{execute T1}}

Copier et coller ce contenu dans le fichier ouvert:

```
---
- name: Show message
  debug:
    msg: "hello from role 3"
```

- lancer le playbook: 

`cd /work_dir && ansible-playbook -i hosts.ini test_role_dep.yml`{{execute T1}}


Lors de l'exécution du rôle1 et du rôle2 dans le même répertoire (avec le rôle1 appelé avant le rôle2), l'ordre d'exécution serait le suivant:

role3 -> role1 -> role2

Vous pouvez remplacer ce comportement avec la variable allow_duplicates: true dans meta/main.yml de role3.

`echo allow_duplicates: true > /work_dir/roles/role3/meta/main.yml`{{execute T1}}

Lancer le playbook de nouveau: `cd /work_dir && ansible-playbook -i hosts.ini test_role_dep.yml`{{execute T1}}

L'ordre d'exécution résultant serait le suivant:

role3 -> role1 -> role3 -> role2

