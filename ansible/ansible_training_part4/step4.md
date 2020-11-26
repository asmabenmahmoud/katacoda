

Lorsqu'on lance un playbook sans spécifier le nom d'utilisateur de connexion vers la cible, Ansible va utiliser l'utilisateur exécutant le playbook. 
Ansible permet de définir l'utilisateur de connexion via la variable "remote_user"           


Ansible peut utiliser les systèmes d'élévation/escalade de privilèges existants afin de permettre à un utilisateur d'exécuter des tâches.

Ces variables peuvent être définies dans le playbook ou dans les fichiers d'inventaire spécifiques à un hôte avec une autre syntaxe. 

- become_user: Définit l'utilisateur autre que celui utilisé pour la connexion à la machine cible.
Il sera utilisé lorsque l'utilisateur distant exécute des tâches en tant qu'utilisateur root ou autre lorsqu’il utilise             l’élévation de privilèges. La plupart des systèmes utiliseront «root» si aucun utilisateur n’est spécifié.
- become_password: Le mot de passe nécessaire pour l’élévationde privilèges. Il peut ne pas etre nécessaire, celon la facon dont                        l'utilisateur est configuré sur la machine cible. Ansible utilise aussi 
[Vault](https://docs.ansible.com/ansible/latest/user_guide/playbooks_vault.html) pour encrypter les mots de passe    
- become_method: Définit la methode d'escalation (sudo, su, ...). Par défaut c'est sudo.

- become: Définir à "yes" pour activer l'escalade de privilèges

##### *Exemple1:*
Démarrer le service httpd qui nécessite des privilèges root lorsqu'il est connecté en tant qu'utilisateur non root. Dans cette exemple ansible utilisera les valeurs par defaut des variables become_user et become_method

```
- name: Ensure the httpd service is running
  service:
    name: httpd
    state: started
  become: yes
```

##### *Exemple2:*

```
- name: Run a command as the Apache User
  command: somecommand
  become: yes
  become_user: apache
```

#### Définition des variables d'escalade de privilèges dans les inventaire:
Les variables peuvent être définies au niveau du groupe et/ou de l'hôte. Le nom des variabes est comme suit:

ansible_become, ansible_become_method, ansible_become_user, ansible_become_pass.

Exemple d'un fichier d'inventaire inventory.ini
```
[group_web]
machine_1 ansible_host=machine_cible1

[all:vars]
ansible_user="<USER>"
ansible_ssh_pass="<MOT_DE_PASSE>"
ansible_become_method=su
ansible_become_pass="<MOT_DE_PASSE>"
```

Exemple d'un playbook playbook.yml
```
---
- hosts: all
  tasks:
  - name: create a file as connected user
    file:
      path: /tmp/test_0.txt
      state: touch
      
  - name: create a file as root user
    become: yes
    become_user: root
    file:
      path: /tmp/test_1.txt
      state: touch
      
  - name: create a file as local technical user
    become: yes
    become_user: user2
    file:
      path: /tmp/test_2.txt
      state: touch
```


