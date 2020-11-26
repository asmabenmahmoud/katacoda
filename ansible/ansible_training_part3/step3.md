
#### setup

Ce module 'setup' récupère des informations utiles sur les hôtes distants sous forme de variables (appelées ansible_facts). Il est automatiquement appelé par les playbooks Ansible qu'on va détailler plus tard.

Il peut également être exécuté directement par la commande ansible afin de vérifier -par exemple- la disponibilité et la valeur des variables pour un hôte.

Tester le module sur le node Ansible: `ansible managed_node1 -i hosts.ini -m setup`{{execute T1}}

Vous avez remarqué que le module nous a retourné plusieurs informations (Système d’exploitation,stockage,...) en format json. Dans le cas ou nous réalisons -par exemple- des opérations différentes en fonction de la distribution de la machine, l’information qui va nous intéresser sera donc le « nom » ou la « version » d’une distribution.

Vous pouvez trouver ces informations en filtrant sur les mots clés « ansible_distribution… » et « ansible_os… »

`ansible managed_node1 -i hosts.ini -m setup -a 'filter=ansible_distribution*'`{{execute T1}}


#### shell

Permet de passer des commandes bash au travers d'Ansible.

`ansible web -i hosts.ini -m shell -a "ls -l /work_dir/"`{{execute T1}}

#### file

Ce module est utilisé pour créer des fichiers, des répertoires, définir ou modifier les autorisations des fichiers, etc.

##### *Exemple 1*
Cette commande permet de créer un fichier (state=touch) s'il n'existe pas et modifier ces droits.

`ansible web -i hosts.ini -m file -a 'path=/work_dir/my_first_file.txt state=touch mode=600 owner=backup group=backup'`{{execute T1}}

Vérifier la création du fichier sur le serveur cible en affichant sa date de modification:
`ls -ll /work_dir/my_first_file.txt`{{execute T2}}

Lancer encore la commande précédente et vous allez avoir le même résultat que la première exécution (couleur du résultat orange + "changed": true).  

<pre style="color: orange">
managed_node1 | CHANGED => {
    "changed": true,
    "dest": "/work_dir/my_first_file.txt",
    "gid": 34,
    "group": "backup",
    "mode": "0600",
    "owner": "backup",
    "size": 0,
    "state": "file",
</pre>

Ce comportement est du au fonctionnement du module file avec l'option state=touch. "touch" permet de créer un fichier s'il n'existe pas.

Si le fichier existe, le module vas changer les 2 valeurs de fichier: date de modification + date d'accès.

Vérifier la nouvelle date de modification du fichier et vous allez remarquer que c'est différent du premier résultat:
`ls -ll /work_dir/my_first_file.txt`{{execute T2}}

##### *exemple 2*
Nous allons réexécuter la commande de l'exemple 1 en ajoutant les 2 options modification_time=preserve access_time=preserve.

Ceci vas permettre au module file de ne pas faire de modifications sur le fichier existant (date de modification + date d'accès).

`ansible web -i hosts.ini -m file -a 'path=/work_dir/my_first_file.txt state=touch mode=600 owner=backup group=backup modification_time=preserve access_time=preserve'`{{execute T1}}

Vous allez avoir un résultat comme suit:

<pre style="color: green">
managed_node1 | SUCCESS => {
    "changed": false,
    "dest": "/work_dir/my_first_file.txt",
    "gid": 34,
    "group": "backup",
    "mode": "0600",
    "owner": "backup",
    "size": 4,
    "state": "file",
    "uid": 34
}
</pre>

Vous pouvez encore reéxécuter la commande et vous allez remarquer qu'on a exactement le même résultat avec "changed": false.

> Cette opération est *idempotente*. Cela signifie qu’après 1 exécution de la commande pour mettre les éléments à l’état souhaité, des exécutions ultérieures de la même commande devraient entraîner 0 changement. En termes simples, idempotence signifie que vous pouvez être sûr d'un état cohérent dans votre environnement.

 ##### *exemple 3*
  
Pour supprimer le fichier créé dans l'exemple 1, vous pouvez modifier le paramètre "state" du module file.
  
`ansible web -i hosts.ini -m file -a 'path=/work_dir/my_first_file.txt state=absent'`{{execute T1}}

Vous allez avoir un résultat comme ci-dessous.  Ce qui signifie qu'il y eu une modification , donc suppression du fichier existant.

<pre style="color: orange">
managed_node1 | CHANGED => {
    "changed": true,
    "path": "/work_dir/my_first_file.txt",
    "state": "absent"
}
</pre>
  
Vérifier que le fichier a bien été supprimé sur la cible:

`ls -ll /work_dir/my_first_file.txt`{{execute T2}}
  
Si vous exécuter encore une fois la commande de suppression du fichier , il y n'aura aucun changement car le fichier n'existe plus. Vous allez donc avoir un résultat comme suit:

<pre style="color: green">
managed_node1 | SUCCESS => {
    "changed": false,
    "path": "/work_dir/my_first_file.txt",
    "state": "absent"
}
</pre>

#### copy
  
Le module permet de copier un fichier de la machine locale ou distante vers un emplacement de la machine distante. 
Pour les cibles Windows, utilisez plutôt le module win_copy.

Créer un fichier sample.txt sur la machine Ansible et copier le sur la machine distante "managed_node1" dans "/tmp/"

`ansible localhost -m file -a 'path=/work_dir/sample.txt state=touch'`{{execute T1}}

`ansible managed_node1 -i hosts.ini -m copy -a "src=/work_dir/sample.txt dest=/tmp/sample.txt backup=yes"`{{execute T1}}

Vérifier que le fichier a bien été copié sur la cible:
`ls -ll /tmp/sample.txt`{{execute T2}}

> Le module copy est *idempotent*. A la première exécution de la commande, vous allez avoir qu'il y a eut un changement car le fichier n'existait pas sur la cible. Si vous reéxécutez la commande encore une fois sans modifier le contenu du fichier sur la source, vous allez avoir un résultat "vert" avec "changed": false.

> Le paramètre backup=yes permet de faire une sauvegarde du fichier "sample.txt" sur la machine distante (si présent) avant de faire la copie. Si le fichier source est exactement pareil que le fichier cible, alors ansible ne vas pas créer une sauvegarde. Vous pouvez tester en exécutant une autre fois la commande de copy, en modifiant le contenu du fichier sur le serveur ansible
  
