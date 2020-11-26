
#### L'équipe de "Développement" (1), commence à faire une nouvelle version v4.0.0 et la mettra à disposition d'une autre équipe 
 
Initier la version v4.0.0

Vérifier que le Git Flow est bien présent

 `git flow config`{{execute T2}}

 Démarrer une nouvelle Release  "v4.0.0"
 
 `git flow release start "v4.0.0"`{{execute T2}}
 
 Vérifier la création de la release
 
 `git flow release list`{{execute T2}}

 Créer un fichier script_v400.sh
 
 `echo "printf 'Ceci est le script de la nouvelle fonctionalité v4.0.0  \n'" > script_v400.sh;cat script_v400.sh`{{execute T2}}
 
 Ajouter le fichier dans la "Staging Area" (cache)
 
 `git add script_v400.sh`{{execute T2}}
 
 Créer un sous répertoire 'log'
 
 `mkdir -p log`{{execute T2}}
 
 Créer un fichier 'log/readme_v400'
 
 `echo "readme v4.0.0" > log/readme_v400`{{execute T2}}
 
  Ajouter le fichier dans la "Staging Area" (cache)
  
 `git add log/readme_v400`{{execute T2}}
 
 Commiter la nouvelle release dans le Repository local 
 
  `git commit -m "ajout fichiers de la v4.0.0 "`{{execute T2}}
   
 Vérifier le nouveau commmit
 
 `git log --oneline`{{execute T2}}
 
 Publier le Git Flow 
 
 `git flow release publish "v4.0.0"`{{execute T2}}
 
 ```
 _Répondre: yes
  ```
 
 Regarder les logs 
 
 `git flow log`{{execute T2}}
 
 
 
#### L'équipe de développement (2), peut suivre une release distante "v4.0.0" et la faire évoluer

A présent vous allez importer "tracker" (importer) la release  développée par l'autre équipe, et la faire évoluer

Tracker et Importer la release v4.0.0

  `git flow release track "v4.0.0"`{{execute T3}}


Lister, puis observer la nouvelle branche  qui a été créée "release/v4.0.0",

  `git branch`{{execute T3}}

   `ls`{{execute T3}}
   
 Regarder les logs 
 
  `git flow log`{{execute T3}}

 Créer le nouveau fichier de la seconde 
 `echo "script seconde equipe" > script_new_equipe_2.sh `{{execute T3}}

 Ajout fichier  
  `git add script_new_equipe_2.sh `{{execute T3}}
 
 Commiter la nouvelle release dans le Repository local 
 
  `git commit -m "ajout fichiers script_new_equipe_2.sh "`{{execute T3}}


 Publier le Git Flow 
 
 `git flow release publish "v4.0.0"`{{execute T3}}
 
 
 Lister la branche en cours 
 
 `git branch`{{execute T3}}
 
 
  Revenir à la branche master 
 
 `git checkout master`{{execute T3}}
 

  Supprimer la copie distante de branche release/v4.0.0 
 
 `git branch -d release/v4.0.0`{{execute T3}}
 

#### L'équipe de "Développement" (1), raffraichit -à son tour- les modifications effectuées par la seconde équipe 

Importer les modifications effectuées sur la release v4.0.0

  `git pull origin release/v4.0.0`{{execute T2}}

Constater les modifications créé par l'autre equipe,

   `ls `{{execute T2}}


Lister la branch en cours

  `git branch`{{execute T3}}
  
 Terminer le Git Flow en cours 
 
 `git flow release finish "v4.0.0"`{{execute T2}}

 ```
 * Vous devez obligatoirement Renseigner la ligne version "v3.0.0" dans le second fichier  
 (touche ":wq!" pour sortir de chaque fichier)  
 ``` 
Consulter à présent les branches: la release v4.0.0 a été fusionné dans les branches master & développement
  `git branch`{{execute T2}}

  
Lister les tags en cours

 `git tag`{{execute T2}}

 Regarder les logs, vous constatez que nous avons fusionné les release -->  dans la branche de développement & dans la  master 
 
 `git flow log`{{execute T2}}


Consulter à présent les branches actives 

  `git branch`{{execute T2}}

 
 A ce stade, vous pouver push le tag de la release sur le repo dsistant 
 
 `git push --tags`{{execute T2}}

Puis vous pouver la pousser sur le repo Central

 `git push origin master`{{execute T2}}

  
la release v4.0.0 a été pushée sur le Repo Remote :  lister sont contenu à distance

  `git ls-remote --tags origin | grep v4.0.0$ | awk '{print "git ls-tree --name-only -r "$1}'|sh`{{execute T3}}
