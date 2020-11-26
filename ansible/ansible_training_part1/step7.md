
L'Inventaire fourni la liste des hôtes (serveurs managés) sur lesquels Ansible exécutera les tâches.
Ansible fonctionne en se basant sur cette liste de machines qui est définie par défaut dans le fichier /etc/ansible/hosts. Ce chemin par defaut peut être modifié dans le fichier de configuration ansible.cfg.

Vous pouvez spécifier aussi un fichier d'inventaire différent à l'aide de l'option -i <chemin> sur la ligne de commande.


Dans un inventaire, on trouve :

> Des hôtes avec leur information de connexion, de configuration, … (DNS, IP, utilisateur, …)
> Des groupes fonctionnels regroupant des instances (app, web server, bdd, …)

Le fichier d'inventaire peut être dans l'un des nombreux formats : yaml, ini, etc.

*Format INI*
```
jumper ansible_port=5555 ansible_host=192.0.2.50
```

*Format YML*
```
...
  hosts:
    jumper:
      ansible_port: 5555
      ansible_host: 192.0.2.50
```


Comme indiqué précédemment, le fichier d'inventaire peut contenir des groupes et des hôtes definis comme suit:

![groups and hosts format INI](/devopsteam/courses/ansible/ansible_training_part1/assets/hosts_and_groups.png)


#### Créer votre premier fichier d'inventaire
Créer un fichier hosts.ini dans votre home directory

`vim /work_dir/hosts.ini`{{execute T1}}

Créer les trois groupes myself, web, db. Pour cela il faut passer en mode "Insert/modification" dans l'éditeur VIM.

Appuyer sur la touche 'i' de votre clavier puis copier le contenu ci-dessous (_Pour copier faite juste un clic sur le text_)

`
[myself]
localhost
[web]
managed_node1
[db]
managed_node2
`{{copy}}


##### _Remarque:

Pour sauvegarder le fichier, utiliser les touches :wq! de votre clavier
Il est important de noter que le copier/coller entre votre terminal et par exemple un éditeur de texte externe.
En revanche il ne fonctionnera pas entre un texte en cours de saisie dans l'éditeur VI et un éditeur externe.
Votre session est limité à 50 min. Si la session expire vous ne pourrez plus récupérer le contenu de vos saisies.
Par conséquent, vi un 'cat' ou 'more' fait un copier coller de vos exercices dans un éditeur externe à votre session Katacoda
