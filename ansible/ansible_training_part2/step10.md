
La gestion des configurations de plusieurs serveurs et environnements est l’une des utilisations majeures d’Ansible. Mais ces fichiers de configuration peuvent **varier** pour chaque serveur distant ou chaque cluster. Mais à part quelques paramètres, tous les autres paramètres seront les mêmes. 

La création de fichiers statiques pour chacune de ces configurations n’est pas une solution efficace, cela prendra beaucoup plus de temps et chaque fois qu’un nouveau cluster sera ajouté, vous devrez utiliser plus de fichiers. C'est ici qu'intervient le module **template Ansible**.

Les templates sont traités par le langage de modèle **Jinja2**. La documentation sur le formatage des modèles est disponible dans [la documentation du concepteur de modèles](http://jinja.pocoo.org/docs/templates).

Les templates sont de simples fichiers texte avec l'extension ".j2"  que nous utilisons dans Ansible et qui contiennent tous vos paramètres de configuration. Lors de l'exécution du playbook, les variables seront remplacées par les valeurs appropriées, en fonction de certaines conditions comme le nom du serveur sur lequel l'opération s'exécute. 

Nous pouvons faire beaucoup plus que remplacer les variables à l’aide de templates Jinj2. Nous pouvons avoir des instructions conditionnelles, des boucles, des filtres pour transformer les données, etc...

Les variables dans un fichier modèle seront indiquées par les doubles accolades, **"{{variables}}"**
  

#### Utilisation des templates

Au minimum, vous devez avoir deux paramètres lorsque vous utilisez le module Ansible.

- **src**: Chemin d’un modèle au format Jinja2 sur le contrôleur Ansible.
- **dest** : Emplacement du fichier résultat du modèle sur la machine distante

Dans la tâche suivante. On utilise le module template et le fichier hello_world.j2. Les doubles accolades couvrent les variables.

Créer un playbook template_exemple1.yml et copier le contenu ci-dessous:

<pre class="file">
---
- hosts: web
  vars:
    variable1: 'Bonjour tout le monde'
  tasks:
    - name: Ansible Template Example
      template:
        src: training-files/exemple_template.j2
        dest: /work_dir/exemple_template.txt
</pre>

Le contenue du fichier jinja exemple_template.j2 est 

<pre class="file">
{{ variable1 }}
Bonjour tout le monde
Ce fichier est un exemple d'un template
La mémoire disponible actuellement est : {{ ansible_memfree_mb }} MBs.
</pre>

Lancer le playbook: `ansible-playbook -i hosts.ini template_exemple1.yml`{{execute T1}}

Vérifier le contenu du fichier exemple_template.txt (sur le serveur cible) après exécution du playbook:

`cat /work_dir/exemple_template.txt`{{execute T2}}

Le résultat doit ressembler à celui ci-dessous (seule la valeur 200 MBs varie en fonction de votre serveur):
<pre class="file">
Bonjour tout le monde
Ce fichier est un exemple d'un template
La mémoire disponible actuelement est : 200 MBs.
</pre>

#### Utilisation des listes dans les templates
Dans le playbook ci-dessous on utilisera une variable "list1" qui sera appelée par une "boucle for" dans le template "exemple_liste_template.j2".

Créer un playbook template_exemple2.yml et copier le contenu ci-dessous:

<pre class="file">
---
- hosts: web
  vars:
    list1: ['première itération','deuxième itération','troixième itération']
  tasks:
    - name: Ansible Template Example
      template:
        src: training-files/exemple_liste_template.j2
        dest: /work_dir/exemple_liste_template.txt
</pre>

Le contenu du fichier jinja exemple_liste_template.j2 est 

<pre class="file">
Ceci est un exemple de boucle de module de modèle avec une liste.
{% for item in list1 %}
  {{ item }}
{% endfor %}
</pre>

Lancer le playbook: `ansible-playbook -i hosts.ini template_exemple2.yml`{{execute T1}}

Vérifier le contenu du fichier exemple_liste_template.txt (sur le serveur cible) après exécution du playbook:
`cat /work_dir/exemple_liste_template.txt`{{execute T2}}

Le résultat doit ressembler à celui ci-dessous:
<pre class="file">
Ceci est un exemple de boucle de module de modèle avec une liste.
première itération
deuxième itération
troixième itération
</pre>
