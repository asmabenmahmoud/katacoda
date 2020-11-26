
Le résultat d'un play peut souvent dépendre de la valeur d'une variable, d'un fact (information sur un système distant) ou du résultat d'une tâche précédente. Dans certains cas, les valeurs des variables peuvent dépendre d'autres variables. 

La première action effectuée par ansible est de récupérer les “facts” des serveurs cibles (via le module setup)
Cette action permettra d’utiliser de nouvelles variables dynamiques utilisables dans l’ensemble des structures de contrôle
Ces variables sont accessibles via le nom ansible_$nom_de_la_variable ou ansible_facts_$nom_de_la_variable.

Cette rubrique explique comment les conditions sont utilisées dans les playbooks comment les variables fact peuvent êtres utiles.

#### La condition When
*Syntax*

when: (condition)

Exemple du context: 
- Ignorer une étape particulière sur un hôte,
- Ne pas installer un certain paquet si le système d'exploitation correspond à une version particulière, 
- Procéder à un de nettoyage si un système de fichiers est saturé.

##### Exemple1 : Condition sur les variables facts pour gérer des OS hétérogènes

<pre class="file">
name: Installing Apache (RHEL)
  yum: 
    name: httpd
    state: latest
  when: ansible_os_family == ‘RedHat’
name: Installing Apache (Debian)
  apt:
    name: apache2
    state: present
  when: ansible_os_family != ‘RedHat’
</pre>

On pourra utiliser des multiples conditions avec "et/ou" logique:
<pre class="file">
tasks:
  - name: "shut down CentOS 6 and Debian 7 systems"
    command: /sbin/shutdown -t now
    when: (ansible_facts['distribution'] == "CentOS" and ansible_facts['distribution_major_version'] == "6") or
          (ansible_facts['distribution'] == "Debian" and ansible_facts['distribution_major_version'] == "7")
</pre>

Cette syntaxe est aussi possible pour le "et" logique:
<pre class="file">
tasks:
  - name: "shut down CentOS 6 systems"
    command: /sbin/shutdown -t now
    when:
      - ansible_facts['distribution'] == "CentOS"
      - ansible_facts['distribution_major_version'] == "6"
</pre>

##### Exemple2 : Condition sur les variables booleans définsi dans le playbook:

<pre class="file">
vars:
  epic: true

tasks:
    - shell: echo "This certainly is epic!"
      when: epic
</pre>

##### Exemple3 : Condition sur les variables "Register"
 exécuter une action en fonction d’une action précédente via ‘register’
 
Dans un playbook, il peut être utile de stocker le résultat d'une commande donnée dans une variable et d'y accéder ultérieurement. 

Le mot clé "register" détermine la variable dans laquelle enregistrer un résultat. Les variables résultantes peuvent être utilisées dans des modèles, des actions ou des instructions when. 

<pre class="file">
- name: test play with register
  hosts: localhost

  tasks:
      - shell: cat training-files/motd
        register: motd_contents

      - shell: echo "motd contains the word hi"
        when: motd_contents.stdout.find('hi') != -1
</pre>


- Dans le playbook précedent, "register" permet de stocker le résultat de l'exécution du module shell dans la variable qu'on a nommé "motd_contents".

- Le playbook affichera "motd contains the word hi" si seulement le fichier  "/etc/motd" contient le caractère "hi", et pour cela nous avons utiliser le condition "when: motd_contents.stdout.find('hi') != -1"

- Afin de comprendre comment nous avons construit cette condition, nous allons afficher le contenu de la variable "motd_contents" en utilisant le module "debug".

Créer un playbook test_register.yml et copier le contenu ci-dessous:

<pre class="file">
---
- name: test play with register
  hosts: web

  tasks:
    - name: Récuperer le contenu du motd dans un register
      shell: cat training-files/motd
      register: motd_contents
      delegate_to: 127.0.0.1
    - name: Afficher le contenu du register  
      debug:
        var: motd_contents
    - name: Utiliser la condition when   
      debug
        msg: echo "motd contains the word hi"
      when: motd_contents.stdout.find('hi') != -1
</pre>


Lancer le playbook test_register.yml:
`ansible-playbook -i hosts.ini test_register.yml`{{execute T1}}

Vous devez avoir le résultat ci-dessous dans le cas où le fichier contient le mot "hi"

<pre style="color: green">
ok: [managed_node1] => {
    "msg": "motd contains the word hi"
}
</pre>

et le résultat ci-dessous dans le cas où le fichier ne contient pas le mot "hi"

<pre style="color: blue">
TASK [Utiliser la condition when]
skipping: [managed_node1]
</pre>



