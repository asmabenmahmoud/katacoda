#### Correction

<pre class="file">
---
- name: Learn how to use condition
  hosts: web
  tasks:
  - stat:
      path: /work_dir/my_dir
    register: stat_result

  - debug:
      msg: "Le repertoire /work_dir/my_dir existe"
    when: stat_result.stat.exists == true and stat_result.stat.isdir == true
</pre>


##### *Remarque

Dans le cas ou vous voulez par exemple tester si le répertoire /work_dir/my_dir existe sur le serveur Ansible avant d'exécuter d'autres tâches sur le serveur cible "managed_node1", vous pouvez utiliser l'option "delegate_to: 127.0.0.1". Cette option permet d'exécuter une action sur le serveur sur lequel le playbook est lancé.

<pre class="file">
---
- name: Learn how to use condition
  hosts: web
  tasks:
  - stat:
      path: /work_dir/my_dir
    register: stat_result
    delegate_to: 127.0.0.1

  - debug:
      msg: "Le repertoire /work_dir/my_dir existe"
    when: stat_result.stat.exists == true and stat_result.stat.isdir == true
</pre>
