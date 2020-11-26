#### L'équipe de "Développement" initie le workflow d'une nouvelle release v2.0.0
 
Vérifier que l'outil Git Flow est présent et bien configuré

 `git flow config`{{execute T2}}

 Démarrer une nouvelle Release  "v2.0.0"
 
 `git flow release start "v2.0.0"`{{execute T2}}
 
 Vérifier la création de la release
 
 `git flow release list`{{execute T2}}

 Créer un fichier script_200.sh
 
 `echo "printf 'Ceci est le script de la nouvelle fonctionalité v2.0.0 \n'" > script_v200.sh;cat script_v200.sh`{{execute T2}}
 
 Ajouter le fichier dans la "Staging Area" (cache)
 
 `git add script_v200.sh`{{execute T2}}
 
 Créer un sous répertoire 'log'
 
 `mkdir log`{{execute T2}}
 
 Créer un fichier 'log/readme_v200'
 
 `echo "readme v2.0.0" > log/readme_v200`{{execute T2}}
 
  Ajouter le fichier dans la "Staging Area" (cache)
  
 `git add log/readme_v200`{{execute T2}}
 
 Commiter la nouvelle release dans le Repository local 
 
  `git commit -m "ajout fichiers de la v2.0.0 "`{{execute T2}}
   
 Vérifier le nouveau commmit
 
 `git log --oneline`{{execute T2}}
 
 Publier le Git Flow 
 
 `git flow release publish "v2.0.0"`{{execute T2}}
 
 ```
 _Répondre: yes
  ```
 
 Regarder les logs 
 
 `git flow log`{{execute T2}}
 
 Terminer le Git Flow en cours 
 
 `git flow release finish "v2.0.0"`{{execute T2}}

 ```
 * vous devez obligatoirement renseigner la version "v2.0.0" dans le second fichier
 (puis touche ":wq!" pour sortir)  
 ``` 

Lister les tags en cours

 `git tag`{{execute T2}}
 
* En regardant les logs, vous constatez que nous avons fusionné les releases:  dans les branches de développement & dans la master 
 
 `git flow log`{{execute T2}}


Consulter à présent les branches actives 

  `git branch`{{execute T2}}


 
 A ce stade, vous pouver push le tag de la release sur le repo dsistant 
 
 `git push --tags`{{execute T2}}

Puis vous pouver la pousser sur le repo Central

 `git push origin master`{{execute T2}}
  

Vous pouvez -à tout moment- lister le contenu d'une release, afin de le communiquer à l'équipe d'exploit pour sa mise en Production, 
pour cela:

   Lister les fichiers que contient la release 2.0.0
  
  Première solution
  
  `git show v2.0.0^{tree}`{{execute T2}}
  
  ou 
  Seconde solution
  
  `git ls-remote --tags origin | grep v2.0.0$ | awk '{print "git ls-tree --name-only -r "$1}'|sh`{{execute T2}}
 
 
  
#### L'équipe de "Production", livre la Release "v2.0.0" en production

Importer la release  v2.0.0 à disposition sur le Repo Central

  `git pull --rebase origin master`{{execute T3}}
 ```
 _Répondre: yes
  ```

Consulter les tags distants 

  `git ls-remote --tags origin`{{execute T3}}



Recupèrer les tags développés

  `git pull origin --tags`{{execute T3}}


Lister les tags

  `git tag`{{execute T3}}



Vous pouvez à tout moment lister les fichiers de la release v2.0.0 que vous venez d'importer

Lister les fichiers que contient la release 2.0.0

   Première solution
   
  `git show v2.0.0^{tree}`{{execute T3}}
  
  ou 
  Seconde solution
  
  `git ls-remote --tags origin | grep v2.0.0$ | awk '{print "git ls-tree --name-only -r "$1}'|sh`{{execute T3}}
 

Vous pouvez aussi importer la release "v2.0.0"  dans une branche temporaire, paralèlle

  `git checkout -b branch_v2.0.0 v2.0.0`{{execute T3}}

Lister les fichiers de la release "v2.0.0" importés 

  `ls`{{execute T3}}

Lister la branche créée

  `git branch`{{execute T3}}

Après avoir consulté la release: revenir sur la branche master

  `git checkout master`{{execute T3}}
  
  Lister la branche master en cours

  `git branch`{{execute T3}}
