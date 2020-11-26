#### Correction

> Créer une nouvelle branche devteam
`git branch devteam`{{execute T1}}

> Déplacer vous dans cette branche
`git checkout devteam`{{execute T1}}

> Créer un nouveau script_1_exo.sh  dans votre espace de travail  
contenenant:  `"echo  Hello"`{{copy}}
 `echo  Hello1 > script_1_exo.sh `{{execute T1}}
 
> Ajouter ce fichier dans la staging area (index)
`git add script_1_exo.sh`{{execute T1}}

> Commiter ce fichier dans votre repository local
`git commit -m "ajout du script_1_exo.sh dans la branche devteam"`{{execute T1}}

> Vérifier le commit
`git log --oneline`{{execute T1}}

> Créer un second script_1_exo.sh  dans votre espace de travail  
contenenant:  `"echo  Hello2"`{{copy}}
 `echo  Hello2 > script_2_exo.sh `{{execute T1}}
 
> Ajouter ce fichier dans la staging area (index)
`git add script_2_exo.sh`{{execute T1}}

> Commiter ce fichier dans votre repository local
`git commit -m "ajout du script_2_exo.sh dans la branche devteam"`{{execute T1}}

> Vérifier le commit
`git log --oneline`{{execute T1}}

> Effectuer un reset hard  du dernier commit de la liste
  `git reset HEAD~1 --hard`{{execute T1}}
 
 Constater que commit du script 1 a disparu de l'historique
 `git log --oneline`{{execute T1}}
 
 De plus, grâce à l'option "hard": le script 1 a complètement disparu de la working directory (répertoire de travail)
 `git status;ls `{{execute T1}}
