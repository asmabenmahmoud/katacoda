#### Correction

playbook_ex01.yml
<pre class="file">
---
- hosts: db
  roles:
    - ntp
</pre>

roles/ntp/tasks/main.yaml 
<pre class="file">
---
# On met le contenu de la clé `tasks` de notre playbook précédent
# mais on ne met pas la clé `tasks` elle-même (juste le contenu).
- name: Ensure NTP installation
  apt:
    name: ntp
    state: latest
- name: Write NTP config file /etc/ntp.conf
  template:
    src: ntp.conf.j2
    dest: /etc/ntp.conf
    owner: root
    group: root
    mode: '0644'
  notify:
    - restart ntp
- name: Ensure ntp is running (and enable it at boot)
  service:
    name: ntp
    state: started
    enabled: yes
</pre>

roles/ntp/handlers/main.yaml
<pre class="file">
---
# Là aussi, on ne met pas la clé `handlers` mais juste le contenu de cette clé.
- name: restart ntp
  service:
    name: ntp
    state: restarted
</pre>

roles/ntp/defaults/main.yaml
<pre class="file">
---
# Ce fichier correspond au contenu de la clé `vars` dans
# notre playbook précédent mais là encore sans la clé `vars`
# elle-même.
ntp_servers:
  - '0.debian.pool.ntp.org'
  - '1.debian.pool.ntp.org'
  - '2.debian.pool.ntp.org'
</pre>

roles/ntp/templates/ contient le fichier jinja ntp.conf.j2 copié depuis /work_dir/training-files/ 

Lancement du playbook `ansible-playbook -i hosts.ini playbook_ex07.yml`{{copy}}
