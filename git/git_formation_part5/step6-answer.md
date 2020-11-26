#### Correction

> Créer une nouvelle branche devteam

`git branch devteam`{{execute T1}}

> Déplacer vous dans cette branche

`git checkout devteam`{{execute T1}}

> Créer un nouveau script_3.sh  dans votre espace de travail  

contenenant:  
  `"echo  Hello"`{{copy}}
  `echo  Hello > script_3_exo.sh `{{execute T1}}
  
> Ajouter ce fichier dans la staging area (index)

`git add script_3.sh`{{execute T1}}

> Commiter ce fichier dans votre repository local

`git commit -m "ajout du script_3.sh dans la branche devteam"`{{execute T1}}

> Vérifier le commit

`git log --oneline`{{execute T1}}
