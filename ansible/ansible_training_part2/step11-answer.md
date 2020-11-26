#### Correction

<pre class="file">
---
- name: Install package
  hosts: web
  vars:
    source_path: /work_dir/training-files
    apache_dst_path: /etc/apache2/apache2.conf
    php_dst_path: /var/www/html/index.html
    http_port: 80
    domain: myapp.com
  gather_facts: no
  tasks:
  - name: Install apache Package
    become: yes
    yum:
      name: apache2
      state: latest
    notify:
      - start apache service
  - name: Copy httpd configuration file
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
  - name: write the apache config file
    become: yes
    template:
      src: "{{ source_path }}/vhost.j2"
      dest: /etc/apache2/sites-available/monsite.conf
    notify:
      - restart apache service
  - name: enable vhost
    become: yes
    command: a2ensite monsite  
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
  



