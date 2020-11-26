#### Correction

playbook_ex03.yml
<pre class="file">
---
- name: Modify config file
  hosts: web
  vars:
    config_file_path: /etc/training/training.d/config.txt
  gather_facts: no
  tasks:
  - name: Replace Server name on apache config file
    become: yes
    replace:
      path: "{{ config_file_path }}"
      regexp: 'ServerName www.example.com'
      replace: 'ServerName myapp.dev.com'
      backup: yes
</pre>

lancer le playbook:  `ansible-playbook -i hosts.ini playbook_ex03.yml`{{copy}}

Vérifier si la modification a été bien éffectuée sur le serveur cible et que l'on a bien un fichier sauvegardé:

`ls -ll /etc/training/training.d/`{{execute T2}}

`cat /etc/training/training.d/config.txt`{{execute T2}}

##### *Remarque:*

Vous pouvez toujours lancer votre playbook plusieurs fois pour tester l'idempotence (tant que le fichier config.txt n'a pas été changé sur la source, vous allez toujours avoir 0 changement après l'exécution du playbook) 

![recap_playbook_ex02](/devopsteam/courses/ansible/ansible_training_part2/assets/recap_playbook_ex02.png)
