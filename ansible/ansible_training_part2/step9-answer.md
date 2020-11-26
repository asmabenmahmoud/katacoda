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
    notify:
      - start apache service
  - name: Copy apache configuration file
    become: yes
    copy:
      src: "{{ source_path }}/apache2.conf"
      dest: "{{ apache_dst_path }}"
    notify:
      - restart apache service
  - name: Copy index.html file
    become: yes
    copy: 
      src: "{{ source_path }}/index.html"
      dest: "{{ php_dst_path }}"
    notify:
      - restart apache service      
  handlers:
    - name: start apache service
      become: yes
      service:
        name: apache2
        state: started
        enabled: yes

    - name: restart apache service
      become: yes
      service:
        name: apache2
        state: restarted
</pre>
  
lancer le playbook:  `ansible-playbook -i hosts.ini playbook_ex04.yml`{{copy}}

###### *Remarques*

- Vous pouvez tester le fonctionnement des handlers en modifiant un des fichiers de configuration par exemple et relancer le playbook pour déclencher le handler  

- Dans ce playbook, nous avons utilisé le fichier de configuration "apache2.conf" qu'on a copié sur le serveur web sans adaptation du contenu de ce fichier. 

- Dans le cas où nous avons besoin d'adapter le contenu de ce fichier de configuration (La ligne ServerName par exemple) en fonction de la machine cible, on pourra utiliser des fichiers appelés "template" qu'on détaillera dans la section suivante.


