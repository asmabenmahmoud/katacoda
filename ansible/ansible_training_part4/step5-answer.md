#### Correction

playbook_ex01.yml
<pre class="file">
---
- name: Copy config file
  hosts: web
  vars:
    remote_dir: /etc/training/training.d
    source_file_path: /work_dir/training-files/config.txt
  gather_facts: no
  tasks:
  - name: Create the remote directory
    become: yes
    file:
      state: directory
      path: "{{ remote_dir }}"
  - name: Copy config file to the remote host web
    become: yes
    copy:
      src: "{{ source_file_path }}"
      dest: "{{ remote_dir }}"
</pre>

Nous allons **externaliser** les variables d'authentification et les définir dans le fichier d'inventaire  hosts.ini

/work_dir/hosts.ini
<pre class="file">
[myself]
localhost
[web]
managed_node1
[db]
managed_node2

[all:vars]
ansible_user="toto"
ansible_ssh_pass="toto"
</pre>

lancer le playbook:  `ansible-playbook -i hosts.ini playbook_ex01.yml`{{copy}}

##### *Remarques*

- Dans le playbook, nous avons besoin d'exécuter les tâches avec l'utilisateur root car lors de la première exécution du playbook playbook_ex01.yml, le répertoire /etc/training/training.d a été créé avec cet utilisateur et les droits d'accès par défaut ( droits de lecture, écriture que pour l'utilisateur root)

- Pour éviter de sauvegarder le mot de passe dans le fichier d'inventaire , 2 possibilités:

1- Utiliser Ansible Vault (cette partie n'est pas détaillée dans cette formation). plus d'information dans [Ansible Vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html)

2- Echange de clé ssh: La clé publique de l'utilisateur "toto" a déja été échangée entre le serveur Ansible et les 2 serveurs cibles. Tester le playbook avec ce fonctionnement:

  Modifier l'inventaire en supprimant les 2 lignes ansible_user et ansible_ssh_pass
  
  Lancer le playbook avec l'utilisateur "toto" :
  `chmod 777 /work_dir/*;su toto`{{execute T1}}

  `ansible-playbook -i hosts.ini playbook_ex01.yml`{{execute T1}}

**Dans les prochains exercices, vous allez créer et lancer les playbooks avec l'utilisateur toto afin de vous habituer à ne pas utiliser l'utilisateur "root" pour la connexion ssh**.
