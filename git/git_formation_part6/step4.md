
  
#### Nous allons apprendre à manipuler l'historique  des commits: revenir en arrière lorsque cela est utile

   
 Afficher l'historique de tous les commits présents
 `git log --oneline`{{execute T1}}
 
 Effectuer un `reset hard` du dernier commit (script 6) 
 `git reset HEAD~1 --hard`{{execute T1}}
 
 Constater que commit du script 6 a disparu de l'historique
 `git log --oneline`{{execute T1}}
 
 De plus, grâce à l'option "hard": le script 6 a complètement disparu de la working directory (répertoire de travail)
 `git status;ls `{{execute T1}}
  
  
  Effectuer un `reset mixed` du dernier commit (script 5) 
 `git reset HEAD~1 --mixed`{{execute T1}}
  
  Constater que commit du script 5 a disparu de l'historique
  `git log --oneline`{{execute T1}}
  
  Grâce à l'option "mixed", le script 5 est toujours dans la working directory, mais n'est plus stagé (indexé) 
  `git status;ls `{{execute T1}}
  
  
  Effectuer un `reset soft` du dernier commit (script _4) 
 `git reset HEAD~1 --soft`{{execute T1}}
 
  Constater que commit du script 4 a disparu de l'historique
  `git log --oneline`{{execute T1}}
  
  Grâce à l'option "soft", le script 4 est restés dans la working directory et est toujours staggés (indexé) 
  `git status;ls;git log --oneline `{{execute T1}}
  
  
  Effectuer un `revert` du second scripts 2, 
  Lancer un commit
  `git commit -a -m "revert script 2"`{{execute T1}}
   
   Puis effectuer le revert
   `git revert HEAD~2`{{execute T1}}
  
      ##### _Si un fichier s'ouvre:  
             "revert Ajout script_2.sh"-->':wq!'   (sauvergarder le fichier & sortir) 

  Constater qu'un nouveau commit est apparut pour tracer la suppression du script: "Revert ajout script_2.sh" , l'ancien commit "ajout script_2.sh"  a été conservé
   `git log --oneline`{{execute T1}}
  
  Constater que le script 2 n'est plus dans la working directory 
  `ls`{{execute T1}}
