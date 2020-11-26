#### Correction

playbook_ex01.yml 
<pre class="file">
---
- name: Copy config file
  hosts: web
  vars:
    remote_dir: /etc/training/training.d
    source_file_path: /work_dir/training-files/config.txt
  tasks:
  - name: Create the remote directory
    file:
      state: directory
      path: "{{ remote_dir }}"
  - name: Copy config file to the remote host web
    copy:
      src: "{{ source_file_path }}"
      dest: "{{ remote_dir }}"
</pre>



lancer le playbook:  `ansible-playbook -i hosts.ini playbook_ex01.yml`{{copy}}


##### *Remarque:*
- Dans ce playbook , vous avez remarqué que la valeur de l'option "path" est remplacée par la variable source_file_path définie au debut du playbook.

- Notez que la syntaxe d'utilisation des variables est "{{ nom_variable }}"

- Lorsque vous lancez le playbook, vous avez une ligne de résultat indiquant que Ansible récupère les "facts" sur le serveur cible. Cette tâche prend un peu de temps d'exécution. 

```
TASK [Gathering Facts] *********************************************
```

Dans le cas ou vous n'avez pas besoins des valeurs de facts, vous pouvez désactiver la récupération des facts en ajoutant cette ligne dans le playbook:

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
    file:
      state: directory
      path: "{{ remote_dir }}"
  - name: Copy config file to the remote host web
    copy:
      src: "{{ source_file_path }}"
      dest: "{{ remote_dir }}"
</pre>
