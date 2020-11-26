
 
##### Planning 

     - Nous Créerons un nouveau `repository local` GIT,
     - Nous apprendrons à `cloner` (un Repository Distant existant),
     - Nous apprendrons à `versionner` nos scripts,
     - Nous créerons ou supprimerons des `branches` de `développements`, 
     - Nous Effectuerons des `commits`,  `annuler` les commits,
     - Nous apprendrons à Consulter des status, des `logs`, `l'historique` des versions
     - Nous effectuerons des `merges` entre `branches`
     
_Remarque: Dans cette partie, nous travaillerons sur le premier Repository Local: "your local Repository"_
![git-central](/testgitessai/scenarios/git_training_part1/assets/git-central.png)





Nous allons ouvrir un terminal sur une VM, qui hébergera notre Repository Local GIT et les premiers développements.

Vérifier que l'environnement de formation est disponible:

`if [ $(docker ps  | grep -v CONTAINER | wc -l) -ge 1 ]; then echo "OK"; else export demarre=$(docker ps  | grep -v CONTAINER | wc -l);while [ $demarre != 1 ]; do export demarre=$(docker ps  | grep -v CONTAINER | wc -l); echo "Patientez chargement Docker:  NB containers actuel = "$demarre; sleep 30; done;  fi`{{execute T1}}

Puis, lancer la commande de connection au terminal:

`d1() { docker exec -it dev1_git_local bash -c "cd /work_dir; echo 'PS1='\''dev1_git_local# '\' >> /root/.bashrc; su - git"; } && d1`{{execute T1}}


##### _Remarque_:
Le prompt dev1_git_local#  vous aidera à repèrer la machine sur laquelle vous êtes connecté.

Si toutes fois vous êtes sortie avec un exit , vous pouvez taper les commandes suivantes:

d1 => Pour se connecter à la VM 'dev1_git_local'.
