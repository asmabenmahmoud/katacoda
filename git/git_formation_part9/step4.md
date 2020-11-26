
#### L'équipe qui développe doit initialiser un Git Glow local

```
Prérequis pour utiliser l'outil Git Flow:  avoir au préalable installé le package linux "git-flow" 
(commande utilisée pou rl'installer: apt-get install git-flow -y)
 ``` 
 
A présent,  vous devez initier l'environnement Git Flow
 `git flow init`{{execute T2}}
 
 ```
How to name your supporting branch prefixes?
Feature branches? [feature/]
Bugfix branches? [bugfix/]
Release branches? [release/]
Hotfix branches? [hotfix/]
Support branches? [support/]
Version tag prefix? []
Hooks and filters directory? [/home/git/.git/hooks]
 ``` 
 
 Démarrer un Work Flow pour créer une première Features  (fonctionalité)
 
 `git flow feature start feature-x`{{execute T2}}
 
 Vérifier la création de la Feature
 
 `git flow feature list`{{execute T2}}

En tant que développeur, vous allez créer une nouvelle feature, puis apprendre à la publier. 

 Créer un fichier script_feature.sh
 
 `echo "printf 'Ceci est le script de la nouvelle fonctionalité \n'" > script_feature.sh;cat script_feature.sh`{{execute T2}}
 
 Ajouter le fichier dans la "Staging Area" (Indexation dans la cache)
 
 `git add script_feature.sh `{{execute T2}}
 
 Commiter la nouvelle feature dans le Repository local 
 
 `git commit -m "ajout du script_feature.sh repo local "`{{execute T2}}
   
 Vérifier le nouveau commit
 
 `git log --oneline`{{execute T2}}
 
 Publier le Git Flow vers le repo central 
 
 `git flow feature publish feature-x`{{execute T2}}
 
 ```
     Répondre: yes
 ```
 
 Vous pouvez consulter les logs 
 
 `git flow log`{{execute T2}}
 
 Terminer le Git Flow en cours 
 
 `git flow feature finish feature-x`{{execute T2}}

 Regarder les logs, vous constater que nous avons fusionné les features -->  dans la branche de développement 
 
 `git flow log`{{execute T2}}
