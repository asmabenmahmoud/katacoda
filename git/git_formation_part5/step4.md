 

#### Créer le Repository `local` afin de versionner les développements sur la VM

  Cérer le répertoire d'installation du Repository 'local'
 `mkdir replocal;cd replocal`{{execute T1}}
 
 Lancer l'installation du premier Repository 'local'
 `git init`{{execute T1}}
  
 Configurer le Git local (mail & username)
 `git config --global user.email "git@example.com";git config --global user.name "git Name";pwd;git config --list `{{execute T1}}
  
  
  Description des commandes de bases que nous allons lancer pour versionner
  
 ![git-workingdir](/testgitessai/scenarios/git_training_part1/assets/git-workingdir.png)
  
 

**L'équipe peut à présent versionner dans le repository local**

  Créer le répertoire PROJET:
 `mkdir PROJET;cd PROJET;pwd `{{execute T1}}
 
 - Créer un fichier 'script_1.sh'
 `echo "printf 'Ceci est un script test créé dans la master \n'" > script_1.sh;cat script_1.sh`{{execute T1}}
 
 Ajouter le fichier dans la cache "Staging Area"
 `git add script_1.sh `{{execute T1}}
 
  Afficher le status en cours
 `git status `{{execute T1}}
 
 Commmiter/valider la création du nouveau fichier, dans votre Repository local 
  `git commit -m "ajout du script_1.sh dans la branche master "`{{execute T1}}
      
 Constater, que le scipt a été committé dans le repository
 `git log --oneline `{{execute T1}}
 
 
#### Création d'une branche pour les développements 
 - Créer la branche
 `git branch Dev`{{execute T1}}
 
 Vérifier la présence de la branche 'Dev'
 `git branch`{{execute T1}}

 Se déplacer dans la branche
 `git checkout Dev`{{execute T1}}

 La branche 'Dev' est à présent active
 `git branch`{{execute T1}}
 
 Créer un second fichier dans la branche de Dev cette fois ci 'script_2.sh'
 `echo "printf 'Ceci est un script test créé dans la branche Dev \n'" > script_2.sh;cat script_2.sh`{{execute T1}}
 
 Ajouter le fichier dans la cache "Staging Area"
 `git add script_2.sh `{{execute T1}}
 
 Afficher le status en cours
 `git status `{{execute T1}}
 
 Commmiter/valider la création du nouveau fichier, dans votre Repository 'local' 
 `git commit -m "ajout du script_2.sh dans la branche Dev"`{{execute T1}}
   
  Constater, que le scipt a été committé dans le repository
 `git log --oneline `{{execute T1}}
 
 Vérifier la présence de la branche 'Dev'
 `git branch`{{execute T1}}
 
#### Fusionner les branches 'Dev' & 'master'

 ![merge](/testgitessai/scenarios/git_training_part1/assets/merge.png)
 
 Se metttre dans la branche master 
 `git checkout master`{{execute T1}}
 
  Effectuer un 'diff' pour consulter ce qui va être "merger" 
 `git diff master Dev`{{execute T1}}

 Fusionner la branche 'Dev' dans la  'master'
 `git merge Dev`{{execute T1}}
  
 Afficher le status en cours
 `git status `{{execute T1}}
 
 Il n'y a plus rien à "merger"
 `git diff master Dev`{{execute T1}}
 
 Supprimer la branche 'Dev'
 `git branch -d Dev`{{execute T1}}

 Vérifier que la branche 'Dev' est bien supprimée
 `git branch `{{execute T1}}
