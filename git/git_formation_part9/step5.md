En tant que développeur, vous allez créer une nouvelle release, puis apprendre à la publier. 

 Démarrer un Work Flow pour créer la première Release  
 
 `git flow release start "v1.0.0"`{{execute T2}}
 
 Vérifier la création de la Feature
 
 `git flow release list`{{execute T2}}

 Créer un fichier script_100.sh
 
 `echo "printf 'Ceci est le script de la nouvelle fonctionalité \n'" > script_100.sh;cat script_100.sh`{{execute T2}}
 
 Ajouter le fichier dans la "Staging Area" (cache)
 
 `git add script_100.sh `{{execute T2}}
 
 Commiter la nouvelle release dans le Repository local 
 
 `git commit -m "ajout du sscript_100.sh repo local "`{{execute T2}}
   
 Vérifier le nouveau commmit
 
 `git log --oneline`{{execute T2}}
 
 Publier le Git Flow 
 
 `git flow release publish "v1.0.0"`{{execute T2}}
 
 ```
 _Répondre: yes
  ```
 
 Regarder les logs 
 
 `git flow log`{{execute T2}}
 
 Terminer le Git Flow en cours 
 
 `git flow release finish "v1.0.0"`{{execute T2}}

 ```
Renseigner la version de la Release: dans chaque fichier texte  puis enregistre et sortir du fichier
 ``` 

 Regarder les logs, vous constater que nous avons fusionné les release -->  dans la branche de développement & master 
 
 `git flow log`{{execute T2}}


Consulter à présent les branches actives 

  `git branch`{{execute T2}}


Vous pouver Tagger la Release

 `git push --tags`{{execute T2}}

Puis vous pouver la pousser sur le repo Central

 `git push origin master`{{execute T2}}
