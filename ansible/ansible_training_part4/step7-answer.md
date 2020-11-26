#### Correction

playbook_ex04.yml
<pre class="file">
---
- name: Install package
  hosts: web
  vars:
    source_path: /work_dir/training-files
    apache_dst_path: /etc/apache2/apache2.conf
    php_dst_path: /var/www/html/index.html
  gather_facts: no
  tasks:
  - name: Install apache Package
    become: yes
    yum:
      name: apache2
      state: latest
  - name: Copy apache configuration file
    become: yes
    copy:
      src: "{{ source_path }}/apache2.conf"
      dest: "{{ apache_dst_path }}"
  - name: Copy index.html file
    become: yes
    copy:
      src: "{{ source_path }}/index.html"
      dest: "{{ php_dst_path }}"
  - name: Start apache2 service
    become: yes
    service:
      name: apache2
      state: started
      enabled: yes
</pre>


lancer le playbook:  `ansible-playbook -i hosts.ini playbook_ex04.yml`{{copy}}

##### *Remarque:*

- Dans ce playbook, vous pouvez remarquer qu'on pourra concaténer une variable avec une chaîne de caractères comme ci-dessous:

  "{{ httpd_source_path }}.httpd.conf"

- L'option utilisée dans le module "service" est state=started. L'action started est **idempotent** c'est à dire qu'elle ne s'éxécute pas si le service est déja démarré.

  Donc si vous changez le fichier de configuration apache2.conf sur le serveur source et relancez le playbook, vous allez remarquer que le seul changement est au niveau du module copy. Le service httpd ne sera pas redémarré.
  
  Pour la plupart des logiciels, toute modification apportée à leurs fichiers de configurations n’aura d’effet qu’au redémarrage du service. Il faut donc utiliser le module service avec l'option  **state=restarted**

<pre class="file">  
    - name: Start httpd service
      become: yes
      service:
        name: apache2 
        state: restarted
        enabled: yes
 </pre>

  Si vous rexécutez à plusieurs reprises le playbook "playbook_ex04.yml" avec la nouvelle valeur de l'option "state", le service redémarrera à chaque exécution **même si aucune modification n'est effectuée sur les fichiers de configuration**, ce qui n'est pas fiable pour une application.

  Le service doit donc être configuré pour redémarrer **seulement après chaque modification de fichier de conf**. Pour cela on va utiliser les **"handlers"**
